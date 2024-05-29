# Load the dataset
house <- read.csv("D:/multi project/draft.csv")
library(glm2)
library(caret)
library(randomForest)
library(gbm)
library(class) # Added for knn function
library(leaps)
library(ggplot2)



# View the structure of the dataset
str(house)


# Convert the outcome variable to binary
house$Gender <- ifelse(house$Gender == "Male", 1, 0)
house$Home.Owner <- ifelse(house$Home.Owner == "Yes", 1, 0)
house$Marital.Status<-ifelse(house$Marital.Status == "Married", 1, 0)
house$Uses.Voice.Service<- ifelse(house$Uses.Voice.Service == "Yes", 1, 0)



#coreelation Matrix

features <- c("Age", "Annual.Income", "Gender", "Marital.Status", "Monthly.Billed.Amount", "Uses.Voice.Service")
selected_features <- house[, features]
cor_matrix <- cor(selected_features)
print(cor_matrix)
ggplot(data = reshape2::melt(cor_matrix), aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient2(low = "orange", mid = "pink", high = "green", midpoint = 0, 
                       limits = c(-1,1), name = "Correlation") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  
  
  
  
  
# Split the data into training and testing sets
set.seed(123)
train_index <- sample(1:nrow(house), 0.7 * nrow(house))
train_data <- house[train_index, ]
test_data <- house[-train_index, ]
# Fit logistic regression model
LR_model <- glm(Home.Owner ~., 
             data = train_data, family = binomial)


# Random Forest
rf_model <- randomForest(`Home.Owner` ~ ., data = train_data)

# Gradient Boosting Machine #Boosted Trees
gbm_model <- gbm(Home.Owner ~ ., data = train_data, distribution = "bernoulli", n.trees = 100, interaction.depth = 3)


#knn_Prediction 
knn_model <- knn(train = train_data[, -which(names(train_data) == "Home.Owner")],  # Predictors
                       test = test_data[, -which(names(test_data) == "Home.Owner")],  # Test data
                       cl = train_data$Home.Owner,  # Target variable
                       k = 5)



rf_model
varImp(rf_model)
# Summarize the model
summary(LR_model)

summary(gbm_model)




# Predict on test data
predictionslr <- predict(LR_model, newdata = test_data, type = "response")
predictionsrf <- predict(rf_model, newdata = test_data, type = "response")
predictionsgbm <- predict(gbm_model, newdata = test_data, type = "response")
predictionsknn <- predict(gbm_model, newdata = test_data, type = "response")



# Convert probabilities to binary predictions
binary_predictionslr <- ifelse(predictionslr > 0.5, 1, 0)
binary_predictionsrf <- ifelse(predictionsrf > 0.5, 1, 0)
binary_predictionsgbm <- ifelse(predictionsgbm > 0.5, 1, 0)





# Calculate accuracy logitical Regression
accuracyLR <- mean(binary_predictionslr == test_data$Home.Owner)
print(paste("Accuracy:", accuracyLR))


#sccuracy for random forest
accuracyRF <- mean(binary_predictionsrf == test_data$Home.Owner)
print(paste("Accuracy:", accuracyRF))


#accuracy for Gbm
accuracyGBM <- mean(binary_predictionsgbm == test_data$Home.Owner)
print(paste("Accuracy:", accuracyGBM))


accuracyknn <- mean(knn_model == test_data$Home.Owner)
confusion_matrix <- table(Predicted = predictionsknn, Actual = test_data$Home.Owner)
print(paste("Accuracy: ", accuracyknn))
print(confusion_matrix)





library(caret) # For data splitting


# Make predictions on the testing set
predictions01 <- predict(LR_model, test_data)
predictions02 <- predict(rf_model, test_data)
predictions03 <- predict(gbm_model, test_data)


# Evaluate model performance
mselr <- mean((predictions01 - test_data$Home.Owner)^2)
print(paste("Mean Squared Error:", mselr))
mserf <- mean((predictions02 - test_data$Home.Owner)^2)
print(paste("Mean Squared Error:", mserf))
msegbm <- mean((predictions03 - test_data$Home.Owner)^2)
print(paste("Mean Squared Error:", msegbm))

subsetmodel <- regsubsets(Home.Owner~ ., data = house)
plot(subsetmodel, scale = "adjr2")









library(caret)

  # Gradient boosting: Shrinkage or learning rate

# Define the control parameters for cross-validation
ctrl <- trainControl(method = "cv",   # Method: "cv" for k-fold cross-validation
                     number = 5,       # Number of folds
                     verboseIter = TRUE)  # Print progress

# Specify the model you want to train
model_train_Lr <- train(Home.Owner ~ .,           # Formula for the model
               data = train_data,       # Training dataset
               method = "glm",          # Method: "glm" for logistic regression (change as needed)
               trControl = ctrl)        # Cross-validation control parameters

# Print the results
print(model_train_Lr)

# Extract performance metrics
performance <- model_train_Lr$results
print(performance)


# Specify the model you want to train
model_train_rf <- train(Home.Owner ~ .,           # Formula for the model
                        data = train_data,       # Training dataset
                        method = "rf",          # Method: "glm" for logistic regression (change as needed)
                        trControl = ctrl)        # Cross-validation control parameters

# Print the results
print(model_train_rf)

# Extract performance metrics
performancerf <- model_train_rf$results
print(performancerf)



# Specify the model you want to train
model_train_gbm <- train(Home.Owner ~ .,           # Formula for the model
                        data = train_data,       # Training dataset
                        method = "gbm",          # Method: "glm" for logistic regression (change as needed)
                        trControl = ctrl)        # Cross-validation control parameters

# Print the results
print(model_train_gbm)

# Extract performance metrics
performancegbm <- model_train_rf$results
print(performancegbm)




