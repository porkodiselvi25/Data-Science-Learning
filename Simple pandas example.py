# Simple pandas example

import pandas as pd

# Create a DataFrame (table)
data = {
    "Name": ["Porkodi", "Laksh"],
    "Age": [22, 21],
    "City": ["Chennai", "Vellore"]
}

df = pd.DataFrame(data)

# Display the DataFrame
print(df)