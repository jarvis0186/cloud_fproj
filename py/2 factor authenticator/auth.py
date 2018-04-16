#!C:\Users\Nivi\AppData\Local\Programs\Python\Python36\python.exe

import cgi
form = cgi.FieldStorage()
input_text=form.getfirst("site", "0")
print ("Content-type:text/html\n\n")

print("<html>")
print("<body>")
print("<h3> Please enter your valid Username and Password of your %s Application</h3>"%input_text)
print("""<form action="generate.py" method="post">Username: <input type="text" name="uname"/><br/><br/>Password:   <input type="password" name="pass"/><br/><br/><input type="submit" value="Generate"/></form>""")
print("</body>")
print("</html>")