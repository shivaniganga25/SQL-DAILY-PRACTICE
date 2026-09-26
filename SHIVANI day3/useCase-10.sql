USE cdg_hyd_jfs_058;

CREATE TABLE support_tickets(

    ticket_id INT NOT NULL AUTO_INCREMENT,
    ticket_number VARCHAR(20) NOT NULL,
    requester_name VARCHAR(120) NOT NULL,
    requester_email VARCHAR(120) NOT NULL,
    subject VARCHAR(200) NOT NULL,
    description TEXT NOT NULL,
    category VARCHAR(20) NOT null,
    priority VARCHAR(20) NOT NULL DEFAULT 'MEDIUM',
    ticket_status VARCHAR(20) NOT NULL DEFAULT 'OPEN',
     assigned_agent VARCHAR(120),
     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL ,
     resolved_at TIMESTAMP ,
     last_update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,

     CONSTRAINT `pk_ticket_id` PRIMARY KEY (ticket_id),
     CONSTRAINT `uk_ticket_number` UNIQUE (ticket_number),
     CONSTRAINT `chk_resolved_at_is_null_or_not_earlier_than_created_timestamp` CHECK (resolved_at > created_at)
     
     );

ALTER TABLE support_tickets AUTO_INCREMENT=001;
DROP TABLE support_tickets;
SELECT * FROM support_tickets;

INSERT INTO support_tickets 
(ticket_number, requester_name, requester_email, subject, description, category, priority, ticket_status, assigned_agent, created_at, resolved_at, last_update_at)
VALUES
('TCK-1001', 'John Smith', 'john.smith@email.com', 'Cannot login to account', 'User is unable to log in despite correct credentials. Getting invalid password error.', 'Account', 'HIGH', 'RESOLVED', 'Alice Johnson', '2026-09-01 09:15:00', '2026-09-01 14:30:00', '2026-09-01 14:30:00');

INSERT INTO support_tickets 
(ticket_number, requester_name, requester_email, subject, description, category, priority, ticket_status, assigned_agent, created_at, resolved_at, last_update_at)
VALUES
('TCK-1002', 'Priya Sharma', 'priya.sharma@email.com', 'Payment not processed', 'Payment was deducted but order shows as pending.', 'Billing', 'HIGH', 'OPEN', NULL, '2026-09-02 10:00:00', NULL, '2026-09-02 10:00:00');

INSERT INTO support_tickets 
(ticket_number, requester_name, requester_email, subject, description, category, priority, ticket_status, assigned_agent, created_at, resolved_at, last_update_at)
VALUES
('TCK-1003', 'Michael Chen', 'michael.chen@email.com', 'App crashes on startup', 'The mobile app crashes immediately after opening on Android 14.', 'Bug', 'MEDIUM', 'IN_PROGRESS', 'Bob Williams', '2026-09-03 08:45:00', NULL, '2026-09-05 09:00:00');

-- Updating ticket_status, resolved_at, and assigned_agent for a ticket by ticket_id
UPDATE support_tickets SET ticket_status = 'RESOLVED', resolved_at = '2026-09-06 11:00:00', assigned_agent = 'Bob Williams', last_update_at = CURRENT_TIMESTAMP WHERE ticket_id = 3;

-- Removing all tickets with ticket_status = 'RESOLVED'
DELETE FROM support_tickets WHERE ticket_status = 'RESOLVED';