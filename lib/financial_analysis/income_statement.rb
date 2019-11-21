class IncomeStatement
  
  attr_accessor :company, :year
  
  def initialize(company, year)
    @company = company
    @year = year
  end
  
  def get_income_statement(ticker)
    response = HTTParty.get("https://financialmodelingprep.com/api/v3/financials/income-statement/#{ticker}")
    income_statement = FinancialAnalysis::IncomeStatement.new(response)
  end
  
end