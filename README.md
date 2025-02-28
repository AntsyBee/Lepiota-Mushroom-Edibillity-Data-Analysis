Based on the contents of the `Lepiota_Mushroom_Data_Analysis.ipynb` file, here is a generated README file:

---

# Lepiota Mushroom Data Analysis

This repository contains an analysis of the Mushrooms belonging to the Lepiota genus via a dataset obtained from the [UCI Machine Learning Repository](https://archive.ics.uci.edu/dataset/73/mushroom). The analysis focuses on understanding the characteristics of edible and poisonous Lepiota mushrooms. Various machine learning models and statistical analysis techniques are utilised to understand and evaluate edibility depends and varies with Lepiota mushroom characteristics. 

## Table of Contents

- [Data Importing](#data-importing)
- [Data Cleansing](#data-cleansing)
- [Exploratory Data Analysis](#exploratory-data-analysis)
- [Model Evaluation](#model-evaluation)
- [Contributing](#contributing)
- [License](#license)

## Data Importing

The dataset is imported using the following steps:
1. Import necessary packages for data manipulation and visualization.
2. Load the data from the `data/agaricus-lepiota.data` file.
3. Assign column names as specified in the `agaricus-lepiota.names` file.
4. Display the first few rows of the dataset to understand its structure.

## Data Cleansing

Data cleansing involves:
1. Identifying and handling missing values.
2. Checking for and handling instances of trailing or leading whitespace.
3. Dropping columns with constant values (e.g., `veil-type`).
4. Renaming columns for clarity (e.g., renaming the `class` column to `poisonous`).

## Exploratory Data Analysis

Exploratory Data Analysis (EDA) includes:
1. Univariate and multivariate analysis to understand the distribution of variables.
2. Visualizing the distribution of the target variable (`poisonous`).
3. Converting categorical data into numerical data for further analysis.
4. Fitting various models including random forrest regressor, knn, linear-regression, logistic-regression, lasso and ridge 
5. Evaluating models using statistical measures including rmse, mse, mae and r-squared. The analysis includes evaluating models using custom evaluation functions. The `evaluate_model` function from `evaluate_model.py` is utilized to assess the performance of different models. 

## Contributing

Contributions are welcome! Please follow these steps:
1. Fork the repository.
2. Create a new branch for your feature or bugfix.
3. Commit your changes.
4. Push to your branch.
5. Create a pull request.

## License

This project is licensed under the MIT License.