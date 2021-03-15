from itertools import product
a=list(product(['1','2'],['3','4']))
print(a)
n=2
s=set(product(['1','2'],repeat=n))
print(s)