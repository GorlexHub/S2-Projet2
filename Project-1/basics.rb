# write your code here
def who_is_bigger(a, b, c)
    if a == nil || b == nil || c == nil 
        "nil detected" 
   elsif a > b && a > c
     "a is bigger"
    elsif b > a && b > c 
        "b is bigger"
    elsif c > a && c > b 
        "c is bigger"
    end 
end 

def reverse_upcase_noLTA(string)
    string.upcase.delete('LTA').reverse!
end 

def array_42(string)
    string.include?(42)
end 

def magic_array(string)
    string.flatten.sort.map{|x|x*2}.delete_if{|x| x % 3 == 0}.uniq
end 
