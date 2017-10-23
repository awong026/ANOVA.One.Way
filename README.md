# ANOVA.One.Way
## Objective
Question 1: Anova on Ozone by month. We want to see if Ozone levels are the same for each month

Question 2: Anova on Solar.R by month. We want to see if Solar.R levels are the same for each month

Question 3: Anova on Wind by month. We want to see if Wind levels are the same for each month

## Summary
Question 1: There were 37 NA values, so I had to construct a new dataframe that did include those rows. (Could have done something else, but I thought this was best) For EDA I found that Ozone level by month has constant variances, but I wasn't sure if normal. It also had data that looked like outliers. So I used the nonparametric method Kruskal-Wallis Test to test if can of the means of Ozone levels for each month were different. I got a low p value, so then I did a multiple comparison step to figure out which pairs of Ozone months differed from each other. I used pairwise wilcox test to do this. 

Question 2: There were 7 NA values, so I had to construct a new data frame that did not include those rows.(Could have done something else, but I thought this was best) For EDA I found that Solar.R level by month has constant variances, but I wasn't sure if normal. It also had data that looked like outliers. So I used the nonparametric method Kruskal-Wallis Test to test if can of the means of Solar.R levels for each month were different. I got a high p value so I couldn't reject the null hypothesis that the means of Solar.R were different. 

Question 3: For EDA I found that Wind by month has constant variances, and it was normal. This means I could create a anova model for this data. The  p value was low, which meant I had to do a multiple comparison step to figure out which pairs Wind months differed from each other. I used Tukey test to do this. (Could have use Bonferroni or Siegal, but decided not to)

## Conclusion
Question 1: After following the procedures in the summary, I found that the means that are different from each other are: 5 and 7, 5 and 8, 7 and 9, and 8 and 9 for ozone level. (months)

Question 2: As stated in summary, I was unable to reject H0 that a means of Solar.R for each month differed. 

Question 3: After following the procedures in the summary, I am 95% confident that months 7 and 5, 8 and 5 do not have the same means for Wind level. 
