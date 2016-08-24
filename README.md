# OCLint-Configuration
This is configuration for OCLint integrate with Xcode projects


##Prerequisite:
	* oclint v10.3 and above installed (brew install oclint)
	* xcpretty installed (gem install xcpretty)


##How-to:
	* Copy .oclint, analysis_script.sh and .rules file to your project folder:
		from oclint-configuration directory, call command:
			cp .oclint {your_project_folder}/.oclint
			cp analysis_script.sh {your_project_folder}/analysis_script.sh
			cp -R .rules {your_project_folder}/.rules

	* Edit SCHEME and WORKSPACE inside analysis_script.sh inside your project folder
	
	* chmod +x analysis_script.sh inside your project folder
	
	* run ./analysis_script.sh

	* Append these lines to .gitignore
		compile_commands.json
		report.html
		analysis_script.sh
		.oclint
		.rules


##Current configs:
	* Currently enable these rules:
		- BitwiseOperatorInConditional
		- BrokenNullCheck
		- BrokenNilCheck
		- BrokenOddnessCheck
		- CollapsibleIfStatements
		- ConstantConditionalOperator
		- ConstantIfExpression
		- DeadCode
		- DoubleNegative
		- ForLoopShouldBeWhileLoop
		- GotoStatement
		- JumbledIncrementer
		- LongClass
		- LongLine
		- LongMethod
		- LongVariableName
		- MisplacedNullCheck
		- MisplacedNilCheck
		- MultipleUnaryOperator
		- HighNcssMethod
		- UseEarlyExitsAndContinue
		- ReturnFromFinallyBlock
		- ShortVariableName
		- ThrowExceptionFromFinallyBlock


Rules references at [here](https://docs.google.com/spreadsheets/d/1gRGWgNheQtx8B65bsXx4NZrkT-hjv0fhi0NGxYLKXTs/edit?usp=sharing)

