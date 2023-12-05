library(tabplot)
library("performance")
library(readxl)
library(dplyr)
library(lubridate)
library(ggplot2)
library(tidyr)
library(ggsci)
library(ggpubr)
library(FastaUtils)
library(ape)
library(TreeTools)
library(phylotools)
library(gtsummary)
library(MASS)
library(car)
library(gt)
library(OddsPlotty)
library(effects)


Data<-read.csv("../091323inp_adlt_ND_boolean.csv",stringsAsFactors = T)

Data$Week<-cut(ymd(Data$Date_of_Flu_Lab),breaks ="week")  

Data$Week<-ymd(Data$Week)

Data$Month<-cut(ymd(Data$Date_of_Flu_Lab),breaks ="month")  

Data$Month<-ymd(Data$Month)

CDC<-read.csv("../CDC Testing and Detection Data.csv",stringsAsFactors = T)
CDC$Week<-cut(mdy(CDC$Week.ending.Date),breaks ="week")
#PercPositivity<-aggregate(X3.Week.Average.Percent.Positivity~Week,CDC,mean)
#TotalTests<-aggregate(X3.Week.Average.Total.Tests~Week,CDC,sum)

CDC_Month<-merge(PercPositivity,TotalTests,by="Week")

CDC$Week<-ymd(CDC$Week)


CDC%>%
  ggplot(aes(x = Week, y= X3.Week.Average.Percent.Positivity))+
  geom_point()+
  theme_pubr()+
  scale_x_date(date_labels = "%b-%Y",date_breaks = "3 months")+rotate_x_text(45)




#tableplot(Data[,-c(1,3)],sortCol = 'Lab',nCols = 10)

Data$comorbidity_sum<-as.numeric(as.character(Data$comorbidity_sum))

Data$AnyComorbidity<-ifelse(Data$comorbidity_sum>0,1,0)



colnames(Data)



Data_Simple<-Data%>%dplyr::select(gender,race,ethnic_group,subtype,bmi,Age_at_Admission,comorbidity_sum,
                            ICU,RSV_att_dth,Month,LOS_Hospitalization)

Data_Simple<-Data_Simple%>%filter(subtype%in%c("A","B"))%>%droplevels()

Data_Simple$comorbidity_sum<-as.numeric(as.character(Data_Simple$comorbidity_sum))

Data_Simple$race<-relevel(Data_Simple$race,ref="White")
Data_Simple$ethnic_group<-relevel(Data_Simple$ethnic_group,ref="Not Hispanic or Latino")


table2 <- 
  tbl_summary(
    Data_Simple,
    by = subtype, # split table by group
    missing = "no" # don't list missing data separately
  ) %>%
  add_n() %>% # add column with total number of non-missing observations
  add_p() %>% # test for a difference between groups
  modify_header(label = "**Variable**") %>% # update the column header
  bold_labels() 

table2

tableplot(Data_Simple,sortCol = 'subtype')

Data_Simple%>%
  ggplot(aes(x = subtype, y= ICU,color=subtype))+
  geom_boxplot(outlier.shape = NA)+geom_point(position = position_jitterdodge())+
  theme_pubr()+scale_color_lancet()

Data_Simple%>%
  ggplot(aes(x = subtype, y= as.factor(ICU),color=subtype))+
  geom_count()+
  scale_size(range = c(1, 20))+theme_pubr()

Data_Simple%>%
  ggplot(aes(x=season,fill=as.factor(ICU)))+geom_bar(position = "fill")+theme_pubr()+scale_fill_lancet()+rotate_x_text(45)+
  facet_grid(.~subtype)

Data_Simple%>%
  ggplot(aes(x = subtype),y= as.factor(ICU))+
  geom_bar(position = "fill",aes(fill= as.factor(ICU)))

Data_Simple%>%
  ggplot(aes(x = as.factor(Month)),y= as.factor(ICU))+
  geom_bar(position = "fill",aes(fill= as.factor(ICU)))+facet_grid(.~subtype)

Data_Simple%>%
  ggplot(aes(x = season, y= as.factor(ICU),color=subtype))+
  geom_bar()+
  scale_size(range = c(1, 10))

Data_Simple%>%
  ggplot(aes(x = season, y= LOS,color=season))+
  geom_boxplot(outlier.shape = NA)+geom_point(position = position_jitterdodge())+
  theme_pubr()


Data_Simple%>%
  ggplot(aes(x = as.factor(ICU), y= comorbidity_sum,color=as.factor(ICU)))+
  geom_boxplot(outlier.shape = NA)+geom_point(position = position_jitterdodge())+
  theme_pubr()


model_glm = glm(subtype ~ . , family="binomial",data=Data_Simple) ####data = na.omit(Data_Simple%>%dplyr::select(-season)))
summary(model_glm)

tbl_regression(model_glm, exponentiate = TRUE)%>%bold_p(t = 0.05)%>%
  as_gt() %>%
  gt::tab_header(
    title = gt::md("**RSVA vs RSVB**"),
    subtitle = gt::md("full model")
  )

