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
