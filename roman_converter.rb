def  my_roman_numerals_converter(number)
    
    if number > 3000 or number < 1
        return 0
    end

    digit_array = number.digits
    number_length = digit_array.length
    index = 0
    reversed_array = []

    while index < number_length
        digit = digit_array[index]

        case index
        when 0
            reversed_array << digit_to_roman(digit)
        when 1
            reversed_array << ten_to_roman(digit)
        when 2
            reversed_array << hundred_to_roman(digit)
        when 3
            reversed_array << thousand_to_roman(digit)
        end

        index+=1
    end
   
    roman_array = reversed_array.reverse
    roman_string = roman_array.join("")
    return roman_string

end

def digit_to_roman(digit)
    num = ""
    case digit
    when 0..3
        num += ("I" * digit)     
    when 4
        num += "IV"
    when 5..8
        num += "V" + ("I" * (digit -5))
    when 9
       num += "IX"
    end
    return num
end

def ten_to_roman(digit)
    num = ""
    case digit
    when 0..3
        num += ("X" * digit)     
    when 4
        num += "XL"
    when 5..8
        num += "L" + ("X" * (digit -5))
    when 9
       num += "XC"
    end
    return num
end

def hundred_to_roman(digit)
    num = ""
    case digit
    when 0..3
        num += ("C" * digit)     
    when 4
        num += "CD"
    when 5..8
        num += "D" + ("C" * (digit -5))
    when 9
       num += "CM"
    end
    return num
end

def thousand_to_roman(digit)
    num = ""
    num += ("M" * digit)     
    return num
end

def print_in_console()
    input_num = "no number was given"

    if ARGV
        input_num = ARGV[0]
    end

    return  input_num.to_i
end

number = print_in_console()

puts "#{number} => #{my_roman_numerals_converter(number)}"
