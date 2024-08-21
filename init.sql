CREATE TABLE IF NOT EXISTS user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

-- Insert some data if the table is empty
INSERT INTO user (name, email) VALUES ('John Doe', 'john@gmail.com');