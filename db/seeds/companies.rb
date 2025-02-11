# db/seeds/companies.rb

# Helper to find position_type_id by name
def find_position_type_id(name)
  PositionType.find_by(name: name)&.id
end

# Companies by Position Type
investment_banking_companies = [
  { name: 'Goldman Sachs', position_type_id: find_position_type_id('Investment Banking') },
  { name: 'JPMorgan Chase', position_type_id: find_position_type_id('Investment Banking') },
  { name: 'Morgan Stanley', position_type_id: find_position_type_id('Investment Banking') },
  { name: 'Bank of America Merrill Lynch', position_type_id: find_position_type_id('Investment Banking') },
  { name: 'Citigroup', position_type_id: find_position_type_id('Investment Banking') },
  { name: 'Baird', position_type_id: find_position_type_id('Investment Banking') },
  { name: 'Credit Suisse', position_type_id: find_position_type_id('Investment Banking') },
  { name: 'Deutsche Bank', position_type_id: find_position_type_id('Investment Banking') },
  { name: 'Barclays', position_type_id: find_position_type_id('Investment Banking') },
  { name: 'UBS', position_type_id: find_position_type_id('Investment Banking') },
  { name: 'Lazard', position_type_id: find_position_type_id('Investment Banking') },
  { name: 'Centerview', position_type_id: find_position_type_id('Investment Banking') },
  { name: 'Evercore', position_type_id: find_position_type_id('Investment Banking') },
  { name: 'Jefferies', position_type_id: find_position_type_id('Investment Banking') },
  { name: 'Houlihan Lokey', position_type_id: find_position_type_id('Investment Banking') },
  { name: 'Rothschild & Co', position_type_id: find_position_type_id('Investment Banking') },
  { name: 'Guggenheim Partners', position_type_id: find_position_type_id('Investment Banking') },
  { name: 'Moelis & Company', position_type_id: find_position_type_id('Investment Banking') },
  { name: 'Perella Weinberg Partners', position_type_id: find_position_type_id('Investment Banking') },
  { name: 'PJT Partners', position_type_id: find_position_type_id('Investment Banking') },
  { name: 'Greenhill & Co', position_type_id: find_position_type_id('Investment Banking') },
  { name: 'Raymond James', position_type_id: find_position_type_id('Investment Banking') },
  { name: 'HSBC', position_type_id: find_position_type_id('Investment Banking') },
  { name: 'Macquarie Group', position_type_id: find_position_type_id('Investment Banking') },
  { name: 'Nomura', position_type_id: find_position_type_id('Investment Banking') },
  { name: 'Societe Generale', position_type_id: find_position_type_id('Investment Banking') },
  { name: 'BNP Paribas', position_type_id: find_position_type_id('Investment Banking') },
  { name: 'Wells Fargo Securities', position_type_id: find_position_type_id('Investment Banking') },
  { name: 'CIBC World Markets', position_type_id: find_position_type_id('Investment Banking') },
  { name: 'Mizuho Financial Group', position_type_id: find_position_type_id('Investment Banking') },
  { name: 'BMO', position_type_id: find_position_type_id('Investment Banking') },
  { name: 'RBC', position_type_id: find_position_type_id('Investment Banking') },
  { name: 'Truist', position_type_id: find_position_type_id('Investment Banking') },
  { name: 'Santander', position_type_id: find_position_type_id('Investment Banking') },
  { name: 'LionTree', position_type_id: find_position_type_id('Investment Banking') },
  { name: 'Qatalyst', position_type_id: find_position_type_id('Investment Banking') },
  { name: 'Raine Group', position_type_id: find_position_type_id('Investment Banking') },
  { name: 'Allen & Company', position_type_id: find_position_type_id('Investment Banking') },
]

