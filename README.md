# Lab_1_week

Scripts:
[
	Bash_3_1_Print_All_Files.sh - Prints all file names on given folder with subfolders

	Bash_3_2_regular_file_or_dir.sh - Checks if file is a regular file or directory 
	("test -d $fileOrDir" the same if we wrote "[ -f $fileOrDir ]")

	Bash_3_3_print_reversed_number.sh - Prints given number inn reverse order
	("let number=$number/10" the same if we wrote "number=$(($number/10))")

	Bash_3_4_count_lines_in_file.sh - Prints the number of lines in the file
]



Tests:
[	
	BashTest_3_2_regular_file_or_dir.sh - tests if script Bash_3_1_Print_All_Files.sh works right

	BashTest_3_3_print_reversed_number.sh - tests if script Bash_3_3_print_reversed_number.sh works right

	BashTest_3_4_count_lines_in_file.sh - tests if script Bash_3_4_count_lines_in_file.sh works right
] 


Cmake_Project_Build:
[
	first.cpp - contains main() function and creates a variable of type A in it, after what it calls memeber function print()
	second.cpp - the structure A is written in it. Structute A has only one member function print() which prints "Hello World!!!"
	CMakeLists.txt - links first.cpp and second.cpp together	
]
