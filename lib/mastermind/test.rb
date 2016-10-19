def get_feedback guess, password
  black = 0
  white = 0
  guess2 = []
  code = password
  4.times.each do |i|
    if guess[i] == code[i]
      black += 1
      code[i] = 0
      guess[i] = 0
    end
  end
  guess.delete(0)
  code.delete(0)
  guess.each do |i|
    if code.detect {|x| x == i}
      code.delete_at(code.find_index((code.detect {|x| x == i})))
    end
  end
  white = guess.length - code.length
  blank_space = code.length
  print "guess is " + guess.join
  puts
  print "code is " + code.join
  puts
  puts "white is " + white.to_s
  puts "black is " + black.to_s
  puts "blank space is " + code.length.to_s
  feedback = {black: black, white: white, blank: code.length}
  return feedback[:black]
end

guess = ["green", "purple", "blue", "blue"]
password = ["blue", "purple", "gray", "blue"]

puts get_feedback(guess, password)
