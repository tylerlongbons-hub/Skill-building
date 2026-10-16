from bank_account import BankAccount
import pytest

@pytest.fixture
def account():
    return BankAccount("Tyler", 1000)

@pytest.fixture
def account2():
    return BankAccount("Kassie", 1000)

def test_init_no_balance():
    ba = BankAccount("Tyler")
    assert ba.balance == 0

def test_init(account: BankAccount):
    assert account.owner == "Tyler"
    assert account.balance == 1000

def test_deposit(account: BankAccount):
    assert account.deposit(100) == 1100

def test_withdraw(account: BankAccount):
    assert account.withdraw(100) == 900

def test_str(account: BankAccount):
    assert str(account) == "Tyler: $1000.00"

def test_transfer(account: BankAccount, account2: BankAccount):
    account.transfer(account2, 100)
    assert account.balance == 900
    assert account2.balance == 1100

@pytest.mark.parametrize("amount", [0, -100, -0.55])
def test_invalid_deposit(account: BankAccount, amount):
    with pytest.raises(ValueError):
        account.deposit(amount)

@pytest.mark.parametrize("amount", [0, -100, -0.55])
def test_negative_withdraw(account: BankAccount, amount):
    with pytest.raises(ValueError):
        account.withdraw(amount)

def test_overdraw_withdraw(account: BankAccount):
    with pytest.raises(ValueError):
        account.withdraw(2000)

@pytest.mark.parametrize("amount", [0, -100, -0.55])
def test_invalid_transfer(account: BankAccount, account2: BankAccount, amount):
    with pytest.raises(ValueError):
        account.transfer(account2, amount)
    assert account.history == []
    assert account2.history == []
    assert account.balance == 1000
    assert account2.balance == 1000

def test_correct_history(account: BankAccount):
    history = [("deposit", 100), ("withdraw", 50)]
    account.deposit(100)
    account.withdraw(50)
    assert account.history == history 

def test_history_transfer(account: BankAccount, account2: BankAccount):
    account.transfer(account2, 100)
    assert account.history == [("withdraw", 100)]
    assert account2.history == [("deposit", 100)]

def test_full_withdraw(account: BankAccount):
    assert account.withdraw(1000) == 0

def test_transfer_short_funds(account, account2):
    with pytest.raises(ValueError):
            account.transfer(account2, 2000)
    assert account.history == []
    assert account2.history == []
    assert account.balance == 1000
    assert account2.balance == 1000
    

