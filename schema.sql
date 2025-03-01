
CREATE TABLE IF NOT EXISTS Business (
    business_id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    city TEXT NOT NULL,
    rating REAL CHECK (rating BETWEEN 0 AND 5),
    review_count INTEGER CHECK (review_count >= 0),
    latitude REAL,
    longitude REAL
);

CREATE TABLE IF NOT EXISTS Category (
    category_id INTEGER PRIMARY KEY AUTOINCREMENT,
    business_id TEXT,
    category_name TEXT NOT NULL,
    FOREIGN KEY (business_id) REFERENCES Business(business_id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Review (
    review_id TEXT PRIMARY KEY,
    user_id TEXT,
    business_id TEXT,
    stars INTEGER CHECK (stars BETWEEN 1 AND 5),
    date TEXT,
    FOREIGN KEY (business_id) REFERENCES Business(business_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

CREATE TABLE IF NOT EXISTS User (
    user_id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    review_count INTEGER CHECK (review_count >= 0)
);

CREATE TABLE IF NOT EXISTS Checkin (
    checkin_id INTEGER PRIMARY KEY AUTOINCREMENT,
    business_id TEXT,
    date TEXT,
    FOREIGN KEY (business_id) REFERENCES Business(business_id)
);

CREATE TABLE IF NOT EXISTS Tip (
    tip_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id TEXT,
    business_id TEXT,
    text TEXT,
    date TEXT,
    FOREIGN KEY (business_id) REFERENCES Business(business_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);
