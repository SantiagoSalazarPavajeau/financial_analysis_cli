class FinancialAnalysis::Company
  # https://financialmodelingprep.com/api/v3/company/profile/MU
  # https://financialmodelingprep.com/api/v3/financials/balance-sheet-statement/FB
  # https://financialmodelingprep.com/api/v3/financials/income-statement/AAPL
  # https://financialmodelingprep.com/api/v3/company/stock/list
  
  attr_accessor :name, :balance_sheet, :income_statement, :profile
  
  @@all = []
  
  def initialize(name)
    @name = name
    @balance_sheet= "Balance Sheet Object"
    @income_statement = "Income Statment Object"
    @profile = "Profile Object"
  end
  
  def get_profile(ticker)
    response = HTTParty.get("https://financialmodelingprep.com/api/v3/company/profile/#{ticker}")
    profile = FinancialAnalysis::Company.new(response)
  end
  
  def name
    
  end
  
  def self.all
    @@all
    # puts "1. Apple"
    # puts "2. Facebook"
    # puts "3. GM"
  end
  
end