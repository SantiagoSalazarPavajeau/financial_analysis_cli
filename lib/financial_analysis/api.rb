class FinancialAnalysis::API
  attr_reader
  
  def self.get_companies
    response = HTTParty.get("https://financialmodelingprep.com/api/v3/stock/actives")
    response["mostActiveStock"].each do |hash|
      FinancialAnalysis::Company.new(hash["ticker"])
    end
  end

end