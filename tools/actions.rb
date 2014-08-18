require 'FileUtils'
require './boilerplate'

#replace strings in file
def stringReplace(searchString, replaceString, fileName)
	file = File.open(fileName, "r")
	fileString = file.read
	file.close
	fileString.gsub!(searchString, replaceString)
	File.open(fileName, "w") { |file| file << fileString }
end

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
			puts "A modal with this name already exists."
		else 
			puts "Please input at title."
			print ">"
			title = STDIN.gets.chomp
			#create html
			output = File.open( "../modals/#{filename}.html","w" )
			output << getModal(filename, title)
			output.close
			#edit js
			stringReplace("var modals = [", "var modals = [\"#{filename}\",", "../js/load-modals.js")
			puts "#{filename} generated in /modals"
			puts "<span data-toggle=\"modal\" data-target=\"\##{filename}\" class=\"hlight\">INSERT TEXT HERE</span>"
		end
	end
end

#removes userdefined modal
def rm
	if checkArgs(2)
		filename = $args[1]
		if File.file?("../modals/#{filename}.html")
			#remove html file
			FileUtils.rm("../modals/#{filename}.html")
			puts "#{filename}.html removed from /modals"
			#remove from js
			stringReplace("\"#{filename}\",", "", "../js/load-modals.js")
		else
			puts "No such file -- #{filename}.html"
		end
	end
end

def ls
	if checkArgs(1)
		File.open("../js/load-modals.js", "r").each_line do |line|
			if line.include? "var modals = ["
				list = line[14..-7]
				if (list == "")
					puts "There are currently no modals"
				else 
					puts list
				end
			end
		end
	end
end

def help
	puts """
	~~~ Railz Help ~~~~
	./railz.rb gen [filename]
	Generate new modal with name filename
	./railz.rb rm [filename]
	Remove modal with name filename
	./railz.rb ls
	List all generated modals
	"""
end