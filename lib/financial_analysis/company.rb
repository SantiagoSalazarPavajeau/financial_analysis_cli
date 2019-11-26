class FinancialAnalysis::Company
  
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
  
end