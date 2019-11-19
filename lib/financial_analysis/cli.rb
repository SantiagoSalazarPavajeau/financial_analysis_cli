class FinancialAnalysis::CLI
  
  def start
    puts "Time for some Financial Analysis"
    FinancialAnalysis::API.get_companies
  end
end