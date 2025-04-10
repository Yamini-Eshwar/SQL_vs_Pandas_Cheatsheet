# SQL vs Pandas Cheatsheet for Beginners 🐼🧠

This repository helps beginners quickly learn **Pandas by comparing it with familiar SQL queries**. I used **DBeaver with SQLite** and mapped the same queries in Python using Pandas.

> 📌 Dataset used: A marketing dataset with travel and coupon behavior.

---

## 🔄 SQL Queries and Equivalent Pandas Code

| SQL Query | Equivalent Pandas |
|-----------|-------------------|
| `SELECT * FROM dataset_1;` | `df` |
| `SELECT weather, temperature FROM dataset_1;` | `df[['weather', 'temperature']]` |
| `SELECT * FROM dataset_1 LIMIT 5;` | `df.head(5)` |
| `SELECT DISTINCT passanger FROM dataset_1;` | `df['passanger'].unique()` |
| `SELECT * FROM dataset_1 WHERE destination = 'Home';` | `df[df['destination'] == 'Home']` |
| `SELECT * FROM dataset_1 ORDER BY coupon;` | `df.sort_values('coupon')` |
| `SELECT destination AS Destination FROM dataset_1;` | `df.rename(columns={'destination': 'Destination'})` |
| `SELECT occupation, COUNT(*) AS count FROM dataset_1 GROUP BY occupation;` | `df.groupby('occupation').size().to_frame('count').reset_index()` |
| `SELECT weather, AVG(temperature) FROM dataset_1 GROUP BY weather;` | `df.groupby('weather')['temperature'].mean()` |
| `SELECT weather, COUNT(temperature) FROM dataset_1 GROUP BY weather;` | `df.groupby('weather')['temperature'].size()` |
| `SELECT weather, COUNT(DISTINCT temperature) FROM dataset_1 GROUP BY weather;` | `df.groupby('weather')['temperature'].nunique()` |
| `SELECT weather, SUM(temperature) FROM dataset_1 GROUP BY weather;` | `df.groupby('weather')['temperature'].sum()` |
| `SELECT weather, MIN(temperature) FROM dataset_1 GROUP BY weather;` | `df.groupby('weather')['temperature'].min()` |
| `SELECT weather, MAX(temperature) FROM dataset_1 GROUP BY weather;` | `df.groupby('weather')['temperature'].max()` |
| `SELECT occupation FROM dataset_1 WHERE occupation = 'Student' GROUP BY occupation;` | `df[df['occupation'] == 'Student'][['occupation']]` |
| `SELECT DISTINCT destination FROM (SELECT * FROM dataset_1 UNION SELECT * FROM table_to_union);` | `pd.concat([dataset_1, table_to_union]).drop_duplicates()['destination'].unique()` |
| `SELECT dataset_1.destination, dataset_1.time FROM dataset_1 INNER JOIN table_to_union ON dataset_1.time = table_to_union.time;` | `pd.merge(dataset_1, table_to_union, on='time')[['destination', 'time']]` |
| `SELECT destination, passanger FROM (SELECT * FROM dataset_1 WHERE passanger = 'Alone');` | `df[df['passanger'] == 'Alone'][['destination', 'passanger']]` |
| `SELECT * FROM dataset_1 WHERE weather LIKE 'sun%';` | `df[df['weather'].str.lower().str.startswith('sun')]` |
| `SELECT DISTINCT temperature FROM dataset_1 WHERE temperature BETWEEN 29 AND 75;` | `df[(df['temperature'] >= 29) & (df['temperature'] <= 75)]['temperature'].unique()` |
| `SELECT occupation FROM dataset_1 WHERE occupation IN ('Sales & Related', 'Managment');` | `df[df['occupation'].isin(['Sales & Related', 'Managment'])]` |

---

### 🧠 Key Takeaway

Understanding **Pandas through SQL** makes data analysis in Python much easier for beginners with a database background!

