class FinancialAnalysis::API
  # https://financialmodelingprep.com/api/v3/company/profile/AAPL,FB,GOOG
  # https://financialmodelingprep.com/api/v3/company/stock/list
  def self.get_companies
    response = HTTParty.get("https://financialmodelingprep.com/api/v3/company/profile/AAPL,FB,GOOG")
    #binding.pry
  end
  
  def get_balance_sheet(ticker)
    response = HTTParty.get("https://financialmodelingprep.com/api/v3/financials/balance-sheet-statement/#{ticker}")
    balance_sheet = FinancialAnalysis::BalanceSheet.new(response)
  end
  
  def get_income_statement(ticker)
    response = HTTParty.get("https://financialmodelingprep.com/api/v3/financials/income-statement/#{ticker}")
    income_statement = FinancialAnalysis::IncomeStatement.new(response)
  end
  
  def get_profile(ticker)
    response = HTTParty.get("https://financialmodelingprep.com/api/v3/company/profile/#{ticker}")
    profile = FinancialAnalysis::Profile.new(response)
  end
  
end