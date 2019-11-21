class BalanceSheet
  
  attr_accessor :company, :year
  
  def initialize(company, year)
    @company = company
    @year = year
  end
  
  def get_balance_sheet(ticker)
    response = HTTParty.get("https://financialmodelingprep.com/api/v3/financials/balance-sheet-statement/#{ticker}")
    balance_sheet = FinancialAnalysis::BalanceSheet.new(response)
  end
  
end