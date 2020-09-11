import unittest

from src.sudome import sudome


class UnprivilegedCase(unittest.TestCase):
    def test_sudome_returns_nonzero_uid_when_not_root(self):
        self.assertNotEqual(0, sudome())


if __name__ == '__main__':
    unittest.main()
