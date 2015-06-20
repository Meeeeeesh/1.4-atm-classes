require 'csv'
users = []
#looping through CSV file to create a hash per row.
CSV.foreach("users.csv", headers: true) do |row|
  users.push(row)
end

class Bank
  attr_reader :name, :balance, :accounts

  def initialize(name)
    @accounts = accounts
    @name = name
    @balance = 0.0
  end

  def account_from
    user = @accounts[name]
    return user[:account] if user[:user].verify_pin?(pin)
  end
end

class User 
  attr_accessor :name, :pin

  def initialize(name, pin)
    @users = []
    CSV.foreach("users.csv", headers: true) do |row|
      @users.push(row)
    end
    @name = name
    @pin = pin
  end

  def verify_pin?(pin)
    if pin == @pin 
      return true
    end
  end

  def withdraw(amount)
    puts "What amount would you like to withdraw?"
    puts "$#{amount} has been successfully withdrawn." 
  end
  
  def deposit(amount)
    puts "What amount would you like to deposit? "
    puts "$#{amount} has been sucessfully deposited."
  end

  def show_balance
    puts "Your existing balance is $#{@balance}."
  end

  def prompt_user(text)
  puts text
  print ">> "
  gets.chomp
  end

  def prompt_and_chomp(text)
  input_text = ""
  while input_text == ""
    input_text = prompt_user(text)
  end
  input_text
  end

  def set_name_pin
  current_user_name = prompt_and_chomp("To Make It Rain, Please Enter Your Name")  
  current_user_pin = prompt_and_chomp("Now Gimme Dem Digits, Guh")  
  puts "INPUT NAME: " + current_user_name
  puts "INPUT PIN: " + current_user_pin
  end

current_user = nil
@users.each do |user|
  if user[:name] == current_user_name && user[:pin] == current_user_pin
    current_user = user
  end
end

puts "CUR USER: " + current_user.inspect

puts "Select an option from the menu."
  puts %{
    1: Check Balance
    2: Withdraw Funds
    3: Deposit Funds
    4: Cancel
  }
  puts ">> "
  cmd = gets.chomp
 
 if current_user
  options = ['1: Check Balance', '2: Withdraw funds', '3: Cancel']
  selected_option = nil
  until (1..options.length).include?(selected_option)
    selected_option = prompt_user(options.join("\n")).to_i
 end

  case selected_option
  when 1
      puts "Your existing balance is $%.2f\n" % account.balance
  when 2
      puts "What amount would you like to withdraw?"
      amount = gets.chomp.to_i
      account.withdraw(amount)
  when 3
      puts "What amount would you like to deposit?"
      amount = gets.chomp.to_i
      account.deposit(amount)
  when 4
      puts "Canceling transaction."
  else
      puts "Try again." unless cmd == 4
    end
  end
end 
