import pandas as pd
import matplotlib.pyplot as plt
from sqlalchemy import create_engine

try:
    engine = create_engine("mysql+mysqlconnector://root:manoj123@localhost/FoodOrderingSystem")
    print("Successfully connected to FoodOrderingSystem!")

    query = "SELECT * FROM vw_TopSellingItems;"
    df = pd.read_sql(query, engine)

    print("\n--- Top Selling Items Dataframe ---")
    print(df)

    plt.figure(figsize=(9, 5))
    plt.bar(df['item_name'], df['total_revenue'], color='orange', edgecolor='black', width=0.6)
    
    plt.title('Top Selling Food Items by Revenue (HyperQ-Commerce)', fontsize=14, fontweight='bold', pad=15)
    plt.xlabel('Food Item Name', fontsize=12, labelpad=10)
    plt.ylabel('Total Revenue (₹)', fontsize=12, labelpad=10)
    plt.grid(axis='y', linestyle='--', alpha=0.5)

    plt.tight_layout()
    plt.show()

except Exception as err:
    print(f"Error: {err}")