#!C:\Python27\python.exe
import cgi
import os


import socket
print ("Content-type:text/html\n\n")
print("<html>")
print("<body>")      
print("Your Computer IP Address is:" + os.environ["REMOTE_ADDR"]) 
print("""<br/><br/><form action="gl.html"> check your current location--> <input type="submit" value="locate"/></form>""")
print("</body>")
print("</html>")

