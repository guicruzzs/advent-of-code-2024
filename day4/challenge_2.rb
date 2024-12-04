def check_direction(line, column)
  return false if !(line).between?(1, @matrix.size - 2)

  return false if !(column).between?(1, @matrix[0].size - 2)

  diagonal_word_1 = @matrix[line-1][column-1] + @matrix[line][column] + @matrix[line+1][column+1]
  diagonal_word_2 = @matrix[line+1][column-1] + @matrix[line][column] + @matrix[line-1][column+1]

  [diagonal_word_1, diagonal_word_1.reverse].include?('MAS') && [diagonal_word_2, diagonal_word_2.reverse].include?('MAS')
end


@matrix = []
File.open('input.txt').each do |line|
  @matrix << line.split('')
end

total_found = 0
@matrix.each_with_index do |line, line_index|
  line.each_with_index do |char, column_index|
    next if char != 'A'

    total_found += 1 if check_direction(line_index, column_index)
  end
end

puts "Total found: #{total_found}"
