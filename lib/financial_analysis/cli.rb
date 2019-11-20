class FinancialAnalysis::CLI
  
  def start
    puts "Time for some Financial Analysis"
    FinancialAnalysis::API.get_companies
    list_companies
    menu
  end
  
  def list_companies
    companies = FinancialAnalysis::Company.all
    companies.each.with_index(1) do |company, i|
      puts "#{i}. #{company.name}"
    end
  end
  
  def menu
    input = nil
    while input != 'exit'
    puts "Choose a company you would like more information on. Type list to see all the available companies or type exit."
      input = gets.strip.downcase
      if input.to_i > 0
        puts companies
      elsif input == 'list'
        list_companies
      else
        puts "Say again? You can retry typing the company's name, or 'list', or 'exit'."
      end
        
      # case input 
      # when "apple"
      #   puts "Apple's income is $10 trillion"
      # when "facebook"
      #   puts "Facbook's income is $20 trillion"
      # when "gm"
      #   puts "GM's income is $30 trillion"
      # when 'list'
      #   list_companies
      # else
      #   puts "Say again? You can retry typing the company's name, or 'list', or 'exit'."
      # end
    end
  end
end