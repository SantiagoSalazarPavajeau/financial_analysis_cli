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
      puts "#{i}. #{company.companyName}"
    end
  end
  
  def display_company_attributes(company_number)
    @companies.each do |company|
      puts "#{company.attributes}"
    end
  end
  
  def display_company_attribute(attribute)
    @compan
  end
  
  def menu
    input = nil
    while input != 'exit'
    puts "Choose a company you would like more information on. Type list to see all the available companies or type exit."
      input = gets.strip.downcase
      if input.to_i > 0
        puts display_company_attributes(input)
      elsif input == 'list'
        list_companies
      else
        puts "Say again? You can retry typing the company's name, or 'list', or 'exit'."
      end
    end
  end
end