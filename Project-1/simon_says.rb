#write your code here
def echo(string)
    string
end 

def shout(string)
    string.upcase
end 

def repeat (y, z=2)
    ("#{y} " * (z - 1) +"#{y}")
end

def start_of_word(e, b=0)
    e.chars.first(b).join
end

def first_word(string)
    string.split.first
end 

def titleize(a)
    words = a.split #split les phrases en mini arrays de mot avec .split
    words.each do |word| #pour chaque phrase, faire mot
        if (word != "and") && (word != "the") # si mot != "and" && mot != "the"
            word[0] = word[0].upcase #alors mot = mot avec la première lettre en maj
        end #fin du if statement
    end # fin de l'itérateur each
    words[0][0] = words[0][0].upcase #met la première lettre du premier mot en maj
    a = words.join(" ") #joint l'array, donc les remet en phrases, avec des espaces entre
end 