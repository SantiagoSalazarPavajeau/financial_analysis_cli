class FinancialAnalysis::API
  # https://financialmodelingprep.com/api/v3/company/profile/AAPL,FB,GOOG
  # https://financialmodelingprep.com/api/v3/company/stock/list
  def self.get_companies
    response = HTTParty.get("https://financialmodelingprep.com/api/v3/company/profile/AAPL,FB,GOOG")
    response["symbolsList"][0..50]
    #binding.pry
  end
  
end