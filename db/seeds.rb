# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create Question Packets
# Create Question Packets
technical_packet = QuestionPacket.find_or_create_by!(name: "Advanced Technical Questions")
behavioral_packet = QuestionPacket.find_or_create_by!(name: "Behavioral Questions")

# Create Questions
questions = [
  {
    question_text: "What is a primary key?",
    answer_choice_1: "A database field",
    answer_choice_2: "A database record",
    answer_choice_3: "A unique identifier",
    answer_choice_4: "A foreign key",
    correct_answer: 3,
    explanation_text: "Primary keys uniquely identify rows in a table.",
    category: "Database"
  },
  {
    question_text: "Explain normalization in databases.",
    answer_choice_1: "Process of combining tables",
    answer_choice_2: "Process of reducing redundancy",
    answer_choice_3: "Optimizing database speed",
    answer_choice_4: "None of the above",
    correct_answer: 2,
    explanation_text: "Normalization reduces redundancy in database design.",
    category: "Database"
  },
  # Linked questions
  {
    question_text: "What is the first step in normalizing a database?",
    answer_choice_1: "Remove duplicate rows",
    answer_choice_2: "Identify primary keys",
    answer_choice_3: "Break down tables into smaller tables",
    answer_choice_4: "Normalize relationships",
    correct_answer: 2,
    explanation_text: "The first step is to identify primary keys.",
    category: "Database",
    question_link: "Normalization",
    question_link_order: 1
  },
  {
    question_text: "What is the second step in normalizing a database?",
    answer_choice_1: "Break down tables into smaller tables",
    answer_choice_2: "Eliminate redundancy",
    answer_choice_3: "Identify relationships",
    answer_choice_4: "Ensure each column depends on the primary key",
    correct_answer: 4,
    explanation_text: "Each column should depend on the primary key.",
    category: "Database",
    question_link: "Normalization",
    question_link_order: 2
  },
  {
    question_text: "What is the third step in normalizing a database?",
    answer_choice_1: "Eliminate transitive dependencies",
    answer_choice_2: "Remove foreign keys",
    answer_choice_3: "Combine related tables",
    answer_choice_4: "Identify primary keys",
    correct_answer: 1,
    explanation_text: "Transitive dependencies must be eliminated.",
    category: "Database",
    question_link: "Normalization",
    question_link_order: 3
  },
  {
    question_text: "What is the purpose of normalization?",
    answer_choice_1: "Reduce redundancy and improve efficiency",
    answer_choice_2: "Add duplicate rows",
    answer_choice_3: "Reduce the number of primary keys",
    answer_choice_4: "None of the above",
    correct_answer: 1,
    explanation_text: "Normalization improves efficiency and reduces redundancy.",
    category: "Database",
    question_link: "Normalization",
    question_link_order: 4
  },
  # Additional questions
  {
    question_text: "What is a foreign key?",
    answer_choice_1: "A unique identifier",
    answer_choice_2: "A primary key in another table",
    answer_choice_3: "A duplicate column",
    answer_choice_4: "A key used to unlock databases",
    correct_answer: 2,
    explanation_text: "A foreign key references the primary key in another table.",
    category: "Database"
  },
  {
    question_text: "What is SQL?",
    answer_choice_1: "Structured Query Language",
    answer_choice_2: "Standard Query Language",
    answer_choice_3: "Simple Query Language",
    answer_choice_4: "Sequential Query Language",
    correct_answer: 1,
    explanation_text: "SQL stands for Structured Query Language.",
    category: "Database"
  },
  {
    question_text: "What is a join in SQL?",
    answer_choice_1: "Combining rows from two or more tables",
    answer_choice_2: "Linking primary keys",
    answer_choice_3: "Removing duplicate rows",
    answer_choice_4: "Adding a column",
    correct_answer: 1,
    explanation_text: "A join combines rows from multiple tables.",
    category: "Database"
  },
  {
    question_text: "What is an index in a database?",
    answer_choice_1: "A table of contents for data",
    answer_choice_2: "A duplicate of data",
    answer_choice_3: "A primary key",
    answer_choice_4: "A unique constraint",
    correct_answer: 1,
    explanation_text: "An index improves query performance.",
    category: "Database"
  },
  {
    question_text: "What is a unique constraint?",
    answer_choice_1: "Prevents duplicate values in a column",
    answer_choice_2: "Ensures all columns have unique values",
    answer_choice_3: "Combines multiple tables",
    answer_choice_4: "Adds a new column",
    correct_answer: 1,
    explanation_text: "A unique constraint ensures column values are unique.",
    category: "Database"
  },
  # Add 15 more technical database-related questions...
]

# Loop through questions and add them to the database
questions.each_with_index do |question_data, index|
  question = Question.create!(
    question_text: question_data[:question_text],
    answer_choice_1: question_data[:answer_choice_1],
    answer_choice_2: question_data[:answer_choice_2],
    answer_choice_3: question_data[:answer_choice_3],
    answer_choice_4: question_data[:answer_choice_4],
    correct_answer: question_data[:correct_answer],
    explanation_text: question_data[:explanation_text],
    category: question_data[:category],
    question_link: question_data[:question_link],
    question_link_order: question_data[:question_link_order],
    position_type_id: 2
  )

  # Assign all questions to the technical packet
  QuestionPacketMembership.create!(question: question, question_packet: technical_packet)
end

