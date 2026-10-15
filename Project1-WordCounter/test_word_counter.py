import word_counter as word_counter

string1 = "The cat. the Dog!"
string1_dict = {"the": 2, "cat": 1, "dog": 1}
empty_set = []
string1_set = [("the", 2)]
string2 = "Tyler is super awesome! tyler is cool..."                            
string3 = "How much wood could a woodchuck chuck if a woodchuck could chuck wood?????"
string3_set = [("a", 2), ("chuck", 2), ("could", 2)]
upper = "TYLER IS COOL"
punct = "TYLER!"
dupe = " TYLER tyler, cool cool"
dupe_set = [("cool", 2), ("tyler", 2)]
weird = "hello world\nhello"
weird_set = {"hello": 2, "world": 1}
nonwords = "tyler ain't not cool"
nonwords_set = [("ain't", 1), ("cool", 1), ("not", 1)]
onlypunct = "hi -- there"
onlypunct_set = [("hi", 1), ("there", 1)]
def test_word_count():
    assert word_counter.word_count(string1) == string1_dict

def test_word_count_lower():
    words = word_counter.word_count(upper)
    assert "tyler" in words

def test_word_count_splice_punct():
    words = word_counter.word_count(punct)
    assert "tyler" in words

def test_top_n_duplicate():
    assert word_counter.top_n(dupe, 2) == dupe_set

def test_word_count_weird_format():
    assert word_counter.word_count(weird) == weird_set

def test_top_n_0():
    assert word_counter.top_n(string1, 0) == empty_set

def test_top_n_1():
     assert word_counter.top_n(string1, 1) == string1_set

def test_top_n_3():
    assert word_counter.top_n(string3, 3) == string3_set

def test_empty_text():
    assert word_counter.word_count("") == {}

def test_apostrophe():
    assert word_counter.top_n(nonwords, 3) == nonwords_set

def test_only_punct():
    assert word_counter.top_n(onlypunct, 2) == onlypunct_set
