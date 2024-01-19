from app.main import hello

def test_hello():
    name = "World"
    ground_truth = "Hello World."
    result = hello(name)
    assert result == ground_truth
