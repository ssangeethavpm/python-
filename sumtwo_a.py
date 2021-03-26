string1='aaaaabbbcccddd'
def string_compression(string1):
    comp=[]
    count=0
    for i in range(len(string1-1)):
        if i==(i+1):
            comp.append(i)
            count+=1
print(string_compression(string1))

