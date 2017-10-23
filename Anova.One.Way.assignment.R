attach(airquality)
head(airquality)

aq <- (airquality)



###############################################

#Question 1: Anova on Ozone by month. 
#We want to see if Ozone levels are the same for each month

##################################################

#EDA
#Check airquality data set
summary(aq)
str(aq)
#Ozone has NA's. I decided to just take out those rows from the dataset
aq1 <- as.data.frame(cbind(Ozone = na.omit(aq$Ozone), Month =aq$Month[which(aq$Ozone!="NA")]))
summary(aq1)
str(aq1)


is.factor(aq1$Month) #Not a factor need to remember to change it to a factor when using anova table

## Two assumptions to check 1. normal and 2. equal variances
## plot to see if the means look different
## and look for outliers - Has a devestating effect on ANOVA so if if there are outliers, you don't want to use F test

#plot
boxplot(aq1$Ozone ~ aq1$Month) #Means of ozones in months don't look the same

##Look for normality
qqnorm(aq1$Ozone[which(aq1$Month == 5)]) #Looks good except outlier
qqnorm(aq1$Ozone[which(aq1$Month == 6)]) #Looks good except outlier
qqnorm(aq1$Ozone[which(aq1$Month == 7)]) #Looks good
qqnorm(aq1$Ozone[which(aq1$Month == 8)]) #Looks good
qqnorm(aq1$Ozone[which(aq1$Month == 9)]) #Looks okay

##After all the qqplots I am not sure if it's normal

##Look at variances. (Look to see if varaince is 10x bigger thna another. If they are then you don't use anova, but none of examples are that way)
var(aq1$Ozone[which(aq1$Month == 5)])
var(aq1$Ozone[which(aq1$Month == 6)]) 
var(aq1$Ozone[which(aq1$Month == 7)]) 
var(aq1$Ozone[which(aq1$Month == 8)]) 
var(aq1$Ozone[which(aq1$Month == 9)]) 

#None of the variances are 10 times larger than another so 
#okay to assume equal variances (Couldn't use var.test because that assumes normal, which we don't want)


#H0: mean ozone of each month is equal. 
#Ha: at least one ozone level in a month is not equal to the others

#Since I am worried about outliers I will use Kruskal-Wallis Test
kruskal.test(aq1$Ozone ~ as.factor(aq1$Month)) #P value is below .0001
#We reject H0, and there is at least one mean different from other others

pairwise.wilcox.test(aq1$Ozone, as.factor(aq1$Month))
#The means that are different from each other are: 5 and 7, 5 and 8, 7 and 9, and 8 and 9


###################################

#Question 2: Anova on Solar.R by Month. 
#We want to see if Solar.R levels are the same for each month

####################################

#EDA
#Solar.R has NA's. I decided to just take out those rows from the dataset
aq2 <- as.data.frame(cbind(Solar.R = na.omit(aq$Solar.R), Month =aq$Month[which(aq$Ozone!="NA")]))
summary(aq2)
str(aq2)

## Two assumptions to check 1. normal and 2. equal variances
## plot to see if the means look different
## and look for outliers - Has a devestating effect on ANOVA so if if there are outliers, you don't want to use F test

#plot
boxplot(aq2$Solar.R ~ aq2$Month) #Means of Solar.R in months don't look the same

##Look for normality
qqnorm(aq2$Solar.R[which(aq2$Month == 5)]) #Looks okay not good
qqnorm(aq2$Solar.R[which(aq2$Month == 6)]) #Doens't look good for normal
qqnorm(aq2$Solar.R[which(aq2$Month == 7)]) #Looks okay
qqnorm(aq2$Solar.R[which(aq2$Month == 8)]) #Looks good
qqnorm(aq2$Solar.R[which(aq2$Month == 9)]) #Looks okay

##After all the qqplots I am not sure if it's normal

##Look at variances. (Look to see if varaince is 10x bigger thna another. If they are then you don't use anova, but none of examples are that way)
var(aq2$Solar.R[which(aq2$Month == 5)])
var(aq2$Solar.R[which(aq2$Month == 6)]) 
var(aq2$Solar.R[which(aq2$Month == 7)]) 
var(aq2$Solar.R[which(aq2$Month == 8)]) 
var(aq2$Solar.R[which(aq2$Month == 9)]) 

#None of the variances are 10 times larger than another so 
#okay to assume equal variances (Couldn't use var.test because that assumes normal, which we don't want)


#H0: mean Solar.R of each month is equal. 
#Ha: at least one Solar.R level in a month is not equal to the others

#Since I am worried about normality I will use Kruskal-Wallis Test
kruskal.test(aq2$Solar.R ~ as.factor(aq2$Month)) #P value is .1313
#We can't reject H0. 


###################################

#Question 3: Anova on Wind by Month. 
#We want to see if Wind levels are the same for each month

####################################

#EDA

## Two assumptions to check 1. normal and 2. equal variances
## plot to see if the means look different
## and look for outliers - Has a devestating effect on ANOVA so if if there are outliers, you don't want to use F test

#plot
boxplot(aq$Wind ~ aq$Month) #Means of Wind in months look the sameish. 

##Look for normality
qqnorm(aq$Wind[which(aq$Month == 5)]) #Looks good
qqnorm(aq$Wind[which(aq$Month == 6)]) #Looks good 
qqnorm(aq$Wind[which(aq$Month == 7)]) #Looks okay
qqnorm(aq$Wind[which(aq$Month == 8)]) #Looks good
qqnorm(aq$Wind[which(aq$Month == 9)]) #Looks okay

##After all the qqplots I am sure I can assume normal

##Look at variances. (Look to see if varaince is 10x bigger thna another. If they are then you don't use anova, but none of examples are that way)
var(aq$Wind[which(aq$Month == 5)])
var(aq$Wind[which(aq$Month == 6)]) 
var(aq$Wind[which(aq$Month == 7)]) 
var(aq$Wind[which(aq$Month == 8)]) 
var(aq$Wind[which(aq$Month == 9)]) 

#None of the variances are 10 times larger than another so 
#okay to assume equal variances (Couldn't use var.test because that assumes normal, which we don't want)


#H0: mean Wind of each month is equal. 
#Ha: at least one Wind level in a month is not equal to the others

#Looks normal and also equal variances so I will use anova
model <- aov(aq$Wind ~ as.factor(aq$Month))
summary(model) #pvalue below .05
#We reject H0. There is at least one wind mean different per month

#Since reject H0. Let's do mutliple comparison to check which pair of means are different
plot(TukeyHSD(model)) ## I am 95% confident that months 7 and 5, 8 and 5 do not have the same means for Wind level. 

