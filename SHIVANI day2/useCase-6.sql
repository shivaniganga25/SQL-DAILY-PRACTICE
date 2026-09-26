USE cdg_hyd_jfs_058;

CREATE TABLE bank_account (
    account_id INT NOT NULL AUTO_INCREMENT,
    account_number CHAR(12) NOT NULL ,
    account_holder_name VARCHAR(120) NOT NULL,
    account_type VARCHAR(20) NOT NULL,
    balance DECIMAL(15, 2) NOT NULL DEFAULT 0.00,
    currency_code CHAR(3) NOT NULL DEFAULT 'INR',
    branch_name VARCHAR(100) NOT NULL,
    opened_date DATE NOT NULL,
    interest_rate DECIMAL(5, 2) NOT NULL DEFAULT 0.00,
    overdraft_limit DECIMAL(12, 2) NOT NULL DEFAULT 0.00,
    account_status VARCHAR(20) NOT NULL DEFAULT 'ACTIVE',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,

    CONSTRAINT `pk_account_id` PRIMARY KEY (account_id),
    CONSTRAINT `uq_account_number` UNIQUE (account_number),
    CONSTRAINT `chk_balance_should_not_be_negative` CHECK (balance >= 0),
    CONSTRAINT `chk_overdraft_limit_should_not_be_negative` CHECK (overdraft_limit >= 0),
    CONSTRAINT `chk_interest_rate` CHECK (interest_rate BETWEEN 0.00 AND 100.00)
);

ALTER TABLE bank_account AUTO_INCREMENT=001;
DROP TABLE bank_account;
SELECT * FROM bank_account;

INSERT INTO bank_account 
(account_number, account_holder_name, account_type, balance, currency_code, branch_name, opened_date, interest_rate, overdraft_limit, account_status)
VALUES
('100000000001', 'Anjali Nair', 'SAVINGS', 125000.50, 'INR', 'Hyderabad Main Branch', '2020-03-15', 3.50, 5000.00, 'ACTIVE');

INSERT INTO bank_account 
(account_number, account_holder_name, account_type, balance, currency_code, branch_name, opened_date, interest_rate, overdraft_limit, account_status)
VALUES
('100000000002', 'Rahul Verma', 'CURRENT', 45000.00, 'INR', 'Banjara Hills Branch', '2022-07-10', 0.00, 25000.00, 'ACTIVE');

INSERT INTO bank_account 
(account_number, account_holder_name, account_type, balance, currency_code, branch_name, opened_date, interest_rate, overdraft_limit, account_status)
VALUES
('100000000003', 'Fatima Sheikh', 'FIXED_DEPOSIT', 500000.00, 'INR', 'Gachibowli Branch', '2019-11-01', 6.75, 0.00, 'DORMANT');


