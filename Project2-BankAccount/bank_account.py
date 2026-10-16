

class BankAccount:
    history = []
    owner = ""
    balance = 0
    def __init__(self, owner: str, balance: float=0):
        """Constructor that takes owner name and a starting balance"""
        self.owner = owner
        self.balance = balance

    def deposit(self, amount: float):
        """Deposit money into the account if it is greater than 0"""
        if amount <= 0:
            raise ValueError
        self.balance += amount
        self.history.append(("deposit", amount))

    def withdraw(self, amount: float):
        """Withdraw money from the acocunt as long as its greater than 0 and does not overdraw the balance"""
        if amount <= 0 or amount > self.balance:
            raise ValueError
        self.balance -= amount
        self.history.append(("withdraw", amount))

    def __str__(self):
        """Print string in format of Name: balance"""
        return f"{self.owner}: {self.balance}"

    def transfer(self, other: "BankAccount", amount: float):
        """Transfer money from one account to another by depositing into one account and withdrawing from the other"""
        try: 
            other.deposit(amount)
            self.withdraw(amount)
        except Exception:
            raise ValueError


    