function mkcd
	command mkdir $argv
	if test $status = 0
		command echo $argv
		cd $argv
	end
end
