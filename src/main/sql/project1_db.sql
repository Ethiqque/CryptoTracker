CREATE TABLE assets (
                        asset_id SERIAL PRIMARY KEY,
                        name VARCHAR(255) NOT NULL,
                        current_price NUMERIC(10, 4) NOT NULL,
                        change_1h NUMERIC(5, 2),
                        change_24h NUMERIC(5, 2),
                        change_7d NUMERIC(5, 2),
                        holdings NUMERIC(15, 4) NOT NULL,
                        average_buy_price NUMERIC(10, 4) NOT NULL,
                        profit_loss NUMERIC(15, 4) NOT NULL
);

CREATE TABLE transactions (
                              transaction_id SERIAL PRIMARY KEY,
                              transaction_type VARCHAR(10) CHECK (transaction_type IN ('Buy', 'Sell', 'Transfer')),
                              asset_id INT REFERENCES assets(asset_id),
                              quantity NUMERIC(15, 6) NOT NULL,
                              price_per_coin NUMERIC(10, 4) NOT NULL,
                              transaction_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
                              fee NUMERIC(10, 2),
                              notes TEXT
);

