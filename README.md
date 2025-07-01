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
    - [cite_start]`Gender`: "Male" -> 1, "Female" -> 0 [cite: 249]
    - [cite_start]`Home.Owner`: "Yes" -> 1, "No" -> 0 [cite: 249, 250]
    - [cite_start]`Marital.Status`: "Married" -> 1, "Single" -> 0 (assuming "Single" for non-married) [cite: 250]
    - [cite_start]`Uses.Voice.Service`: "Yes" -> 1, "No" -> 0 [cite: 250]

## Exploratory Data Analysis (EDA)

[cite_start]A correlation matrix was generated to visualize the relationships between the selected numerical features: `Age`, `Annual.Income`, `Gender`, `Marital.Status`, `Monthly.Billed.Amount`, and `Uses.Voice.Service`. [cite: 250]

![Correlation Matrix](https://via.placeholder.com/600x400/FF0000/FFFFFF?text=Correlation+Matrix+Plot)
*Note: Replace the placeholder with an actual screenshot of your generated correlation matrix.*

## Models Used

The following classification models were trained and evaluated:

1.  [cite_start]**Logistic Regression (LR)** [cite: 251]
2.  [cite_start]**Random Forest Classifier (RF)** [cite: 251]
3.  [cite_start]**Gradient Boosting Machine (GBM)** [cite: 252]
4.  [cite_start]**k-Nearest Neighbors (KNN)** [cite: 252]

## Results

The models were evaluated based on their accuracy and Mean Squared Error (MSE) on the test set.

| Model                 | Accuracy | Mean Squared Error (MSE) |
| :-------------------- | :------- | :----------------------- |
| Logistic Regression   | [cite_start]0.802963686695978 [cite: 258] | [cite_start]0.49897300904818 [cite: 259]                 |
| Random Forest         | [cite_start]0.812408402540303 [cite: 258] | [cite_start]0.115158222217537 [cite: 259]                 |
| Gradient Boosting     | [cite_start]0.802963686695978 [cite: 258]| [cite_start]0.531518529424131 [cite: 259]                |
| k-Nearest Neighbors   | [cite_start]0.766813222602182 [cite: 258]| N/A                 |

## Feature Selection

LASSO (Least Absolute Shrinkage and Selection Operator) regression was used to perform feature selection and shrinkage. [cite_start]The mean squared error path for different `alpha` values is plotted to understand the impact of regularization on model performance. [cite: 259]

![LASSO MSE Plot](https://via.placeholder.com/600x400/0000FF/FFFFFF?text=LASSO+MSE+Plot)
*Note: Replace the placeholder with an actual screenshot of your generated LASSO MSE plot.*

## Cross-Validation

[cite_start]To assess the generalization ability of the models, 5-fold cross-validation was performed for Logistic Regression, Random Forest, and Gradient Boosting. [cite: 259, 260]

-   [cite_start]**Logistic Regression Cross-Validation Scores**: RMSE: 0.4006791, Rsquared: 0.0003025087, MAE: 0.3209426 [cite: 262]
-   **Random Forest Cross-Validation Scores**:
    * [cite_start]mtry = 2: RMSE = 0.3538159, Rsquared = 0.3576365, MAE = 0.2788545 [cite: 282]
    * [cite_start]mtry = 4: RMSE = 0.3049234, Rsquared = 0.4615505, MAE = 0.2233804 [cite: 282]
    * [cite_start]mtry = 6: RMSE = 0.3030302, Rsquared = 0.4654046, MAE = 0.2216446 [cite: 282]
-   [cite_start]**Gradient Boosting Cross-Validation Scores**: [Detailed iteration results are provided in the source file, but a summarized performance is not explicitly printed in the provided R output.] [cite: 285, 286, 287, 288, 289, 290, 291, 292, 293, 294]

## Installation

To run this project, you'll need Python and the following libraries. You can install them using pip:

```bash
pip install pandas numpy scikit-learn matplotlib seaborn
