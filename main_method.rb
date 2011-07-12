#!/usr/bin/ruby -w

require 'Company'
  	
  def is_a_number?(s)
    s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true 
  end
  
  company_array = Company.create_companies_from_file("CustomerDetails1.txt")
  puts company_array
  
  puts "enter your lower limit (if you want to specify one)"
  customer_lower = gets.strip.gsub(/\,|[^\d]/,"")
  
  puts "enter your upper limit (if you want to specify one)"
  customer_upper = gets.strip.gsub(/\,|[^\d]/,"")
  
  unless (is_a_number?(customer_upper) && customer_upper.to_i > 0) || (is_a_number?(customer_lower) && customer_lower.to_i > 0)
    puts "You have not chosen an upper or a lower limit, therefore I cannot help you!"
  end
  
  unless is_a_number?(customer_upper) || customer_upper.to_i < 0
    customer_upper = 100000
  end
  
  unless is_a_number?(customer_lower) 
    customer_lower = 0
  end
  
  puts "You have specified an lower limit of #{customer_lower} and an upper limit of #{customer_upper}"
  
  company_array.each do |my_company|
    if customer_lower <= my_company.upper_limit || customer_upper >= my_company.lower_limit
      puts "You can buy from #{my_company.name} which has a lower limit of #{my_company.lower_limit} and an upper limit of #{my_company.upper_limit}"
    end
  end
  

  
  
  
