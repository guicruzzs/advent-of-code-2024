def is_a_safe_report?(report)
  direction = 0

  report.each_with_index do |level, index|
    next if index == 0

    previous_level = report[index - 1]

    if direction == 0
      if level > previous_level
        direction = 1
      elsif level < previous_level
        direction = -1
      else
        return false
      end
    end

    return false if (level - previous_level) * direction <= 0 || (level - previous_level) * direction > 3
  end

  true
end

def is_there_a_safe_report?(report)
  report.size.times do |count|
    report_copy = report.dup
    report_copy.delete_at(count)
    return true if is_a_safe_report?(report_copy)
  end

  false
end

safe_reports = 0
File.open('input.txt').each do |line|
  report = line.split(" ").map(&:to_i)

  safe_reports += is_there_a_safe_report?(report) ? 1 : 0
end

puts "Total of safe reports: #{safe_reports}"
