# Program (start)  to parse file and count and lookup words
# James Skon, Kenyon College
# January 2024

# Read file and break into lines
def getFile(name)
    fileObj = File.open(name)
    fileObj.read()
    text.split("\n")
end

def displayLines(lines)
  lines.each do |l|
    print l,"\n"
  end
end

lines = getFile("emilydickenson.txt")
displayLines(lines)



