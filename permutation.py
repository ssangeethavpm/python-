
num=[1,2,3,4,5]
target=8
for i in num:
    for j in num:
        if i!=j:
            if i+j==target:
                print(i,j)
                break

