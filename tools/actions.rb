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
		puts "#{$args[1]} removed from /modals"
	end
end

def ls
	if checkArgs(1)
		puts "ls"
	end
end