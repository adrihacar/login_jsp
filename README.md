# Secure Login

This program is intended to show how a dynamic web site hosted in a Tomcat Server can interact with a MySQL database 


## Warning :exclamation:

Not implement this login in a real server. This login tries to highlight the concepts of interaction website-database and hashing-salting. It doesn't provide a cookie service to keep track of the user while in the website and is still vulnerable to attacks as SQL Injection.


##Prerequisites
* Eclipse IDE
* Apache Tomcat Server
* Database (MySQL)
* Browser
## Installation


* Install an Apache Tomcat Server and a database as could be MySQL. You can install a LAMP or XAMP server 
* Clone this repository from github.
```bash
	git clone https://github.com/adrihacar/login_jsp.git
```
* Create the database. By default, the database is located in <mark> /localhost/cripto </mark> and "username" and "password" as the default to login. You can change this in the class BDControler.
* Run the file <mark> database.sql</mark> in the database to create the needed tables
* Import the project to eclipse as a Dynamic Web Project.
```
File >  Open Project From File system
```
* Configure the tomcat server in eclipse.
```
File > New > Other... >Server > Server >Next >Tomcatv7.0Server > Next > Finish
```
* Run the project in the server from eclipse

##Authors

* **Adrián Hacar** - *Initial work* - [adrihacar](https://github.com/adrihacar)
