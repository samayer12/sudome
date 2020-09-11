import unittest
from src.sudome import sudome


class PrivilegedCase(unittest.TestCase):
    def test_sudome_returns_zero_uid_when_root(self):
        self.assertEqual(0, sudome())


if __name__ == '__main__':
    unittest.main()
