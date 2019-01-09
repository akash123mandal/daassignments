#import SALARY.xlsx as SALARY

#Filter by year = 2014
SALARY_14 <- SALARY[SALARY$Year == 2014, ]

#According to professor's instructions, we are required to find correlation between sum of basic, other, and overtime (ie, totalpaybenefits) with basic pay. It has been instructed to ignore Attribute 'Benefits', which is Nominal

#Remove data with 'na' values for concerened attrbutes
SALARY_14_NEW <- SALARY_14[!is.na(SALARY_14$BasePay) & !is.na(SALARY_14$TotalPayBenefits), ]

basepay <- SALARY_14_NEW$BasePay
totalpay <- SALARY_14_NEW$TotalPayBenefits
cor(basepay, totalpay)

model <- lm(totalpay ~ basepay)
summary(model)
abline(model, col='red')
