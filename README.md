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

The dataset used for this project is `Homeowner.csv`. It contains information about individuals, including their demographics and service usage patterns.

## Features

The dataset includes the following features:

- `Age`: Age of the individual.
- `Annual.Income`: Annual income of the individual.
- `Gender`: Gender of the individual (converted to binary: 1 for Male, 0 for Female).
- `Marital.Status`: Marital status of the individual (converted to binary: 1 for Married, 0 for Not Married).
- `Monthly.Billed.Amount`: Monthly amount billed to the individual.
- `Uses.Voice.Service`: Whether the individual uses voice service (converted to binary: 1 for Yes, 0 for No).
- `Home.Owner`:
- **Target Variable** - Whether the individual is a home owner (converted to binary: 1 for Yes, 0 for No).

## Data Preprocessing

The following preprocessing steps were applied to the dataset:

- **Categorical to Numerical Conversion**:
    - `Gender`: "Male" -> 1, "Female" -> 0
    - `Home.Owner`: "Yes" -> 1, "No" -> 0
    - `Marital.Status`: "Married" -> 1, "Single" -> 0 (assuming "Single" for non-married)
    - `Uses.Voice.Service`: "Yes" -> 1, "No" -> 0

## Exploratory Data Analysis (EDA)

A correlation matrix was generated to visualize the relationships between the selected numerical features: `Age`, `Annual.Income`, `Gender`, `Marital.Status`, `Monthly.Billed.Amount`, and `Uses.Voice.Service`.

![Correlation Matrix](https://via.placeholder.com/600x400/FF0000/FFFFFF?text=Correlation+Matrix+Plot)
*Note: Replace the placeholder with an actual screenshot of your generated correlation matrix.*

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
| Logistic Regression   | [Accuracy LR] | [MSE LR]                 |
| Random Forest         | [Accuracy RF] | [MSE RF]                 |
| Gradient Boosting     | [Accuracy GBM]| [MSE GBM]                |
| k-Nearest Neighbors   | [Accuracy KNN]| [MSE KNN]                |

*Note: Replace `[Accuracy LR]`, `[MSE LR]`, etc., with the actual values obtained from your script.*

## Feature Selection

LASSO (Least Absolute Shrinkage and Selection Operator) regression was used to perform feature selection and shrinkage. The mean squared error path for different `alpha` values is plotted to understand the impact of regularization on model performance.

![LASSO MSE Plot](https://via.placeholder.com/600x400/0000FF/FFFFFF?text=LASSO+MSE+Plot)
*Note: Replace the placeholder with an actual screenshot of your generated LASSO MSE plot.*

## Cross-Validation

To assess the generalization ability of the models, 5-fold cross-validation was performed for Logistic Regression, Random Forest, and Gradient Boosting.

-   **Logistic Regression Cross-Validation Scores**: [LR CV Scores]
-   **Random Forest Cross-Validation Scores**: [RF CV Scores]
-   **Gradient Boosting Cross-Validation Scores**: [GBM CV Scores]

*Note: Replace `[LR CV Scores]`, `[RF CV Scores]`, etc., with the actual values obtained from your script.*

## Installation

To run this project, you'll need Python and the following libraries. You can install them using pip:

```bash
pip install pandas numpy scikit-learn matplotlib seaborn
