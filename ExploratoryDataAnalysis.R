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

# Measures of Central Tendency
# Measures of Central Tendency for numeric variables

# Mean, Median, and Mode for Age
mean_age <- mean(attrition_data$Age)
median_age <- median(attrition_data$Age)
mode_age <- as.numeric(names(sort(-table(attrition_data$Age)))[1])

# Mean, Median, and Mode for DailyRate
mean_daily_rate <- mean(attrition_data$DailyRate)
median_daily_rate <- median(attrition_data$DailyRate)
mode_daily_rate <- as.numeric(names(sort(-table(attrition_data$DailyRate)))[1])

# Mean, Median, and Mode for DistanceFromHome
mean_distance_from_home <- mean(attrition_data$DistanceFromHome)
median_distance_from_home <- median(attrition_data$DistanceFromHome)
mode_distance_from_home <- as.numeric(names(sort(-table(attrition_data$DistanceFromHome)))[1])

# Mean, Median, and Mode for MonthlyIncome
mean_monthly_income <- mean(attrition_data$MonthlyIncome)
median_monthly_income <- median(attrition_data$MonthlyIncome)
mode_monthly_income <- as.numeric(names(sort(-table(attrition_data$MonthlyIncome)))[1])

# Mean, Median, and Mode for MonthlyRate
mean_monthly_rate <- mean(attrition_data$MonthlyRate)
median_monthly_rate <- median(attrition_data$MonthlyRate)
mode_monthly_rate <- as.numeric(names(sort(-table(attrition_data$MonthlyRate)))[1])

# Mean, Median, and Mode for NumCompaniesWorked
mean_num_companies_worked <- mean(attrition_data$NumCompaniesWorked)
median_num_companies_worked <- median(attrition_data$NumCompaniesWorked)
mode_num_companies_worked <- as.numeric(names(sort(-table(attrition_data$NumCompaniesWorked)))[1])

# Mean, Median, and Mode for PercentSalaryHike
mean_percent_salary_hike <- mean(attrition_data$PercentSalaryHike)
median_percent_salary_hike <- median(attrition_data$PercentSalaryHike)
mode_percent_salary_hike <- as.numeric(names(sort(-table(attrition_data$PercentSalaryHike)))[1])

# Mean, Median, and Mode for TotalWorkingYears
mean_total_working_years <- mean(attrition_data$TotalWorkingYears)
median_total_working_years <- median(attrition_data$TotalWorkingYears)
mode_total_working_years <- as.numeric(names(sort(-table(attrition_data$TotalWorkingYears)))[1])

# Mean, Median, and Mode for TrainingTimesLastYear
mean_training_times_last_year <- mean(attrition_data$TrainingTimesLastYear)
median_training_times_last_year <- median(attrition_data$TrainingTimesLastYear)
mode_training_times_last_year <- as.numeric(names(sort(-table(attrition_data$TrainingTimesLastYear)))[1])

# Mean, Median, and Mode for YearsAtCompany
mean_years_at_company <- mean(attrition_data$YearsAtCompany)
median_years_at_company <- median(attrition_data$YearsAtCompany)
mode_years_at_company <- as.numeric(names(sort(-table(attrition_data$YearsAtCompany)))[1])

# Mean, Median, and Mode for YearsInCurrentRole
mean_years_in_current_role <- mean(attrition_data$YearsInCurrentRole)
median_years_in_current_role <- median(attrition_data$YearsInCurrentRole)
mode_years_in_current_role <- as.numeric(names(sort(-table(attrition_data$YearsInCurrentRole)))[1])

# Mean, Median, and Mode for YearsSinceLastPromotion
mean_years_since_last_promotion <- mean(attrition_data$YearsSinceLastPromotion)
median_years_since_last_promotion <- median(attrition_data$YearsSinceLastPromotion)
mode_years_since_last_promotion <- as.numeric(names(sort(-table(attrition_data$YearsSinceLastPromotion)))[1])

# Mean, Median, and Mode for YearsWithCurrManager
mean_years_with_curr_manager <- mean(attrition_data$YearsWithCurrManager)
median_years_with_curr_manager <- median(attrition_data$YearsWithCurrManager)
mode_years_with_curr_manager <- as.numeric(names(sort(-table(attrition_data$YearsWithCurrManager)))[1])

# Displaying the results
cat("Measures of Central Tendency for Numeric Variables:\n")
cat("\n")
cat("Variable: Age\n")
cat("Mean:", mean_age, "\n")
cat("Median:", median_age, "\n")
cat("Mode:", mode_age, "\n")
cat("\n")
cat("Variable: DailyRate\n")
cat("Mean:", mean_daily_rate, "\n")
cat("Median:", median_daily_rate, "\n")
cat("Mode:", mode_daily_rate, "\n")
cat("\n")
cat("Variable: DistanceFromHome\n")
cat("Mean:", mean_distance_from_home, "\n")
cat("Median:", median_distance_from_home, "\n")
cat("Mode:", mode_distance_from_home, "\n")
cat("\n")
cat("Variable: MonthlyIncome\n")
cat("Mean:", mean_monthly_income, "\n")
cat("Median:", median_monthly_income, "\n")
cat("Mode:", mode_monthly_income, "\n")
cat("\n")
cat("Variable: MonthlyRate\n")
cat("Mean:", mean_monthly_rate, "\n")
cat("Median:", median_monthly_rate, "\n")
cat("Mode:", mode_monthly_rate, "\n")
cat("\n")
cat("Variable: NumCompaniesWorked\n")
cat("Mean:", mean_num_companies_worked, "\n")
cat("Median:", median_num_companies_worked, "\n")
cat("Mode:", mode_num_companies_worked, "\n")
cat("\n")
cat("Variable: PercentSalaryHike\n")
cat("Mean:", mean_percent_salary_hike, "\n")
cat("Median:", median_percent_salary_hike, "\n")
cat("Mode:", mode_percent_salary_hike, "\n")
cat("\n")
cat("Variable: TotalWorkingYears\n")
cat("Mean:", mean_total_working_years, "\n")
cat("Median:", median_total_working_years, "\n")
cat("Mode:", mode_total_working_years, "\n")
cat("\n")
cat("Variable: TrainingTimesLastYear\n")
cat("Mean:", mean_training_times_last_year, "\n")
cat("Median:", median_training_times_last_year, "\n")
cat("Mode:", mode_training_times_last_year, "\n")
cat("\n")
cat("Variable: YearsAtCompany\n")
cat("Mean:", mean_years_at_company, "\n")
cat("Median:", median_years_at_company, "\n")
cat("Mode:", mode_years_at_company, "\n")
cat("\n")
cat("Variable: YearsInCurrentRole\n")
cat("Mean:", mean_years_in_current_role, "\n")
cat("Median:", median_years_in_current_role, "\n")
cat("Mode:", mode_years_in_current_role, "\n")
cat("\n")
cat("Variable: YearsSinceLastPromotion\n")
cat("Mean:", mean_years_since_last_promotion, "\n")
cat("Median:", median_years_since_last_promotion, "\n")
cat("Mode:", mode_years_since_last_promotion, "\n")
cat("\n")
cat("Variable: YearsWithCurrManager\n")
cat("Mean:", mean_years_with_curr_manager, "\n")
cat("Median:", median_years_with_curr_manager, "\n")
cat("Mode:", mode_years_with_curr_manager, "\n")
