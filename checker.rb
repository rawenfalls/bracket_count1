def scan
  expression = gets.chomp.strip.scan(/[()]/)
  check_brackets(expression)
end

def check_answer
  quit = false
  until quit
    answer = gets.chomp.downcase
    yes_or_no = [["y", "yes", "д", "да"], ["n", "no", "н", "нет"]]
    if yes_or_no.assoc("y").include?(answer)
      quit = true
    elsif yes_or_no.assoc("n").include?(answer)
      abort
    else
      puts "некоректный ввод, попробуйте ещё раз"
    end
  end
end

def check_brackets( expression)
  loop do
    break if  expression.first != "("
    break if expression.index(")") == nil
    expression.shift
    expression.delete_at(expression.index(")"))
  end
  if expression == []
    puts "верное кол-во скобок"
  else
    puts "неверное кол-во скобок"
  end
end