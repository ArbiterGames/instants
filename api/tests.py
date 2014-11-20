from django.test import TestCase


class APITest(TestCase):
    def test_math_is_correct(self):
        two = 1 + 1
        self.assertEqual(two, 2)
