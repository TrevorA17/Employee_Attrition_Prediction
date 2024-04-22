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
