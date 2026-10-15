import pytest
import Word_Counter as word_counter

string1 = "The cat. the Dog!"
string1_dict = {"the": 2, "cat": 1, "dog": 1}
empty_set = []
string1_set = [("the", 2)]
string2 = "Tyler is super awesome! tyler is cool..."                            
string3 = "How much wood could a woodchuck chuck if a woodchuck could chuck wood?????"
string3_set = [("wood", 2), ("could", 2), ("a", 2)]
upper = "TYLER IS COOL"
punct = "TYLER!"

def test_word_count():
    assert word_counter.word_count(string1) == string1_dict

def test_word_count_lower():
    words = word_counter.word_count(upper)
    assert "tyler" in words

def test_word_count_splice_punct():
    words = word_counter.word_count(punct)
    assert "tyler" in words

def test_top_n_0():
    assert word_counter.top_n(string1, 0) == empty_set

def test_top_n_1():
     assert word_counter.top_n(string1, 1) == string1_set

def test_top_n_3():
    assert word_counter.top_n(string3, 3) == string3_set

