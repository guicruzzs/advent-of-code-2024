raw_input = File.open('input.txt').read
allowed = true
final_value = 0

raw_input.scan(/mul\(\d{1,3}\,\d{1,3}\)|don\'t\(\)|do\(\)/).each do |expression|
  (allowed = false) && next if expression == 'don\'t()'

  (allowed = true) && next if expression == 'do()'

  final_value += expression.match(/(\d+)\,(\d+)/).captures.map(&:to_i).reduce(&:*) if allowed
end

puts "Final value: #{final_value}"
