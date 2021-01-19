#!/usr/bin/env python3

'''Print line numbers'''

__author__ = 'Andrew Pennebaker (andrew.pennebaker@gmail.com)'
__date__ = '8 Oct 2005'
__copyright__ = 'Copyright 2005 Andrew Pennebaker'
__version__ = '0.2'

from contracts import *


@onctract(filename='str', start='int', end='int')
def show_numbers(filename, start=1, end=0):
    '''Prints line numbers for text files from start to end
    (omit end or use 0 for start to EOF).'''

    if end != 0 and end < start:
        print('Error: End is after start.')
        return

    with open(filename, 'r') as f:
        number = 1
        line = f.readline()

        while len(line) > 0 and (end == 0 or number <= end):
            if (number >= start):
                print('%d\t%s' % (number, line))

                line = f.readline()
                number += 1
