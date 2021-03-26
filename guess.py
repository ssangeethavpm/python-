list1=['apple','orange','grapes']

choice=input("Enter the choice:[apple or orange or grapes]")
guess='apple'

i=0
while i<=len(list1):
    if choice==guess:
        print('found')
        break
    i=i+1
print('try again')
