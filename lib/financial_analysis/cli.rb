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
  
  def display_company_attributes(input)
    # company ticker must connect to that company object
    # attributes of one company should be displayed
    # specific company is not being selected
    company = @companies.detect{ |company| company.ticker == input}
     puts ""
     puts "#{company.instance_methods}"
     puts ""
  end
  
  def display_company_attribute(input)
    company = @companies.detect{ |company| company.ticker == input}
     puts ""
     puts "#{company.companyName}: #{company.input}"
     puts ""
  end
  
  def menu
    input = nil
    while input != 'exit'
    puts "Choose a company you would like more information on by typing its ticker (e.g. AAPL). Type list to see some available companies or type exit."
      input = gets.strip
      if input == 'list'
        list_companies
      elsif display_company_attributes(input)
        puts display_company_attributes(input)
      else
        puts "You can retry typing a company's name, or 'list', or 'exit'."
      end
    end
  end
end