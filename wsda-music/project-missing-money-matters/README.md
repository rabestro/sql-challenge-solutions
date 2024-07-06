# SQL Essential Training
> with Walter Shields

## Project Missing Money Matters

### Challenges

The situation: For a long time, Adams Andrew, Manager of WSDA Music, has been unable to
account for a discrepancy in his company’s financials.
The furthest he has gotten in his own attempts to analyze the company data is figuring out that the discrepancy occurred between the years 2011 and 2012. But that’s about all that Adams knows for certain.
You have been called in to do what you do best—apply your SQL skills: • Analyze WSDA Music’s Data to:
− Get a list of suspects
− Narrowyourlist
− Pinpointyourprimesuspect(s)
The Management team at WSDA Music is eager to review your findings! Work through each part of the project below, then watch the corresponding final project movie to compare your answers.

### Considerations

Hmmm. OK, so where do we start? We have access to WSDA Music’s Data and a great first step is to revisit the situation, with the aim of zeroing in on the specific tables that may be relevant to start looking at first.

### Hint:
Money is missing so, did someone take it? Did something account for the discrepancy? What can be done? Starting with the assumption that the missing funds can be attributed to someone, what tables will most likely contain information about people? What related activity in this database do people do that creates a transaction record (since we are after a missing sum of money—in what tables would this type of business store this information?).
Tables: Customers, Employees, Invoices 

### CHALLENGE 1

General queries that begin to give you some high-level context
1. How many transactions took place between the years 2011 and 2012?
2. How much money did WSDA Music make during the same period?

### CHALLENGE 2

More targeted questions that query tables containing data about customers and employees
1. Get a list of customers who made purchases between 2011 and 2012.
2. Get a list of customers, sales reps, and total transaction amounts for each customer between 2011 and 2012.
3. How many transactions are above the average transaction amount during the same time period?
4. What is the average transaction amount for each year that WSDA Music has been in business?

### CHALLENGE 3

Queries that perform in-depth analysis with the aim of finding employees who may have been financially motivated to commit a crime
1. Get a list of employees who exceeded the average transaction amount from sales they generated during 2011 and 2012.
2. Create a Commission Payout column that displays each employee’s commission based on 15% of the sales transaction amount.
3. Which employee made the highest commission?
4. List the customers that the employee identified in the last question.
5. Which customer made the highest purchase?
6. Look at this customer record—do you see anything suspicious?
7. Who do you conclude is our primary person of interest?
Well done! You’ve uncovered insights by analyzing the data. WSDA Music management thanks you. Use these same SQL skills to analyze future data sets.
Additional learning resources are also shared in the final chapter of this course.