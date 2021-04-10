import nltk
import re

import app
import ease1

# word=[]

class wordsntags:
    def __init__(self,word,tag):
        self.word = word
        self.tag = tag

    def display(self):
        print(self.word+":"+self.tag)

def pos(sentence : str):
    print("hey!")
    tokens=nltk.word_tokenize(sentence)
    poss=nltk.pos_tag(tokens)
    word= [w[0] for w in poss]
    tag= [w[1] for w in poss]
    print(word)
    print(tag)
    l=len(word)
    w=[]
    # noun = re.compile("NN")

    for i in range(0,l):
        noun = re.search(r'N[A-Z]',tag[i])
        pronoun = re.search(r'PR[A-Z$]',tag[i])
        pronoun1 = re.search(r'W[P$]',tag[i])
        verb = re.search(r'V[A-Z]',tag[i])
        adjective = re.search(r'J[A-Z]',tag[i])
        adverb = re.search(r'R[A-Z]',tag[i])
        adverb1 = re.search(r'WRB',tag[i])
        preposition = re.search(r'IN',tag[i])
        conjunction = re.search(r'CC',tag[i])
        interjection = re.search(r'UH',tag[i])
        to = re.search(r'TO',tag[i])
        determiner = re.search(r'DT',tag[i])

        if noun:
            w.append(wordsntags(word[i],"noun"))
        if pronoun:
            w.append(wordsntags(word[i],"pronoun"))
        if pronoun1:
            w.append(wordsntags(word[i],"pronoun"))
        if verb:
            w.append(wordsntags(word[i],"verb"))
        if adjective:
            w.append(wordsntags(word[i],"adjective"))
        if adverb:
            w.append(wordsntags(word[i],"adverb"))
        if adverb1:
            w.append(wordsntags(word[i],"adverb"))
        if preposition:
            w.append(wordsntags(word[i],"preposition"))
        if conjunction:
            w.append(wordsntags(word[i],"conjunction"))
        if interjection:
            w.append(wordsntags(word[i],"interjection"))
        if to:
            w.append(wordsntags(word[i],"to"))
        if determiner:
            w.append(wordsntags(word[i],"determiner"))

    for j in w:
        print(j.display())
    for k in word:
        search_term = k
        ease1.search_and_download(search_term=search_term)
