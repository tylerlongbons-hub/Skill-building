

class BankAccount:


    def __init__(self, owner: str, balance: float=0):
        """Constructor that takes owner name and a starting balance"""
        self.owner = owner
        self.balance = balance
        self.history = []

    def deposit(self, amount: float) -> float:
        """Deposit money into the account if it is greater than 0"""
        if amount <= 0:
            print(f"You entered in an invalid amount of money ${amount}")
            raise ValueError
        self.balance += amount
        self.history.append(("deposit", amount))
        return self.balance

    def withdraw(self, amount: float) -> float:
        """Withdraw money from the account as long as its greater than 0 and does not overdraw the balance"""
        if amount <= 0 or amount > self.balance:
            print(f"You entered in an invalid amount of money or don't have enough to withdraw ${amount}")
            raise ValueError
        self.balance -= amount
        self.history.append(("withdraw", amount))
        return self.balance

    def __str__(self) -> str:
        """Print string in format of Name: balance"""
        return f"{self.owner}: ${self.balance:.2f}"

    def transfer(self, other: "BankAccount", amount: float):
        """Transfer money from one account to another by depositing into one account and withdrawing from the other"""
        if self.balance - amount >= 0:
            self.withdraw(amount)
            other.deposit(amount)
        else:
            print(f"you do not have the funds to transfer {amount} to {other.owner}")
            raise ValueError
            


    