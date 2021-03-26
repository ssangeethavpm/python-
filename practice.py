number=int(input('Enter the number to guess'))

for i in range(1,50):
    guess=int(input("Enter the number:"))
    if guess==number:
        print("number found")
    elif guess<number:
        print('Enter greater number')
    elif guess>number:
        print('Enter smaller number')
