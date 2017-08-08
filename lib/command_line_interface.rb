def welcome
  puts "Hello and welcome to the Star Wars research thingy."
end

def get_character_from_user
  puts "Please enter a character"
  character = gets.chomp
end

def exit
	if input == "exit"
		puts "Goodbye!"
	end
end