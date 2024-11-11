"""
Sample tests
"""
from app.calc import add, subtract
from django.test import SimpleTestCase


class TestCalc(SimpleTestCase):
    def test_add_two_numbers(self):
        res = add(5, 6)
        self.assertEqual(res, 11)

    def test_sub_two_numbers(self):
        res = subtract(10, 15)
        self.assertEqual(res, -5)
