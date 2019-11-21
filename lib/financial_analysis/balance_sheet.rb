class FinancialAnalysis::BalanceSheet
  
  attr_accessor :company, :year, :date, :cash_and_cash_equivalents, :short_term_investments, :cash_and_short_term_investments, :receivables, :inventories, :total_current_assets, :property_plant_and_equipment_net, :goodwill_and_intangible_assets, :long_term_investments, :tax_assets, :total_non_current_assets, :total_assets, :payables, :short_term_debt, :total_current_liabilities, :long_term_debt, :total_debt, :deferred_revenue, :tax_liabilities, :deposit_liabilities, :total_non_current_liabilities, :total_liabilities, :other_comprehensive_income,:retained_earnings_deficit, :total_shareholders_equity, :investments, :net_debt, :other_assets, :other_liabilities
  
  def initialize(company, year)
    self.company=(company)
    
    # if year == "2019"
    #   year_index = 0
    # elsif year == "2018"
    #   year_index = 1
    # end
    # @year = year
    response["financials"][year_index].each { |k,v| self.send("@#{k}=", v) }
  end
  
   def company=(company_obj)
    self.company = company_obj
    company_obj.balance_sheets << self
  end
  
  def get_balance_sheet(ticker)
    response = HTTParty.get("https://financialmodelingprep.com/api/v3/financials/balance-sheet-statement/#{ticker}")
    balance_sheet = FinancialAnalysis::BalanceSheet.new(response)
  end
  
end