private_equity_companies = [
  { name: 'Blackstone', position_type_id: find_position_type_id('Private Equity') },
  { name: 'KKR', position_type_id: find_position_type_id('Private Equity') },
  { name: 'Carlyle Group', position_type_id: find_position_type_id('Private Equity') },
  { name: 'TPG Capital', position_type_id: find_position_type_id('Private Equity') },
  { name: 'Apollo', position_type_id: find_position_type_id('Private Equity') },
  { name: 'Warburg Pincus', position_type_id: find_position_type_id('Private Equity') },
  { name: 'Bain Capital', position_type_id: find_position_type_id('Private Equity') },
  { name: 'Advent International', position_type_id: find_position_type_id('Private Equity') },
  { name: 'Hellman & Friedman', position_type_id: find_position_type_id('Private Equity') },
  { name: 'Silver Lake Partners', position_type_id: find_position_type_id('Private Equity') },
  { name: 'Thoma Bravo', position_type_id: find_position_type_id('Private Equity') },
  { name: 'Clayton, Dubilier & Rice (CD&R)', position_type_id: find_position_type_id('Private Equity') },
  { name: 'EQT Partners', position_type_id: find_position_type_id('Private Equity') },
  { name: 'General Atlantic', position_type_id: find_position_type_id('Private Equity') },
  { name: 'Vista Equity Partners', position_type_id: find_position_type_id('Private Equity') },
  { name: 'Brookfield Asset Management', position_type_id: find_position_type_id('Private Equity') },
  { name: 'CVC Capital Partners', position_type_id: find_position_type_id('Private Equity') },
  { name: 'Permira', position_type_id: find_position_type_id('Private Equity') },
  { name: 'Ares Management', position_type_id: find_position_type_id('Private Equity') },
  { name: 'Oaktree Capital Management', position_type_id: find_position_type_id('Private Equity') },
  { name: 'L Catterton', position_type_id: find_position_type_id('Private Equity') },
  { name: 'Partners Group', position_type_id: find_position_type_id('Private Equity') },
  { name: 'HarbourVest Partners', position_type_id: find_position_type_id('Private Equity') },
  { name: 'Apollo Global Management', position_type_id: find_position_type_id('Private Equity') },
  { name: 'Ardian', position_type_id: find_position_type_id('Private Equity') },
  { name: 'Kohlberg & Company', position_type_id: find_position_type_id('Private Equity') },
  { name: 'Francisco Partners', position_type_id: find_position_type_id('Private Equity') },
  { name: 'HG Capital', position_type_id: find_position_type_id('Private Equity') },
  { name: 'ICG (Intermediate Capital Group)', position_type_id: find_position_type_id('Private Equity') },
  { name: 'Providence Equity Partners', position_type_id: find_position_type_id('Private Equity') },
  { name: 'Charterhouse Capital Partners', position_type_id: find_position_type_id('Private Equity') },
  { name: 'Sun Capital Partners', position_type_id: find_position_type_id('Private Equity') },
  { name: 'Lion Capital', position_type_id: find_position_type_id('Private Equity') },
  { name: 'Cerberus Capital Management', position_type_id: find_position_type_id('Private Equity') },
  { name: 'HIG Capital', position_type_id: find_position_type_id('Private Equity') },
  { name: 'Adams Street Partners', position_type_id: find_position_type_id('Private Equity') },
  { name: 'Madison Dearborn Partners', position_type_id: find_position_type_id('Private Equity') },
  { name: 'Audax Group', position_type_id: find_position_type_id('Private Equity') },
  { name: 'American Securities', position_type_id: find_position_type_id('Private Equity') },
  { name: 'Paine Schwartz Partners', position_type_id: find_position_type_id('Private Equity') },
  { name: 'GTCR', position_type_id: find_position_type_id('Private Equity') },
  { name: 'Welsh, Carson, Anderson & Stowe (WCAS)', position_type_id: find_position_type_id('Private Equity') },
  { name: 'Accel-KKR', position_type_id: find_position_type_id('Private Equity') }
]

venture_capital_companies = [
  { name: 'Sequoia Capital', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'Andreessen Horowitz', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'Accel Partners', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'Benchmark', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'Greylock Partners', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'Lightspeed Venture Partners', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'Kleiner Perkins', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'Union Square Ventures', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'Bessemer Venture Partners', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'Insight Partners', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'GV (Google Ventures)', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'SoftBank Vision Fund', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'Index Ventures', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'IVP (Institutional Venture Partners)', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'NEA (New Enterprise Associates)', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'General Catalyst', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'Redpoint Ventures', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'Balderton Capital', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'Forerunner Ventures', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'Craft Ventures', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'First Round Capital', position_type_id: find_position_type_id('Venture Capital') },
  { name: '500 Global (formerly 500 Startups)', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'Hummingbird Ventures', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'Foundry Group', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'RRE Ventures', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'Tiger Global Management', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'Battery Ventures', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'Menlo Ventures', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'Norwest Venture Partners', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'Sapphire Ventures', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'Alkeon Capital', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'Thrive Capital', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'Founders Fund', position_type_id: find_position_type_id('Venture Capital') },
  { name: '8VC', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'DCM Ventures', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'Shasta Ventures', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'Wing Venture Capital', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'Altos Ventures', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'Matrix Partners', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'GGV Capital', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'Aspect Ventures', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'Crosslink Capital', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'Scale Venture Partners', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'Eurazeo', position_type_id: find_position_type_id('Venture Capital') },
  { name: 'Palo Alto Networks Ventures', position_type_id: find_position_type_id('Venture Capital') }
]


