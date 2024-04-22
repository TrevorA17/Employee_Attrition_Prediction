# Saving the logistic regression model
saveRDS(logistic_model, "./models/saved_logistic_model.rds")

# Prepare new data for prediction using subset variables
new_data <- data.frame(
  Age = 30,  # Example value for Age
  BusinessTravel = "Travel_Rarely",  # Example value for BusinessTravel
  DailyRate = 500,  # Example value for DailyRate
  Department = "Research & Development",  # Example value for Department
  DistanceFromHome = 5,  # Example value for DistanceFromHome
  Education = 3,  # Example value for Education
  EducationField = "Life Sciences",  # Example value for EducationField
  EnvironmentSatisfaction = 4,  # Example value for EnvironmentSatisfaction
  Gender = "Female",  # Example value for Gender
  HourlyRate = 60,  # Example value for HourlyRate
  JobInvolvement = 3,  # Example value for JobInvolvement
  JobLevel = 2,  # Example value for JobLevel
  JobRole = "Research Scientist",  # Example value for JobRole
  JobSatisfaction = 4,  # Example value for JobSatisfaction
  MaritalStatus = "Married",  # Example value for MaritalStatus
  MonthlyIncome = 6000,  # Example value for MonthlyIncome
  MonthlyRate = 25000,  # Example value for MonthlyRate
  NumCompaniesWorked = 1,  # Example value for NumCompaniesWorked
  Over18 = "Y",  # Example value for Over18
  OverTime = "No",  # Example value for OverTime
  PercentSalaryHike = 15,  # Example value for PercentSalaryHike
  PerformanceRating = 3,  # Example value for PerformanceRating
  RelationshipSatisfaction = 3,  # Example value for RelationshipSatisfaction
  StandardHours = 80,  # Example value for StandardHours
  StockOptionLevel = 1,  # Example value for StockOptionLevel
  TotalWorkingYears = 10,  # Example value for TotalWorkingYears
  TrainingTimesLastYear = 3,  # Example value for TrainingTimesLastYear
  WorkLifeBalance = 3,  # Example value for WorkLifeBalance
  YearsAtCompany = 5,  # Example value for YearsAtCompany
  YearsInCurrentRole = 3,  # Example value for YearsInCurrentRole
  YearsSinceLastPromotion = 2,  # Example value for YearsSinceLastPromotion
  YearsWithCurrManager = 3,  # Example value for YearsWithCurrManager
  EmployeeCount = 1,  # Example value for EmployeeCount
  EmployeeNumber = 1,
  Attrition = "No"  # Example value for Attrition
)

# Convert relevant variables to factors in new_data
factor_vars <- c("Education", "EnvironmentSatisfaction", "JobInvolvement", 
                 "JobLevel", "JobSatisfaction", "PerformanceRating", 
                 "RelationshipSatisfaction", "StockOptionLevel", 
                 "WorkLifeBalance")

new_data[factor_vars] <- lapply(new_data[factor_vars], as.factor)

# Use the loaded model to make predictions
predictions_loaded_model <- predict(logistic_model, newdata = new_data)

# Print predictions
print(predictions_loaded_model)
