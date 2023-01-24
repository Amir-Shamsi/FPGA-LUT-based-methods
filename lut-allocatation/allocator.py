import numpy

def function(x):
    """ always going to be positive for 0 < x < 1 """
    return x**2 - x**3

class Allocator:
    __name__ = 'LUT Allocator'

    def __init__(self, func, bits=8):
        self.__bits__ = bits
        self.func = func

    @staticmethod
    def frac_to_bin(num, prec):
        Integral, binary = int(num), ''
        fractional = num - Integral
        while Integral:
            rem = Integral % 2
            binary += str(rem)
            Integral //= 2
        binary = binary[::-1]
        while prec:
            fractional *= 2
            frac_bit = int(fractional)
            if frac_bit == 1:
                fractional -= frac_bit
                binary += '1'
            else: binary += '0'
            prec -= 1
        return binary

    def allocate(self):
        with open('generated-data/LUT.txt', mode='w')as lut_file:
            fractional_array = numpy.linspace(0, 1, 258)[:-1]  # dividing range (0, 1) into 256 different fraction
            for frac in fractional_array:
                ans = Allocator.frac_to_bin(self.func(frac), self.__bits__)
                lut_file.write(f'{ans}\n')

alloc = Allocator(func=function)
alloc.allocate()
print(f'{alloc.__name__} created LUT table.')