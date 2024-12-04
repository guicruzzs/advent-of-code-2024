def check_direction(line, column, line_direction, column_direction)
  return false if !(line + line_direction * 3).between?(0, @matrix.size - 1)

  return false if !(column + column_direction * 3).between?(0, @matrix[0].size - 1)

  word = 4.times.reduce("") do |acc, letter_number|
    acc += @matrix[line + line_direction * letter_number][column + column_direction * letter_number]
  end

  word == 'XMAS'
end


@matrix = []
File.open('input.txt').each do |line|
  @matrix << line.split('')
end

total_found = 0
@matrix.each_with_index do |line, line_index|
  line.each_with_index do |char, column_index|
    next if char != 'X'

    total_found += 1 if check_direction(line_index, column_index,  0,  1)
    total_found += 1 if check_direction(line_index, column_index,  0, -1)
    total_found += 1 if check_direction(line_index, column_index,  1,  0)
    total_found += 1 if check_direction(line_index, column_index, -1,  0)
    total_found += 1 if check_direction(line_index, column_index,  1,  1)
    total_found += 1 if check_direction(line_index, column_index,  1, -1)
    total_found += 1 if check_direction(line_index, column_index, -1,  1)
    total_found += 1 if check_direction(line_index, column_index, -1, -1)
  end
end

puts "Total found: #{total_found}"
