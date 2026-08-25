import pandas as pd

def load_data(file_path):
    """
    Load a CSV file and return a pandas DataFrame.
    """
    data = pd.read_csv(file_path)
    return data

file_path = r"C:\Users\admin\PORKODI CLG\Data-Science-Learning\Task-32\sales_project\data\sales_data.csv"

df = load_data(file_path)
print(df.head())

def get_summary(data):
    """
    Return statistical summary of the dataset.
    """
    return data.describe()

def get_shape(data):
    """
    Return number of rows and columns.
    """
    return data.shape

    def get_columns(data):
    """
    Return column names.
    """
    return list(data.columns)

def check_missing_values(data):
    """
    Return missing values in each column.
    """
    return data.isnull().sum()

import logging


def setup_logger():
    """
    Configure and return a logger.
    """
    logging.basicConfig(
        filename="logs/app.log",
        level=logging.INFO,
        format="%(asctime)s - %(levelname)s - %(message)s"
    )

    return logging.getLogger()




