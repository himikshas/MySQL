#!/usr/bin/env python3

import cgi
import csv
import os


# Enable CGI traceback (for debugging)
import cgitb
cgitb.enable()   #shows python error message


# Read form data
form = cgi.FieldStorage()   #reads data, parses it and stores it


#Extracting data from individual fields of the the form
name = form.getvalue("name", "")
email = form.getvalue("email", "")
dob = form.getvalue("date", "")
state = form.getvalue("state", "")


# CSV file path
file = "/var/www/html/cgi-bin/registered_users.csv"


# Check if file exists
file_exists = os.path.isfile(file)


# Write to CSV
with open(file, mode="a", newline="") as file2:   #open file with append mode: adds new user without deleting old ones
    writer = csv.writer(file2)                    #newline="" prevents blank lines in CSV
    #Converts python lists into CSV rows


# Write header only once
if not file_exists:
   writer.writerow(["Name", "Email", "DOB", "State"])  #for header

   writer.writerow([name, email, dob, state])

# Send response back to browser
print("Content-Type: text/html\n")       #Headers must be printed before HTML
print("<html>")                          #tells browser This response is HTMl
print("<body>")
print("<h2>User Registered Successfully </h2>")
print("<p>Thank you, <b>{}</b></p>".format(name))    #.format(name) injects python variables into HTML like name of the user
print("</body>")
print("</html>")


#Environment Variables
print(f"""
<br> 
<h2>Request Environment Variables</h2>""")
for key in sorted(os.environ.keys()):
    print(f"""
<h3>{key}:{os.environ[key]}</h3><br>
          """)
