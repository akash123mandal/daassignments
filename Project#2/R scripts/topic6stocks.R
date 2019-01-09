#assumption, choosing to predict closing value

library(zoo)
library(ggplot2)
library(tseries)
library(forecast)

STOCKS$Date <- as.Date(STOCKS$Date)
ZOO <- zoo(STOCKS$Close, order.by = STOCKS$Date)
time_series <- ts(ZOO)

ggplot(STOCKS, aes(Date, Close)) + geom_line() + scale_x_date('month')  + ylab("Close values") +
  xlab("")

STOCKS$clean_ts = tsclean(time_series)
clean_ts = STOCKS$clean_ts

ggplot() +
  geom_line(data = STOCKS, aes(x = Date, y = clean_ts)) + ylab('Close Values')

adf.test(clean_ts, alternative = "stationary")

close_ma30 <- ma(clean_ts, order = 30)

fit <- auto.arima(close_ma30, seasonal = FALSE)
print(fit)
fcast <- forecast(fit, h = 2)
print(fcast)

fit <- auto.arima(clean_ts, seasonal = FALSE)
print(fit)
fcast <- forecast(fit, h = 51)
print(fcast)
