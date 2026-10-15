
import string 

"""
Counts the words in a text string and counts them.
"""
def word_count(text: str) -> dict[str, int]:
    words = {}
    for word in text.split():
        word = word.lower().strip(string.punctuation)
        if not word:
            continue
        if word not in words:
            words[word] = 1
        else:
            words[word] += 1
    return words

"""
Takes a dictionary of counted Strings, sorts them and returns the top n most common words from the text.
"""
def top_n(text: str, n: int) -> list[tuple[str, int]]:
    words = word_count(text)
    sorted_words = dict(sorted(words.items(), key=lambda item: (-item[1], item[0])))
    top_words = []
    for ind, (key, val) in enumerate(sorted_words.items()):
        if ind < n:
            top_words.append((key, val))
    return top_words

