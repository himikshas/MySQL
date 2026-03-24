#!/usr/bin/env python3

import csv
import cgitb

#For debugging the python file gives exact line error
cgitb.enable()

print("Content-Type: text/html\n")       #to tell browser that the content is HTML
print("<html><body>")                    #start of HTML page
print("<h2>Registered Users</h2>")

#Opening CSV file
with open("/var/www/html/cgi-bin/registered_users.csv") as f:
    reader = csv.reader(f)     #iterates the header
    for row in reader:         #row is a list of values
        print("<br>".join(row))   #joins list elements with <br>
        print("<hr>")             #line separator

print("</body></html>")           #closes page
