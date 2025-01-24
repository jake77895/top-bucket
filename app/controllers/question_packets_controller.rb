class QuestionPacketsController < ApplicationController
  def index
    @question_packets = QuestionPacket.all.order(:name)

    # Add the dynamic packet
    @dynamic_packet = dynamic_packet

    # Calculate the display count for each packet
    @grouped_question_counts = @question_packets.each_with_object({}) do |packet, counts|
      counts[packet.id] = count_question_groups(packet.questions, packet.questions.size - 1)
    end
  end

  def show
    if params[:id] == "qotd"
      # Use the method from the Question model to fetch the Question of the Day
      question_of_the_day = Question.question_of_the_day
  
      # Use the Question of the Day for the "qotd" packet
      @questions = [question_of_the_day]
  
      # Create a temporary object for the "qotd" packet
      @question_packet = OpenStruct.new(name: "Question of the Day", id: "qotd")
    else
      # Handle regular packets as before
      @question_packet = QuestionPacket.find(params[:id])
      question_ids = params[:filtered_questions] || @question_packet.questions.pluck(:id)
      @questions = Question.where(id: question_ids)
    end
  
    # Apply final ordering for linked questions
    @questions = final_ordering(@questions)
  
    # Set the current question based on the question index
    @current_question_index = params[:question_index].to_i || 0
    @question = @questions[@current_question_index]
  
    # Precompute max question_link_order for each linked group
    @max_question_orders = compute_max_question_orders(@questions)
  
    # Navigation indices
    @prev_index = @current_question_index.positive? ? @current_question_index - 1 : nil
    @next_index = @current_question_index < @questions.size - 1 ? @current_question_index + 1 : nil
  
    # Display count (based on groups)
    @display_count = count_question_groups(@questions, @current_question_index)
    @total_question_groups = count_question_groups(@questions, @questions.size - 1)
  
    # Store filtered questions for navigation links
    @filtered_question_ids = @questions.pluck(:id)
  end

  def dynamic_packet
    # Fetch the Question of the Day from the Rails cache
    question_of_the_day = Rails.cache.fetch("question_of_the_day") { Question.order("RANDOM()").first }
    
    # Fetch random questions excluding the Question of the Day
    random_questions = Question.where.not(id: question_of_the_day.id).order("RANDOM()").limit(9) # Adjust the limit as needed
  
    # Combine QOTD with the random questions
    [question_of_the_day] + random_questions
  end
  

  def options
    @question_packet = QuestionPacket.find(params[:id])
    questions = @question_packet.questions
  
    # Apply all filters to determine the filtered questions
    filtered_questions = apply_options(questions).pluck(:id)
  
    # Redirect to show with filtered_questions
    redirect_to question_packet_path(@question_packet, filtered_questions: filtered_questions)
  end

  private

  def compute_max_question_orders(questions)
    # Convert questions to an ActiveRecord relation if it's an array
    question_ids = questions.map(&:id)
    Question
      .where(id: question_ids)
      .where.not(question_link: nil)
      .group(:question_link)
      .pluck(:question_link, Arel.sql("MAX(question_link_order)"))
      .to_h
  end
  

  def count_question_groups(questions, current_index)
    counted_keys = Set.new
    display_count = 0

    questions[0..current_index].each do |question|
      key = question.question_link || question.id
      unless counted_keys.include?(key)
        display_count += 1
        counted_keys.add(key)
      end
    end

    display_count
  end

  # Final ordering: Group linked questions and order them within their groups
  def final_ordering(questions)
    linked_questions = questions.select { |q| q.question_link.present? }
    unlinked_questions = questions.reject { |q| q.question_link.present? }

    grouped_linked_questions = linked_questions
      .group_by(&:question_link)
      .values
      .flat_map { |group| group.sort_by(&:question_link_order) }

    questions.map do |q|
      if q.question_link.present?
        grouped_linked_questions.shift
      else
        unlinked_questions.shift
      end
    end
  end

  def apply_options(questions)
    questions = filter_by_number_of_questions(questions)
    questions = filter_starred_terms(questions)
    questions = exclude_multi_part_questions(questions)
    randomize_order(questions)
  end

  # Option: Number of questions
  def filter_by_number_of_questions(questions)
    number = params[:num_questions]
    return questions if number.nil? || number == "all"

    grouped_questions = questions.group_by { |q| q.question_link || q.id }
    limited_groups = grouped_questions.keys.first(number.to_i)
    limited_questions = grouped_questions.slice(*limited_groups).values.flatten

    questions.where(id: limited_questions.map(&:id))
  end

  def filter_starred_terms(questions)
    return questions unless params[:study_starred].in?(["1", "on"])

    questions.joins(:questions_users).where(questions_users: { user_id: current_user.id })
  end

  def randomize_order(questions)
    return questions unless params[:randomize_order].in?(["1", "on"])

    questions.shuffle
  end

  def exclude_multi_part_questions(questions)
    return questions unless params[:exclude_multi_part].in?(["1", "on"])

    questions.where(question_link: nil)
  end
end
