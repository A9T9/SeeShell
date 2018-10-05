from win32com import client # needed for connecting to COM
import csv   #built in python lib for reading csv file
import sys

#SeeShell API - Python Demo Script
#Screencast on Youtube: https://www.youtube.com/watch?v=jlgJQwzEVp4

#This is script is the Python version of "Submit-CSV.VBS". 
#It reads a CSV file line by line, and uses SeeShell Browser 
#to submit the data to a website.

# the filename of the csv containing name and email
INPUT_FILE = 'namesandemail.csv'

# display message in console and wait for enter key
print("Press Enter to start CSV submission")
sys.stdin.readline()

# activate SeeShell COM objects
objB = client.Dispatch("SeeShell.Browser")
objB.open(10)


with open(INPUT_FILE, 'rt') as fp: # open the csv file containing name and email
    reader = csv.reader(fp) # load it to CSV reader
    for row in reader: # for each row

        i = objB.echo("Processing Name: {} {}".format(row[0], row[0]))
        i = objB.setVariable("first", row[0])
        i = objB.setVariable("last", row[1])
        i = objB.setVariable("email", row[2])

        i = objB.play("Demo-Variables")
        if i < 0:
            print("Play error: %d" % (i,) + " " + objB.getLastError())

print("Done, press Enter to close the SeeShell Browser")
sys.stdin.readline()

objB.close()