corporate_development_companies = [
  # Technology
  { name: 'Google', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'Amazon', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'Microsoft', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'Apple', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'Meta (formerly Facebook)', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'Netflix', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'Adobe', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'Salesforce', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'Intel', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'Cisco Systems', position_type_id: find_position_type_id('Corporate Development') },

  # Insurance
  { name: 'AIG', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'MetLife', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'Prudential Financial', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'Allstate', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'State Farm', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'The Hartford', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'Chubb Limited', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'Liberty Mutual', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'Progressive', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'Travelers Companies', position_type_id: find_position_type_id('Corporate Development') },

  # Manufacturing
  { name: 'General Electric (GE)', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'Honeywell', position_type_id: find_position_type_id('Corporate Development') },
  { name: '3M', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'Caterpillar', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'Deere & Company', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'Eaton Corporation', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'Emerson Electric', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'Parker Hannifin', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'Rockwell Automation', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'Textron', position_type_id: find_position_type_id('Corporate Development') },

  # Pharmaceuticals and Healthcare
  { name: 'Pfizer', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'Johnson & Johnson', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'Merck', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'AbbVie', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'Bristol-Myers Squibb', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'Amgen', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'Gilead Sciences', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'Novartis', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'Eli Lilly', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'Roche', position_type_id: find_position_type_id('Corporate Development') },

  # Retail
  { name: 'Walmart', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'Target', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'Costco Wholesale', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'Home Depot', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'Lowe’s', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'CVS Health', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'Walgreens Boots Alliance', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'Kroger', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'Macy’s', position_type_id: find_position_type_id('Corporate Development') },
  { name: 'Nordstrom', position_type_id: find_position_type_id('Corporate Development') }
]

hedge_fund_companies = [
  { name: 'Citadel', position_type_id: find_position_type_id('Hedge Fund') },
  { name: 'Bridgewater Associates', position_type_id: find_position_type_id('Hedge Fund') },
  { name: 'Two Sigma', position_type_id: find_position_type_id('Hedge Fund') },
  { name: 'Millennium Management', position_type_id: find_position_type_id('Hedge Fund') },
  { name: 'D.E. Shaw & Co.', position_type_id: find_position_type_id('Hedge Fund') },
  { name: 'Renaissance Technologies', position_type_id: find_position_type_id('Hedge Fund') },
  { name: 'Point72 Asset Management', position_type_id: find_position_type_id('Hedge Fund') },
  { name: 'AQR Capital Management', position_type_id: find_position_type_id('Hedge Fund') },
  { name: 'Elliott Management Corporation', position_type_id: find_position_type_id('Hedge Fund') },
  { name: 'Man Group', position_type_id: find_position_type_id('Hedge Fund') },
  { name: 'Balyasny Asset Management', position_type_id: find_position_type_id('Hedge Fund') },
  { name: 'Pershing Square Capital Management', position_type_id: find_position_type_id('Hedge Fund') },
  { name: 'BlueCrest Capital Management', position_type_id: find_position_type_id('Hedge Fund') },
  { name: 'Caxton Associates', position_type_id: find_position_type_id('Hedge Fund') },
  { name: 'Marshall Wace', position_type_id: find_position_type_id('Hedge Fund') },
  { name: 'Davidson Kempner Capital Management', position_type_id: find_position_type_id('Hedge Fund') },
  { name: 'Hudson Bay Capital Management', position_type_id: find_position_type_id('Hedge Fund') },
  { name: 'Anchorage Capital Partners', position_type_id: find_position_type_id('Hedge Fund') },
  { name: 'Third Point LLC', position_type_id: find_position_type_id('Hedge Fund') },
  { name: 'Adage Capital Management', position_type_id: find_position_type_id('Hedge Fund') },
  { name: 'King Street Capital Management', position_type_id: find_position_type_id('Hedge Fund') },
  { name: 'Canyon Partners', position_type_id: find_position_type_id('Hedge Fund') },
  { name: 'Farallon Capital', position_type_id: find_position_type_id('Hedge Fund') },
  { name: 'Och-Ziff Capital Management (Sculptor)', position_type_id: find_position_type_id('Hedge Fund') },
  { name: 'Lone Pine Capital', position_type_id: find_position_type_id('Hedge Fund') },
  { name: 'Tiger Global Management', position_type_id: find_position_type_id('Hedge Fund') },
  { name: 'Greenlight Capital', position_type_id: find_position_type_id('Hedge Fund') },
  { name: 'Highbridge Capital Management', position_type_id: find_position_type_id('Hedge Fund') },
  { name: 'ValueAct Capital', position_type_id: find_position_type_id('Hedge Fund') },
  { name: 'Viking Global Investors', position_type_id: find_position_type_id('Hedge Fund') },
  { name: 'Glennmont Partners', position_type_id: find_position_type_id('Hedge Fund') },
  { name: 'Tudor Investment Corporation', position_type_id: find_position_type_id('Hedge Fund') },
  { name: 'Soros Fund Management', position_type_id: find_position_type_id('Hedge Fund') },
  { name: 'York Capital Management', position_type_id: find_position_type_id('Hedge Fund') },
  { name: 'GMO LLC', position_type_id: find_position_type_id('Hedge Fund') },
  { name: 'Perry Capital', position_type_id: find_position_type_id('Hedge Fund') }
]

