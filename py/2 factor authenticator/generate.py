#!C:\Users\Nivi\AppData\Local\Programs\Python\Python36\python.exe

import cgi
import string


from random import *
print ("Content-type:text/html\n\n")
print("<html>")
print("<body>")
characters = string.ascii_letters + string.punctuation  + string.digits
password =  "".join(choice(characters) for x in range(randint(8, 16)))
print("<p>The code generated for the application is : </p>" )
print ("<p>%s<p>"%password)
print("<p> Please keep a screenshot of this code or come back again!! </p>")
print("</body>")
print("</html>")
