# Load dataset
attrition_data <- read.csv("data/Attrition.csv", colClasses = c(
  Age = "numeric",
  Attrition = "factor",
  BusinessTravel = "factor",
  DailyRate = "numeric",
  Department = "factor",
  DistanceFromHome = "numeric",
  Education = "factor",
  EducationField = "factor",
  EmployeeCount = "numeric",
  EmployeeNumber = "numeric",
  EnvironmentSatisfaction = "factor",
  Gender = "factor",
  HourlyRate = "numeric",
  JobInvolvement = "factor",
  JobLevel = "factor",
  JobRole = "factor",
  JobSatisfaction = "factor",
  MaritalStatus = "factor",
  MonthlyIncome = "numeric",
  MonthlyRate = "numeric",
  NumCompaniesWorked = "numeric",
  Over18 = "factor",
  OverTime = "factor",
  PercentSalaryHike = "numeric",
  PerformanceRating = "factor",
  RelationshipSatisfaction = "factor",
  StandardHours = "numeric",
  StockOptionLevel = "factor",
  TotalWorkingYears = "numeric",
  TrainingTimesLastYear = "numeric",
  WorkLifeBalance = "factor",
  YearsAtCompany = "numeric",
  YearsInCurrentRole = "numeric",
  YearsSinceLastPromotion = "numeric",
  YearsWithCurrManager = "numeric"
))

# Display the structure of the dataset
str(attrition_data)

# View the first few rows of the dataset
head(attrition_data)

# Open the dataset in a viewer window
View(attrition_data)

# Load required package for data splitting
library(caTools)

# Set seed for reproducibility
set.seed(123)

# Split the data into training and testing sets (80% training, 20% testing)
split <- sample.split(attrition_data$Attrition, SplitRatio = 0.8)

# Create training and testing datasets
training_data <- attrition_data[split, ]
testing_data <- attrition_data[!split, ]

# Display the dimensions of the training and testing datasets
cat("Training dataset dimensions:", dim(training_data), "\n")
cat("Testing dataset dimensions:", dim(testing_data), "\n")

# Load required package for bootstrapping
library(boot)

# Function to compute the statistic of interest (e.g., mean, median) from a bootstrap sample
compute_statistic <- function(data, indices) {
  statistic <- mean(data$Age[indices])  # Example: Compute the mean of 'Age'
  return(statistic)
}

# Perform bootstrapping
boot_results <- boot(data = attrition_data, statistic = compute_statistic, R = 1000)

# Display the bootstrapped results
print(boot_results)

#Cross-Validation
# Load required package for cross-validation
library(caret)

# Set seed for reproducibility
set.seed(123)

# Specify the size of the subset (e.g., 80% of the original data)
subset_size <- 0.8 * nrow(attrition_data)

# Randomly select rows for the subset
subset_indices <- sample(1:nrow(attrition_data), subset_size, replace = FALSE)

# Create the subset
subset_data <- attrition_data[subset_indices, ]

# Display the dimensions of the subset
cat("Subset dataset dimensions:", dim(subset_data), "\n")

# Define the control parameters for cross-validation
ctrl <- trainControl(method = "cv", number = 10)  # 10-fold cross-validation

# Train the model using cross-validation on the subset dataset
model <- train(Attrition ~ ., data = subset_data, method = "rf", trControl = ctrl)

# Display the model results
print(model)

# Make predictions using the logistic regression model
logistic_predictions <- predict(logistic_model, type = "response")

# Convert predicted probabilities to binary predictions
logistic_predictions_binary <- ifelse(logistic_predictions > 0.5, "Yes", "No")

# Calculate accuracy
logistic_accuracy <- mean(logistic_predictions_binary == subset_data$Attrition)
print(paste("Logistic Regression Accuracy:", logistic_accuracy))

# Make predictions using the decision tree model
tree_predictions <- predict(tree_model, subset_data, type = "class")

# Calculate accuracy
tree_accuracy <- mean(tree_predictions == subset_data$Attrition)
print(paste("Decision Tree Accuracy:", tree_accuracy))

# Make predictions using the random forest model
rf_predictions <- predict(rf_model, subset_data)

# Calculate accuracy
rf_accuracy <- mean(rf_predictions == subset_data$Attrition)
print(paste("Random Forest Accuracy:", rf_accuracy))

# Load required packages
library(caret)

# Define control parameters for cross-validation
ctrl <- trainControl(method = "cv", number = 10)  # 10-fold cross-validation

# Train logistic regression model
logistic_model <- train(Attrition ~ ., data = subset_data, method = "glm", family = binomial, trControl = ctrl)
# Train decision tree model
tree_model <- train(Attrition ~ ., data = subset_data, method = "rpart", trControl = ctrl)
# Train random forest model
rf_model <- train(Attrition ~ ., data = subset_data, method = "rf", trControl = ctrl)

# Compare model performances using resamples
resamples_list <- resamples(list(LogisticRegression = logistic_model, DecisionTree = tree_model, RandomForest = rf_model))

# Summarize model performances
summary(resamples_list)