investment_management_companies = [
  { name: 'Fidelity Investments', position_type_id: find_position_type_id('Investment Management') },
  { name: 'Vanguard', position_type_id: find_position_type_id('Investment Management') },
  { name: 'BlackRock', position_type_id: find_position_type_id('Investment Management') },
  { name: 'T. Rowe Price', position_type_id: find_position_type_id('Investment Management') },
  { name: 'Schroders', position_type_id: find_position_type_id('Investment Management') },
  { name: 'AllianceBernstein (Bernstein)', position_type_id: find_position_type_id('Investment Management') },
  { name: 'Dodge & Cox', position_type_id: find_position_type_id('Investment Management') },
  { name: 'Neuberger Berman', position_type_id: find_position_type_id('Investment Management') },
  { name: 'PIMCO', position_type_id: find_position_type_id('Investment Management') },
  { name: 'Franklin Templeton Investments', position_type_id: find_position_type_id('Investment Management') },
  { name: 'Invesco', position_type_id: find_position_type_id('Investment Management') },
  { name: 'State Street Global Advisors', position_type_id: find_position_type_id('Investment Management') },
  { name: 'Northern Trust Asset Management', position_type_id: find_position_type_id('Investment Management') },
  { name: 'Charles Schwab Investment Management', position_type_id: find_position_type_id('Investment Management') },
  { name: 'Janus Henderson Investors', position_type_id: find_position_type_id('Investment Management') },
  { name: 'Capital Group (American Funds)', position_type_id: find_position_type_id('Investment Management') },
  { name: 'J.P. Morgan Asset Management', position_type_id: find_position_type_id('Investment Management') },
  { name: 'Morgan Stanley Investment Management', position_type_id: find_position_type_id('Investment Management') },
  { name: 'Goldman Sachs Asset Management', position_type_id: find_position_type_id('Investment Management') },
  { name: 'UBS Asset Management', position_type_id: find_position_type_id('Investment Management') },
  { name: 'Barings', position_type_id: find_position_type_id('Investment Management') },
  { name: 'Nuveen', position_type_id: find_position_type_id('Investment Management') },
  { name: 'Wellington Management', position_type_id: find_position_type_id('Investment Management') },
  { name: 'Principal Global Investors', position_type_id: find_position_type_id('Investment Management') },
  { name: 'Amundi Asset Management', position_type_id: find_position_type_id('Investment Management') },
  { name: 'Legg Mason', position_type_id: find_position_type_id('Investment Management') },
  { name: 'Macquarie Asset Management', position_type_id: find_position_type_id('Investment Management') },
  { name: 'Putnam Investments', position_type_id: find_position_type_id('Investment Management') },
  { name: 'Manulife Investment Management', position_type_id: find_position_type_id('Investment Management') },
  { name: 'MFS Investment Management', position_type_id: find_position_type_id('Investment Management') },
  { name: 'Dimensional Fund Advisors', position_type_id: find_position_type_id('Investment Management') },
  { name: 'AQR Capital Management', position_type_id: find_position_type_id('Investment Management') },
  { name: 'DoubleLine Capital', position_type_id: find_position_type_id('Investment Management') },
  { name: 'Voya Investment Management', position_type_id: find_position_type_id('Investment Management') },
  { name: 'Brandywine Global', position_type_id: find_position_type_id('Investment Management') },
  { name: 'Eaton Vance', position_type_id: find_position_type_id('Investment Management') },
  { name: 'Robeco', position_type_id: find_position_type_id('Investment Management') },
  { name: 'Loomis Sayles', position_type_id: find_position_type_id('Investment Management') },
  { name: 'Federated Hermes', position_type_id: find_position_type_id('Investment Management') },
  { name: 'ClearBridge Investments', position_type_id: find_position_type_id('Investment Management') }
]

