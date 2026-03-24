#!/usr/bin/python3

from lxml import etree

xml = "book.xml"
xsd = "book.xsd"

with open(xsd, "rb") as f:
    file = etree.XML(f.read())

schema = etree.XMLSchema(file)

doc = etree.parse(xml)

if schema.validate(doc):
    print("XML schema is valid")
else:
    print("XML schema is not valid")
for error in schema.error_log:
    print(error)
