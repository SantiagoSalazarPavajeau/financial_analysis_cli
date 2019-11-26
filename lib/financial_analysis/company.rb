class FinancialAnalysis::Company
  # https://financialmodelingprep.com/api/v3/company/profile/MU
  # https://financialmodelingprep.com/api/v3/financials/balance-sheet-statement/FB
  # https://financialmodelingprep.com/api/v3/financials/income-statement/AAPL
  # https://financialmodelingprep.com/api/v3/company/stock/list
  
  attr_accessor :ticker, :balance_sheets, :income_statements, :price, :beta, :volAvg, :mktCap, :lastDiv, :range, :changes, :changesPercentage, :companyName, :exchange, :industry, :website, :description, :ceo, :sector, :image
  
  @@all = []
  
  def initialize(ticker)
    @ticker = ticker
    response = HTTParty.get("https://financialmodelingprep.com/api/v3/company/profile/#{ticker}")
    response["profile"].each { |k,v| self.send("#{k}=", v) }
    response_balance = HTTParty.get("https://financialmodelingprep.com/api/v3/financials/balance-sheet-statement/#{ticker}")
    self.balance_sheets = response_balance["financials"][0]
    response_income = HTTParty.get("https://financialmodelingprep.com/api/v3/financials/income-statement/#{ticker}")
    self.income_statements = response_income["financials"][0]
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  # def get_balance_sheets(ticker)
  #   response_balance = HTTParty.get("https://financialmodelingprep.com/api/v3/financials/balance-sheet-statement/#{ticker}")
  #   self.balance_sheets = response_balance["financials"][0]
  #   self.balance_sheets
  #   binding.pry
  # end
  
  # def get_income_statement(ticker)
  #   response_income = HTTParty.get("https://financialmodelingprep.com/api/v3/financials/income-statement/#{ticker}")
  #   self.income_statements = response_income["financials"][0]
  #   self.income_statements
  # end
  
end