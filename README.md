# Dice Game - A Java Web Game Using Servlets

## Description
Dice Game is a simple web-based game developed in Java using servlets. The game allows players to roll the dice and accumulate points.

## Game Rules
- The user should roll 3 dice, numbered 1, 2 and 3, one at a time in any order
- During a game, the same die must not be rolled several times, in fact, if a player rolls the same die more than once, the application stops the game and the player receives a score = -1
- If the result obtained for die number 1 is strictly lower than the result obtained for die number 2 and the result obtained for die number 2 is strictly lower than the result obtained for die number 3, then the player receives a score equal to the sum of the results obtained for the 3 dices
- If the result obtained for die number 1 is strictly higher than the result obtained for die number 2 and the result obtained for die number 2 is strictly higher than the result obtained for die number 3 then the player receives a score equal to the product results obtained for the 3 dices
- Otherwise it receives a zero score
- The application must stop the game once we can conclude about the score, for example if we get 5 for die number 1 and 6 for die number 2 then there is no point in waiting for the result of die number 3, because the score will be equal to 0 regardless of the result of the 3rd die

## Project Structure
The project contains the following files and folders:
- `src/main`: This folder contains the main source code for your project
  - `java/com`:
     - `info`: this package contains the classes that provides informations about the game, dices and users
     - `web`:
       - `filters`: This package contains the filters used in the web application, including the ExceptionFilter class and the SecurityFilter class for authentication
       - `helpers`: This package contains utility classes that assist in various tasks throughout the web application
       - `listeners`: This package contains the listeners that handle application-level events, such as context initialization
       - `servlets`: This package contains the servlets that handle requests and responses in the web application
  - `resources`: This folder contains the log4j.xml file, which is used for configuring the logging framework
  - `webapp`: This folder contains the web resources for your application such as JSPs and CSS
- `pom.xml`: This is the Maven build file for your project. You should include this file so that others can build and run your project using Maven
- `dl1.iml`: This file is used by IntelliJ IDEA to store project-specific settings and configuration
- `README.md`: This file provides information about the project

## Requirements
To run the Dice Game, you'll need to have the following installed:
- Java 11 or later
- Apache Tomcat 10

## Technologies Used
- Java
- Servlets
- JSP
- Bootstrap
- Apache Tomcat

## Future Plans
- Implement a chat system for players to communicate during the game
- Allow players to customize the game rules, such as the number of dice, the maximum number of rolls, and the winning conditions
- Add achievements and rewards for players who reach certain milestones, such as reaching a high score, winning multiple games in a row, or rolling a certain combination of dice

## Acknowledgments
This program was inspired by the work of my teacher [@BOUDAA TARIK](https://github.com/boudaa)
