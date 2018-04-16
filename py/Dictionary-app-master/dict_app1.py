#!C:\Users\Nivi\AppData\Local\Programs\Python\Python36\python.exe
import json
from difflib import get_close_matches
import cgi
data = json.load(open("data.json"))
form=cgi.FieldStorage()

print ("Content-type:text/html\n\n")
print ("<html>")
print ("<body>")
print("""<form action="index.py" method="post">""")
def translate(w):
    w = w.lower()
    if w in data:
        return data[w]
    elif w.title() in data:  # if user entered "texas" this will check for "Texas" as well.
        return data[w.title()]
    elif w.upper() in data:  # in case user enters words like USA or NATO
        return data[w.upper()]
    elif len(get_close_matches(w, data.keys())) > 0:
        return "Did you mean %s instead? Please renter the word:" % get_close_matches(w, data.keys())


    else:
        return "The word doesn't exist. Please double check it."


word = form.getfirst("word", "0")


print("<p>The meaning of %s is:</p>" %word)
output = translate(word)
if type(output) == list:
    for item in output:
        print("<p>%s</p>" %item)
else:
    print("<p>%s</p>" %output)


print("""<br/><br/><br/> <h4>Find for another word?<input type="submit" value="yes"/></h4></form>""")
print ("</body>")
print ("</html>")
#the Program ends here
