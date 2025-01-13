# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create Question Packets
technical_packet = QuestionPacket.create!(name: "Advanced Technical Questions")
behavioral_packet = QuestionPacket.create!(name: "Behavioral Questions")

# Create Questions
question1 = Question.create!(
  question_text: "What is a primary key?",
  answer_choice_1: "A database field",
  answer_choice_2: "A database record",
  answer_choice_3: "A unique identifier",
  answer_choice_4: "A foreign key",
  correct_answer: 3,
  explanation_text: "Primary keys uniquely identify rows in a table.",
  category: "Database",
  position_type_id: 2
)

question2 = Question.create!(
  question_text: "Explain normalization in databases.",
  answer_choice_1: "Process of combining tables",
  answer_choice_2: "Process of reducing redundancy",
  answer_choice_3: "Optimizing database speed",
  answer_choice_4: "None of the above",
  correct_answer: 2,
  explanation_text: "Normalization reduces redundancy in database design.",
  category: "Database",
  position_type_id: 2
)

# Assign Questions to Packets
QuestionPacketMembership.create!(question: question1, question_packet: technical_packet)
QuestionPacketMembership.create!(question: question2, question_packet: technical_packet)
