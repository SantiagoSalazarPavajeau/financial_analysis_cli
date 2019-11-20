class FinancialAnalysis::API
  # https://financialmodelingprep.com/api/v3/company/profile/MU
  def self.get_companies
    response = HTTParty.get("https://financialmodelingprep.com/api/v3/company/stock/list")
    response["symbolsList"][0..50]
    #binding.pry
  end
  
end