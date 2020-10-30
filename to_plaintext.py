#!/usr/bin/env python3
import html2text
import sys
print(sys.argv[1])
htmlfile = open(sys.argv[1],'r')
html = htmlfile.read()
text_maker = html2text.HTML2Text()
text_maker.unicode_snob = True
text_maker.decode_errors = 'ignore'
text = text_maker.handle(html)
htmlfile.close()
htmlfile = open(sys.argv[1]+".md",'w')
htmlfile.write(text)
htmlfile.close()
