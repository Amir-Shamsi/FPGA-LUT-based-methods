import numpy

class RandomGenerator:
    __name__ = 'Random Generator'

    @staticmethod
    def generate(bits, count, gen_full=False):
        binary_repr_v = numpy.vectorize(numpy.binary_repr)
        random_arr = [i for i in range(256)] if gen_full else numpy.random.randint(1, 257, count)
        brv = binary_repr_v(random_arr, bits)
        with open('generated-data/Random_Entries.txt', mode='w') as file:
            for rand in brv: file.write(f'{rand}\n')

RandomGenerator().generate(8, 40)