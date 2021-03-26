import time

print('quiz for u')
name=input('Enter you name:')
print('welcome',name)
age=int(input("enter the age:"))


def ready():
    print('1.What is color of orange:')
    answer = input('the option is red/orange/yello/blue:')
    score = 0
    if answer == 'orange':
        score += 1
    print('you score is:', score)




if age>=18:
    print('you are ok to play')
    time.sleep(1)
    ready()
else:
    print('sorry try next time')








