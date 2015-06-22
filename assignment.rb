require 'csv'

class User
  attr_accessor :name, :balance, :accounts

  def initialize(name)
    @accounts = accounts
    @name = name
    @balance = 0.0
  end

  def account_from
    user = @accounts[name]
    return user[:account] if user[:user].verify_pin?(pin)
  end

  def self.authenticate
    CSV.foreach("users.csv", headers: true) do |row|
      @users.push(row)
    end
  end
end

class Bank
  attr_accessor :name, :pin, :balance

  def initialize
    # @users = User.new
    @name = name
    @pin = pin
    @balance = 0.0
  end

  def user=(new_user)
    @new_user = Bank.new
  end

  def user
    @new_user
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
    @current_user_name = self.prompt_and_chomp("To Make It Rain, Please Enter Your Name")  
    @current_user_pin = self.prompt_and_chomp("Now Gimme Dem Digits, Guh")
    self.verify  
  end

  def verify
    current_user = nil
    @new_user.each do |user|
      if self.user[:name] == @current_user_name && user[:pin] == @current_user_pin.to_i
        @current_user = user
        self.menu
      end
    end  
  end

  # def menu
  #   puts "Select an option from the menu."
  #     puts %{
  #     1: Check Balance
  #     2: Withdraw Funds
  #     3: Deposit Funds
  #     4: Cancel
  #   }
  #   puts ">> "
  #   @selected_option = gets.chomp
  #   self.pre_opt
  # end

  def menu
      options = ['1: Check Balance', '2: Withdraw Funds', '3: Deposit Funds', '4: Cancel']
      until (1..options.length).include?(@selected_option)
        @selected_option = self.prompt_user(options.join("\n")).to_i
     end
     self.options
  end

  def options
      case @selected_option
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


customer = Bank.new

customer.set_name_pin

