max_iterations = 255

red = 0
green = 0
blue = 0
colors = []

#Red Starts Up
#Green Up
#Red Down
#Blue Up
#Green Down
#Red Up
#Red and Blue Down half way

sections = 6
size = max_iterations / sections
increment = 255.0 / size

for x in range(max_iterations):
        s = x / size
        pos = x % size
        if s == 0:
            red = 255
            green += increment
        elif s == 1:
            green = 255
            red -= increment
        elif s == 2:
            red = 0
            blue += increment
        elif s == 3:
            blue = 255
            green -= increment
        elif s == 4:
            green = 0
            red += increment
        elif s == 5:
            red = 255
            blue -= increment
        color = hex((int(red) << 16) | (int(green) << 8) | int(blue))[2:]
        if   len(color) != 6: color = "0"*(6-len(color)) + color
        colors.append(color)

result = "case(iteration)"

for x in range(max_iterations):
    num = str(max_iterations - x - 1)
    if len(num) != 3: num = "0"*(3-len(num)) + num
    if x % 5 == 0:
        result += '\n'
        
    result += num + ": color <= 24'h" + colors[x] + "; "

result += "\n" + str(max_iterations) + ": color <= 24'h000000;\nendcase"

print result
