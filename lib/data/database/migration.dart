class Migration {
  static final List<String> tables = [
    '''CREATE TABLE accounts (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          type TEXT NOT NULL,
          createdAt TEXT NOT NULL
        )''',
    '''CREATE TABLE users (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          email TEXT NOT NULL UNIQUE,
          password TEXT NOT NULL,
          accountId INTEGER NOT NULL,
          FOREIGN KEY (accountId) REFERENCES accounts(id)
        )''',
    '''CREATE TABLE financial_areas (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          accountId INTEGER NOT NULL,
          FOREIGN KEY (accountId) REFERENCES accounts(id)
        )''',
    '''CREATE TABLE transaction_categories (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          financialAreaId INTEGER NOT NULL,
          accountId INTEGER NOT NULL,
          FOREIGN KEY (financialAreaId) REFERENCES financial_areas(id),
          FOREIGN KEY (accountId) REFERENCES accounts(id)
        )''',
    '''CREATE TABLE institutions (
          id INTEGER PRIMARY KEY AUTOINCREMENT, 
          name TEXT, 
          image TEXT
       )''',
    '''CREATE TABLE bank_accounts (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          balance REAL NOT NULL DEFAULT 0,
          accountId INTEGER NOT NULL,
          institutionId INTEGER, 
          FOREIGN KEY(institutionId) REFERENCES institutions(id),
          FOREIGN KEY (accountId) REFERENCES accounts(id)
        )''',
    '''CREATE TABLE contacts (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          type TEXT NOT NULL,
          accountId INTEGER NOT NULL,
          FOREIGN KEY (accountId) REFERENCES accounts(id)
        )''',
    '''CREATE TABLE transactions (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          description TEXT,
          value REAL NOT NULL,
          date TEXT NOT NULL,
          status TEXT NOT NULL,
          financialAreaId INTEGER NOT NULL,
          categoryId INTEGER,
          bankAccountOriginId INTEGER NOT NULL,
          bankAccountDestinationId INTEGER,
          contactId INTEGER,
          accountId INTEGER NOT NULL,
          FOREIGN KEY (financialAreaId) REFERENCES financial_areas(id),
          FOREIGN KEY (categoryId) REFERENCES categories(id),
          FOREIGN KEY (bankAccountOriginId) REFERENCES bank_accounts(id),
          FOREIGN KEY (bankAccountDestinationId) REFERENCES bank_accounts(id),
          FOREIGN KEY (contactId) REFERENCES contacts(id),
          FOREIGN KEY (accountId) REFERENCES accounts(id)
        )'''
  ];
}
