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
	when "add"
		add
	when "rm"
		rm
	when "ls"
		ls
	end
end