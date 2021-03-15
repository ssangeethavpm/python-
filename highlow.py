import random

l = []

more = [41, 14, 29, 49, 8, 42, 23, 38, 40, 33, 30, 44]
negative = [50, 53, 26, 48, 51, 57, 20, 13, 16, 21, 37]
more_value=sorted(more,reverse=False)

list1=[1,2,3,4,5,6,7,8,9,10,11,12,14,15,16,17,18,19,22,23,24,25,27,28,29]
list2=[30,31,32,33,34,35,36,38,39,40,41,42,43,44,45,46,47,49,52,54,55,56,58,59]
low=random.sample(list1,3)

high=random.sample(list2,3)
c=low+high

print(c)
