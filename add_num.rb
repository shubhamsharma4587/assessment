def add(num)
  return 0 if num.empty?

  delimiter = ","
  if num.start_with?("//")
    delimiter, num = num.scan(/\/\/(.+)\n(.+)/)[0]
  end

  num = num.split(/#{delimiter}|\n/)
  negatives = num.select { |n| n.to_i < 0 }.map(&:to_i)
  if negatives.any?
    raise "Negative numbers not allowed: #{negatives.join(', ')}"
  end

  num.map(&:to_i).select { |n| n <= 1000 }.sum
end

# main starts here
str_ls = ["", "1", "1,5", "1\n2,3", "//;\n1;2", "-1,2,3", "//@\n1@2@3"]
str_ls.each do |str|
  begin
    result = add(str)
    puts "Input: #{str}, Output: #{result}"
  rescue StandardError => e
    puts "Input: #{str}, Error: #{e.message}"
  end
end
