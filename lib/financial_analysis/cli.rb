class FinancialAnalysis::CLI
  
  def start
    puts "Time for some Financial Analysis"
    FinancialAnalysis::API.get_companies
    list_companies
    menu
  end
  
  def list_companies
    puts "1. Apple"
    puts "2. Facebook"
    puts "3. GM"
  end
  
  def menu
    puts "Choose a company you would like more information on."
  end
end