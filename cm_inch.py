'''CENTIMETER TO INCH CONVERSION'''
def cm_inch(cm):
    inch=float(cm)*0.3937
    return'The inch is {}'.format(inch)
'''CELSIUS TO FAHRENHEIT CONVERSION'''
def celsius_fahren(c):
    fahren=(c*1.8)+32
    return 'The Fahrenheit is{}'.format(fahren)
centimeter=input("Enter the centimeter to convert to inch:")
print(cm_inch(centimeter))
fahrenheit=int(input("Enter the celsius:"))
print(celsius_fahren(fahrenheit))