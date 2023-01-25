def function(x): return x ** 2 - x ** 3

class Test:

    def __init__(self, func):
        self.func = func

    @staticmethod
    def bin_to_fractional(binary_str):
        val = 0
        for idx in range(len(binary_str)):
            if binary_str[idx] != '0':
                val += int(binary_str[idx]) * 2 ** (-1 * (idx + 1))
        return val

    def test(self, X, Y_test, count):
        self.accuracy_arr = []
        for index in range(count):
            x_val = self.bin_to_fractional(X[index])
            y_test_val = self.bin_to_fractional(Y_test[index])
            y_train_val = self.func(x_val)
            self.accuracy_arr.append(
                100 if y_train_val == 0 else 100 - (abs(y_test_val - y_train_val) / y_train_val * 100) % 100)
        return self.accuracy_arr

    def get_avg_accuracy(self):
        return sum(self.accuracy_arr) / len(self.accuracy_arr)


# for test first we load the results
randF = open('../generators/generated-data/Random_Entries.txt').read().split('\n')
firstPF = open('exec-data/FirstPart.txt').read().split('\n')
secondPF = open('exec-data/SecondPart.txt').read().split('\n')
thirdPF = open('exec-data/ThirdPart.txt').read().split('\n')

# let's test
tester = Test(function)

tester.test(randF, firstPF, 19)
print(f'average accuracy of 1st Part: {tester.get_avg_accuracy()}')

tester.test(randF, secondPF, 19)
print(f'average accuracy of 2th Part: {tester.get_avg_accuracy()}')

tester.test(randF, thirdPF, 19)
print(f'average accuracy of 3th Part: {tester.get_avg_accuracy()}')