fp_and_a_companies = [
  # Technology
  { name: 'Datadog', position_type_id: find_position_type_id('FP&A') },
  { name: 'Databricks', position_type_id: find_position_type_id('FP&A') },
  { name: 'Microsoft', position_type_id: find_position_type_id('FP&A') },
  { name: 'Amazon', position_type_id: find_position_type_id('FP&A') },
  { name: 'Google', position_type_id: find_position_type_id('FP&A') },
  { name: 'Apple', position_type_id: find_position_type_id('FP&A') },
  { name: 'Meta (formerly Facebook)', position_type_id: find_position_type_id('FP&A') },
  { name: 'Adobe', position_type_id: find_position_type_id('FP&A') },
  { name: 'Salesforce', position_type_id: find_position_type_id('FP&A') },
  { name: 'Intel', position_type_id: find_position_type_id('FP&A') },

  # Manufacturing
  { name: 'General Electric', position_type_id: find_position_type_id('FP&A') },
  { name: '3M', position_type_id: find_position_type_id('FP&A') },
  { name: 'Caterpillar', position_type_id: find_position_type_id('FP&A') },
  { name: 'Honeywell', position_type_id: find_position_type_id('FP&A') },
  { name: 'Emerson Electric', position_type_id: find_position_type_id('FP&A') },
  { name: 'Deere & Company', position_type_id: find_position_type_id('FP&A') },
  { name: 'Parker Hannifin', position_type_id: find_position_type_id('FP&A') },
  { name: 'Rockwell Automation', position_type_id: find_position_type_id('FP&A') },
  { name: 'Eaton Corporation', position_type_id: find_position_type_id('FP&A') },
  { name: 'Textron', position_type_id: find_position_type_id('FP&A') },

  # Consumer Goods
  { name: 'Procter & Gamble', position_type_id: find_position_type_id('FP&A') },
  { name: 'Coca-Cola', position_type_id: find_position_type_id('FP&A') },
  { name: 'PepsiCo', position_type_id: find_position_type_id('FP&A') },
  { name: 'Unilever', position_type_id: find_position_type_id('FP&A') },
  { name: 'Nestlé', position_type_id: find_position_type_id('FP&A') },
  { name: 'Colgate-Palmolive', position_type_id: find_position_type_id('FP&A') },
  { name: 'Kimberly-Clark', position_type_id: find_position_type_id('FP&A') },
  { name: 'Mondelez International', position_type_id: find_position_type_id('FP&A') },
  { name: 'The Hershey Company', position_type_id: find_position_type_id('FP&A') },
  { name: 'Kraft Heinz', position_type_id: find_position_type_id('FP&A') },

  # Healthcare
  { name: 'Johnson & Johnson', position_type_id: find_position_type_id('FP&A') },
  { name: 'Pfizer', position_type_id: find_position_type_id('FP&A') },
  { name: 'Merck & Co.', position_type_id: find_position_type_id('FP&A') },
  { name: 'AbbVie', position_type_id: find_position_type_id('FP&A') },
  { name: 'Bristol-Myers Squibb', position_type_id: find_position_type_id('FP&A') },
  { name: 'Amgen', position_type_id: find_position_type_id('FP&A') },
  { name: 'Gilead Sciences', position_type_id: find_position_type_id('FP&A') },
  { name: 'Eli Lilly', position_type_id: find_position_type_id('FP&A') },
  { name: 'Medtronic', position_type_id: find_position_type_id('FP&A') },
  { name: 'Roche', position_type_id: find_position_type_id('FP&A') },

  # Retail
  { name: 'Walmart', position_type_id: find_position_type_id('FP&A') },
  { name: 'Target', position_type_id: find_position_type_id('FP&A') },
  { name: 'Costco Wholesale', position_type_id: find_position_type_id('FP&A') },
  { name: 'Home Depot', position_type_id: find_position_type_id('FP&A') },
  { name: 'Lowe’s', position_type_id: find_position_type_id('FP&A') },
  { name: 'CVS Health', position_type_id: find_position_type_id('FP&A') },
  { name: 'Walgreens Boots Alliance', position_type_id: find_position_type_id('FP&A') },
  { name: 'Kroger', position_type_id: find_position_type_id('FP&A') },
  { name: 'Macy’s', position_type_id: find_position_type_id('FP&A') },
  { name: 'Nordstrom', position_type_id: find_position_type_id('FP&A') }
]

