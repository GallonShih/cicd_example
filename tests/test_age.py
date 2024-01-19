from app.main import age

def test_age():
    ground_truth = 18
    result = age()
    assert result == ground_truth
