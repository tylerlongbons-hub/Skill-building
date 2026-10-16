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

def test_init(account):
    assert account.owner == "Tyler"
    assert account.balance == 1000

def test_deposit(account):
    account.deposit(100)
    assert account.balance == 1100

def test_withdraw(account):
    account.withdraw(100)
    assert account.balance == 900

def test_str(account):
    assert str(account) == "Tyler: 1000"

def test_transfer(account, account2):
    account.transfer(account2, 100)
    assert account.balance == 900
    assert account2.balance == 1100

def test_invalid_deposit(account):
    with pytest.raises(ValueError):
        account.deposit(-100)

def test_negative_withdraw(account):
    with pytest.raises(ValueError):
        account.withdraw(-100)

def test_overdraw_withdraw(account):
    with pytest.raises(ValueError):
        account.withdraw(2000)

def test_invalid_transfer(account, account2):
    with pytest.raises(ValueError):
        account.transfer(account2, -100)
    

