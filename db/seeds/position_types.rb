# db/seeds/position_types.rb

position_types = [
  { id: 1, name: 'Investment Banking', description: nil },
  { id: 2, name: 'Private Equity', description: nil },
  { id: 3, name: 'Venture Capital', description: nil },
  { id: 4, name: 'Corporate Development', description: nil },
  { id: 5, name: 'Hedge Fund', description: nil },
  { id: 6, name: 'Investment Management', description: nil },
  { id: 7, name: 'FP&A', description: nil },
  { id: 8, name: 'Consulting', description: nil },
  { id: 9, name: 'Other', description: nil }
]

PositionType.create!(position_types)
