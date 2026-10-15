
import string 

def word_count(text):
    words = {}
    if len(text) == 0:
        return []
    for word in text.split(' '):
        word = word.lower().strip(string.punctuation)
        if word not in words:
            words[word] = 1
        else:
            words[word] += 1
    return words

def top_n(text, n: int ):
    words = word_count(text)
    sorted_words = dict(sorted(words.items(), key=lambda item: item[1], reverse = True))
    top_words = []
    for ind, (key, val) in enumerate(sorted_words.items()):
        if ind < n:
            top_words.append((key, val))
    return top_words


string1 = "The cat. the Dog!"
string2 = "Tyler is super awesome! tyler is cool..."
string3 = "How much wood could a woodchuck chuck if a woodchuck could chuck wood?????"
#word_count(string1)
top = top_n(string3, 3)
print(top)
