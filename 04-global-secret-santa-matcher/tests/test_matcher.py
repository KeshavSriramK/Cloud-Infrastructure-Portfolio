import unittest
from src.lambda_matcher import generate_matches

class TestSecretSantaMatcher(unittest.TestCase):
    def test_no_self_match(self):
        participants = [
            {'Name': 'Alice', 'Email': 'alice@example.com'},
            {'Name': 'Bob', 'Email': 'bob@example.com'},
            {'Name': 'Charlie', 'Email': 'charlie@example.com'},
            {'Name': 'Diana', 'Email': 'diana@example.com'}
        ]
        
        matches = generate_matches(participants)
        self.assertEqual(len(matches), 4)

        for giver, receiver in matches:
            self.assertNotEqual(giver['Email'], receiver['Email'])

if __name__ == '__main__':
    unittest.main()