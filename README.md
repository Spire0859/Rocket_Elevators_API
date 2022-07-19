Project Title : The Rocket Elevators Database
https://chilisincarne.xyz/

	Project Description
*WHAT THE APPLICATION DOES:
The application uses
	- Ruby 2.7.6
	- Rails 5.2.8
	- pg gem (for the rake tasks)
	- faker gem (for the seeds file)


1. The website is improving and can now take quotes into account and save it to our MySQL database.
	To get there, just click on "Get a Quote" from the banners at the top of the main page.
2. It can also takes messages via the CONTACT US form at the bottom of the main page.
3. You can create an account or log in in the "LOG IN" section at the top right of any page.
4. If you have an admin account, you can just use your admin email address (from
the employee list) and enter the password : 123456 	// (Very safe!)

WHY THIS TECHNOLOGY?
MySQL is used as an operative database were most of the data get treated. But we also used a
Postgresql database that act as a Database Warehouse in the background. When the MySQL
database is filled with data, it is then sent to the Postgresql DWH in different tables and
you can ask 3 questions via rake tasks.

	Those rake task commands are:
	1. rake qs:q_one
	2. rake qs:q_two
	3. rake qs:q_three
	(You may find the code at the bottom of the newtask.rake file)

In case this does not function properly. Abort the ship, destroy the evidence and pray...
OR!
Try those queries via the SQL editor in DBeaver. These lines answers the the respective 
question numbers:

	1. select contact_id, EXTRACT(MONTH FROM creation_date)
           FROM fact_contact;
	
	2. select quote_id, EXTRACT(MONTH FROM creation_date)
	   FROM fact_quotes;
	
	3. SELECT company_name, nb_elevators
	   FROM public.dim_customers;

*CHALLENGES WE FACED
	-- Log Day 7 --
The moral is low, but the team hold the ship to steady speed...
We faced some difficulties while developing these new features. The Rails structure felt
quite complete, but overwhelming at first. Understanding that most files are related and
have dependencies confused us a lot. It was also the first time that our crew had to deal
with databases. Setting everything as a whole was a great learning experience that did
traumatized the crew a little bit. We are now more comfortable with the technology than before
while only sacrificing our souls during the process... fair exchange I say.
								-Captain Pan


*HOW TO USE THE PROJECT
------------------------------------------------------------------
	LOG IN
You can create an account following the usual steps.

	ADMIN
To enter as an Admin, you need to seed it first to make it work.
username: [employee email]
password: 123456

	CONTACT US
Just fill the input fields and send it via the "Submit" button at
the bottom. It will be saved in the database.
------------------------------------------------------------------



*API
------------------------------------------------------------------

GOOGLE MAPS - Google Maps is a well know service powered by Google. It give us access to a grand variety of location. We use this services
to localised our customers dynamicly in our backoffice section. All ours customers location a represented with marker and clicking thes 
markers show more caracteristics of the building in this location.

SENDGRID - Sendgrid is powerful api who make the connection with our customers more easy. With this api we can send message to our customers
depending on diffrent event. In our case we us it to send a personalize greetings email when someone fill the contacts us form.   


	-- Crew members of this project --
Captain Pan - Marcos Salvador III López
First Mate - Matias Mansilla
Naked Mate - Tanim Khondaker
Carlos - Carlos Alexis Almanzar
