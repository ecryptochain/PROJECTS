# PROJECTS
This dataset provides a detailed view of students enrolled in various undergraduate programs offered at a higher education institution.  

It includes demographic data, academic performance, and social-economic factors, these are crucial information that can be used to analyze the possible predictors of student dropout and academic success.

This dataset was published on kaggle.com which has 35 variables and 4424 observations.

For this project's sake, a simple random sampling was performed to obtain a sample of 1,500 from the data.

The training data equals 900 observations, and the validation data will be 600 observations.

 
The X variables are:

· Application mode
· Displaced
· Debtor
· Tuition fees up to date
· Gender
· Scholarship holder
· Curricular unit's 1st sem (enrolled)
· Curricular unit's 1st sem (approved)
· Curricular unit's 1st sem (grade)
· Curricular unit's 2nd sem (enrolled)  
· Curricular unit's 2nd sem (approved)  
· Curricular unit's 2nd sem (grade)
The Y variable is the Target variable, meaning a student is a dropout, currently enrolled or graduated. The target variable was converted to a numerical variable so that linear regression can be performed on the data.


AIM OF THE PROJECT

The project aims at exploring the predictors of academic performance and determining its relationship to the academic outcome (Target = Dropout, Enrolled and Graduate) using the provided data set. The project also aims to build a model of predictors to determine the target outcome of the students. The model should be able to learn from the data and predict the target outcome in any higher education institution given that all other metrics are present.

Also, in this third report, we will be using the logistic regression method to explore the selected variables and determine the most significant variables classifying the Y variable (Target). The following variables namely Debtor, Gender and Curricular unit’s 1sr sem (enrolled) in the previous data because they do not provide any substantial significance in explaining and drawing more insights from the data.

After this we have our new variables listed below:

The X variables are:

· Application mode
· Displaced
· Tuition fees up to date
· Scholarship holder
· Curricular unit's 1st sem (approved)
· Curricular unit's 1st sem (grade)
· Curricular unit's 2nd sem (enrolled)  
· Curricular unit's 2nd sem (approved)  
· Curricular unit's 2nd sem (grade)
The Y variable is the Target variable.


VARIABLE CONVERSION  

The Y variable which is target was originally classified as 1 = Dropout, 2 = Enrolled and 3 = Graduate.

The median value of the Target variable was calculated with the value of 2. The reason behind this is because we will be performing logistic regression on the data and will require the Y variable to be in a binary form (0 and 1) for easy interpretation of the data.

The new values of the Target variable are 0 and 1 where 1 represents if a student will Graduate and 0 represents if a student will Dropout. 

FULL MODEL

For this part, I performed logistic regression analysis on the whole data because we need to distinguish how each variable affects each other and over the individual and collective impact on the data. So, all 10 variables were included in the analysis and with the output shown below for more insight.

We will explain and draw insights from the X variables and see if we can draw collective insights from the data.

1. Intercept: The intercept is -2.88159. In logistic regression, the intercept represents the log-odds of the event when all predictors are zero and, in this case, it's the log-odds of the event when all categorical variables are at their reference levels and continuous variables are at zero.

2. Application mode: For a one-unit increase in the Application mode, the log-odds of the response variable decrease by -0.03647. Since the p-value is less than 0.05, we consider this variable statistically significant. It shows that as the Application mode increases, the odds of the event happening decrease.

3. Displaced: The coefficient for displaced is 0.10365, but the p-value is greater than 0.05. Therefore, we cannot confidently say that being Displaced has a significant effect on the log-odds of the Target variable stating if a student will graduate or not.

4. Tuition.fees.up.to.date: A one-unit increase in Tuition.fees.up.to.date will cause an increase in the log-odds of the Target variable by 2.32913. This variable is highly significant (p-value < 0.001), showing that higher tuition fees are strongly associated with increased odds of a student graduating.  This also makes sense because as students pay their tuition on time, they will have little or no reason to miss classes and will be more serious with their studies so as to get back their value for money.

5. Scholarship.holder: As a student, being a Scholarship holder is naturally linked with serious minded students and from the analysis we can see it is associated with an increase in the log-odds by 0.99596. This variable is highly significant (p-value < 0.001), meaning that Scholarship holders have significantly higher odds at 99.5% of graduating from college compared to non-scholarship holders.

6. Curricular.units.1st.sem.enrolled.: A one-unit increase in Curricular.units.1st.sem.enrolled will result in a decrease in the log-odds by 0.42141. This variable is significant (p-value < 0.001), indicating that higher enrollment in the first semester is associated with decreased odds of a student graduating.  This also makes sense because the more courses a student register, they might be overwhelmed and slack off in their academic performance

7. Curricular.units.1st.sem.approved.: A one-unit increase in Curricular.units.1st.sem.approved. will result in an increase in the odds of graduation by 0.65547. This variable is highly significant (p-value < 0.001), suggesting that higher approval of curricular units in the first semester is strongly associated with increased odds of a student graduating college. Also, this can be seen as a positive trend because if you’re approved of the first semester then there’s a higher chance that a student will graduate.

8. Curricular.units.1st.sem.grade.: A one-unit increase in Curricular.units.1st.sem..grade. is associated with a slight decrease in the log odds by 0.13093. This variable is significant at 0.05 (p-value = 0.008699), indicating that higher grades in the first semester are slightly linked with decreased odds of the student graduating. This can be true if interpreted as such, a student feeling more relaxed about their first semester performance can cause reduced efforts in the second semester causing a slight possibility of poor performance by the student.

9. Curricular.units.2nd.sem.enrolled.: A one-unit increase in Curricular.units.2nd.sem.enrolled. is associated with a decrease in the chances of a student graduating by 0.93907. This variable is highly significant (p-value < 0.001), showing that higher enrollment in the second semester is strongly linked to if a student will graduate or not.

10. Curricular.units.2nd.sem.approved.: A one-unit increase in Curricular.units.2nd.sem.approved. is associated with an increase in the chances of a student graduating by 0.97182. This variable is highly significant (p-value < 0.001), suggesting that higher approval of curricular units in the second semester is strongly associated with increased odds of the event.

11. Curricular.units.2nd.sem.grade.: A one-unit increase in Curricular.units.2nd.sem.grade. is associated with an increase in the log-odds by 0.19877. This variable is significant (p-value = 0.000102), indicating that higher grades in the second semester are associated with increased chances of a student graduating from college.


COLLECTIVE EFFECTS

- The Tuition.fees.up.to.date, Scholarship.holder, and both Curricular.units.1st.sem.approved. and Curricular.units.2nd.sem..approved. variables have a notable positive impact on the log-odds, indicating a higher probability of the event.

- Conversely, Application.mode, Curricular.units.1st.sem..enrolled., Curricular.units.2nd.sem..enrolled., Curricular.units.1st.sem..grade., and Curricular.units.2nd.sem..grade. have negative impacts on the log-odds, showing a lower probability of the event.

- Displaced does not seem to have a statistically significant impact on the outcome.


