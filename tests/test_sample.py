# tests/test_sample.py
#
# This is a sample test file to demonstrate testing for Python code.
# We will use the 'pytest' framework.

# A simple function to test
def add(a, b):
    return a + b

# A test for the function
def test_add():
    assert add(1, 1) == 2
