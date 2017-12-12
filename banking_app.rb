@counter = 0
@account_number = 0

private
def pin
    @pin = 1234
end

class Account
	
    attr_reader :name, :balance, :number
    def initialize(name, balance=100)
        @name = name
        @balance = balance
    end  
    
    def display_balance()
        puts "Balance: $#{@balance}."
	end

def withdraw(amount)
	if balance < amount
	puts "Overdraw, transaction denied" 
	else 
      @balance -= amount
      puts "Withdrew $#{amount}. New balance: $#{@balance}."
	  
    end
end

def deposit(amount)
		@balance += amount 
		 puts "Deposited $#{amount}. New balance: $#{@balance}."
	 end
	 
	 def transfer(amount)
		 if balance < amount
		puts "Overdraw, transaction denied " 
		exit
		end
		end
	
end

#Outside the class

@checking_account = Account.new("Checking", 9_000_000) 
@savings_account = Account.new("Savings", 1000)


def menu
	puts "What would you like to do?"
	puts " "
	puts "-- Type 'Balance' to check balance."
	puts "-- Type 'Withdraw' to withdraw funds."
	puts "-- Type 'Deposit' to deposit funds."
	puts "-- Type 'Transfer' to transfer funds."
	puts " "
	choice = gets.chomp.upcase

case choice

	when 'BALANCE' 
	@current_account.display_balance()
	puts " "
	menu


	when 'WITHDRAW'
puts "Enter How Much to Withdraw"
amount = gets.chomp.to_i
@current_account.withdraw(amount)
puts " "
menu

	when 'DEPOSIT'
puts "Enter How Much to Deposit"
amount = gets.chomp.to_i
@current_account.deposit(amount)
puts " "
menu

	when 'TRANSFER'
puts "Enter How Much to Transfer"
amount = gets.chomp.to_i
puts "To Which Account?"
	gets.chomp
	@secondary_account = @savings_account
	@secondary_account.deposit(amount)
	@current_account.transfer(amount)
	@current_account.withdraw(amount)
	puts "Succesfully transfered $#{amount}"
	puts " "
	menu

	when 'CHANGE'
account_choice

	when 'ADD'
	@account_number += 1
		if @account_number <= 1
	puts "What Would You like to name this account?"
	name = gets.chomp.upcase
	@extra_account = Account.new(name, 0)
	puts "Created new #{@extra_account.name} Account"
	@extra_account.display_balance
	account_choice
		else puts "Cannot create more accounts"
		account_choice
		end

	when 'EXIT'
exit

	else
puts "Not a Valid Command"
puts "Try Again"
menu
# I added the "choice" case to the menu method.
end
end


def account_choice
	if @account_number == 0
	puts "Which Account To Access?"
	puts "#{@savings_account.name.upcase}" 
	puts "#{@checking_account.name.upcase}"
	selection = gets.chomp.upcase
	else
	puts "Which Account To Access?"
	puts "#{@savings_account.name.upcase}" 
	puts "#{@checking_account.name.upcase}"
	puts "#{@extra_account.name}"
	selection = gets.chomp.upcase
	end

case selection
	
	when 'SAVINGS'
	@current_account = @savings_account
	@secondary_account = @checking_account
	puts "Currently in #{@savings_account.name} Account"
	menu
	
	when 'CHECKING'
	@current_account = @checking_account
	puts "Currently in #{@checking_account.name} Account"
	menu
	
	when "#{@extra_account.name}"
	@current_account = @extra_account
	puts "Currently in #{@extra_account.name} Account"
	menu
	
	else 
		puts "Not a Correct Selection"
		account_choice
		
# I added the "selection" case to the account_choice method.
	
	end
	
	end

def pin_error
	@counter += 1
	if @counter < 3
    puts "Access Denied: Incorrect PIN."
	login
	else
	puts "Too Many Pin Attempts. Now Exiting."
	exit
	

end
end



def login

puts "Enter PIN"

	if
	gets.to_i == pin
	account_choice
	else 
	pin_error
	end

end




#This is where I stop defining methods, and call stuff


login

