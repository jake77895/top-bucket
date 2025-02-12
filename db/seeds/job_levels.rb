# db/seeds/job_levels.rb

# Helper methods to find IDs by name
def find_position_type_id(name)
  PositionType.find_by(name: name)&.id
end

def find_company_id(name)
  Company.find_by(name: name)&.id
end

job_levels = [
  # Investment Banking
  { name: 'Intern', level_rank: 0, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('Investment Banking'), company_id: nil },
  { name: 'Analyst', level_rank: 1, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('Investment Banking'), company_id: nil },
  { name: 'Associate', level_rank: 2, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('Investment Banking'), company_id: nil },
  { name: 'Vice President', level_rank: 3, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('Investment Banking'), company_id: nil },
  { name: 'Executive Director', level_rank: 4, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('Investment Banking'), company_id: nil },
  { name: 'Managing Director', level_rank: 5, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('Investment Banking'), company_id: nil },

  # Evercore (Investment Banking)
  { name: 'Intern', level_rank: 0, is_global_default: false, is_position_type_default: false, position_type_id: find_position_type_id('Investment Banking'), company_id: 11 },
  { name: 'Analyst', level_rank: 1, is_global_default: false, is_position_type_default: false, position_type_id: find_position_type_id('Investment Banking'), company_id: 11 },
  { name: 'Associate', level_rank: 2, is_global_default: false, is_position_type_default: false, position_type_id: find_position_type_id('Investment Banking'), company_id: 11 },
  { name: 'Vice President', level_rank: 3, is_global_default: false, is_position_type_default: false, position_type_id: find_position_type_id('Investment Banking'), company_id: 11 },
  { name: 'Managing Director', level_rank: 4, is_global_default: false, is_position_type_default: false, position_type_id: find_position_type_id('Investment Banking'), company_id: 11 },
  { name: 'Senior Managing Director', level_rank: 5, is_global_default: false, is_position_type_default: false, position_type_id: find_position_type_id('Investment Banking'), company_id: 11 },

  # Private Equity
  { name: 'Intern', level_rank: 0, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('Private Equity'), company_id: nil },
  { name: 'Analyst', level_rank: 1, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('Private Equity'), company_id: nil },
  { name: 'Associate', level_rank: 2, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('Private Equity'), company_id: nil },
  { name: 'Vice President', level_rank: 3, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('Private Equity'), company_id: nil },
  { name: 'Principal', level_rank: 4, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('Private Equity'), company_id: nil },
  { name: 'Partner', level_rank: 5, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('Private Equity'), company_id: nil },

  # Venture Capital
  { name: 'Intern', level_rank: 0, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('Venture Capital'), company_id: nil },
  { name: 'Analyst', level_rank: 1, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('Venture Capital'), company_id: nil },
  { name: 'Associate', level_rank: 2, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('Venture Capital'), company_id: nil },
  { name: 'Senior Associate', level_rank: 3, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('Venture Capital'), company_id: nil },
  { name: 'Principal', level_rank: 4, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('Venture Capital'), company_id: nil },
  { name: 'Partner', level_rank: 5, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('Venture Capital'), company_id: nil },

  # Corporate Development
  { name: 'Intern', level_rank: 0, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('Corporate Development'), company_id: nil },
  { name: 'Analyst', level_rank: 1, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('Corporate Development'), company_id: nil },
  { name: 'Associate', level_rank: 2, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('Corporate Development'), company_id: nil },
  { name: 'Manager', level_rank: 3, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('Corporate Development'), company_id: nil },
  { name: 'Director', level_rank: 4, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('Corporate Development'), company_id: nil },
  { name: 'Vice President', level_rank: 5, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('Corporate Development'), company_id: nil },

  # Investment Management
  { name: 'Intern', level_rank: 0, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('Investment Management'), company_id: nil },
  { name: 'Analyst', level_rank: 1, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('Investment Management'), company_id: nil },
  { name: 'Associate', level_rank: 2, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('Investment Management'), company_id: nil },
  { name: 'Senior Associate', level_rank: 3, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('Investment Management'), company_id: nil },
  { name: 'Portfolio Manager', level_rank: 4, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('Investment Management'), company_id: nil },
  { name: 'Director', level_rank: 5, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('Investment Management'), company_id: nil },

  # FP&A
  { name: 'Intern', level_rank: 0, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('FP&A'), company_id: nil },
  { name: 'Analyst', level_rank: 1, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('FP&A'), company_id: nil },
  { name: 'Senior Analyst / Associate', level_rank: 2, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('FP&A'), company_id: nil },
  { name: 'Manager', level_rank: 3, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('FP&A'), company_id: nil },
  { name: 'Director', level_rank: 4, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('FP&A'), company_id: nil },
  { name: 'Vice President', level_rank: 5, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('FP&A'), company_id: nil },

  # Consulting
  { name: 'Intern', level_rank: 0, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('Consulting'), company_id: nil },
  { name: 'Analyst', level_rank: 1, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('Consulting'), company_id: nil },
  { name: 'Associate', level_rank: 2, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('Consulting'), company_id: nil },
  { name: 'Manager', level_rank: 3, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('Consulting'), company_id: nil },
  { name: 'Director', level_rank: 4, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('Consulting'), company_id: nil },
  { name: 'Partner', level_rank: 5, is_global_default: false, is_position_type_default: true, position_type_id: find_position_type_id('Consulting'), company_id: nil },

  # Global Default
  { name: 'Intern', level_rank: 0, is_global_default: true, is_position_type_default: false, position_type_id: nil, company_id: nil },
  { name: 'Analyst', level_rank: 1, is_global_default: true, is_position_type_default: false, position_type_id: nil, company_id: nil },
  { name: 'Associate', level_rank: 2, is_global_default: true, is_position_type_default: false, position_type_id: nil, company_id: nil },
  { name: 'Manager', level_rank: 3, is_global_default: true, is_position_type_default: false, position_type_id: nil, company_id: nil },
  { name: 'Director', level_rank: 4, is_global_default: true, is_position_type_default: false, position_type_id: nil, company_id: nil },
  { name: 'Partner', level_rank: 5, is_global_default: true, is_position_type_default: false, position_type_id: nil, company_id: nil }
]

JobLevel.create!(job_levels)
