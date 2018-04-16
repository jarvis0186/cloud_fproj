#!C:\Users\Nivi\AppData\Local\Programs\Python\Python36\python.exe

import cgi

print ("Content-type:text/html\n\n")
print ("<html>")
print ("<body>")
print ("<h1>Two Factor Authentication Code</h1>") 
print("""<div> <form action="auth.py" method="post"><label><input type="checkbox" name="site" value="Amazon"/> Amazon</label><br/>
	<label><input type="checkbox" name="site" value="Gmail"/>Gmail</label><br/>
	<label><input type="checkbox" name="site" value="FaceBook" />FaceBook</label><br/>
	<label><input type="checkbox" name="site" value="WhatsApp" />WhatsApp</label><br/>
	<label><input type="checkbox" name="site" value="Drive" />Drive</label><br/>
	<input type="submit" value="Generate"/></div>""")
print("</form>")
print("</body>")
print("</html>")
