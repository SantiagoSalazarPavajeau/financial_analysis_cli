class FinancialAnalysis::Company
  # https://financialmodelingprep.com/api/v3/company/profile/MU
  # https://financialmodelingprep.com/api/v3/financials/balance-sheet-statement/FB
  # https://financialmodelingprep.com/api/v3/financials/income-statement/AAPL
  # https://financialmodelingprep.com/api/v3/company/stock/list
  
  attr_accessor :ticker, :balance_sheets, :income_statements, :price, :beta, :volAvg, :mktCap, :lastDiv, :range, :changes, :changesPercentage, :companyName, :exchange, :industry, :website, :description, :ceo, :sector, :image
  
  @@all = []
  
  def initialize(ticker)
    # @name = api_hash["companyName"]
    # @balance_sheets = []
    # @income_statements = []
    @ticker = ticker
    response = HTTParty.get("https://financialmodelingprep.com/api/v3/company/profile/#{ticker}")
    response["profile"].each { |k,v| self.send("#{k}=", v) }
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  # def get_balance_sheet(ticker)
  #   response = HTTParty.get("https://financialmodelingprep.com/api/v3/financials/balance-sheet-statement/#{ticker}")
  #   balance_sheet = FinancialAnalysis::BalanceSheet.new(response)
  # end
  
end