string1='g()(al)'
def change(command):
    return command.replace('()','o').replace('(al)','al')
print(change(string1))