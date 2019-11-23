class FinancialAnalysis::API
  attr_reader
  
  def self.get_companies
    response = HTTParty.get("https://financialmodelingprep.com/api/v3/stock/actives")
    response["mostActiveStock"].each do |hash|
      FinancialAnalysis::Company.new(hash["ticker"])
    end
    #binding.pry
  end
  
  
  
  # def get_income_statement(ticker)
  #   response = HTTParty.get("https://financialmodelingprep.com/api/v3/financials/income-statement/#{ticker}")
  #   income_statement = FinancialAnalysis::IncomeStatement.new(response)
  # end
  
  # def get_profile(ticker)
  #   response = HTTParty.get("https://financialmodelingprep.com/api/v3/company/profile/#{ticker}")
  #   profile = FinancialAnalysis::Profile.new(response)
  # end
  
end