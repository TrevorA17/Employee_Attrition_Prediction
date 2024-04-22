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

#Measures of Frequency
# Measures of frequency for Attrition variable
table(attrition_data$Attrition)

# Measures of frequency for BusinessTravel variable
table(attrition_data$BusinessTravel)

# Measures of frequency for Department variable
table(attrition_data$Department)

# Measures of frequency for Education variable
table(attrition_data$Education)

# Measures of frequency for EducationField variable
table(attrition_data$EducationField)

# Measures of frequency for EnvironmentSatisfaction variable
table(attrition_data$EnvironmentSatisfaction)

# Measures of frequency for Gender variable
table(attrition_data$Gender)

# Measures of frequency for JobRole variable
table(attrition_data$JobRole)

# Measures of frequency for MaritalStatus variable
table(attrition_data$MaritalStatus)

# Measures of frequency for Over18 variable
table(attrition_data$Over18)

# Measures of frequency for OverTime variable
table(attrition_data$OverTime)

# Measures of frequency for PerformanceRating variable
table(attrition_data$PerformanceRating)

# Measures of frequency for RelationshipSatisfaction variable
table(attrition_data$RelationshipSatisfaction)

# Measures of frequency for StockOptionLevel variable
table(attrition_data$StockOptionLevel)

# Measures of frequency for WorkLifeBalance variable
table(attrition_data$WorkLifeBalance)
