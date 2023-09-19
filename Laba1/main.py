import math
print("fasfasdfasf")
print("Введите коэффициенты ")
print("ax^2 + bx + c = 0:")
q = float(input("a = "))
w = float(input("b = "))
e = float(input("c = "))

v = w ** 2 - 4 * q * e
print(" D = %.2f" % v)

if v > 0:
    x1 = (-w + math.sqrt(v)) / (2 * q)
    x2 = (-w - math.sqrt(v)) / (2 * q)
    print("x1 = %.2f \nx2 = %.2f" % (x1, x2))
elif v == 0:
    x = -w / (2 * q)
    print ("x = %.2f" % x)
else:
    print("Нет корней")
    print("Попробуй еще раз")
