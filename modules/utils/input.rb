module Input
  def ask_text(text)
    valid = false
    until valid
      print "Insert #{text}: "
      input = gets.chomp
      valid = true unless input == ''
    end
    input
  end

  def ask_year(text)
    year = '0'
    until !(year =~ /\d{4,4}/).nil? && year.to_i.between?(1, 2022)
      print "Insert #{text} [year, 4 digits]: "
      year = gets.chomp
    end
    year
  end
end