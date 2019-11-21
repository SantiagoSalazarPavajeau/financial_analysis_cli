require "pry"
require "httparty"
require_relative "financial_analysis/version"
require_relative "financial_analysis/api"
require_relative "financial_analysis/cli"
require_relative "financial_analysis/company"
require_relative "financial_analysis/balance_sheet"
require_relative "financial_analysis/income_statement"





module FinancialAnalysis
  class Error < StandardError; end
  # Your code goes here...
end
