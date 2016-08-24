# OCLint-Configuration
This is configuration for OCLint integrate with Xcode projects

Prerequisite:
	- oclint v10.3 and above installed (brew install oclint)
	- xcpretty installed (gem install xcpretty)

How-to:
	- Copy .oclint and analysis_script.sh file to your project folder
	- Edit SCHEME and WORKSPACE inside analysis_script.sh inside your project folder
	- chmod +x analysis_script.sh inside your project folder
	- run ./analysis_script.sh