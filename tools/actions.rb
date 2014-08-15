require 'FileUtils'
require './boilerplate'

#checks for proper argument length
def checkArgs(argNum)
	case
	when $args.length > argNum
		puts "You have too many args. For help, just run the command './railz help'"
		return false
	when $args.length == argNum
		return true
	else
		puts "You have too few arguments. For help, jusft run the command './railz help'"
		return false
	end
end

#generates new modal with a userdefined id/file name
#and a userdefined title
def gen
	if checkArgs(2)
		filename = $args[1]
		if (File.file?("../modals/#{filename}.html"))
			puts "A modal with this name already exists"
		else 
			puts "Please input at title."
			print ">"
			title = STDIN.gets.chomp
			output = File.open( "../modals/#{filename}.html","w" )
			output << getModal(filename, title)
			output.close
			puts "#{filename} generated in /modals"
		end
	end
end

def add
	if checkArgs(4)
		puts "Added #{$args[1]} to #{$args[3]}"
	end
end

#removes userdefined modal
def rm
	if checkArgs(2)
		if File.file?("../modals/#{$args[1]}.html")
			FileUtils.rm("../modals/#{$args[1]}.html")
			puts "#{$args[1]}.html removed from /modals"
		else
			puts "No such file -- #{$args[1]}.html"
		end
	end
end

def ls
	if checkArgs(1)
		puts "ls"
	end
end

def help
	puts "This is the help message"
end