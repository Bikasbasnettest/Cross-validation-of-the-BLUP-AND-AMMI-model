setwd("E:/MNCH 74-75W Report to press basnet/Blup analyis sample data")
BLUP<-read.csv("E:/MNCH 74-75W Report to press basnet/Blup analyis sample data/MODCV.csv")
attach(BLUP)
print(BLUP)
library(metan)
?cv_ammif
ammi1<-cv_ammif(BLUP, ENV, GEN, REP, Y.ha,  design = "RCBD",
 nboot = 5, verbose = TRUE
)
ammi10<-cv_ammi(BLUP, ENV, GEN, REP, NKE, naxis = 0)
ammi11<-cv_ammi(BLUP, ENV, GEN, REP, NKE, naxis = 2)
ammi12<-cv_ammi(BLUP, ENV, GEN, REP, NKE, naxis = 3)
AMMI13<-cv_ammif(BLUP, ENV, GEN, REP, NKE)

#for the Genotypes vs Environment Random effect
BLUPG<-cv_blup(BLUP, ENV, GEN, REP, NKE, random = "gen")
#random model for all term
BLUPG1<-cv_blup(BLUP, ENV, GEN, REP, NKE, random = "all")
#for visualization of the Results 
bind_means<-bind_cv(AMMI13, BLUPG, BLUPG1, bind = "means")
print(bind_means$RMSPD)#RMSPD is the Root mean squre predictons
#to combine the all results
bind_ammi<-bind_cv(ammi10, ammi11, ammi12)
bind_ammi_blup<-bind_cv(AMMI13, BLUPG, BLUPG1)
Biku<-plot(bind_ammi, violin = TRUE)
Biku1<-plot(bind_ammi_blup)
biku3<-plot(bind_ammi_blup, order_box = TRUE)
arrange_ggplot(Biku1, Biku1, biku3, tag_levels = "a")
?cv_ammi

