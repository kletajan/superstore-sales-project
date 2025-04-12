import pandas as pd

df = pd.read_csv('../data/Superstore.csv', encoding='utf-8')

# Convert to ISO format
df['order_date'] = pd.to_datetime(df['order_date'], dayfirst=True).dt.strftime('%Y-%m-%d')
df['ship_date'] = pd.to_datetime(df['ship_date'], dayfirst=True).dt.strftime('%Y-%m-%d')

# Save cleaned version
df.to_csv('../data/superstore_clean.csv', index=False)