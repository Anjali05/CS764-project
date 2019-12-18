import sys
import string

"""
f = open("test.tbl", "r+")
for line in f.readlines():
   print (line)
   string.replace(line, line[-1],'')
   print (line)
f.close()
"""

list = ["customer.tbl", "date.tbl", "lineorder.tbl", "part.tbl", "supplier.tbl"]
#list = ["lineorder.tbl"]
for i in list:
   with open(str(i), 'r') as f:
      newlines = []
      for line in f.readlines():
         newlines.append(line.strip()[:-1])
         # print (line.strip()[:-1])
         # print ("hello")

   with open(str(i), 'w') as f:
      for line in newlines:
         # print (line)
         f.write(line + "\n")


