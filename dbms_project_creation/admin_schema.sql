CREATE TABLE admin_users (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    last_login TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE admin_live_orders (
    order_id VARCHAR(20) PRIMARY KEY, 
    order_time VARCHAR(20),           
    customer_name VARCHAR(100),       
    total_value DECIMAL(10, 2),       
    payment_method VARCHAR(50),       
    current_status ENUM('Processing', 'Out for Delivery', 'Delivered') DEFAULT 'Processing',
    assigned_delivery_person VARCHAR(100)
);
CREATE TABLE admin_customer_directory (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),                
    contact_info VARCHAR(150),        
    join_date DATE,                   
    account_status VARCHAR(20) DEFAULT 'ACTIVE', 
    total_orders_placed INT DEFAULT 0
);

CREATE TABLE admin_audit_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    admin_username VARCHAR(50),
    action_performed TEXT,            
    action_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);