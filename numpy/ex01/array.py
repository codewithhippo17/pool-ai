import numpy as np

my_array = np.array([42, 3.14, "string", {"key": "val"}, [1, 2], (3, 4), {5, 6}, True], dtype=object)


for i in my_array:
    print(type(i))
