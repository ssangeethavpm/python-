def odd_even(num):
    if num%2==0:
        print('The number {} is  even number'.format(num))
    else:
        print('The number {} is odd number'.format(num))

number=int(input("Enter the number:"))
print(odd_even(number))