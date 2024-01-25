# Program (start)  to parse file and count and lookup words
# James Skon, Kenyon College
# January 2024

# Read file and break into lines
def getFile(name)
    fileObj = File.open(name)
    text=fileObj.read()
    text.split("\n")
end

# Display all the line in an array of text strings
def displayLines(lines)
  lines.each do |l|
    print l,"\n"
  end
end

# Return a hash mapping words the the count of their occurances
# e.g. {"tree"=>4,"boat"=>1}
def createWordCountTable(lines)
  # Remove punctuation from w, and make lower case
  # See https://www.ralfebert.com/snippets/ruby-rails/regex_cheat_sheet/
  # w=w.gsub(/\W/, ' ').downcase  
  table = {}
  lines.each do |line|
    words = line.split(" ")
    words.each do |word|
      word=word.gsub(/\W/, '').downcase.chomp
      if table.include?(word)
        table[word]+=1
      else
        table[word]=1
      end
    end
  end
  table
end

# Given a word count table, ask for words, and lookup the
# counts, until user enteres a empty line.
def lookupWordCounts(countTable)
  print "Enter word:"
  word=gets.chomp.downcase
  while word.length > 0
    if countTable.include?(word)
      print "#{word} occurs #{countTable[word]}\n"
    else
      print "#{word} is not in file"
    end
    print "Enter word:"
    word=gets.chomp.downcase
  end
end

# Return a hash mapping words in lines to a list of line numbers where
# the word appears.
# e.g. {"tree"=>[5, 12, 56, 132],"boat"=>[325]}
def createWordLineTable(lines)
  table = {}
  lineNm = 0
  lines.each do |line|
    words = line.split(" ")
    words.each do |word|
      word=word.gsub(/\W/, '').downcase.chomp
      if table.include?(word)
        if table[word][-1]!=lineNm
          table[word].push(lineNm)
        end
      else
        table[word]=[lineNm]
      end
    end
    lineNm+=1
  end
  table
end

# Given a word line table (from above), ask for words, and lookup and
# display the lines with this word until a empty line is entered
# Do not display the same line twice
def printMatchingLines(wordLineTable,lines)
  print "Enter word:"
  word=gets.chomp.downcase
  while word.length > 0
    if wordLineTable.include?(word)
      wordLineTable[word].each do |ln|
        print "#{ln+1}. #{lines[ln]}\n"
      end
    else
      print "#{word} is not in file"
    end
    print "Enter word:"
    word=gets.chomp.downcase
  end
end

lines = getFile("emilydickenson.txt")
#displayLines(lines)
=begin
countTable=createWordCountTable(lines)
print countTable.length,"\n"
lookupWordCounts(countTable)
=end
WordLineTable=createWordLineTable(lines)
printMatchingLines(WordLineTable,lines)
