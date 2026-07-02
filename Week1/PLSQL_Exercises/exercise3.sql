-- Procedure 1: Process Monthly Interest
CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest AS
BEGIN
    UPDATE Accounts
    SET Balance = Balance + (Balance * 0.01)
    WHERE AccountType = 'Savings';

    DBMS_OUTPUT.PUT_LINE('Monthly interest processed.');
END;
/

-- Procedure 2: Update Employee Bonus
CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus (
    dept_name IN VARCHAR2,
    bonus_percent IN NUMBER
)
AS
BEGIN
    UPDATE Employees
    SET Salary = Salary + (Salary * bonus_percent / 100)
    WHERE Department = dept_name;

    DBMS_OUTPUT.PUT_LINE('Bonus updated for department: ' || dept_name);
END;
/

-- Procedure 3: Transfer Funds
CREATE OR REPLACE PROCEDURE TransferFunds (
    from_acc IN NUMBER,
    to_acc IN NUMBER,
    amount IN NUMBER
)
AS
    source_balance NUMBER;
BEGIN
    SELECT Balance INTO source_balance
    FROM Accounts
    WHERE AccountID = from_acc;

    IF source_balance >= amount THEN
        UPDATE Accounts
        SET Balance = Balance - amount
        WHERE AccountID = from_acc;

        UPDATE Accounts
        SET Balance = Balance + amount
        WHERE AccountID = to_acc;

        DBMS_OUTPUT.PUT_LINE('Transfer successful.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Insufficient balance.');
    END IF;
END;
/


-- Testing procedures
BEGIN
    ProcessMonthlyInterest;
END;
/

BEGIN
    UpdateEmployeeBonus('IT', 10);
END;
/

BEGIN
    TransferFunds(1, 2, 200);
END;
/