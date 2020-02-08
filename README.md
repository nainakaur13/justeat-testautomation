


# **Just Eat Test Automation**

The Just Eat Test performs UI functional automation test on JustEat website(Food ordering site: https://www.just-eat.co.uk/) using **Robot Framework**.

Robot Framework is a test automation framework for acceptance testing and acceptance test-driven development (ATDD). 
It has easy-to-use tabular test data syntax which utilizes the **keyword-driven testing approach**.


## Test Setup

 - Install Python & PIP(Package Installation Manager) - Python 3 (add to your PATH) 
 - Use PIP to install Robot Framework  using command:  
			`pip install robotframework `
 - Use PIP to install Seleniumlibrary  using command: 
		   `pip install robotframework-seleniumlibrary ` 
  - Desired Browsers 
   - Install Selenium Webdrivers for each browser 
   - Install IDE: Pycharm/IntelliJ/RIDE  Install Intellibot Plugin

## Project Structure

- **/JustEat**  `Project`
	 * **/Testcases**
		 * Justeat.robot   `Script `
	 + **/Resources**
		 + Common.robot  `Suite setup, Open browser etc `
		 + Justeat.robot  `Keyword file `
		 +  **/PO**  `Page Objects `
			 + LandingPage.robot
			 + SearchPage.robot
	 + **/Results**  


## Approach Used

- Follows Procedural Style
- Break script into keywords which can be reused by multiple testcases. Improves ability to decipher test results
-  Move keywords to Resource file
-  Follows **Page Object Model**. Create page objects in a resounce file. A one place for all actions/locators

## Test Scenarios

**Feature:**  As a user, I want to be able to find restaurants in my area.

	Testcase1: 	Search for restaurant in an area
	Keyword1:		Search for restaurant by area  "AR51 1AA"
					 Enter search address  
    				 Submit search
    				 verify search result

				
	
	Testcase2: 	Search for restaurant by popular cusine in an area
	Keyword1:		Search for restaurant by area  "AR51 1AA"
	Keyword2:		Search for restaurant  by cuisine	"pizza"
					 select cuisine from popular cusine
					 verify cuisine search result
					
	
	Testcase3:	Search for restaurant by special offers in an area 	
	Keyword1:		Search for restaurant by area  "AR51 1AA"
	Keyword2:		Search for restaurant  by special offers
					 select special offer filter
					 verify special offer search result

## Test Case Execution

1. From Editor - Pycharm/IntelliJ
		Open Project in editor > Terminal window
		Run any of the following commands:
		
	Type `"robot -d results Testcases/Justeat.robot"` 
	> **-d #directory** - create directory "Results" for test execution result files. It can be any absolute path in user system
		 
	Type `"robot -d results -i Justeat Testcases/Justeat.robot"` 
	> **-i #tagname** - This will run all those testcases having tag "Justeat"
	 
	Type `"robot -d results -t 'Search for restaurant in an area' Testcases/Justeat.robot"` 
	> **-t "#testcasename"**  - This will execute specific testcase

2. From Command Window: CD to Project directory and execute any of the above commands

## Execution Result

UI acceptance tests result in a HTML report for each feature.Reports  are written into their respective /results directories after a successful run.

In the case of test failures, a screen-shot of the UI at the point of failure is embedded into the report.

Below Result files get generated:
1. outpul.xml
2. log.html
3. report.html 
