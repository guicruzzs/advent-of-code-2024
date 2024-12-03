raw_input = File.open('input.txt').read

final_value = raw_input.scan(/mul\(\d{1,3}\,\d{1,3}\)/).reduce(0) do |acc, expression|
  acc += expression.match(/(\d+)\,(\d+)/).captures.map(&:to_i).reduce(&:*)
end

puts "Final value: #{final_value}"
