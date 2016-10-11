attach(locof)

str(locof)

line <- as.factor(line)
trial <- as.factor(trial)
block <- as.factor(block)
sex <-as.factor(sex)
plate <-as.factor(plate)

summary(locof)

install.packages('car')


modlf <-lmer(dist~sex+line+sex:line+(1|block)+
                (1|blockday)+(1|blockdaytrial)+(1|plate)+(1|comp), REML=FALSE)

Anova(modlf, type='III')


modlfa <-lmer(dist~sex + line +(1|block)+
                (1|blockday)+(1|blockdaytrial)+(1|plate)+(1|comp), REML=FALSE)

anova(modlf, modlfa)
# two models are significantly different, therefore need to included interaction in test


modlfb <-lmer(dist~line+(1|block)+
                (1|blockday)+(1|blockdaytrial)+(1|plate)+(1|comp), REML=FALSE)

anova(modlfa, modlfb)
# models are again significantly, therefore both sex and line are needed...

modlfc <-lmer(dist~sex+(1|block)+
                (1|blockday)+(1|blockdaytrial)+(1|plate)+(1|comp), REML=FALSE)

anova(modlfc, modlfa)

modlfd <-lmer(dist~line+sex:line+(1|block)+
                (1|blockday)+(1|blockdaytrial)+(1|plate)+(1|comp), REML=FALSE)

anova(modlfd, modlf)
### creating nests ####
locof$blockday<-paste(locof$block, locof$day, sep=".")
locof$blockdaytrial<-paste(locof$blockday, locof$trial, sep=".")


#### model test #####
modd <-lmer(dist~sex+line+sex:line+(1|block)+(1|blockday)+(1|blockdaytrial)+(1|comp)+(1|plate), REML=FALSE)
summary(modd)
Anova(modd, type='III')

##### interaction plot #####

#original interaction plot
interaction.plot(sex, line, dist)

plot(dist~line*sex)


female <- subset(locof,subset=locof$sex=='F')
male <-subset(locof,subset=locof$sex=='M')
boxplot(male$dist)
boxplot(female$dist)

line301 <- subset(locof,subset=locof$line=='301')
boxplot(line301$dist)
boxplot(line301$dist~line301$sex)


line712 <- subset(locof,subset=locof$line=='712')
boxplot(line712$dist)
boxplot(line712$dist~line712$sex)

line25120 <- subset(locof,subset=locof$line=='25120')
boxplot(line25120$dist)
boxplot(line25120$dist~line25120$sex)

line304 <- subset(locof,subset=locof$line=='304')
boxplot(line304$dist)
boxplot(line304$dist~line304$sex)


line555 <- subset(locof,subset=locof$line=='555')
boxplot(line555$dist)
boxplot(line555$dist~line555$sex)

line774 <- subset(locof,subset=locof$line=='774')
boxplot(line774$dist)
boxplot(line774$dist~line774$sex)


# all interaction effects are positive (so males are always faster than females... but it's not always
# statistically significant)

plot(female$dist~male$dist)
abline(lm(female$dist~male$dist))

detach(locof)


mean(female$dist)
mean(male$dist)


attach(loco_sex)
plot(F~M)
summary(lm(F~M))
abline(lm(F~M))

detach(loco_sex)

attach(averages)
t.test(Fav,Mav, paired=TRUE)
boxplot(Fav,Mav)

plot(Fav~Mav)
summary(lm(Fav~Mav))
abline(lm(Fav~Mav))


attach(avrfit)

summary(avrfit)

block <- as.factor(block)
is.factor(block)
line <-as.factor(line)
is.factor(line)
is.numeric(pupa)

rmod <- lmer(pupa~line+(1|block))
summary(rmod)
Anova(rmod)
plot(pupa~line)

#### fitness correlation ####
attach(fcorr)

summary(fcorr)

LINE <- as.factor(LINE)
Line <- as.factor(Line)

plot(FFIT~Fav)
abline(lm(FFIT~Fav))
summary(lm(FFIT~Fav))

# no relationship between reproductive fitness and locomotion


### male fitness ####

attach(mfit)
summary(mfit)
Line <- as.factor(Line)
Line.1 <-as.factor(Line.1)
plot(Fert~Mav)
abline(lm(Fert~Mav))
summary(lm(Fert~Mav))

