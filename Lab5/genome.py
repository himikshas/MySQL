#!/usr/bin/env python3

import json
import cgitb

cgitb.enable()

print("Content-Type: text/html")
print()

print("<h2>Genome List</h2>")

filePath = "/var/www/data/ucscGenome.json"

with open(filePath, 'r') as f:
    data = json.load(f)

subdata = data["ucscGenomes"]

print("<ul>")

for genome, info in subdata.items():
    common_name = info["organism"]
    scientific_name = info["scientificName"]
    print(f"<li><b>{genome}</b>: {common_name} (<i>{scientific_name}</i>)</li>")

print("</ul>")