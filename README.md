# Dbms_project
This Database is created by joint efforts of
  #23112014 Aditya Jakate
  #23112030 Prince kewatkar
  #23112046 Rohit Sah

  Individual submissions files are adi

The database project is developed for the InterCity Express Trains to support their day to day operations. The InterCity Express Trains (IET) represent an India based company that started operating 6 months ago. They are operating trains that are indigenously developed high-speed, automated train units. An InterCity Express  train  is equipped with latest facilities and will provide a faster, more comfortable, and more convenient travel experience to rail users. 

For the above purpose and keeping their needs in mind we build a database that is will equiped with different tables such as train, stations, drivers, coaches, seats, passengers, travel agents, routes, intermediate station, train schedules, booking, tickets, route active days, backup trains and accomodations.

The above tables are designed keeping in mind the various requirement that we need to perform. For that purpose the above tables consists of many columns which not only help us to keep and sort data but also help us to get an overview of what we want to do.

We can understand it as that we created train table which consist of columns train id acting as primary key keeping the train id and then train name as column keeping the name of the train similarly we have driver table having driver id as column acting as primary key and keeping the driver id then drivername as column keeping the name of the driver then contact number as column keeping the contact number of the driver then city of residence as column keeping the city of residence of driver  then restday as column keeping the resting day of the driver.

Similarly, the other tables are station table which consist of column station name keeping the records of station name and station id acting as primary key keeping the station id records. The next table in the database is coaches consisting of columns as coachnumber, mileage, next maintenance date, last maintenance date, trainid where train id is foreign key and coach number is primary key. The other table in the database is seat consisting of column seat number and coach number and both acting as composite primary key. The other table in the database is passenger consisting of column passengerid, name, age and contact information where passengerid act as primary key. The other table in the database is travelagents which consists of column agentid , name , commissionpercentage where agentid act as primary key. The other table in the database is routes which consists of columns routeid, distance, originid, destinationid and traveltime where route id act as primary key and origin id and destination id act as foreign key. The other table in the database is intermediate station consists of column route id, station id, arrival time, departure time and date where route id and station id act as composite primary key. The other table in the database is trainschedule consists of column scheduled id, route id, departure time, arrival time, driver id , co driver id, date, train id and actual arrival time where scheduled id is primary key and route id, driver id , co driver id act as foreign key. The other table in the database is booking consist of column booking id, passenger id, route id, scheduled id, booking date, ticket price, discount type, travel agent id, seat number,  coach number and iscancelled where booking id is primary key and passenger id, route id , scheduled id, travel agent id, seat number and coach number act as primary key. 

Similarly, the other tables are ticket consist of column ticket id , scheduled id, route id, price, total ticket, sold ticket and available ticket where ticket id is the primary key and route id and scheduled id act as foreign key. The other table in the database is route active days which consist of column route id and active day where route id and active day act as composite primary key. The other table in the database is backup train consist of column train id and route id and both acting as foreign key. The other table in the database is accomidation consist of column station id, driver id, date and room number where station id and driver id act as foreign key. All the table mentioned here help us perform our jobs and design for our purpose. 

The tables are also interconnected with the help of foreign key making them capable of running various query according to our needs and help us getting valuable insight.

At the end, the database is made in such a way where on can easily manage, sort and retrieve data based on their needs. 

For the above purpose we worked as a team . And to get the job done we decided to distribute the tasks among ourselves based on our skills and knowledges. We too come together when needed, had google meets too. Starting from making the ER-diagram then relationship then schema and then running the query we came a long way clearing our doubts and learning many new concepts from our naive mistakes. 
  
