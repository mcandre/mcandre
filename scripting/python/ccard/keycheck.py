"""Validate keys"""


def cs(number):
    """Checksum helper"""

    s = 0

    alternate = True

    while number > 0:
        digit = number % 10
        number /= 10

        if alternate:
            digit *= 2

            if digit > 9:
                digit -= 9

        s += digit

        alternate = not alternate

    return s


def check(number):
    """Checksum"""

    return cs(number) % 10 == 0
