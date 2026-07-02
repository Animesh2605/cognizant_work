SET SERVEROUTPUT ON;

-- Scenario 1: Apply discount for customers above 60
DECLARE
BEGIN
    FOR rec IN (
        SELECT c.CustomerID, c.DOB, l.LoanID
        FROM Customers c
        JOIN Loans l ON c.CustomerID = l.CustomerID
    )
    LOOP
        IF MONTHS_BETWEEN(SYSDATE, rec.DOB)/12 > 60 THEN
            UPDATE Loans
            SET InterestRate = InterestRate - 1
            WHERE LoanID = rec.LoanID;

            DBMS_OUTPUT.PUT_LINE(
                'Discount applied for Customer ID: ' || rec.CustomerID
            );
        END IF;
    END LOOP;
END;
/


-- Scenario 2: Promote VIP customers
DECLARE
BEGIN
    FOR rec IN (
        SELECT CustomerID, Balance
        FROM Customers
    )
    LOOP
        IF rec.Balance > 10000 THEN
            DBMS_OUTPUT.PUT_LINE(
                'Customer ID ' || rec.CustomerID || ' promoted to VIP'
            );
        END IF;
    END LOOP;
END;
/


-- Scenario 3: Loan due reminders
DECLARE
BEGIN
    FOR rec IN (
        SELECT LoanID, CustomerID, EndDate
        FROM Loans
        WHERE EndDate BETWEEN SYSDATE AND SYSDATE + 30
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Reminder: Loan ID ' || rec.LoanID ||
            ' for Customer ID ' || rec.CustomerID ||
            ' is due on ' || rec.EndDate
        );
    END LOOP;
END;
/