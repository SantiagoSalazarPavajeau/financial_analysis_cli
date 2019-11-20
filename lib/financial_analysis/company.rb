class FinancialAnalysis::Company
  # https://financialmodelingprep.com/api/v3/company/profile/MU
  # https://financialmodelingprep.com/api/v3/financials/balance-sheet-statement/FB
  # https://financialmodelingprep.com/api/v3/financials/income-statement/AAPL
  # https://financialmodelingprep.com/api/v3/company/stock/list
  
  @@all = []
  
  def initialize
   #balance-sheet-statement
   #income-statement
  end
  
  def self.all
    @@all
  end
  
end