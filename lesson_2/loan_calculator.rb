=begin
Understand the Problem 
    - Inputs -- Loan ammount, intrest rate, length of loan
    - Output -- Monthly intrest rate, loan duration in months, monthly payment
    - Requirements -- monthly payment(m), principle(p), monthly intrest rate (j), loan duration in months(n)
ID rules
    - time in years to months
    - apr vs mpr (Yearly to monthly)
    - m = p * (j / (1 - (1 + j)**(-n)))
      - monthly payment = principle * (monthly intrest rate / (1 - (1 + monthly intrest rate)**(-duration in months)))

Examples / Test cases
  - 0 month loan
  - intrest in percentage
  - non usd calculations

Data Structure 
  - not sure what to do here, maybe the yearly to monthly?

Algorithm 
  Welcome message
  Input loan ammount
  Input APR
    -Convert to monthly %
  Input duration in years
    -convert to months
  - m = p * (j / (1 - (1 + j)**(-n)))
  - Puts statement .. Your monthly payment on a #{loan ammount} dollar loan over #{duration in years} years is #{monthly payment}

Code
  -Code that shit, but with intetion
=end

# Method for putting string and prepending => for pretty formatting and practice.
def prompt(message)
  puts("=> #{message}")
end

# main loop - calculator's logic here
loop do
  puts "Welcome to loan calculator."
  puts "--------------------------"

  # This loop initialized principle outside of itself and then runs until a valid input for principle is 
  principle = ""
  loop do
    prompt("How many USD are you looking to borrow?")
    principle = gets.chomp.to_i

    if principle <= 0
      prompt("Enter a valid loan ammount.")
    else
      break
    end
  end

  # Intrest is initialized outside of the loop and then the loop runs until a valid input is given.
  intrest = ''
  loop do
    prompt("Enter your intrest rate as a percentage.")
    intrest = gets.chomp.to_f
    # will still work if you enter 6% instead of just 6 but this seems wrong

    if intrest <= 0 
      prompt("Enter a valid intrest rate")
    else
      break
    end 
  end

  # Years is initialized outdide of the loop and the loop runs until a valid input is input.
  years = ''
  loop do
    prompt("Enter the length of your loan in years")
    years = gets.chomp.to_f

    if years <= 0
      prompt("Enter a valid length of loan")
    else
      break
    end
  end

  # Basic math logic for convertint % to float, years to months, monthly intrest rate
  intrest_rate = intrest / 100
  monthly_intrest_rate = intrest_rate / 12
  term_in_months = years * 12

  # equation for monthly intrest  --  m = p * (j / (1 - (1 + j)**(-n)))  --m = monthly payment, p = loan ammt, j = monthly intrest rate, n = loan duration in months
  monthly_payment = principle * (monthly_intrest_rate / (1 - (1 + monthly_intrest_rate)**(-term_in_months)))

  puts "Your monthly patment on a #{principle} dollar loan at #{intrest}% intrest is #{monthly_payment} dollars a month."
  
  prompt("Would you like to make another calculation? Y for yes.")
  answer = gets.chomp
  break unless answer.upcase == "Y"
end