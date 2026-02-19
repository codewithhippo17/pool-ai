import  numpy as np

arr = np.arange(1, 101)
print("Question 1")
print(arr)

odd = arr[::2]
print("Question 2")
print(odd)


even_rev = arr[1::2][::-1]
print("Question 3")
print(even_rev)


print("Question 4")
arr[1::3] = 0
print(arr)
