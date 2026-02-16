import  numpy as np


zeros = np.zeros(300)

print("zeros without shaping")

print(zeros)
print(zeros.shape)

zeros = zeros.reshape((3, 100))


print("zeros with shaping")
print(zeros)
print(zeros.shape)

