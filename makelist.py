






def spinWords(word1,word2):
    pos1 = 0 
    while pos1 <=len(word1):
        pos2 = 0
        while pos2 <= len(word2):
            outword = word1[:pos1] + word2[:pos2]
            print(outword)
            outword = word1[:pos1] + "." + word2[:pos2]
            print(outword)
            outword = word1[:pos1] + "-" + word2[:pos2]
            print(outword)
            pos2 = pos2 +1 
        pos1 = pos1 +1     


word1 = "john"
word2 = "connor"

spinWords(word1,word2)
spinWords(word2,word1)

word1 = "general"
word2 = "connor"

spinWords(word1,word2)
spinWords(word2,word1)

word1 = "john"
word2 = "general"

spinWords(word1,word2)
spinWords(word2,word1)

word1 = "resistance"
word2 = "leader"

spinWords(word1,word2)
spinWords(word2,word1)

word1 = "john"
word2 = ""

spinWords(word1,word2)
spinWords(word2,word1)

word1 = "john"
word2 = "t800"

spinWords(word1,word2)
spinWords(word2,word1)

word1 = "jack"
word2 = "connor"

spinWords(word1,word2)
spinWords(word2,word1)

word1 = "jon"
word2 = "conner"

spinWords(word1,word2)
spinWords(word2,word1)

word1 = "jim"
word2 = "conner"

spinWords(word1,word2)
spinWords(word2,word1)

word1 = "james"
word2 = "conner"

spinWords(word1,word2)
spinWords(word2,word1)

word1 = "james"
word2 = "cameron"

spinWords(word1,word2)
spinWords(word2,word1)