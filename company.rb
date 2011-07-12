#!/usr/bin/ruby -w

class Company
  
  def initialize(name, lower_limit, upper_limit)
    @name = name
    @lower_limit = lower_limit
    @upper_limit = upper_limit
  end
  
  attr_accessor :name, :lower_limit, :upper_limit
  
  def to_s
    "Company Name: #{name}, Lower Limit: #{lower_limit}, Upper Limit: #{upper_limit}"
  end
  
  def self.create_companies_from_file(file_name)
    company_array = []
    begin
    	file = File.new(file_name, "r")
    	while (line = file.gets)
    	  array_1 = line.split(":")
    	  my_company = array_1[0]
    	  array_2 = array_1[1].split("-")
    	  my_lower_limit = array_2[0].strip.gsub(/\,|[^\d]/,"")
    	  my_upper_limit = array_2[1].strip.gsub(/\,|[^\d]/,"")
    	  company_array << Company.new(my_company, my_lower_limit, my_upper_limit)
    	end
    	file.close
    rescue => err
    	puts "Exception: #{err}"
    	err
    end
    company_array
  end
end