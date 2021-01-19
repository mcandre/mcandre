'''ROT13 encryption for the fun of it.'''

__author__ = 'Andrew Pennebaker (andrew.pennebaker@gmail.com)'
__date__ = '11 Nov 2005 - 12 Nov 2005'
__copyright__ = 'Copyright 2005 Andrew Pennebaker'
__version__ = '0.2'

import socket


class Rot13Socket(socket.socket):
    '''ROT13 socket'''

    def crypt(self, plain):
        '''ROT13 symmetric encryption algorithm'''

        cipher = []
        c = 0
        for p in plain:
            b = ord(p)
            if b >= 65 and b <= 90:
                c = (b - 52) % 26 + 65
            elif b >= 97 and b <= 122:
                c = (b - 84) % 26 + 97
            else:
                c = b

            cipher.append(chr(c))

        return ''.join(cipher)

    def write(self, data):
        '''Write data'''

        self.send(self.crypt(data))

    def read(self, buffer):
        '''Read data'''

        return self.crypt(self.recv(buffer))
