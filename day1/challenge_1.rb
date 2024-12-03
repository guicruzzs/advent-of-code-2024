left_list = []
right_list = []

File.open('challenge_input.txt').each do |line|
  left_value, right_value = line.gsub(/\s+/, " ").split(" ")
  left_list << left_value.to_i
  right_list << right_value.to_i
end

left_list.sort!
right_list.sort!
final_value = 0
left_list.size.times do |i|
  final_value += (left_list[i] - right_list[i]).abs
end

puts "final value: #{final_value}"