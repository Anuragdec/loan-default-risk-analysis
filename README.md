# loan-default-risk-analysis
about my mini project - loan default prediction
in this we will clean and load the datasets on the platform , to find out the useful insights , and learn the different ways to solve and find the solutions and the most important thing is , we will study the data and focus on the most important questions and problems which is very first thing to do , so that we can get the clear understanding of the situation and help in the growing the business and making decisions . in this we handled the dataset which is filled with garbage values and null , and we arrange the dataset with perfect datatypes so it won't mismatch , then we solve the 5 questions which gives the most important answer and help us to move at the right direction , we also learn the use of CASE WHEN , GROUP BY , ORDER and WINDOW FUNCTIONS , and one more thing is for concate we can use ' ||' this symbol and if we use this with any number like (round (default_rate) )+ % , then it will convert to String , not remain same as number as datatype . and in final , we come to know where we have to rase the flag and which segment we have to be careful about .

Objective: What business question we are solving (loan default risk analysis)
this is my mini project of solving the basic but important  problems which are identify the loan defaulters and what process i do to get to the solution ,
DATASET - Loan default prediction
so i gather the data of around , 150 MB , with around 20 column file
Method: SQL techniques used — Group by , window function , subqueries, CASE WHEN, conditional aggregation , concate in diff ways  .
 

Key findings -
-overall default rate percentage is = 12.37%
-business loan purpose have the  highest numbers of default loan up to 13% , then education which is 12% .
-loan amount which is approve the 150k make the highest number of percentage in default ->14.73% .
higher income of 150k + , have high interest , have total loan 102 , with default rate ->18.18%
In this Riskiest segment is other which is rank 1 , with default rate  17.72% ,and on the second rank is Education with 15.85% default rate .
So what: What a lender could actually do with this -
  -  tighten approval criteria for other and education purpose , flag loans above 150k interest rate for extra review