consulting_companies = [
  # Strategy Consulting (MBB and Other Top Strategy Firms)
  { name: 'McKinsey & Company', position_type_id: find_position_type_id('Consulting') },
  { name: 'Boston Consulting Group (BCG)', position_type_id: find_position_type_id('Consulting') },
  { name: 'Bain & Company', position_type_id: find_position_type_id('Consulting') },
  { name: 'Roland Berger', position_type_id: find_position_type_id('Consulting') },
  { name: 'Oliver Wyman', position_type_id: find_position_type_id('Consulting') },
  { name: 'L.E.K. Consulting', position_type_id: find_position_type_id('Consulting') },
  { name: 'Arthur D. Little', position_type_id: find_position_type_id('Consulting') },

  # Big Four & Accounting Advisory
  { name: 'Deloitte Consulting', position_type_id: find_position_type_id('Consulting') },
  { name: 'PwC Advisory', position_type_id: find_position_type_id('Consulting') },
  { name: 'EY-Parthenon', position_type_id: find_position_type_id('Consulting') },
  { name: 'KPMG Strategy', position_type_id: find_position_type_id('Consulting') },
  { name: 'Grant Thornton Advisory', position_type_id: find_position_type_id('Consulting') },
  { name: 'BDO Consulting', position_type_id: find_position_type_id('Consulting') },

  # Economic Consulting
  { name: 'Cornerstone Research', position_type_id: find_position_type_id('Consulting') },
  { name: 'NERA Economic Consulting', position_type_id: find_position_type_id('Consulting') },
  { name: 'Compass Lexecon', position_type_id: find_position_type_id('Consulting') },
  { name: 'Analysis Group', position_type_id: find_position_type_id('Consulting') },
  { name: 'Brattle Group', position_type_id: find_position_type_id('Consulting') },
  { name: 'FTI Consulting', position_type_id: find_position_type_id('Consulting') },

  # Boutique & Specialized Firms
  { name: 'AlixPartners', position_type_id: find_position_type_id('Consulting') },
  { name: 'Booz Allen Hamilton', position_type_id: find_position_type_id('Consulting') },
  { name: 'Zeb Consulting', position_type_id: find_position_type_id('Consulting') },
  { name: 'Simon-Kucher & Partners', position_type_id: find_position_type_id('Consulting') },
  { name: 'Keystone Strategy', position_type_id: find_position_type_id('Consulting') },
  { name: 'Putnam Associates', position_type_id: find_position_type_id('Consulting') },
  { name: 'Teneo', position_type_id: find_position_type_id('Consulting') },
  { name: 'Mars & Co', position_type_id: find_position_type_id('Consulting') },
  { name: 'OC&C Strategy Consultants', position_type_id: find_position_type_id('Consulting') },
  { name: 'L.E.K. Consulting', position_type_id: find_position_type_id('Consulting') },

  # IT & Digital Consulting
  { name: 'Capgemini', position_type_id: find_position_type_id('Consulting') },
  { name: 'Accenture Strategy', position_type_id: find_position_type_id('Consulting') },
  { name: 'IBM Global Business Services', position_type_id: find_position_type_id('Consulting') },
  { name: 'Publicis Sapient', position_type_id: find_position_type_id('Consulting') },
  { name: 'Cognizant Consulting', position_type_id: find_position_type_id('Consulting') },
  { name: 'Bain & Company Digital', position_type_id: find_position_type_id('Consulting') },
  { name: 'Infosys Consulting', position_type_id: find_position_type_id('Consulting') },
  { name: 'Tata Consultancy Services (TCS)', position_type_id: find_position_type_id('Consulting') },
  { name: 'Wipro Consulting', position_type_id: find_position_type_id('Consulting') }
]


other_companies = [
  { name: 'Other', position_type_id: find_position_type_id('Other') }
]

# Combine all companies
all_companies = investment_banking_companies +
                private_equity_companies +
                venture_capital_companies +
                corporate_development_companies +
                hedge_fund_companies +
                investment_management_companies +
                fp_and_a_companies +
                consulting_companies +
                other_companies

# Create records
Company.create!(all_companies)
