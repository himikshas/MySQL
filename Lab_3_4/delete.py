#!/usr/bin/env python3

import cgi
import csv
import cgitb


#Debugging
cgitb.enable()


#Get data/ POST data and stores value
form = cgi.FieldStorage()
email = form.getvalue("email", "")     #require user email to delete[as name could be similar]


rows = []   #we cant delete the row we want so CSV file rewrite all rows which are required without the one which is asked by user to delete


#Opens file in read only mode[just to match the email of the user which we want to delete]
with open("/var/www/html/cgi-bin/registered_users.csv", "r") as f:
    reader = csv.reader(f)
    for row in reader:   #row is a list of headers
        if row[1] != email:   # keep all except deleted email  row[1] is email in csv
            rows.append(row)


#Opens file in write mode to rewrite again all user data without the one which is asked to delete
with open("/var/www/html/cgi-bin/registered_users.csv", "w", newline="") as f:

    writer = csv.writer(f)
    writer.writerows(rows)  #to rewrite rows


print("Content-Type: text/html\n")
print("<html><body>")
print("<h2>User Deleted (if existed)</h2>")
print("<p>Email: {}</p>".format(email))
print("</body></html>")
