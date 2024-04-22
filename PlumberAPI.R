# Load the saved logistic regression model
loaded_logistic_model <- readRDS("./models/saved_logistic_model.rds")

#* @apiTitle Employee Attrition Prediction Model API
#* @apiDescription Used to predict employee attrition.

#* @param Age Age of the employee
#* @param BusinessTravel Frequency of business travel (e.g., "Travel_Rarely", "Travel_Frequently", "Non-Travel")
#* @param DailyRate Daily rate of the employee
#* @param Department Department in which the employee works (e.g., "Sales", "Research & Development", "Human Resources")
#* @param DistanceFromHome Distance from home to work for the employee
#* @param Education Level of education of the employee (1: 'Below College', 2: 'College', 3: 'Bachelor', 4: 'Master', 5: 'Doctor')
#* @param EducationField Field of education of the employee (e.g., "Life Sciences", "Medical", "Marketing")
#* @param EnvironmentSatisfaction Level of environment satisfaction of the employee (1: 'Low', 2: 'Medium', 3: 'High', 4: 'Very High')
#* @param Gender Gender of the employee (Male/Female)
#* @param HourlyRate Hourly rate of the employee
#* @param JobInvolvement Level of job involvement of the employee (1: 'Low', 2: 'Medium', 3: 'High', 4: 'Very High')
#* @param JobLevel Level of job of the employee (1, 2, 3, 4, 5)
#* @param JobRole Role of the employee in the company (e.g., "Sales Executive", "Research Scientist", "Laboratory Technician")
#* @param JobSatisfaction Level of job satisfaction of the employee (1: 'Low', 2: 'Medium', 3: 'High', 4: 'Very High')
#* @param MaritalStatus Marital status of the employee (e.g., "Single", "Married", "Divorced")
#* @param MonthlyIncome Monthly income of the employee
#* @param MonthlyRate Monthly rate of the employee
#* @param NumCompaniesWorked Number of companies the employee has worked for
#* @param Over18 Whether the employee is over 18 years old (Y/N)
#* @param OverTime Whether the employee works overtime (Yes/No)
#* @param PercentSalaryHike Percentage of salary hike for the employee
#* @param PerformanceRating Performance rating of the employee (1: 'Low', 2: 'Good', 3: 'Excellent', 4: 'Outstanding')
#* @param RelationshipSatisfaction Level of relationship satisfaction of the employee (1: 'Low', 2: 'Medium', 3: 'High', 4: 'Very High')
#* @param StandardHours Standard hours worked by the employee
#* @param StockOptionLevel Level of stock option for the employee (0, 1, 2, 3)
#* @param TotalWorkingYears Total number of years the employee has worked
#* @param TrainingTimesLastYear Number of training times last year for the employee
#* @param WorkLifeBalance Level of work-life balance of the employee (1: 'Bad', 2: 'Good', 3: 'Better', 4: 'Best')
#* @param YearsAtCompany Number of years the employee has worked at the company
#* @param YearsInCurrentRole Number of years the employee has been in the current role
#* @param YearsSinceLastPromotion Number of years since the employee's last promotion
#* @param YearsWithCurrManager Number of years the employee has been with the current manager
#* @param EmployeeCount Count of employees
#* @param EmployeeNumber Employee number
#* @param Attrition Actual attrition status of the employee (Yes/No)

#* @get /attrition_prediction

predict_attrition <- function(Age, BusinessTravel, DailyRate, Department, DistanceFromHome,
                              Education, EducationField, EnvironmentSatisfaction, Gender,
                              HourlyRate, JobInvolvement, JobLevel, JobRole, JobSatisfaction,
                              MaritalStatus, MonthlyIncome, MonthlyRate, NumCompaniesWorked,
                              Over18, OverTime, PercentSalaryHike, PerformanceRating,
                              RelationshipSatisfaction, StandardHours, StockOptionLevel,
                              TotalWorkingYears, TrainingTimesLastYear, WorkLifeBalance,
                              YearsAtCompany, YearsInCurrentRole, YearsSinceLastPromotion,
                              YearsWithCurrManager, EmployeeCount, EmployeeNumber, Attrition) {
  
  # Create a data frame using the arguments
  to_be_predicted <- data.frame(
    Age = as.numeric(Age),
    BusinessTravel = as.character(BusinessTravel),
    DailyRate = as.numeric(DailyRate),
    Department = as.character(Department),
    DistanceFromHome = as.numeric(DistanceFromHome),
    Education = as.factor(Education),
    EducationField = as.character(EducationField),
    EnvironmentSatisfaction = as.factor(EnvironmentSatisfaction),
    Gender = as.character(Gender),
    HourlyRate = as.numeric(HourlyRate),
    JobInvolvement = as.factor(JobInvolvement),
    JobLevel = as.factor(JobLevel),
    JobRole = as.character(JobRole),
    JobSatisfaction = as.factor(JobSatisfaction),
    MaritalStatus = as.character(MaritalStatus),
    MonthlyIncome = as.numeric(MonthlyIncome),
    MonthlyRate = as.numeric(MonthlyRate),
    NumCompaniesWorked = as.factor(NumCompaniesWorked),
    Over18 = as.character(Over18),
    OverTime = as.character(OverTime),
    PercentSalaryHike = as.numeric(PercentSalaryHike),
    PerformanceRating = as.factor(PerformanceRating),
    RelationshipSatisfaction = as.factor(RelationshipSatisfaction),
    StandardHours = as.numeric(StandardHours),
    StockOptionLevel = as.factor(StockOptionLevel),
    TotalWorkingYears = as.numeric(TotalWorkingYears),
    TrainingTimesLastYear = as.factor(TrainingTimesLastYear),
    WorkLifeBalance = as.factor(WorkLifeBalance),
    YearsAtCompany = as.numeric(YearsAtCompany),
    YearsInCurrentRole = as.numeric(YearsInCurrentRole),
    YearsSinceLastPromotion = as.numeric(YearsSinceLastPromotion),
    YearsWithCurrManager = as.numeric(YearsWithCurrManager),
    EmployeeCount = as.factor(EmployeeCount),
    EmployeeNumber = as.factor(EmployeeNumber),
    Attrition = as.factor(Attrition)
  )
  
  # Use the loaded model to make predictions
  prediction <- predict(loaded_logistic_model, newdata = to_be_predicted)
  
  # Return the prediction
  return(prediction)
}
