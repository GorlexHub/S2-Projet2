# Write yout code here
def ftoc(fahrenheit)
    fahrenheit = (fahrenheit.to_f - 32) / 1.8
    fahrenheit = fahrenheit.round 
end 

def ctof(celsius)
    celsius = celsius.to_f * 1.8 + 32
end 