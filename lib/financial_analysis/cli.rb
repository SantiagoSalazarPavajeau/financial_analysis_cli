class FinancialAnalysis::CLI
  
  attr_accessor :companies
  
  def start
    puts "Time for some Financial Analysis"
    FinancialAnalysis::API.get_companies
    list_companies
    menu
  end
  
  def list_companies
    @companies = FinancialAnalysis::Company.all
    @companies.each.with_index(1) do |company, i|
      puts "#{i}. #{company.companyName} -> ticker: #{company.ticker}"
    end
  end
  
  def menu
    input = nil
    while input != 'exit'
    puts "Choose a company you would like more information on by typing its ticker (e.g. AAPL). Type list to see some available companies or type exit."
      input = gets.strip
      if input == 'list'
        list_companies
      elsif @companies.detect{ |company| company.ticker == input}
        company = @companies.detect{ |company| company.ticker == input}
         puts ""
         puts "#{company.companyName}:" if company.companyName != ""
         puts ""
         puts "#{company.description}" if company.description != ""
         puts "Sector: #{company.sector}" if company.sector != ""
         puts "CEO: #{company.ceo}" if company.ceo != ""
         puts "Industry: #{company.industry}" if company.industry != ""
         puts "Website: #{company.website}" if company.website != ""
         puts "Stock price: #{company.price}" if company.price != ""
         puts "Market capitalization: #{company.mktCap}" if company.mktCap != ""
         puts ""
         puts "Would you like to see the balance sheet and income statment of this company? y/n"
          input = gets.strip.downcase
          if input == "y"
            puts "Balance Sheet: #{company.balance_sheets}."
            puts ""
            puts "Income Statement: #{company.income_statements}"
          else
          end
      else
        puts "You can retry typing a company's ticker, or 'list', or 'exit'."
      end
    end
  end
end