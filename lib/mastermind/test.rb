@possible_codes =*("0000".."5555")
$colors = ["blue", "green", "purple", "red", "yellow", "Orange"]


def not_possible_codes(feedback, guess)
  puts "We're in the method now"
  not_possible = {one: "", two: "", three: "", four: ""}
  new_possible_codes = []


  guess = colors_to_numbers(guess)
  temp_code = guess
  puts "The prvious guess was " + temp_code
  @possible_codes.each do |possible_code|
    temp_black = 0
    temp_white = 0
    possible_code_minus_black = possible_code.dup
    temp_code_minus_black = temp_code.dup
    (0..3).each do |i|
      if possible_code[i] == temp_code[i]
        possible_code_minus_black.sub!(possible_code[i], "")
        temp_code_minus_black.sub!(temp_code[i], "")
        temp_black += 1
      end
    end
    possible_code_minus_black.length.times do |i|
      if temp_code_minus_black.include? possible_code_minus_black[i]
        temp_code_minus_black.sub!(possible_code_minus_black[i], "")
        temp_white += 1
      end

    end
    if feedback[:black] == temp_black && feedback[:white] == temp_white
      new_possible_codes << possible_code
      puts new_possible_codes
    end

    puts "the code of " + possible_code.to_s + 
    " compared to the previous guess of " + temp_code.to_s + " gives the feedback of blacks: " + 
    temp_black.to_s + " and whites: " + temp_white.to_s


  end
end


def colors_to_numbers colors
  numbers = []
  colors.each do |x|
    case x
    when $colors[0]
      numbers << "0"
    when $colors[1]
      numbers << "1"
    when $colors[2]
      numbers << "2"
    when $colors[3]
      numbers << "3"
    when $colors[4]
      numbers << "4"
    when $colors[5]
      numbers << "5"                        
    end
  end
  numbers.join
end


actual_code = ["blue", "green", "blue", "purple"]
feedback = {black: 1, white: 2, blank: 1}
previous_guess = ["blue", "blue", "green", "green"] # 0011
# example of of same feedback 0102

puts "The actual code is " + actual_code.to_s
puts "The feedback sent to the method is " + feedback.to_s
puts "The previous guess was " + previous_guess.to_s
not_possible_codes(feedback, previous_guess)