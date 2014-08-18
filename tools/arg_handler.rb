require "./actions"

$args = []
def fillArgs 
	i = 0
	while i < ARGV.length do 
		$args[i] = ARGV[i]
		i += 1
	end 
end 

def pickAction
	case $args[0]
	when "gen"
		gen
	when "rm"
		rm
	when "ls"
		ls
	when "help"
		help
	else
		if ($args.length > 0) 
			puts "#{$args[0]}: command not found"
		else 
			help
		end
	end
end