# Home Owner Prediction Models

This project explores various machine learning models to predict home ownership based on demographic and service usage data.

## Table of Contents

- [Project Overview](#project-overview)
- [Dataset](#dataset)
- [Features](#features)
- [Data Preprocessing](#data-preprocessing)
- [Exploratory Data Analysis (EDA)](#exploratory-data-analysis-eda)
- [Models Used](#models-used)
- [Results](#results)
- [Feature Selection](#feature-selection)
- [Cross-Validation](#cross-validation)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Project Overview

The goal of this project is to build and evaluate different classification models to accurately predict whether an individual is a home owner (`Home.Owner`). The project utilizes several popular machine learning algorithms, including Logistic Regression, Random Forest, Gradient Boosting Machines, and k-Nearest Neighbors. We also perform feature selection using LASSO regression and evaluate model robustness using cross-validation.

## Dataset

The dataset used for this project is `draft.csv`. It contains information about individuals, including their demographics and service usage patterns.

## Features

The dataset includes the following features:

- `Age`: Age of the individual.
- `Annual.Income`: Annual income of the individual.
- `Gender`: Gender of the individual (converted to binary: 1 for Male, 0 for Female).
- `Marital.Status`: Marital status of the individual (converted to binary: 1 for Married, 0 for Not Married).
- `Monthly.Billed.Amount`: Monthly amount billed to the individual.
- `Uses.Voice.Service`: Whether the individual uses voice service (converted to binary: 1 for Yes, 0 for No).
- `Home.Owner`: **Target Variable** - Whether the individual is a home owner (converted to binary: 1 for Yes, 0 for No).

## Data Preprocessing

The following preprocessing steps were applied to the dataset:

- **Categorical to Numerical Conversion**:
    - `Gender`: "Male" -> 1, "Female" -> 0 
    - `Home.Owner`: "Yes" -> 1, "No" -> 0 
    - `Marital.Status`: "Married" -> 1, "Single" -> 0 (assuming "Single" for non-married) 
    - `Uses.Voice.Service`: "Yes" -> 1, "No" -> 0 

## Exploratory Data Analysis (EDA)

A correlation matrix was generated to visualize the relationships between the selected numerical features: `Age`, `Annual.Income`, `Gender`, `Marital.Status`, `Monthly.Billed.Amount`, and `Uses.Voice.Service`.

![image](https://github.com/user-attachments/assets/785d1fd1-fdf4-4fe6-b432-4c4f7c28eab9)


## Models Used

The following classification models were trained and evaluated:

1.  **Logistic Regression (LR)**
2.  **Random Forest Classifier (RF)** 
3.  **Gradient Boosting Machine (GBM)** 
4.  **k-Nearest Neighbors (KNN)** 

## Results

The models were evaluated based on their accuracy and Mean Squared Error (MSE) on the test set.

| Model                 | Accuracy | Mean Squared Error (MSE) |
| :-------------------- | :------- | :----------------------- |
| Logistic Regression   | 0.802963686695978 | ]0.49897300904818                 |
| Random Forest         | 0.812408402540303  | 0.115158222217537                  |
| Gradient Boosting     | 0.802963686695978 | n/a                |

## Feature Selection

![image](https://github.com/user-attachments/assets/2e980498-a730-43f0-bb0f-7bcd37700a62)


## Cross-Validation

To assess the generalization ability of the models, 5-fold cross-validation was performed for Logistic Regression, Random Forest, and Gradient Boosting. 

-   [cite_start]**Logistic Regression Cross-Validation Scores**: RMSE: 0.4006791, Rsquared: 0.0003025087, MAE: 0.3209426 [cite: 262]
-   **Random Forest Cross-Validation Scores**:
    * mtry = 2: RMSE = 0.3538159, Rsquared = 0.3576365, MAE = 0.2788545 
    * mtry = 4: RMSE = 0.3049234, Rsquared = 0.4615505, MAE = 0.2233804 
    * mtry = 6: RMSE = 0.3030302, Rsquared = 0.4654046, MAE = 0.2216446 
- **Gradient Boosting Cross-Validation Scores**: [Detailed iteration results are provided in the source file, but a summarized performance is not explicitly printed in the provided R output.] [cite: 285, 286, 287, 288, 289, 290, 291, 292, 293, 294]


