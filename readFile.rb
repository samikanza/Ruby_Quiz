#!/usr/bin/ruby -w
 
counter = 1
begin
	file = File.new("CustomerDetails1.txt", "r")
	i = 0
	company_array = []
	while (line = file.gets)
	  array_1 = line.split(":")
	  my_company = array_1[0]
	  array_2 = array_1[1].split("-")
	  my_lower_limit = array_2[0].strip.gsub(/\,|[^\d]/,"")
	  my_upper_limit = array_2[1].strip.gsub(/\,|[^\d]/,"")
	  company_array[i] = Company.new(my_company, my_lower_limit, my_upper_limit)
	  i = i+1
	end
	puts #{company_array}
	file.close
rescue => err
	puts "Exception: #{err}"
	err
end