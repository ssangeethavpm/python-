import random
l=[]
i=0
more=[41,14,29,49,8,42,23,38,40,33,30,44]
negative=[50,53,26,48,51,57,20,13,16,21,37]
while i<=5:
    num=random.randrange(1,59)
    if num not in negative:
        l.append(num)
        i+=1
print(l)