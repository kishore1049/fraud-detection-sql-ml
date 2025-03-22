# Fraud Detection Using SQL & Python

## 📌 Project Overview
This project aims to detect fraudulent transactions by analyzing financial data stored in an **MS SQL Server** database. It uses **Python (pandas, matplotlib, seaborn)** for data extraction, analysis, and visualization. The project demonstrates:

- SQL database connectivity using **pyodbc**
- Data extraction and manipulation with **pandas**
- Fraud detection logic based on transaction thresholds
- Data visualization with **matplotlib & seaborn**
- Automation of SQL queries

## 📂 Folder Structure
```
fraud-detection/
│── data/                    # Sample datasets (if any)
│── scripts/                 # Python scripts for data processing
│── notebooks/               # Jupyter Notebooks with analysis
│── sql/                     # SQL scripts for data creation & insertion
│── README.md                # Project documentation
│── requirements.txt         # Python dependencies
│── fraud_detection.py       # Main script for running analysis
```

## 🛠️ Technologies Used
- **SQL Server** (Database Management)
- **Python** (Data Processing & Visualization)
- **Jupyter Notebook** (Analysis & Reporting)
- **pandas, matplotlib, seaborn** (Data Analysis & Visualization)

## 📖 Dataset Information
The dataset consists of 100 randomly generated transactions with:
- `transaction_id`: Unique transaction identifier
- `amount`: Transaction amount (ranging from 1,000 to 20,000)
- `transaction_date`: Date of transaction

SQL script to create & populate the table:
```sql
DROP TABLE IF EXISTS dbo.transactions;

CREATE TABLE dbo.transactions (
    transaction_id INT PRIMARY KEY,
    amount DECIMAL(10,2),
    transaction_date DATETIME
);

DECLARE @counter INT = 1;
WHILE @counter <= 100
BEGIN
    DECLARE @amount DECIMAL(10,2) = ROUND((RAND() * 19000) + 1000, 2);
    DECLARE @trans_date DATETIME = GETDATE();
    INSERT INTO dbo.transactions (transaction_id, amount, transaction_date)
    VALUES (@counter, @amount, @trans_date);
    SET @counter = @counter + 1;
END;
```

## 🔧 Installation & Setup
1. **Clone the repository**
   ```sh
   git clone https://github.com/yourusername/fraud-detection.git
   cd fraud-detection
   ```

2. **Install dependencies**
   ```sh
   pip install -r requirements.txt
   ```

3. **Configure SQL Server connection**
   Update `fraud_detection.py` with your SQL Server credentials:
   ```python
   import pyodbc
   conn = pyodbc.connect(
       "DRIVER={ODBC Driver 17 for SQL Server};"
       "SERVER=your_server_name;"
       "DATABASE=your_database_name;"
       "Trusted_Connection=yes;"
   )
   ```

4. **Run the analysis script**
   ```sh
   python fraud_detection.py
   ```

## 📊 Visualizations
- **Transaction Amount Distribution**
- **Fraudulent Transaction Detection (Threshold-Based)**
- **Time-Based Trends**

Example:
```python
import matplotlib.pyplot as plt
import seaborn as sns

df = pd.read_sql("SELECT * FROM dbo.transactions", conn)
sns.histplot(df['amount'], bins=20, kde=True)
plt.title("Transaction Amount Distribution")
plt.show()
```

## 🚀 Future Enhancements
- **Real-time API Integration** to fetch live transactions
- **Machine Learning Model** for anomaly detection
- **Email Alerts** for suspicious transactions

## 📝 License
This project is licensed under the **MIT License**.

## 🤝 Contributing
Feel free to fork the repo and submit pull requests!

---
Let me know if you'd like any modifications! 🚀
