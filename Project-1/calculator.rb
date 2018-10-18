#write your code here
def add(x, y)
    x + y 
end

def subtract(n, f)
    n - f 
end

def sum(array)
    array.inject(0){|sum, x| sum + x}
end 

def multiply(a, b)
    a * b
end 

def power(a)
    a * a 
end

def factorial(x)
    (1..x).inject(:*) || 1
end 