step.model <- model_glm %>% stepAIC(trace = T,direction="both")
coef(step.model)
step.model$anova
Anova(step.model, type="III")
summary(step.model)

qqnorm(resid(step.model))
qqline(resid(step.model))
hist(resid(step.model))
plot(fitted(step.model),resid(step.model))
abline(h=0)

check_model(step.model)
r2(step.model)
multicollinearity(step.model)


plot(effect(step.model,term=c("ICU")),ylab="Prob")
plot(predictorEffects(step.model, ~ .),style="stacked",lines=list(col=c("#49B9D2","magenta4","#E44C35")))


tbl_regression(step.model, exponentiate = TRUE)%>%bold_p(t = 0.05)%>%
  as_gt() %>%
  gt::tab_header(
    title = gt::md("**RSVA vs RSVB**"),
    subtitle = gt::md("step model")
  )



odds_plot(model_glm)
odds_plot(step.model)


# DataEpi<-Data%>%dplyr::select(Week,gender,race,ethnic_group,subtype,bmi,Age_at_Admission,
#                               ICU,RSV_att_dth,season,LOS)
# 
# DataEpi<-DataEpi%>%filter(subtype%in%c("A","B"))%>%droplevels()
# 
# DataEpi<-merge(DataEpi,CDC[,c(3,5,6)],by="Week")
# 
# model_glm_1 = glm(subtype ~ . , family="binomial", data = na.omit(DataEpi%>%dplyr::select(-season,-Week)))
# summary(model_glm_1)
# 
# plot(predictorEffects(model_glm_1, ~ .),style="stacked",lines=list(col=c("#49B9D2","magenta4","#E44C35")))
# 
# 
# tbl_regression(model_glm_1, exponentiate = TRUE)%>%bold_p(t = 0.05)%>%
#   as_gt() %>%
#   gt::tab_header(
#     title = gt::md("**RSVA vs RSVB**"),
#     subtitle = gt::md("model step with epi")
#   )
# 
# odds_plot(model_glm_1)
# 
# 
# step.model.1 <- model_glm_1 %>% stepAIC(trace = T,direction="both")
# coef(step.model.1)
# step.model.1$anova
# Anova(step.model.1, type="III")
# summary(step.model.1)
# 
# tbl_regression(step.model.1, exponentiate = TRUE)%>%bold_p(t = 0.05)%>%
#   as_gt() %>%
#   gt::tab_header(
#     title = gt::md("**RSVA vs RSVB**"),
#     subtitle = gt::md("model step with epi")
#   )
# 
# odds_plot(step.model.1)
# 
# DataEpi%>%
#   ggplot(aes(x = subtype, y= X3.Week.Average.Total.Tests,color=subtype))+
#   geom_boxplot(outlier.shape = NA)+geom_point(position = position_jitterdodge())+
#   theme_pubr()
# 
# DataEpi%>%
#   ggplot(aes(x = season, y= X3.Week.Average.Percent.Positivity,color=subtype))+
#   geom_boxplot(outlier.shape = NA)+geom_point(position = position_jitterdodge())+
#   theme_pubr()+rotate_x_text(45)



model_glm_prepandemic = glm(subtype ~ . , family="binomial", data = Data_Simple%>%filter(Month<ymd("2020-03-01")))
summary(model_glm)

tbl_regression(model_glm_prepandemic, exponentiate = TRUE)%>%bold_p(t = 0.05)%>%
  as_gt() %>%
  gt::tab_header(
    title = gt::md("**RSVA vs RSVB**"),
    subtitle = gt::md("full model prepandemic")
  )

odds_plot(model_glm_prepandemic)

step.model_prepandemic <- model_glm_prepandemic %>% stepAIC(trace = T,direction="both")
coef(step.model_prepandemic)
step.model_prepandemic$anova
Anova(step.model_prepandemic, type="III")
summary(step.model_prepandemic)


tbl_regression(step.model_prepandemic, exponentiate = TRUE)%>%bold_p(t = 0.05)%>%
  as_gt() %>%
  gt::tab_header(
    title = gt::md("**RSVA vs RSVB**"),
    subtitle = gt::md("model step prepandemic")
  )

odds_plot(step.model_prepandemic)





model_glm_1_prepandemic = glm(subtype ~ Age_at_Admission+RSV_att_dth+comorbidity_sum+ICU+X3.Week.Average.Percent.Positivity+X3.Week.Average.Total.Tests , family="binomial", data = na.omit(DataEpi%>%filter(!(season%in%c("2019-2020", "2021-2022", "2022-2023")))%>%dplyr::select(-season,-Week)))
summary(model_glm_1_prepandemic)

plot(predictorEffects(model_glm_1_prepandemic, ~ .),style="stacked",lines=list(col=c("#49B9D2","magenta4","#E44C35")))


tbl_regression(model_glm_1_prepandemic, exponentiate = TRUE)%>%bold_p(t = 0.05)%>%
  as_gt() %>%
  gt::tab_header(
    title = gt::md("**RSVA vs RSVB**"),
    subtitle = gt::md("model step with epi prepandemic")
  )

odds_plot(model_glm_1_prepandemic)
