require 'FileUtils'
#add help action
#help action should be designed like bash w/ usage:

def checkArgs(argNum)
	case
	when $args.length > argNum
		puts "You have too many args. For help, just run the command './railz help'"
		return false
	when $args.length == argNum
		return true
	else
		puts "You have too few arguments. For help, just run the command './railz help'"
		return false
	end
end

def gen
	if checkArgs(2)
		puts "#{$args[1]} generated in /modals"
	end
end

def add
	if checkArgs(4)
		puts "Added #{$args[1]} to #{$args[3]}"
	end
end

def rm
	if checkArgs(2)
		if (File.file?("../modals/#{$args[1]}.html"))
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