
# Helper methods to find IDs by name
def find_position_type_id(name)
  PositionType.find_by(name: name)&.id
end

def find_company_id(name)
  Company.find_by(name: name)&.id
end

def find_location_id(name)
  Location.find_by(name: name)&.id
end

groups = [

  # -------------------- Default Investment Banking Groups --------------------
  { name: "TMT", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: true },
  { name: "Healthcare", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: true },
  { name: "M&A", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: true },
  { name: "LevFin", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: true },
  { name: "Restructuring", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: true },
  { name: "ECM", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: true },
  { name: "DCM", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: true },
  { name: "Private Capital Advisory", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: true },
  { name: "Financial Sponsors", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: true },
  { name: "FIG", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: true },
  { name: "Energy & Natural Resources", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: true },
  { name: "Consumer & Retail", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: true },
  { name: "Real Estate, Gaming, & Lodging", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: true },
  { name: "Public Sector & Infrastructure", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: true },
  { name: "Generalist", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: true },

  # -------------------- Industry-Specific Groups (Evercore) --------------------
  { name: "Chemicals", company_id: find_company_id("Evercore"), location_id: find_location_id("New York"), position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Communications", company_id: find_company_id("Evercore"), location_id: find_location_id("New York"), position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Consumer / Retail", company_id: find_company_id("Evercore"), location_id: find_location_id("New York"), position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Financial Services", company_id: find_company_id("Evercore"), location_id: find_location_id("New York"), position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Healthcare", company_id: find_company_id("Evercore"), location_id: find_location_id("New York"), position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Industrials", company_id: find_company_id("Evercore"), location_id: find_location_id("New York"), position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Infrastructure, Utilities & Renewables (IUR)", company_id: find_company_id("Evercore"), location_id: find_location_id("New York"), position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Insurance", company_id: find_company_id("Evercore"), location_id: find_location_id("New York"), position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Information & Media", company_id: find_company_id("Evercore"), location_id: find_location_id("New York"), position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Metals, Materials & Mining", company_id: find_company_id("Evercore"), location_id: find_location_id("New York"), position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Technology", company_id: find_company_id("Evercore"), location_id: find_location_id("New York"), position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Transportation", company_id: find_company_id("Evercore"), location_id: find_location_id("New York"), position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },

  # -------------------- Industry-Specific Groups (Goldman Sachs) --------------------
  { name: "Consumer / Retail", company_id: find_company_id("Goldman Sachs"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Financial and Strategic Investors", company_id: find_company_id("Goldman Sachs"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Financial Institutions", company_id: find_company_id("Goldman Sachs"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Healthcare", company_id: find_company_id("Goldman Sachs"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Industrials", company_id: find_company_id("Goldman Sachs"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Natural Resources", company_id: find_company_id("Goldman Sachs"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Public Sector and Infrastructure", company_id: find_company_id("Goldman Sachs"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Real Estate", company_id: find_company_id("Goldman Sachs"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "TMT", company_id: find_company_id("Goldman Sachs"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "ECM", company_id: find_company_id("Goldman Sachs"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Investment Grade Capital Markets", company_id: find_company_id("Goldman Sachs"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Leveraged Finance Capital Markets", company_id: find_company_id("Goldman Sachs"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Corporate Derivatives", company_id: find_company_id("Goldman Sachs"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Structured Finance", company_id: find_company_id("Goldman Sachs"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Real Estate Financing", company_id: find_company_id("Goldman Sachs"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Sustainable Banking", company_id: find_company_id("Goldman Sachs"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },

  # -------------------- Industry-Specific Groups (JPMorgan Chase) --------------------
  { name: "Consumer retail", company_id: find_company_id("JPMorgan Chase"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Energy and infrastructure", company_id: find_company_id("JPMorgan Chase"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Financial institutions", company_id: find_company_id("JPMorgan Chase"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Financial investors", company_id: find_company_id("JPMorgan Chase"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Healthcare", company_id: find_company_id("JPMorgan Chase"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Industrials", company_id: find_company_id("JPMorgan Chase"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Media and communications", company_id: find_company_id("JPMorgan Chase"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Public sector", company_id: find_company_id("JPMorgan Chase"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Real estate", company_id: find_company_id("JPMorgan Chase"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Technology", company_id: find_company_id("JPMorgan Chase"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },

  # -------------------- Private Equity Groups --------------------
  { name: "TMT", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Private Equity"), position_type_default: true },
  { name: "Healthcare", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Private Equity"), position_type_default: true },
  { name: "Consumer & Retail", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Private Equity"), position_type_default: true },
  { name: "Industrials", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Private Equity"), position_type_default: true },
  { name: "Financial Services", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Private Equity"), position_type_default: true },
  { name: "Energy & Infrastructure", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Private Equity"), position_type_default: true },
  { name: "Real Estate", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Private Equity"), position_type_default: true },
  { name: "Business Services", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Private Equity"), position_type_default: true },
  { name: "Growth Equity", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Private Equity"), position_type_default: true },
  { name: "Distressed / Special Situations", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Private Equity"), position_type_default: true },

  # -------------------- Venture Capital Groups --------------------
  { name: "Technology", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Venture Capital"), position_type_default: true },
  { name: "Healthcare & Life Sciences", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Venture Capital"), position_type_default: true },
  { name: "Deep Tech & Frontier Tech", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Venture Capital"), position_type_default: true },
  { name: "Consumer & Entertainment", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Venture Capital"), position_type_default: true },
  { name: "Pre-Seed", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Venture Capital"), position_type_default: true },
  { name: "Seed", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Venture Capital"), position_type_default: true },
  { name: "Series A", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Venture Capital"), position_type_default: true },
  { name: "Series B", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Venture Capital"), position_type_default: true },
  { name: "Series C+", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Venture Capital"), position_type_default: true },

  # -------------------- Hedge Fund Groups --------------------
  { name: "TMT", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Hedge Fund"), position_type_default: true },
  { name: "Healthcare & Biotech", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Hedge Fund"), position_type_default: true },
  { name: "Financial Services & Fintech", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Hedge Fund"), position_type_default: true },
  { name: "Energy & Natural Resources", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Hedge Fund"), position_type_default: true },
  { name: "Consumer, Retail & E-Commerce", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Hedge Fund"), position_type_default: true },
  { name: "Industrials & Aerospace", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Hedge Fund"), position_type_default: true },
  { name: "Real Estate & REITs", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Hedge Fund"), position_type_default: true },
  { name: "Global Macro & Multi-Industry", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Hedge Fund"), position_type_default: true },
  { name: "Long / Short", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Hedge Fund"), position_type_default: true },
  { name: "Quantitative", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Hedge Fund"), position_type_default: true },
  { name: "Long only", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Hedge Fund"), position_type_default: true },
  { name: "Short only", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Hedge Fund"), position_type_default: true },

  # -------------------- Industry-Specific Groups (Bank of America Merrill Lynch) --------------------
  { name: "M&A", company_id: find_company_id("Bank of America Merrill Lynch"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Consumer and retail", company_id: find_company_id("Bank of America Merrill Lynch"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Natural resources and energy transition", company_id: find_company_id("Bank of America Merrill Lynch"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Financial institutions", company_id: find_company_id("Bank of America Merrill Lynch"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Healthcare", company_id: find_company_id("Bank of America Merrill Lynch"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Industrials", company_id: find_company_id("Bank of America Merrill Lynch"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Real estate, gaming and lodging", company_id: find_company_id("Bank of America Merrill Lynch"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "TMT", company_id: find_company_id("Bank of America Merrill Lynch"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Financial Sponsors", company_id: find_company_id("Bank of America Merrill Lynch"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },

  # -------------------- Industry-Specific Groups (Citigroup) --------------------
  { name: "Metals & Mining", company_id: find_company_id("Citigroup"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Consumer & Health", company_id: find_company_id("Citigroup"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Power, Utilities & Renewables Group", company_id: find_company_id("Citigroup"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "M&A", company_id: find_company_id("Citigroup"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Tech", company_id: find_company_id("Citigroup"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Financial Sponsors", company_id: find_company_id("Citigroup"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },

  # -------------------- Industry-Specific Groups (Barclays) --------------------
  { name: "Healthcare", company_id: find_company_id("Barclays"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Industrials", company_id: find_company_id("Barclays"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Financial Institutions", company_id: find_company_id("Barclays"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Real Estate", company_id: find_company_id("Barclays"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "TMT", company_id: find_company_id("Barclays"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Consumer Retail", company_id: find_company_id("Barclays"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Infrastructure", company_id: find_company_id("Barclays"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Energy Transition", company_id: find_company_id("Barclays"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Financial Sponsors", company_id: find_company_id("Barclays"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },

  # -------------------- Industry-Specific Groups (Morgan Stanley) --------------------
  { name: "Business Services", company_id: find_company_id("Morgan Stanley"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Consumer Retail", company_id: find_company_id("Morgan Stanley"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Financial Institutions", company_id: find_company_id("Morgan Stanley"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Financial Sponsors", company_id: find_company_id("Morgan Stanley"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Global Power & Utilities", company_id: find_company_id("Morgan Stanley"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Healthcare", company_id: find_company_id("Morgan Stanley"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Industrials", company_id: find_company_id("Morgan Stanley"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Latin America", company_id: find_company_id("Morgan Stanley"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Media & Communications", company_id: find_company_id("Morgan Stanley"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "M&A", company_id: find_company_id("Morgan Stanley"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Oil & Gas", company_id: find_company_id("Morgan Stanley"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Real Estate", company_id: find_company_id("Morgan Stanley"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Shareholder Activism", company_id: find_company_id("Morgan Stanley"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Transportation", company_id: find_company_id("Morgan Stanley"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },
  { name: "Technology", company_id: find_company_id("Morgan Stanley"), location_id: nil, position_type_id: find_position_type_id("Investment Banking"), position_type_default: false },

    # -------------------- Corporate Development Groups --------------------
  { name: "Technology", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Corporate Development"), position_type_default: true },
  { name: "Healthcare & Life Sciences", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Corporate Development"), position_type_default: true },
  { name: "Financial Services", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Corporate Development"), position_type_default: true },
  { name: "Consumer & Retail", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Corporate Development"), position_type_default: true },
  { name: "Energy & Infrastructure", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Corporate Development"), position_type_default: true },
  { name: "Media, Entertainment, & Gaming", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Corporate Development"), position_type_default: true },
  { name: "Industrial & Manufacturing", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Corporate Development"), position_type_default: true },

  # -------------------- FP&A Groups --------------------
  { name: "TMT", company_id: nil, location_id: nil, position_type_id: find_position_type_id("FP&A"), position_type_default: true },
  { name: "Healthcare & Life Sciences", company_id: nil, location_id: nil, position_type_id: find_position_type_id("FP&A"), position_type_default: true },
  { name: "Financial Services & Fintech", company_id: nil, location_id: nil, position_type_id: find_position_type_id("FP&A"), position_type_default: true },
  { name: "Energy & Natural Resources", company_id: nil, location_id: nil, position_type_id: find_position_type_id("FP&A"), position_type_default: true },
  { name: "Consumer, Retail & E-Commerce", company_id: nil, location_id: nil, position_type_id: find_position_type_id("FP&A"), position_type_default: true },
  { name: "Industrials & Manufacturing", company_id: nil, location_id: nil, position_type_id: find_position_type_id("FP&A"), position_type_default: true },
  { name: "Real Estate & REITs", company_id: nil, location_id: nil, position_type_id: find_position_type_id("FP&A"), position_type_default: true },

  # -------------------- Consulting Groups --------------------
  { name: "TMT", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Consulting"), position_type_default: true },
  { name: "Healthcare & Life Sciences", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Consulting"), position_type_default: true },
  { name: "Financial Services", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Consulting"), position_type_default: true },
  { name: "Fintech", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Consulting"), position_type_default: true },
  { name: "Energy & Natural Resources", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Consulting"), position_type_default: true },
  { name: "Consumer, Retail & E-Commerce", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Consulting"), position_type_default: true },
  { name: "Industrials, Manufacturing & Aerospace", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Consulting"), position_type_default: true },
  { name: "Real Estate & Infrastructure", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Consulting"), position_type_default: true },
  { name: "Public Sector & Government", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Consulting"), position_type_default: true },

  # -------------------- Investment Management Groups --------------------
  { name: "Buy Side", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Investment Management"), position_type_default: true },
  { name: "Sell Side", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Investment Management"), position_type_default: true },
  { name: "Equity", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Investment Management"), position_type_default: true },
  { name: "Fixed Income", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Investment Management"), position_type_default: true },
  { name: "Private Equity & Alternative Investments", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Investment Management"), position_type_default: true },
  { name: "Real Estate & REITs", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Investment Management"), position_type_default: true },
  { name: "Infrastructure", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Investment Management"), position_type_default: true },
  { name: "ESG", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Investment Management"), position_type_default: true },
  { name: "Multi-Asset", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Investment Management"), position_type_default: true },
  { name: "TMT", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Investment Management"), position_type_default: true },
  { name: "Healthcare & Life Sciences", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Investment Management"), position_type_default: true },
  { name: "Financial Services & Fintech", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Investment Management"), position_type_default: true },
  { name: "Energy & Natural Resources", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Investment Management"), position_type_default: true },
  { name: "Consumer, Retail, & E-Commerce", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Investment Management"), position_type_default: true },
  { name: "Industrials & Infrastructure", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Investment Management"), position_type_default: true },

  # -------------------- Other Groups --------------------
  { name: "TMT", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Other"), position_type_default: true },
  { name: "Healthcare & Life Sciences", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Other"), position_type_default: true },
  { name: "Financial Services & Fintech", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Other"), position_type_default: true },
  { name: "Energy & Industrials", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Other"), position_type_default: true },
  { name: "Consumer, Retail & Real Estate", company_id: nil, location_id: nil, position_type_id: find_position_type_id("Other"), position_type_default: true }
]

Group.create!(groups)
