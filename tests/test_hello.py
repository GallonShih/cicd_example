from app.main import hello

def test_hello():
    name = "World"
    result = hello(name)
    assert result == "Hello World."
