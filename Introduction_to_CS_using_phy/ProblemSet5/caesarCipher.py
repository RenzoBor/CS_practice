import string
print(string.ascii_lowercase)
def build_shift_dict(shift):
    '''
    Creates a dictionary that can be used to apply a cipher to a letter.
    The dictionary maps every uppercase and lowercase letter to a
    character shifted down the alphabet by the input shift. The dictionary
    should have 52 keys of all the uppercase letters and all the lowercase
    letters only.        

    shift (integer): the amount by which to shift every letter of the 
    alphabet. 0 <= shift < 26

    Returns: a dictionary mapping a letter (string) to 
             another letter (string). 
    '''
    alphabet=string.ascii_lowercase
    alphabetUC=string.ascii_uppercase
    shiftedAlph= {}
    for char in alphabet:
        try:
            shiftedAlph[char]= alphabet[alphabet.index(char)+shift]
        except IndexError:
            excess=alphabet.index(char)+shift-len(alphabet)
            shiftedAlph[char]= alphabet[excess]
    for char in alphabetUC:
        try:
            shiftedAlph[char]= alphabetUC[alphabetUC.index(char)+shift]
        except IndexError:
            excess=alphabetUC.index(char)+shift-len(alphabetUC)
            shiftedAlph[char]= alphabetUC[excess]
    return shiftedAlph
print(build_shift_dict(1))