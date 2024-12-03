left_list = []
right_list = []

File.open('input.txt').each do |line|
  left_value, right_value = line.gsub(/\s+/, " ").split(" ")
  left_list << left_value.to_i
  right_list << right_value.to_i
end

final_value = left_list.reduce(0) do |acc, left_value|
  times = right_list.reduce(0) do |acc, right_value|
    acc += right_value == left_value ? 1 : 0
  end
  acc += (times * left_value)
end

puts "final value: #{final_value}"