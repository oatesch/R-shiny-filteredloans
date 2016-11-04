#load data
loans <- read.csv('loandata.csv', stringsAsFactors = T)

#replace blanks with NA
loans[loans==""] <- NA

#correct order of Ratings (AA higher than A)
Ratings <- c("AA", "A", "B", "C", "D", "E", "F", "HR")
loans$Rating <- factor(loans$Rating, levels = Ratings)
#Define Line Colours
RatingCols <- brewer.pal(length(levels(loans$Rating))+1,"Set1") #+1 for average line
names(RatingCols) <- c(levels(loans$Rating),"Avg")


#correct order of WorkExperience
WorkEx <- c("LessThan2Years",
            "2To5Years",
            "5To10Years",
            "10To15Years",
            "15To25Years",
            "MoreThan25Years")
loans$WorkExperience <- factor(loans$WorkExperience, levels = WorkEx)


#define useful columns (comment out for development)
useful <- c(
  "ProbabilityOfDefault",
  "Rating",
  "Country",
  "IncomeTotal",
  "MonthlyPayment",
  "FreeCash",
  "MonthlyPayment",
  "WorkExperience",
  "Age",
  "Amount",
  "AppliedAmount",
  "Interest",
  "LoanDuration",
  "MonthlyPayment",
  "UseOfLoan",
  "Education",
  "WorkExperience",
  "FreeCash",
  "LastPaymentOn",
  "Status",
  "RecoveryStage",
  "PrincipalPaymentsMade",
  "InterestAndPenaltyPaymentsMade",
  "ExpectedReturn",
  "FirstPaymentDate",
  "BidsManual",
  "BidsPortfolioManager",
  "BidsApi",
  "LossGivenDefault"
)
  



#strip rows with no Rating and non-useful columns
loans <- loans[!is.na(loans$Rating),useful]




#Save  dataset, hash of csv and files
SHAloan <-  paste0(sha1('loandata.csv'), sha1('ui.R'), sha1('server.R'), sha1('import.R'))
save(SHAloan,loans,Ratings,WorkEx,RatingCols,file="envir.Rdata")

#clean up
rm(useful)