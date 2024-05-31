# Hangman game
#

# -----------------------------------
# Helper code
# You don't need to understand this helper code,
# but you will have to know how to use the functions
# (so be sure to read the docstrings!)

import random

WORDLIST_FILENAME = "words.txt"

def loadWords():
    """
    Returns a list of valid words. Words are strings of lowercase letters.
    
    Depending on the size of the word list, this function may
    take a while to finish.
    """
    print("Loading word list from file...")
    # inFile: file
    inFile = open(WORDLIST_FILENAME, 'r')
    # line: string
    line = inFile.readline()
    # wordlist: list of strings
    wordlist = line.split()
    print("  ", len(wordlist), "words loaded.")
    return wordlist

def chooseWord(wordlist):
    """
    wordlist (list): list of words (strings)

    Returns a word from wordlist at random
    """
    return random.choice(wordlist)

# end of helper code
# -----------------------------------

# Load the list of words into the variable wordlist
# so that it can be accessed from anywhere in the program
wordlist = loadWords()

def isWordGuessed(secretWord, lettersGuessed):
    '''
    secretWord: string, the word the user is guessing
    lettersGuessed: list, what letters have been guessed so far
    returns: boolean, True if all the letters of secretWord are in lettersGuessed;
      False otherwise
    '''
    secretLetters=[]
    correctGuesses=0
    for letter in secretWord:
        if letter not in secretLetters:
            secretLetters.append(letter)
    for letter in lettersGuessed:
        if letter in secretLetters:
            correctGuesses+=1
    if correctGuesses == len(secretLetters):
        return True
    else:
        return False
            
    # FILL IN YOUR CODE HERE...



def getGuessedWord(secretWord, lettersGuessed):
    '''
    secretWord: string, the word the user is guessing
    lettersGuessed: list, what letters have been guessed so far
    returns: string, comprised of letters and underscores that represents
      what letters in secretWord have been guessed so far.
    '''
    wordSoFar=''
    for letter in secretWord:
        if letter in lettersGuessed:
            wordSoFar+=" "+letter+" "
        else:
            wordSoFar+=" _ "
    return wordSoFar
    # FILL IN YOUR CODE HERE...



def getAvailableLetters(lettersGuessed):
    '''
    lettersGuessed: list, what letters have been guessed so far
    returns: string, comprised of letters that represents what letters have not
      yet been guessed.
    '''
    avialableLetters='abcdefghijklmnopqrstuvwxyz'
    avialableLettersList=[]
    for l in avialableLetters:
        avialableLettersList.append(l)
    for l in lettersGuessed:
        avialableLettersList.remove(l)
    avialableLetters=''
    for l in avialableLettersList:
        avialableLetters+=l
    return avialableLetters
    # FILL IN YOUR CODE HERE...
    

def hangman(secretWord):
    '''
    secretWord: string, the secret word to guess.

    Starts up an interactive game of Hangman.

    * At the start of the game, let the user know how many 
      letters the secretWord contains.

    * Ask the user to supply one guess (i.e. letter) per round.

    * The user should receive feedback immediately after each guess 
      about whether their guess appears in the computers word.

    * After each round, you should also display to the user the 
      partially guessed word so far, as well as letters that the 
      user has not yet guessed.

    Follows the other limitations detailed in the problem write-up.
    '''
    lettersGuessed=[]
    mistakesMade=0
    avaiableLetters=getAvailableLetters(lettersGuessed)
    print('Welcome to the game Hangman!')
    print("I'm thinking about a word that is " + str(len(secretWord)) + " letters long.")
    while True:
        print("-------------")
        print("You have " + str(8-mistakesMade) + " guesses left.")
        print("Avaiable letters: "+ avaiableLetters)
        letter=input("Please guess a letter: ")
        if letter in lettersGuessed:
            print("Oops! You've already guessed that letter: " + getGuessedWord(secretWord, lettersGuessed))
        elif letter in secretWord:
            lettersGuessed.append(letter)
            avaiableLetters=getAvailableLetters(lettersGuessed)
            print("Good guess: "+ getGuessedWord(secretWord, lettersGuessed))
            if isWordGuessed(secretWord, lettersGuessed):
                print('Congratulations, you won!!')
                break
        else:
            lettersGuessed.append(letter)
            avaiableLetters=getAvailableLetters(lettersGuessed)
            print("Oops! That letter is not in my word: " + getGuessedWord(secretWord, lettersGuessed))
            mistakesMade+=1
            if(mistakesMade==8):
                print("Oooh, you lost. The word was " + secretWord)
                break









# When you've completed your hangman function, uncomment these two lines
# and run this file to test! (hint: you might want to pick your own
# secretWord while you're testing)

secretWord = chooseWord(wordlist).lower()
hangman(secretWord)
