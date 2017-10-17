

# Source:
# https://datahub.io/core/euribor

# https://www.ecb.europa.eu/events/pdf/conferences/bernoth_final.pdf

# http://a-little-book-of-r-for-time-series.readthedocs.io/en/latest/src/timeseries.html

# https://research.fb.com/prophet-forecasting-at-scale/

# auto.arima
# https://www.rdocumentation.org/packages/forecast/versions/8.1/topics/auto.arima

# https://www.r-bloggers.com/time-series-analysis-using-r-forecast-package/

# https://www.rdocumentation.org/packages/forecast/versions/8.1/topics/auto.arima

# https://github.com/robjhyndman/forecast

# http://ec.europa.eu/eurostat

# http://es.inflation.eu/tasas-de-inflacion/europa/inflacion-europa.aspx

# https://data.worldbank.org/indicator/FR.INR.RINR?locations=ES



#euribor <- read.csv("C:\\Users\\cmoreno\\Desktop\\Euribor\\euribor\\data\\euribor-12m-monthly.csv", sep=",", header = TRUE)

# Read Euribor Dataset from Github
euribor <- read.csv("https://raw.githubusercontent.com/caiomsouza/forecast-euribor/master/euribor/data/euribor-12m-monthly.csv", sep=",", header = TRUE)


euribor

summary(euribor)

euribor.df <- as.data.frame(euribor)

# Remove columns maturity_level and granularity
euribor.df <- euribor.df[, setdiff(names(euribor.df), c("maturity_level", "granularity"))]
euribor.df


plot(euribor.df)

#install.packages("ggplot2")
#library(ggplot2)

#install.packages("prophet")
#library(prophet)

#install.packages("Rcpp")
#library("Rcpp")

#install.packages("forecast")
library(forecast)


#https://research.fb.com/prophet-forecasting-at-scale/


# https://cran.r-project.org/web/packages/forecast/forecast.pdf


ts = ts(euribor.df)
ts
plot(ts[,2])
plot(ts[,2],type="o",col="blue") 


ts[,1]
ts[,2]

ts

# Predict using Auto Arima
fit <- auto.arima(ts[,2])
plot(forecast(fit,h=20))

# 30 years x 12 months = 360 months
# Predict using Auto Arima for 120 months
fit <- auto.arima(ts[,2])
plot(forecast(fit,h=360))
fit
fit$residuals
fit$fitted
fit$x


# Predict using Auto Arima for 120 months
fit <- auto.arima(ts[,2])
plot(forecast(fit,h=120))

# Predict using Auto Arima for 3 months
fit <- auto.arima(ts[,2])
plot(forecast(fit,h=3))


# Predict using Auto Arima for 48 months
fit <- auto.arima(ts[,2])
plot(forecast(fit,h=48))

# Predict using Auto Arima for 12 months
fit <- auto.arima(ts[,2])
plot(forecast(fit,h=12))

# Predict using Auto Arima for 6 months
fit <- auto.arima(ts[,2])
plot(forecast(fit,h=6))

# Predict using Auto Arima for 6 months
fit <- auto.arima(ts[,2])
plot(forecast(fit,h=6))

#12 months x 10 years = 120 months




