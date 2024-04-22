Employee Attrition Prediction
================
134780 Trevor Okinda
April 2024

- [Student Details](#student-details)
- [Setup Chunk](#setup-chunk)

# Student Details

|                       |                                     |
|-----------------------|-------------------------------------|
| **Student ID Number** | 134780                              |
| **Student Name**      | Trevor Okinda                       |
| **BBIT 4.2 Group**    | C                                   |
| **Project Name**      | Employee Attrition Prediction Model |

# Setup Chunk

**Note:** the following KnitR options have been set as the global
defaults: <BR>
`knitr::opts_chunk$set(echo = TRUE, warning = FALSE, eval = TRUE, collapse = FALSE, tidy = TRUE)`.

More KnitR options are documented here
<https://bookdown.org/yihui/rmarkdown-cookbook/chunk-options.html> and
here <https://yihui.org/knitr/options/>.

``` r
# Load dataset
attrition_data <- read.csv("Attrition.csv", colClasses = c(
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
```

    ## 'data.frame':    1470 obs. of  35 variables:
    ##  $ Age                     : num  41 49 37 33 27 32 59 30 38 36 ...
    ##  $ Attrition               : Factor w/ 2 levels "No","Yes": 2 1 2 1 1 1 1 1 1 1 ...
    ##  $ BusinessTravel          : Factor w/ 3 levels "Non-Travel","Travel_Frequently",..: 3 2 3 2 3 2 3 3 2 3 ...
    ##  $ DailyRate               : num  1102 279 1373 1392 591 ...
    ##  $ Department              : Factor w/ 3 levels "Human Resources",..: 3 2 2 2 2 2 2 2 2 2 ...
    ##  $ DistanceFromHome        : num  1 8 2 3 2 2 3 24 23 27 ...
    ##  $ Education               : Factor w/ 5 levels "1","2","3","4",..: 2 1 2 4 1 2 3 1 3 3 ...
    ##  $ EducationField          : Factor w/ 6 levels "Human Resources",..: 2 2 5 2 4 2 4 2 2 4 ...
    ##  $ EmployeeCount           : num  1 1 1 1 1 1 1 1 1 1 ...
    ##  $ EmployeeNumber          : num  1 2 4 5 7 8 10 11 12 13 ...
    ##  $ EnvironmentSatisfaction : Factor w/ 4 levels "1","2","3","4": 2 3 4 4 1 4 3 4 4 3 ...
    ##  $ Gender                  : Factor w/ 2 levels "Female","Male": 1 2 2 1 2 2 1 2 2 2 ...
    ##  $ HourlyRate              : num  94 61 92 56 40 79 81 67 44 94 ...
    ##  $ JobInvolvement          : Factor w/ 4 levels "1","2","3","4": 3 2 2 3 3 3 4 3 2 3 ...
    ##  $ JobLevel                : Factor w/ 5 levels "1","2","3","4",..: 2 2 1 1 1 1 1 1 3 2 ...
    ##  $ JobRole                 : Factor w/ 9 levels "Healthcare Representative",..: 8 7 3 7 3 3 3 3 5 1 ...
    ##  $ JobSatisfaction         : Factor w/ 4 levels "1","2","3","4": 4 2 3 3 2 4 1 3 3 3 ...
    ##  $ MaritalStatus           : Factor w/ 3 levels "Divorced","Married",..: 3 2 3 2 2 3 2 1 3 2 ...
    ##  $ MonthlyIncome           : num  5993 5130 2090 2909 3468 ...
    ##  $ MonthlyRate             : num  19479 24907 2396 23159 16632 ...
    ##  $ NumCompaniesWorked      : num  8 1 6 1 9 0 4 1 0 6 ...
    ##  $ Over18                  : Factor w/ 1 level "Y": 1 1 1 1 1 1 1 1 1 1 ...
    ##  $ OverTime                : Factor w/ 2 levels "No","Yes": 2 1 2 2 1 1 2 1 1 1 ...
    ##  $ PercentSalaryHike       : num  11 23 15 11 12 13 20 22 21 13 ...
    ##  $ PerformanceRating       : Factor w/ 2 levels "3","4": 1 2 1 1 1 1 2 2 2 1 ...
    ##  $ RelationshipSatisfaction: Factor w/ 4 levels "1","2","3","4": 1 4 2 3 4 3 1 2 2 2 ...
    ##  $ StandardHours           : num  80 80 80 80 80 80 80 80 80 80 ...
    ##  $ StockOptionLevel        : Factor w/ 4 levels "0","1","2","3": 1 2 1 1 2 1 4 2 1 3 ...
    ##  $ TotalWorkingYears       : num  8 10 7 8 6 8 12 1 10 17 ...
    ##  $ TrainingTimesLastYear   : num  0 3 3 3 3 2 3 2 2 3 ...
    ##  $ WorkLifeBalance         : Factor w/ 4 levels "1","2","3","4": 1 3 3 3 3 2 2 3 3 2 ...
    ##  $ YearsAtCompany          : num  6 10 0 8 2 7 1 1 9 7 ...
    ##  $ YearsInCurrentRole      : num  4 7 0 7 2 7 0 0 7 7 ...
    ##  $ YearsSinceLastPromotion : num  0 1 0 3 2 3 0 0 1 7 ...
    ##  $ YearsWithCurrManager    : num  5 7 0 0 2 6 0 0 8 7 ...

``` r
# View the first few rows of the dataset
head(attrition_data)
```

    ##   Age Attrition    BusinessTravel DailyRate             Department
    ## 1  41       Yes     Travel_Rarely      1102                  Sales
    ## 2  49        No Travel_Frequently       279 Research & Development
    ## 3  37       Yes     Travel_Rarely      1373 Research & Development
    ## 4  33        No Travel_Frequently      1392 Research & Development
    ## 5  27        No     Travel_Rarely       591 Research & Development
    ## 6  32        No Travel_Frequently      1005 Research & Development
    ##   DistanceFromHome Education EducationField EmployeeCount EmployeeNumber
    ## 1                1         2  Life Sciences             1              1
    ## 2                8         1  Life Sciences             1              2
    ## 3                2         2          Other             1              4
    ## 4                3         4  Life Sciences             1              5
    ## 5                2         1        Medical             1              7
    ## 6                2         2  Life Sciences             1              8
    ##   EnvironmentSatisfaction Gender HourlyRate JobInvolvement JobLevel
    ## 1                       2 Female         94              3        2
    ## 2                       3   Male         61              2        2
    ## 3                       4   Male         92              2        1
    ## 4                       4 Female         56              3        1
    ## 5                       1   Male         40              3        1
    ## 6                       4   Male         79              3        1
    ##                 JobRole JobSatisfaction MaritalStatus MonthlyIncome MonthlyRate
    ## 1       Sales Executive               4        Single          5993       19479
    ## 2    Research Scientist               2       Married          5130       24907
    ## 3 Laboratory Technician               3        Single          2090        2396
    ## 4    Research Scientist               3       Married          2909       23159
    ## 5 Laboratory Technician               2       Married          3468       16632
    ## 6 Laboratory Technician               4        Single          3068       11864
    ##   NumCompaniesWorked Over18 OverTime PercentSalaryHike PerformanceRating
    ## 1                  8      Y      Yes                11                 3
    ## 2                  1      Y       No                23                 4
    ## 3                  6      Y      Yes                15                 3
    ## 4                  1      Y      Yes                11                 3
    ## 5                  9      Y       No                12                 3
    ## 6                  0      Y       No                13                 3
    ##   RelationshipSatisfaction StandardHours StockOptionLevel TotalWorkingYears
    ## 1                        1            80                0                 8
    ## 2                        4            80                1                10
    ## 3                        2            80                0                 7
    ## 4                        3            80                0                 8
    ## 5                        4            80                1                 6
    ## 6                        3            80                0                 8
    ##   TrainingTimesLastYear WorkLifeBalance YearsAtCompany YearsInCurrentRole
    ## 1                     0               1              6                  4
    ## 2                     3               3             10                  7
    ## 3                     3               3              0                  0
    ## 4                     3               3              8                  7
    ## 5                     3               3              2                  2
    ## 6                     2               2              7                  7
    ##   YearsSinceLastPromotion YearsWithCurrManager
    ## 1                       0                    5
    ## 2                       1                    7
    ## 3                       0                    0
    ## 4                       3                    0
    ## 5                       2                    2
    ## 6                       3                    6

``` r
# Open the dataset in a viewer window
View(attrition_data)
```

``` r
#Measures of Frequency
# Measures of frequency for Attrition variable
table(attrition_data$Attrition)
```

    ## 
    ##   No  Yes 
    ## 1233  237

``` r
# Measures of frequency for BusinessTravel variable
table(attrition_data$BusinessTravel)
```

    ## 
    ##        Non-Travel Travel_Frequently     Travel_Rarely 
    ##               150               277              1043

``` r
# Measures of frequency for Department variable
table(attrition_data$Department)
```

    ## 
    ##        Human Resources Research & Development                  Sales 
    ##                     63                    961                    446

``` r
# Measures of frequency for Education variable
table(attrition_data$Education)
```

    ## 
    ##   1   2   3   4   5 
    ## 170 282 572 398  48

``` r
# Measures of frequency for EducationField variable
table(attrition_data$EducationField)
```

    ## 
    ##  Human Resources    Life Sciences        Marketing          Medical 
    ##               27              606              159              464 
    ##            Other Technical Degree 
    ##               82              132

``` r
# Measures of frequency for EnvironmentSatisfaction variable
table(attrition_data$EnvironmentSatisfaction)
```

    ## 
    ##   1   2   3   4 
    ## 284 287 453 446

``` r
# Measures of frequency for Gender variable
table(attrition_data$Gender)
```

    ## 
    ## Female   Male 
    ##    588    882

``` r
# Measures of frequency for JobRole variable
table(attrition_data$JobRole)
```

    ## 
    ## Healthcare Representative           Human Resources     Laboratory Technician 
    ##                       131                        52                       259 
    ##                   Manager    Manufacturing Director         Research Director 
    ##                       102                       145                        80 
    ##        Research Scientist           Sales Executive      Sales Representative 
    ##                       292                       326                        83

``` r
# Measures of frequency for MaritalStatus variable
table(attrition_data$MaritalStatus)
```

    ## 
    ## Divorced  Married   Single 
    ##      327      673      470

``` r
# Measures of frequency for Over18 variable
table(attrition_data$Over18)
```

    ## 
    ##    Y 
    ## 1470

``` r
# Measures of frequency for OverTime variable
table(attrition_data$OverTime)
```

    ## 
    ##   No  Yes 
    ## 1054  416

``` r
# Measures of frequency for PerformanceRating variable
table(attrition_data$PerformanceRating)
```

    ## 
    ##    3    4 
    ## 1244  226

``` r
# Measures of frequency for RelationshipSatisfaction variable
table(attrition_data$RelationshipSatisfaction)
```

    ## 
    ##   1   2   3   4 
    ## 276 303 459 432

``` r
# Measures of frequency for StockOptionLevel variable
table(attrition_data$StockOptionLevel)
```

    ## 
    ##   0   1   2   3 
    ## 631 596 158  85

``` r
# Measures of frequency for WorkLifeBalance variable
table(attrition_data$WorkLifeBalance)
```

    ## 
    ##   1   2   3   4 
    ##  80 344 893 153

``` r
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
```

    ## Measures of Central Tendency for Numeric Variables:

``` r
cat("\n")
```

``` r
cat("Variable: Age\n")
```

    ## Variable: Age

``` r
cat("Mean:", mean_age, "\n")
```

    ## Mean: 36.92381

``` r
cat("Median:", median_age, "\n")
```

    ## Median: 36

``` r
cat("Mode:", mode_age, "\n")
```

    ## Mode: 35

``` r
cat("\n")
```

``` r
cat("Variable: DailyRate\n")
```

    ## Variable: DailyRate

``` r
cat("Mean:", mean_daily_rate, "\n")
```

    ## Mean: 802.4857

``` r
cat("Median:", median_daily_rate, "\n")
```

    ## Median: 802

``` r
cat("Mode:", mode_daily_rate, "\n")
```

    ## Mode: 691

``` r
cat("\n")
```

``` r
cat("Variable: DistanceFromHome\n")
```

    ## Variable: DistanceFromHome

``` r
cat("Mean:", mean_distance_from_home, "\n")
```

    ## Mean: 9.192517

``` r
cat("Median:", median_distance_from_home, "\n")
```

    ## Median: 7

``` r
cat("Mode:", mode_distance_from_home, "\n")
```

    ## Mode: 2

``` r
cat("\n")
```

``` r
cat("Variable: MonthlyIncome\n")
```

    ## Variable: MonthlyIncome

``` r
cat("Mean:", mean_monthly_income, "\n")
```

    ## Mean: 6502.931

``` r
cat("Median:", median_monthly_income, "\n")
```

    ## Median: 4919

``` r
cat("Mode:", mode_monthly_income, "\n")
```

    ## Mode: 2342

``` r
cat("\n")
```

``` r
cat("Variable: MonthlyRate\n")
```

    ## Variable: MonthlyRate

``` r
cat("Mean:", mean_monthly_rate, "\n")
```

    ## Mean: 14313.1

``` r
cat("Median:", median_monthly_rate, "\n")
```

    ## Median: 14235.5

``` r
cat("Mode:", mode_monthly_rate, "\n")
```

    ## Mode: 4223

``` r
cat("\n")
```

``` r
cat("Variable: NumCompaniesWorked\n")
```

    ## Variable: NumCompaniesWorked

``` r
cat("Mean:", mean_num_companies_worked, "\n")
```

    ## Mean: 2.693197

``` r
cat("Median:", median_num_companies_worked, "\n")
```

    ## Median: 2

``` r
cat("Mode:", mode_num_companies_worked, "\n")
```

    ## Mode: 1

``` r
cat("\n")
```

``` r
cat("Variable: PercentSalaryHike\n")
```

    ## Variable: PercentSalaryHike

``` r
cat("Mean:", mean_percent_salary_hike, "\n")
```

    ## Mean: 15.20952

``` r
cat("Median:", median_percent_salary_hike, "\n")
```

    ## Median: 14

``` r
cat("Mode:", mode_percent_salary_hike, "\n")
```

    ## Mode: 11

``` r
cat("\n")
```

``` r
cat("Variable: TotalWorkingYears\n")
```

    ## Variable: TotalWorkingYears

``` r
cat("Mean:", mean_total_working_years, "\n")
```

    ## Mean: 11.27959

``` r
cat("Median:", median_total_working_years, "\n")
```

    ## Median: 10

``` r
cat("Mode:", mode_total_working_years, "\n")
```

    ## Mode: 10

``` r
cat("\n")
```

``` r
cat("Variable: TrainingTimesLastYear\n")
```

    ## Variable: TrainingTimesLastYear

``` r
cat("Mean:", mean_training_times_last_year, "\n")
```

    ## Mean: 2.79932

``` r
cat("Median:", median_training_times_last_year, "\n")
```

    ## Median: 3

``` r
cat("Mode:", mode_training_times_last_year, "\n")
```

    ## Mode: 2

``` r
cat("\n")
```

``` r
cat("Variable: YearsAtCompany\n")
```

    ## Variable: YearsAtCompany

``` r
cat("Mean:", mean_years_at_company, "\n")
```

    ## Mean: 7.008163

``` r
cat("Median:", median_years_at_company, "\n")
```

    ## Median: 5

``` r
cat("Mode:", mode_years_at_company, "\n")
```

    ## Mode: 5

``` r
cat("\n")
```

``` r
cat("Variable: YearsInCurrentRole\n")
```

    ## Variable: YearsInCurrentRole

``` r
cat("Mean:", mean_years_in_current_role, "\n")
```

    ## Mean: 4.229252

``` r
cat("Median:", median_years_in_current_role, "\n")
```

    ## Median: 3

``` r
cat("Mode:", mode_years_in_current_role, "\n")
```

    ## Mode: 2

``` r
cat("\n")
```

``` r
cat("Variable: YearsSinceLastPromotion\n")
```

    ## Variable: YearsSinceLastPromotion

``` r
cat("Mean:", mean_years_since_last_promotion, "\n")
```

    ## Mean: 2.187755

``` r
cat("Median:", median_years_since_last_promotion, "\n")
```

    ## Median: 1

``` r
cat("Mode:", mode_years_since_last_promotion, "\n")
```

    ## Mode: 0

``` r
cat("\n")
```

``` r
cat("Variable: YearsWithCurrManager\n")
```

    ## Variable: YearsWithCurrManager

``` r
cat("Mean:", mean_years_with_curr_manager, "\n")
```

    ## Mean: 4.123129

``` r
cat("Median:", median_years_with_curr_manager, "\n")
```

    ## Median: 3

``` r
cat("Mode:", mode_years_with_curr_manager, "\n")
```

    ## Mode: 2

``` r
# Measures of Distribution for numeric variables

# Summary statistics for Age
summary(attrition_data$Age)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##   18.00   30.00   36.00   36.92   43.00   60.00

``` r
# Quartiles for Age
quantile(attrition_data$Age)
```

    ##   0%  25%  50%  75% 100% 
    ##   18   30   36   43   60

``` r
# Summary statistics for DailyRate
summary(attrition_data$DailyRate)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##   102.0   465.0   802.0   802.5  1157.0  1499.0

``` r
# Quartiles for DailyRate
quantile(attrition_data$DailyRate)
```

    ##   0%  25%  50%  75% 100% 
    ##  102  465  802 1157 1499

``` r
# Summary statistics for DistanceFromHome
summary(attrition_data$DistanceFromHome)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##   1.000   2.000   7.000   9.193  14.000  29.000

``` r
# Quartiles for DistanceFromHome
quantile(attrition_data$DistanceFromHome)
```

    ##   0%  25%  50%  75% 100% 
    ##    1    2    7   14   29

``` r
# Summary statistics for MonthlyIncome
summary(attrition_data$MonthlyIncome)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##    1009    2911    4919    6503    8379   19999

``` r
# Quartiles for MonthlyIncome
quantile(attrition_data$MonthlyIncome)
```

    ##    0%   25%   50%   75%  100% 
    ##  1009  2911  4919  8379 19999

``` r
# Summary statistics for MonthlyRate
summary(attrition_data$MonthlyRate)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##    2094    8047   14236   14313   20462   26999

``` r
# Quartiles for MonthlyRate
quantile(attrition_data$MonthlyRate)
```

    ##      0%     25%     50%     75%    100% 
    ##  2094.0  8047.0 14235.5 20461.5 26999.0

``` r
# Summary statistics for NumCompaniesWorked
summary(attrition_data$NumCompaniesWorked)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##   0.000   1.000   2.000   2.693   4.000   9.000

``` r
# Quartiles for NumCompaniesWorked
quantile(attrition_data$NumCompaniesWorked)
```

    ##   0%  25%  50%  75% 100% 
    ##    0    1    2    4    9

``` r
# Summary statistics for PercentSalaryHike
summary(attrition_data$PercentSalaryHike)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##   11.00   12.00   14.00   15.21   18.00   25.00

``` r
# Quartiles for PercentSalaryHike
quantile(attrition_data$PercentSalaryHike)
```

    ##   0%  25%  50%  75% 100% 
    ##   11   12   14   18   25

``` r
# Summary statistics for TotalWorkingYears
summary(attrition_data$TotalWorkingYears)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##    0.00    6.00   10.00   11.28   15.00   40.00

``` r
# Quartiles for TotalWorkingYears
quantile(attrition_data$TotalWorkingYears)
```

    ##   0%  25%  50%  75% 100% 
    ##    0    6   10   15   40

``` r
# Summary statistics for TrainingTimesLastYear
summary(attrition_data$TrainingTimesLastYear)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##   0.000   2.000   3.000   2.799   3.000   6.000

``` r
# Quartiles for TrainingTimesLastYear
quantile(attrition_data$TrainingTimesLastYear)
```

    ##   0%  25%  50%  75% 100% 
    ##    0    2    3    3    6

``` r
# Summary statistics for YearsAtCompany
summary(attrition_data$YearsAtCompany)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##   0.000   3.000   5.000   7.008   9.000  40.000

``` r
# Quartiles for YearsAtCompany
quantile(attrition_data$YearsAtCompany)
```

    ##   0%  25%  50%  75% 100% 
    ##    0    3    5    9   40

``` r
# Summary statistics for YearsInCurrentRole
summary(attrition_data$YearsInCurrentRole)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##   0.000   2.000   3.000   4.229   7.000  18.000

``` r
# Quartiles for YearsInCurrentRole
quantile(attrition_data$YearsInCurrentRole)
```

    ##   0%  25%  50%  75% 100% 
    ##    0    2    3    7   18

``` r
# Summary statistics for YearsSinceLastPromotion
summary(attrition_data$YearsSinceLastPromotion)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##   0.000   0.000   1.000   2.188   3.000  15.000

``` r
# Quartiles for YearsSinceLastPromotion
quantile(attrition_data$YearsSinceLastPromotion)
```

    ##   0%  25%  50%  75% 100% 
    ##    0    0    1    3   15

``` r
# Summary statistics for YearsWithCurrManager
summary(attrition_data$YearsWithCurrManager)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##   0.000   2.000   3.000   4.123   7.000  17.000

``` r
# Quartiles for YearsWithCurrManager
quantile(attrition_data$YearsWithCurrManager)
```

    ##   0%  25%  50%  75% 100% 
    ##    0    2    3    7   17

``` r
# Measures of Relationship
# Correlation matrix for numeric variables
correlation_matrix <- cor(attrition_data[c("Age", "DailyRate", "DistanceFromHome", "MonthlyIncome", "MonthlyRate", "NumCompaniesWorked", "PercentSalaryHike", "TotalWorkingYears", "TrainingTimesLastYear", "YearsAtCompany", "YearsInCurrentRole", "YearsSinceLastPromotion", "YearsWithCurrManager")])
print(correlation_matrix)
```

    ##                                  Age    DailyRate DistanceFromHome
    ## Age                      1.000000000  0.010660943     -0.001686120
    ## DailyRate                0.010660943  1.000000000     -0.004985337
    ## DistanceFromHome        -0.001686120 -0.004985337      1.000000000
    ## MonthlyIncome            0.497854567  0.007707059     -0.017014445
    ## MonthlyRate              0.028051167 -0.032181602      0.027472864
    ## NumCompaniesWorked       0.299634758  0.038153434     -0.029250804
    ## PercentSalaryHike        0.003633585  0.022703677      0.040235377
    ## TotalWorkingYears        0.680380536  0.014514739      0.004628426
    ## TrainingTimesLastYear   -0.019620819  0.002452543     -0.036942234
    ## YearsAtCompany           0.311308770 -0.034054768      0.009507720
    ## YearsInCurrentRole       0.212901056  0.009932015      0.018844999
    ## YearsSinceLastPromotion  0.216513368 -0.033228985      0.010028836
    ## YearsWithCurrManager     0.202088602 -0.026363178      0.014406048
    ##                         MonthlyIncome  MonthlyRate NumCompaniesWorked
    ## Age                       0.497854567  0.028051167         0.29963476
    ## DailyRate                 0.007707059 -0.032181602         0.03815343
    ## DistanceFromHome         -0.017014445  0.027472864        -0.02925080
    ## MonthlyIncome             1.000000000  0.034813626         0.14951522
    ## MonthlyRate               0.034813626  1.000000000         0.01752135
    ## NumCompaniesWorked        0.149515216  0.017521353         1.00000000
    ## PercentSalaryHike        -0.027268586 -0.006429346        -0.01023831
    ## TotalWorkingYears         0.772893246  0.026442471         0.23763859
    ## TrainingTimesLastYear    -0.021736277  0.001466881        -0.06605407
    ## YearsAtCompany            0.514284826 -0.023655107        -0.11842134
    ## YearsInCurrentRole        0.363817667 -0.012814874        -0.09075393
    ## YearsSinceLastPromotion   0.344977638  0.001566800        -0.03681389
    ## YearsWithCurrManager      0.344078883 -0.036745905        -0.11031916
    ##                         PercentSalaryHike TotalWorkingYears
    ## Age                           0.003633585       0.680380536
    ## DailyRate                     0.022703677       0.014514739
    ## DistanceFromHome              0.040235377       0.004628426
    ## MonthlyIncome                -0.027268586       0.772893246
    ## MonthlyRate                  -0.006429346       0.026442471
    ## NumCompaniesWorked           -0.010238309       0.237638590
    ## PercentSalaryHike             1.000000000      -0.020608488
    ## TotalWorkingYears            -0.020608488       1.000000000
    ## TrainingTimesLastYear        -0.005221012      -0.035661571
    ## YearsAtCompany               -0.035991262       0.628133155
    ## YearsInCurrentRole           -0.001520027       0.460364638
    ## YearsSinceLastPromotion      -0.022154313       0.404857759
    ## YearsWithCurrManager         -0.011985248       0.459188397
    ##                         TrainingTimesLastYear YearsAtCompany YearsInCurrentRole
    ## Age                              -0.019620819    0.311308770        0.212901056
    ## DailyRate                         0.002452543   -0.034054768        0.009932015
    ## DistanceFromHome                 -0.036942234    0.009507720        0.018844999
    ## MonthlyIncome                    -0.021736277    0.514284826        0.363817667
    ## MonthlyRate                       0.001466881   -0.023655107       -0.012814874
    ## NumCompaniesWorked               -0.066054072   -0.118421340       -0.090753934
    ## PercentSalaryHike                -0.005221012   -0.035991262       -0.001520027
    ## TotalWorkingYears                -0.035661571    0.628133155        0.460364638
    ## TrainingTimesLastYear             1.000000000    0.003568666       -0.005737504
    ## YearsAtCompany                    0.003568666    1.000000000        0.758753737
    ## YearsInCurrentRole               -0.005737504    0.758753737        1.000000000
    ## YearsSinceLastPromotion          -0.002066536    0.618408865        0.548056248
    ## YearsWithCurrManager             -0.004095526    0.769212425        0.714364762
    ##                         YearsSinceLastPromotion YearsWithCurrManager
    ## Age                                 0.216513368          0.202088602
    ## DailyRate                          -0.033228985         -0.026363178
    ## DistanceFromHome                    0.010028836          0.014406048
    ## MonthlyIncome                       0.344977638          0.344078883
    ## MonthlyRate                         0.001566800         -0.036745905
    ## NumCompaniesWorked                 -0.036813892         -0.110319155
    ## PercentSalaryHike                  -0.022154313         -0.011985248
    ## TotalWorkingYears                   0.404857759          0.459188397
    ## TrainingTimesLastYear              -0.002066536         -0.004095526
    ## YearsAtCompany                      0.618408865          0.769212425
    ## YearsInCurrentRole                  0.548056248          0.714364762
    ## YearsSinceLastPromotion             1.000000000          0.510223636
    ## YearsWithCurrManager                0.510223636          1.000000000

``` r
# Contingency table for Attrition and BusinessTravel
table(attrition_data$Attrition, attrition_data$BusinessTravel)
```

    ##      
    ##       Non-Travel Travel_Frequently Travel_Rarely
    ##   No         138               208           887
    ##   Yes         12                69           156

``` r
# Contingency table for Attrition and Department
table(attrition_data$Attrition, attrition_data$Department)
```

    ##      
    ##       Human Resources Research & Development Sales
    ##   No               51                    828   354
    ##   Yes              12                    133    92

``` r
# Contingency table for Attrition and EducationField
table(attrition_data$Attrition, attrition_data$EducationField)
```

    ##      
    ##       Human Resources Life Sciences Marketing Medical Other Technical Degree
    ##   No               20           517       124     401    71              100
    ##   Yes               7            89        35      63    11               32

``` r
# Contingency table for Attrition and Gender
table(attrition_data$Attrition, attrition_data$Gender)
```

    ##      
    ##       Female Male
    ##   No     501  732
    ##   Yes     87  150

``` r
# Contingency table for Attrition and JobRole
table(attrition_data$Attrition, attrition_data$JobRole)
```

    ##      
    ##       Healthcare Representative Human Resources Laboratory Technician Manager
    ##   No                        122              40                   197      97
    ##   Yes                         9              12                    62       5
    ##      
    ##       Manufacturing Director Research Director Research Scientist
    ##   No                     135                78                245
    ##   Yes                     10                 2                 47
    ##      
    ##       Sales Executive Sales Representative
    ##   No              269                   50
    ##   Yes              57                   33

``` r
# Contingency table for Attrition and MaritalStatus
table(attrition_data$Attrition, attrition_data$MaritalStatus)
```

    ##      
    ##       Divorced Married Single
    ##   No       294     589    350
    ##   Yes       33      84    120

``` r
# Contingency table for Attrition and Over18
table(attrition_data$Attrition, attrition_data$Over18)
```

    ##      
    ##          Y
    ##   No  1233
    ##   Yes  237

``` r
# Contingency table for Attrition and OverTime
table(attrition_data$Attrition, attrition_data$OverTime)
```

    ##      
    ##        No Yes
    ##   No  944 289
    ##   Yes 110 127

``` r
# Contingency table for Attrition and PerformanceRating
table(attrition_data$Attrition, attrition_data$PerformanceRating)
```

    ##      
    ##          3    4
    ##   No  1044  189
    ##   Yes  200   37

``` r
# Contingency table for Attrition and RelationshipSatisfaction
table(attrition_data$Attrition, attrition_data$RelationshipSatisfaction)
```

    ##      
    ##         1   2   3   4
    ##   No  219 258 388 368
    ##   Yes  57  45  71  64

``` r
# Contingency table for Attrition and StockOptionLevel
table(attrition_data$Attrition, attrition_data$StockOptionLevel)
```

    ##      
    ##         0   1   2   3
    ##   No  477 540 146  70
    ##   Yes 154  56  12  15

``` r
# Contingency table for Attrition and WorkLifeBalance
table(attrition_data$Attrition, attrition_data$WorkLifeBalance)
```

    ##      
    ##         1   2   3   4
    ##   No   55 286 766 126
    ##   Yes  25  58 127  27

``` r
# ANOVA
# Load required package for ANOVA
library(stats)

# Perform ANOVA tests

# ANOVA for Age and Attrition
age_anova <- aov(Age ~ Attrition, data = attrition_data)
summary(age_anova)
```

    ##               Df Sum Sq Mean Sq F value   Pr(>F)    
    ## Attrition      1   3107  3107.3   38.18 8.36e-10 ***
    ## Residuals   1468 119488    81.4                     
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
# ANOVA for MonthlyIncome and Attrition
income_anova <- aov(MonthlyIncome ~ Attrition, data = attrition_data)
summary(income_anova)
```

    ##               Df    Sum Sq   Mean Sq F value   Pr(>F)    
    ## Attrition      1 8.319e+08 831869887   38.49 7.15e-10 ***
    ## Residuals   1468 3.173e+10  21613287                     
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
# ANOVA for TotalWorkingYears and Attrition
working_years_anova <- aov(TotalWorkingYears ~ Attrition, data = attrition_data)
summary(working_years_anova)
```

    ##               Df Sum Sq Mean Sq F value   Pr(>F)    
    ## Attrition      1   2602  2602.4   44.25 4.06e-11 ***
    ## Residuals   1468  86332    58.8                     
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
# ANOVA for YearsAtCompany and Attrition
years_at_company_anova <- aov(YearsAtCompany ~ Attrition, data = attrition_data)
summary(years_at_company_anova)
```

    ##               Df Sum Sq Mean Sq F value   Pr(>F)    
    ## Attrition      1    996   995.9      27 2.32e-07 ***
    ## Residuals   1468  54142    36.9                     
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
# ANOVA for YearsSinceLastPromotion and Attrition
promotion_anova <- aov(YearsSinceLastPromotion ~ Attrition, data = attrition_data)
summary(promotion_anova)
```

    ##               Df Sum Sq Mean Sq F value Pr(>F)
    ## Attrition      1     17   16.63   1.602  0.206
    ## Residuals   1468  15238   10.38

``` r
# ANOVA for YearsWithCurrManager and Attrition
years_with_manager_anova <- aov(YearsWithCurrManager ~ Attrition, data = attrition_data)
summary(years_with_manager_anova)
```

    ##               Df Sum Sq Mean Sq F value   Pr(>F)    
    ## Attrition      1    456   456.3   36.71 1.74e-09 ***
    ## Residuals   1468  18246    12.4                     
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

``` r
# Basic Visualization
#Uni variate Plots
# Load required package for plotting
library(ggplot2)

# Histogram for Age
ggplot(attrition_data, aes(x = Age)) +
  geom_histogram(binwidth = 5, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Age", x = "Age", y = "Frequency")
```

![](Attrition_files/figure-gfm/Basic%20Visualization-1.png)<!-- -->

``` r
# Histogram for MonthlyIncome
ggplot(attrition_data, aes(x = MonthlyIncome)) +
  geom_histogram(binwidth = 500, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Monthly Income", x = "Monthly Income", y = "Frequency")
```

![](Attrition_files/figure-gfm/Basic%20Visualization-2.png)<!-- -->

``` r
# Histogram for TotalWorkingYears
ggplot(attrition_data, aes(x = TotalWorkingYears)) +
  geom_histogram(binwidth = 1, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Total Working Years", x = "Total Working Years", y = "Frequency")
```

![](Attrition_files/figure-gfm/Basic%20Visualization-3.png)<!-- -->

``` r
# Histogram for YearsAtCompany
ggplot(attrition_data, aes(x = YearsAtCompany)) +
  geom_histogram(binwidth = 1, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Years at Company", x = "Years at Company", y = "Frequency")
```

![](Attrition_files/figure-gfm/Basic%20Visualization-4.png)<!-- -->

``` r
# Boxplot for Age
ggplot(attrition_data, aes(x = "", y = Age)) +
  geom_boxplot(fill = "skyblue", color = "black") +
  labs(title = "Boxplot of Age", x = NULL, y = "Age")
```

![](Attrition_files/figure-gfm/Basic%20Visualization-5.png)<!-- -->

``` r
# Boxplot for MonthlyIncome
ggplot(attrition_data, aes(x = "", y = MonthlyIncome)) +
  geom_boxplot(fill = "skyblue", color = "black") +
  labs(title = "Boxplot of Monthly Income", x = NULL, y = "Monthly Income")
```

![](Attrition_files/figure-gfm/Basic%20Visualization-6.png)<!-- -->

``` r
# Boxplot for TotalWorkingYears
ggplot(attrition_data, aes(x = "", y = TotalWorkingYears)) +
  geom_boxplot(fill = "skyblue", color = "black") +
  labs(title = "Boxplot of Total Working Years", x = NULL, y = "Total Working Years")
```

![](Attrition_files/figure-gfm/Basic%20Visualization-7.png)<!-- -->

``` r
# Boxplot for YearsAtCompany
ggplot(attrition_data, aes(x = "", y = YearsAtCompany)) +
  geom_boxplot(fill = "skyblue", color = "black") +
  labs(title = "Boxplot of Years at Company", x = NULL, y = "Years at Company")
```

![](Attrition_files/figure-gfm/Basic%20Visualization-8.png)<!-- -->

``` r
# Pairwise scatterplots for selected numeric variables
ggplot(attrition_data, aes(x = Age, y = MonthlyIncome, color = Attrition)) +
  geom_point() +
  labs(title = "Scatterplot of Age vs. Monthly Income", x = "Age", y = "Monthly Income")
```

![](Attrition_files/figure-gfm/Basic%20Visualization-9.png)<!-- -->

``` r
ggplot(attrition_data, aes(x = YearsAtCompany, y = YearsSinceLastPromotion, color = Attrition)) +
  geom_point() +
  labs(title = "Scatterplot of Years at Company vs. Years Since Last Promotion", x = "Years at Company", y = "Years Since Last Promotion")
```

![](Attrition_files/figure-gfm/Basic%20Visualization-10.png)<!-- -->

``` r
# Boxplots for numeric variables grouped by Attrition
ggplot(attrition_data, aes(x = Attrition, y = Age, fill = Attrition)) +
  geom_boxplot() +
  labs(title = "Boxplot of Age by Attrition", x = "Attrition", y = "Age")
```

![](Attrition_files/figure-gfm/Basic%20Visualization-11.png)<!-- -->

``` r
ggplot(attrition_data, aes(x = Attrition, y = MonthlyIncome, fill = Attrition)) +
  geom_boxplot() +
  labs(title = "Boxplot of Monthly Income by Attrition", x = "Attrition", y = "Monthly Income")
```

![](Attrition_files/figure-gfm/Basic%20Visualization-12.png)<!-- -->

``` r
# Faceted histograms for Age and MonthlyIncome by Attrition
ggplot(attrition_data, aes(x = Age)) +
  geom_histogram(binwidth = 5, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Age by Attrition", x = "Age", y = "Frequency") +
  facet_wrap(~Attrition)
```

![](Attrition_files/figure-gfm/Basic%20Visualization-13.png)<!-- -->

``` r
ggplot(attrition_data, aes(x = MonthlyIncome)) +
  geom_histogram(binwidth = 500, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Monthly Income by Attrition", x = "Monthly Income", y = "Frequency") +
  facet_wrap(~Attrition)
```

![](Attrition_files/figure-gfm/Basic%20Visualization-14.png)<!-- -->

``` r
# Check for missing values in the dataset
missing_values <- colSums(is.na(attrition_data))

# Check if there are any missing values in any column
any_missing <- any(missing_values > 0)

# Print the results
if (any_missing) {
  print("There are missing values in the dataset.")
  # Display the number of missing values in each column
  print(missing_values[missing_values > 0])
} else {
  print("There are no missing values in the dataset.")
}
```

    ## [1] "There are no missing values in the dataset."

``` r
# Load required package for data transformation
library(caret)
```

    ## Loading required package: lattice

``` r
# Function to normalize numeric variables
normalize_data <- function(data) {
  normalized_data <- as.data.frame(apply(data, 2, function(x) (x - min(x)) / (max(x) - min(x))))
  return(normalized_data)
}

# Apply normalization to numeric variables
normalized_attrition_data <- normalize_data(attrition_data[, c("Age", "DailyRate", "DistanceFromHome", "MonthlyIncome", "MonthlyRate", "NumCompaniesWorked", "PercentSalaryHike", "TotalWorkingYears", "TrainingTimesLastYear", "YearsAtCompany", "YearsInCurrentRole", "YearsSinceLastPromotion", "YearsWithCurrManager")])

# Display the first few rows of the normalized dataset
head(normalized_attrition_data)
```

    ##         Age DailyRate DistanceFromHome MonthlyIncome MonthlyRate
    ## 1 0.5476190 0.7158196       0.00000000     0.2624539  0.69805260
    ## 2 0.7380952 0.1267001       0.25000000     0.2170090  0.91600080
    ## 3 0.4523810 0.9098067       0.03571429     0.0569247  0.01212608
    ## 4 0.3571429 0.9234073       0.07142857     0.1000527  0.84581409
    ## 5 0.2142857 0.3500358       0.03571429     0.1294892  0.58373821
    ## 6 0.3333333 0.6463851       0.03571429     0.1084255  0.39229070
    ##   NumCompaniesWorked PercentSalaryHike TotalWorkingYears TrainingTimesLastYear
    ## 1          0.8888889        0.00000000             0.200             0.0000000
    ## 2          0.1111111        0.85714286             0.250             0.5000000
    ## 3          0.6666667        0.28571429             0.175             0.5000000
    ## 4          0.1111111        0.00000000             0.200             0.5000000
    ## 5          1.0000000        0.07142857             0.150             0.5000000
    ## 6          0.0000000        0.14285714             0.200             0.3333333
    ##   YearsAtCompany YearsInCurrentRole YearsSinceLastPromotion
    ## 1          0.150          0.2222222              0.00000000
    ## 2          0.250          0.3888889              0.06666667
    ## 3          0.000          0.0000000              0.00000000
    ## 4          0.200          0.3888889              0.20000000
    ## 5          0.050          0.1111111              0.13333333
    ## 6          0.175          0.3888889              0.20000000
    ##   YearsWithCurrManager
    ## 1            0.2941176
    ## 2            0.4117647
    ## 3            0.0000000
    ## 4            0.0000000
    ## 5            0.1176471
    ## 6            0.3529412

``` r
# Check the number of levels for each factor variable
factor_levels <- sapply(attrition_data, function(x) {
  if (is.factor(x)) {
    return(length(levels(x)))
  } else {
    return(0)  # For non-factor variables
  }
})

# Identify factor variables with only one level
single_level_factors <- names(factor_levels[factor_levels == 1])

# Print the names of factor variables with only one level
print(single_level_factors)
```

    ## [1] "Over18"

``` r
# If you want to remove these variables from the modeling process:
attrition_data <- attrition_data[, !names(attrition_data) %in% single_level_factors]
```

``` r
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
```

    ## Training dataset dimensions: 1176 34

``` r
cat("Testing dataset dimensions:", dim(testing_data), "\n")
```

    ## Testing dataset dimensions: 294 34

``` r
# Load required package for bootstrapping
library(boot)
```

    ## 
    ## Attaching package: 'boot'

    ## The following object is masked from 'package:lattice':
    ## 
    ##     melanoma

``` r
# Function to compute the statistic of interest (e.g., mean, median) from a bootstrap sample
compute_statistic <- function(data, indices) {
  statistic <- mean(data$Age[indices])  # Example: Compute the mean of 'Age'
  return(statistic)
}

# Perform bootstrapping
boot_results <- boot(data = attrition_data, statistic = compute_statistic, R = 1000)

# Display the bootstrapped results
print(boot_results)
```

    ## 
    ## ORDINARY NONPARAMETRIC BOOTSTRAP
    ## 
    ## 
    ## Call:
    ## boot(data = attrition_data, statistic = compute_statistic, R = 1000)
    ## 
    ## 
    ## Bootstrap Statistics :
    ##     original      bias    std. error
    ## t1* 36.92381 -0.01553401   0.2299266
