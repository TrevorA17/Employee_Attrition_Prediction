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

# Measures of Distribution for numeric variables

# Summary statistics for Age
summary(attrition_data$Age)

# Quartiles for Age
quantile(attrition_data$Age)

# Summary statistics for DailyRate
summary(attrition_data$DailyRate)

# Quartiles for DailyRate
quantile(attrition_data$DailyRate)

# Summary statistics for DistanceFromHome
summary(attrition_data$DistanceFromHome)

# Quartiles for DistanceFromHome
quantile(attrition_data$DistanceFromHome)

# Summary statistics for MonthlyIncome
summary(attrition_data$MonthlyIncome)

# Quartiles for MonthlyIncome
quantile(attrition_data$MonthlyIncome)

# Summary statistics for MonthlyRate
summary(attrition_data$MonthlyRate)

# Quartiles for MonthlyRate
quantile(attrition_data$MonthlyRate)

# Summary statistics for NumCompaniesWorked
summary(attrition_data$NumCompaniesWorked)

# Quartiles for NumCompaniesWorked
quantile(attrition_data$NumCompaniesWorked)

# Summary statistics for PercentSalaryHike
summary(attrition_data$PercentSalaryHike)

# Quartiles for PercentSalaryHike
quantile(attrition_data$PercentSalaryHike)

# Summary statistics for TotalWorkingYears
summary(attrition_data$TotalWorkingYears)

# Quartiles for TotalWorkingYears
quantile(attrition_data$TotalWorkingYears)

# Summary statistics for TrainingTimesLastYear
summary(attrition_data$TrainingTimesLastYear)

# Quartiles for TrainingTimesLastYear
quantile(attrition_data$TrainingTimesLastYear)

# Summary statistics for YearsAtCompany
summary(attrition_data$YearsAtCompany)

# Quartiles for YearsAtCompany
quantile(attrition_data$YearsAtCompany)

# Summary statistics for YearsInCurrentRole
summary(attrition_data$YearsInCurrentRole)

# Quartiles for YearsInCurrentRole
quantile(attrition_data$YearsInCurrentRole)

# Summary statistics for YearsSinceLastPromotion
summary(attrition_data$YearsSinceLastPromotion)

# Quartiles for YearsSinceLastPromotion
quantile(attrition_data$YearsSinceLastPromotion)

# Summary statistics for YearsWithCurrManager
summary(attrition_data$YearsWithCurrManager)

# Quartiles for YearsWithCurrManager
quantile(attrition_data$YearsWithCurrManager)

# Measures of Relationship
# Correlation matrix for numeric variables
correlation_matrix <- cor(attrition_data[c("Age", "DailyRate", "DistanceFromHome", "MonthlyIncome", "MonthlyRate", "NumCompaniesWorked", "PercentSalaryHike", "TotalWorkingYears", "TrainingTimesLastYear", "YearsAtCompany", "YearsInCurrentRole", "YearsSinceLastPromotion", "YearsWithCurrManager")])
print(correlation_matrix)

# Contingency table for Attrition and BusinessTravel
table(attrition_data$Attrition, attrition_data$BusinessTravel)

# Contingency table for Attrition and Department
table(attrition_data$Attrition, attrition_data$Department)

# Contingency table for Attrition and EducationField
table(attrition_data$Attrition, attrition_data$EducationField)

# Contingency table for Attrition and Gender
table(attrition_data$Attrition, attrition_data$Gender)

# Contingency table for Attrition and JobRole
table(attrition_data$Attrition, attrition_data$JobRole)

# Contingency table for Attrition and MaritalStatus
table(attrition_data$Attrition, attrition_data$MaritalStatus)

# Contingency table for Attrition and Over18
table(attrition_data$Attrition, attrition_data$Over18)

# Contingency table for Attrition and OverTime
table(attrition_data$Attrition, attrition_data$OverTime)

# Contingency table for Attrition and PerformanceRating
table(attrition_data$Attrition, attrition_data$PerformanceRating)

# Contingency table for Attrition and RelationshipSatisfaction
table(attrition_data$Attrition, attrition_data$RelationshipSatisfaction)

# Contingency table for Attrition and StockOptionLevel
table(attrition_data$Attrition, attrition_data$StockOptionLevel)

# Contingency table for Attrition and WorkLifeBalance
table(attrition_data$Attrition, attrition_data$WorkLifeBalance)

# ANOVA
# Load required package for ANOVA
library(stats)

# Perform ANOVA tests

# ANOVA for Age and Attrition
age_anova <- aov(Age ~ Attrition, data = attrition_data)
summary(age_anova)

# ANOVA for MonthlyIncome and Attrition
income_anova <- aov(MonthlyIncome ~ Attrition, data = attrition_data)
summary(income_anova)

# ANOVA for TotalWorkingYears and Attrition
working_years_anova <- aov(TotalWorkingYears ~ Attrition, data = attrition_data)
summary(working_years_anova)

# ANOVA for YearsAtCompany and Attrition
years_at_company_anova <- aov(YearsAtCompany ~ Attrition, data = attrition_data)
summary(years_at_company_anova)

# ANOVA for YearsSinceLastPromotion and Attrition
promotion_anova <- aov(YearsSinceLastPromotion ~ Attrition, data = attrition_data)
summary(promotion_anova)

# ANOVA for YearsWithCurrManager and Attrition
years_with_manager_anova <- aov(YearsWithCurrManager ~ Attrition, data = attrition_data)
summary(years_with_manager_anova)

# Basic Visualization
#Uni variate Plots
# Load required package for plotting
library(ggplot2)

# Histogram for Age
ggplot(attrition_data, aes(x = Age)) +
  geom_histogram(binwidth = 5, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Age", x = "Age", y = "Frequency")

# Histogram for MonthlyIncome
ggplot(attrition_data, aes(x = MonthlyIncome)) +
  geom_histogram(binwidth = 500, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Monthly Income", x = "Monthly Income", y = "Frequency")

# Histogram for TotalWorkingYears
ggplot(attrition_data, aes(x = TotalWorkingYears)) +
  geom_histogram(binwidth = 1, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Total Working Years", x = "Total Working Years", y = "Frequency")

# Histogram for YearsAtCompany
ggplot(attrition_data, aes(x = YearsAtCompany)) +
  geom_histogram(binwidth = 1, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Years at Company", x = "Years at Company", y = "Frequency")

# Boxplot for Age
ggplot(attrition_data, aes(x = "", y = Age)) +
  geom_boxplot(fill = "skyblue", color = "black") +
  labs(title = "Boxplot of Age", x = NULL, y = "Age")

# Boxplot for MonthlyIncome
ggplot(attrition_data, aes(x = "", y = MonthlyIncome)) +
  geom_boxplot(fill = "skyblue", color = "black") +
  labs(title = "Boxplot of Monthly Income", x = NULL, y = "Monthly Income")

# Boxplot for TotalWorkingYears
ggplot(attrition_data, aes(x = "", y = TotalWorkingYears)) +
  geom_boxplot(fill = "skyblue", color = "black") +
  labs(title = "Boxplot of Total Working Years", x = NULL, y = "Total Working Years")

# Boxplot for YearsAtCompany
ggplot(attrition_data, aes(x = "", y = YearsAtCompany)) +
  geom_boxplot(fill = "skyblue", color = "black") +
  labs(title = "Boxplot of Years at Company", x = NULL, y = "Years at Company")


