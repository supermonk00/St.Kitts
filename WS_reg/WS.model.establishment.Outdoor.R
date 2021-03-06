model3.bestsubset  = regsubsets(model.3.dataset$AirTC_Avg_HS~.,
                               data.frame(cbind(
                                 model.3.dataset$AirTC_Avg_WS,
                                 model.3.dataset$AirTC_Avg_WS^2,
                                 model.3.dataset$AirTC_Avg_WS^3,
                                 model.3.dataset$AirTC_Avg_WS^4,
                                 model.3.dataset$AirTC_Avg_WS^5,
                                 model.3.dataset$RH_WS,
                                 model.3.dataset$RH_WS^2,
                                 model.3.dataset$RH_WS^3,
                                 model.3.dataset$RH_WS^4,
                                 model.3.dataset$RH_WS^5,
                                 model.3.dataset$VWC_Avg,
                                 model.3.dataset$VWC_Avg^2,
                                 model.3.dataset$VWC_Avg^3,
                                 model.3.dataset$VWC_Avg^4,
                                 model.3.dataset$VWC_Avg^5,
                                 model.3.dataset$EC_Avg,
                                 model.3.dataset$EC_Avg^2,
                                 model.3.dataset$EC_Avg^3,
                                 model.3.dataset$EC_Avg^4,
                                 model.3.dataset$EC_Avg^5,
                                 model.3.dataset$T_Avg,
                                 model.3.dataset$T_Avg^2,
                                 model.3.dataset$T_Avg^3,
                                 model.3.dataset$T_Avg^4,
                                 model.3.dataset$T_Avg^5,
                                 model.3.dataset$SlrW,
                                 model.3.dataset$SlrW^2,
                                 model.3.dataset$SlrW^3,
                                 model.3.dataset$SlrW^4,
                                 model.3.dataset$SlrW^5,
                                 model.3.dataset$SlrMJ_Tot,
                                 model.3.dataset$SlrMJ_Tot^2,
                                 model.3.dataset$SlrMJ_Tot^3,
                                 model.3.dataset$SlrMJ_Tot^4,
                                 model.3.dataset$SlrMJ_Tot^5,
                                 model.3.dataset$WS_ms_Avg,
                                 model.3.dataset$WS_ms_Avg^2,
                                 model.3.dataset$WS_ms_Avg^3,
                                 model.3.dataset$WS_ms_Avg^4,
                                 model.3.dataset$WS_ms_Avg^5
                                 )),nvmax =52 , nbest = 3,method = "forward")

reg.summary = summary(model3.bestsubset)
plot(model3.bestsubset, scale = "bic")
plot(model3.bestsubset, scale = "Cp")
md1 = coef(model3.bestsubset,which(rank(reg.summary$bic) == 1))
md2 = coef(model3.bestsubset,which(rank(reg.summary$bic) == 2))
md3 = coef(model3.bestsubset,which(rank(reg.summary$bic) == 3))

# cross validation
set.seed(15112)
train = model.3.dataset[sample(nrow(model.3.dataset),nrow(model.3.dataset)*0.8),]
test = model.3.dataset[-(sample(nrow(model.3.dataset),nrow(model.3.dataset)*0.8)),]


train.control <- trainControl(method = "cv", number = 10)


model1 <- train(data.frame(cbind(model.3.dataset$AirTC_Avg_WS,
                                 model.3.dataset$AirTC_Avg_WS^5,
                                 model.3.dataset$RH_WS,
                                 model.3.dataset$VWC_Avg,
                                 model.3.dataset$VWC_Avg^2,
                                 model.3.dataset$VWC_Avg^3,
                                 model.3.dataset$VWC_Avg^4,
                                 model.3.dataset$VWC_Avg^5,
                                 model.3.dataset$EC_Avg,
                                 model.3.dataset$EC_Avg^2,
                                 model.3.dataset$EC_Avg^3,
                                 model.3.dataset$EC_Avg^4,
                                 model.3.dataset$EC_Avg^5,
                                 model.3.dataset$T_Avg,
                                 model.3.dataset$T_Avg^2,
                                 model.3.dataset$T_Avg^4,
                                 model.3.dataset$T_Avg^5,
                                 model.3.dataset$SlrW,
                                 model.3.dataset$SlrW^2,
                                 model.3.dataset$SlrW^3,
                                 model.3.dataset$SlrW^4,
                                 model.3.dataset$SlrW^5,
                                 model.3.dataset$SlrMJ_Tot,
                                 model.3.dataset$SlrMJ_Tot^2,
                                 model.3.dataset$SlrMJ_Tot^3,
                                 model.3.dataset$SlrMJ_Tot^5,
                                 model.3.dataset$WS_ms_Avg,
                                 model.3.dataset$WS_ms_Avg^2)),
                model.3.dataset$AirTC_Avg_HS, method = "lm",
                trControl = train.control)

model2 <- train(data.frame(cbind(model.3.dataset$AirTC_Avg_WS,
                                 model.3.dataset$AirTC_Avg_WS^4,
                                 model.3.dataset$RH_WS,
                                 model.3.dataset$VWC_Avg,
                                 model.3.dataset$VWC_Avg^2,
                                 model.3.dataset$VWC_Avg^3,
                                 model.3.dataset$VWC_Avg^4,
                                 model.3.dataset$VWC_Avg^5,
                                 model.3.dataset$EC_Avg,
                                 model.3.dataset$EC_Avg^2,
                                 model.3.dataset$EC_Avg^3,
                                 model.3.dataset$EC_Avg^4,
                                 model.3.dataset$EC_Avg^5,
                                 model.3.dataset$T_Avg,
                                 model.3.dataset$T_Avg^2,
                                 model.3.dataset$T_Avg^4,
                                 model.3.dataset$T_Avg^5,
                                 model.3.dataset$SlrW,
                                 model.3.dataset$SlrW^2,
                                 model.3.dataset$SlrW^3,
                                 model.3.dataset$SlrW^4,
                                 model.3.dataset$SlrW^5,
                                 model.3.dataset$SlrMJ_Tot,
                                 model.3.dataset$SlrMJ_Tot^2,
                                 model.3.dataset$SlrMJ_Tot^3,
                                 model.3.dataset$SlrMJ_Tot^5,
                                 model.3.dataset$WS_ms_Avg,
                                 model.3.dataset$WS_ms_Avg^2)),
                model.3.dataset$AirTC_Avg_HS, method = "lm",
                trControl = train.control)

model3 <- train(data.frame(cbind(model.3.dataset$AirTC_Avg_WS,
                                 model.3.dataset$AirTC_Avg_WS^5,
                                 model.3.dataset$RH_WS,
                                 model.3.dataset$VWC_Avg,
                                 model.3.dataset$VWC_Avg^2,
                                 model.3.dataset$VWC_Avg^3,
                                 model.3.dataset$VWC_Avg^4,
                                 model.3.dataset$VWC_Avg^5,
                                 model.3.dataset$EC_Avg,
                                 model.3.dataset$EC_Avg^2,
                                 model.3.dataset$EC_Avg^3,
                                 model.3.dataset$EC_Avg^4,
                                 model.3.dataset$EC_Avg^5,
                                 model.3.dataset$T_Avg,
                                 model.3.dataset$T_Avg^2,
                                 model.3.dataset$T_Avg^3,
                                 model.3.dataset$T_Avg^4,
                                 model.3.dataset$T_Avg^5,
                                 model.3.dataset$SlrW,
                                 model.3.dataset$SlrW^2,
                                 model.3.dataset$SlrW^3,
                                 model.3.dataset$SlrW^4,
                                 model.3.dataset$SlrW^5,
                                 model.3.dataset$SlrMJ_Tot,
                                 model.3.dataset$SlrMJ_Tot^2,
                                 model.3.dataset$SlrMJ_Tot^3,
                                 model.3.dataset$SlrMJ_Tot^5,
                                 model.3.dataset$WS_ms_Avg,
                                 model.3.dataset$WS_ms_Avg^2)),
                model.3.dataset$AirTC_Avg_HS, method = "lm",
                trControl = train.control)
rbind(model1$results,model2$results,model3$results)

# vif test
vif(lm(model.3.dataset$AirTC_Avg_HS~model.3.dataset$AirTC_Avg_WS+
       model.3.dataset$AirTC_Avg_WS^4+
       model.3.dataset$RH_WS+
       model.3.dataset$VWC_Avg+
       model.3.dataset$VWC_Avg^2+
       model.3.dataset$VWC_Avg^3+
       model.3.dataset$VWC_Avg^4+
       model.3.dataset$VWC_Avg^5+
       model.3.dataset$EC_Avg+
       model.3.dataset$EC_Avg^2+
       model.3.dataset$EC_Avg^3+
       model.3.dataset$EC_Avg^4+
       model.3.dataset$EC_Avg^5+
       model.3.dataset$T_Avg+
       model.3.dataset$T_Avg^2+
       model.3.dataset$T_Avg^3+
       model.3.dataset$T_Avg^4+
       model.3.dataset$T_Avg^5+
       model.3.dataset$SlrW+
       model.3.dataset$SlrW^2+
       model.3.dataset$SlrW^3+
       model.3.dataset$SlrW^4+
       model.3.dataset$SlrW^5+
       model.3.dataset$SlrMJ_Tot+
       model.3.dataset$SlrMJ_Tot^2+
       model.3.dataset$SlrMJ_Tot^3+
       model.3.dataset$SlrMJ_Tot^5+
       model.3.dataset$WS_ms_Avg+
       model.3.dataset$WS_ms_Avg^2))
### LASSO Reg
library(glmnet) 
library(caret)
set.seed(15112)
train = model.3.dataset[sample(nrow(model.3.dataset),nrow(model.3.dataset)*0.8),]
test = model.3.dataset[-(sample(nrow(model.3.dataset),nrow(model.3.dataset)*0.8)),]

x_train = as.matrix(cbind(train$AirTC_Avg_WS,
                          train$AirTC_Avg_WS^4,
                          train$RH_WS,
                          train$VWC_Avg,
                          train$VWC_Avg^2,
                          train$VWC_Avg^3,
                          train$VWC_Avg^4,
                          train$VWC_Avg^5,
                          train$EC_Avg,
                          train$EC_Avg^2,
                          train$EC_Avg^3,
                          train$EC_Avg^4,
                          train$EC_Avg^5,
                          train$T_Avg,
                          train$T_Avg^2,
                          train$T_Avg^4,
                          train$T_Avg^5,
                          train$SlrW,
                          train$SlrW^2,
                          train$SlrW^3,
                          train$SlrW^4,
                          train$SlrW^5,
                          train$SlrMJ_Tot,
                          train$SlrMJ_Tot^2,
                          train$SlrMJ_Tot^3,
                          train$SlrMJ_Tot^5,
                          train$WS_ms_Avg,
                          train$WS_ms_Avg^2))

y_train = train$AirTC_Avg_HS

x_test = as.matrix(cbind(test$AirTC_Avg_WS,
                         test$AirTC_Avg_WS^4,
                         test$RH_WS,
                         test$VWC_Avg,
                         test$VWC_Avg^2,
                         test$VWC_Avg^3,
                         test$VWC_Avg^4,
                         test$VWC_Avg^5,
                         test$EC_Avg,
                         test$EC_Avg^2,
                         test$EC_Avg^3,
                         test$EC_Avg^4,
                         test$EC_Avg^5,
                         test$T_Avg,
                         test$T_Avg^2,
                         test$T_Avg^4,
                         test$T_Avg^5,
                         test$SlrW,
                         test$SlrW^2,
                         test$SlrW^3,
                         test$SlrW^4,
                         test$SlrW^5,
                         test$SlrMJ_Tot,
                         test$SlrMJ_Tot^2,
                         test$SlrMJ_Tot^3,
                         test$SlrMJ_Tot^5,
                         test$WS_ms_Avg,
                         test$WS_ms_Avg^2))
y_test = test$AirTC_Avg_HS

lambdas <- 10^seq(2, -3, by = -.1)

# Setting alpha = 1 implements lasso regression
lasso_reg <- cv.glmnet(x_train, y_train, alpha = 1, lambda = lambdas, standardize = TRUE, nfolds = 5)

# Best 
lambda_best <- lasso_reg$lambda.min 
lasso_model <- glmnet(x_train, y_train, alpha = 1, lambda = lambda_best, standardize = TRUE)

eval_results = function(true, predicted, df) {
  SSE = sum((predicted - true)^2)
  SST = sum((true - mean(true))^2)
  R_square = 1 - SSE / SST
  RMSE = sqrt(SSE/nrow(df))
  MAE = sum(abs(predicted - true))/nrow(df)
  
  
  # Model performance metrics
  data.frame(
    RMSE = RMSE,
    Rsquare = R_square,
    MAE = MAE
  )
  
}

predictions_train <- predict(lasso_model, s = lambda_best, newx = x_train)
eval_results(y_train, predictions_train, train)

predictions_test <- predict(lasso_model, s = lambda_best, newx = x_test)
eval_results(y_test, predictions_test, test)





coef = rbind(lasso_model$a0,lasso_model$beta) %>%
  as.matrix()

basic_mat = model.matrix(model.3.dataset$AirTC_Avg_HS~.,
                         data.frame(cbind(model.3.dataset$AirTC_Avg_WS,
                                          model.3.dataset$AirTC_Avg_WS^4,
                                          model.3.dataset$RH_WS,
                                          model.3.dataset$VWC_Avg,
                                          model.3.dataset$VWC_Avg^2,
                                          model.3.dataset$VWC_Avg^3,
                                          model.3.dataset$VWC_Avg^4,
                                          model.3.dataset$VWC_Avg^5,
                                          model.3.dataset$EC_Avg,
                                          model.3.dataset$EC_Avg^2,
                                          model.3.dataset$EC_Avg^3,
                                          model.3.dataset$EC_Avg^4,
                                          model.3.dataset$EC_Avg^5,
                                          model.3.dataset$T_Avg,
                                          model.3.dataset$T_Avg^2,
                                          model.3.dataset$T_Avg^4,
                                          model.3.dataset$T_Avg^5,
                                          model.3.dataset$SlrW,
                                          model.3.dataset$SlrW^2,
                                          model.3.dataset$SlrW^3,
                                          model.3.dataset$SlrW^4,
                                          model.3.dataset$SlrW^5,
                                          model.3.dataset$SlrMJ_Tot,
                                          model.3.dataset$SlrMJ_Tot^2,
                                          model.3.dataset$SlrMJ_Tot^3,
                                          model.3.dataset$SlrMJ_Tot^5,
                                          model.3.dataset$WS_ms_Avg,
                                          model.3.dataset$WS_ms_Avg^2)))

### Predictive power evaluation

predict  = basic_mat %*% coef %>%
  as.numeric()
actual =  model.3.dataset$AirTC_Avg_HS

eval_results(actual, predict, model.3.dataset)

### Descriptive statistics
library(ggplot2)
plot.dataset = rbind(
  data.frame(Time = as.POSIXct(model.3.dataset$TIMESTAMP), Temperature = model.3.dataset$AirTC_Avg_WS, Category = "AWS"),
  data.frame(Time = as.POSIXct(model.3.dataset$TIMESTAMP), Temperature = actual, Category = "MS:Actual"),
  data.frame(Time = as.POSIXct(model.3.dataset$TIMESTAMP), Temperature = predict, Category = "Predict")
)

plot.dataset.0202 = plot.dataset %>%
  filter(month(Time) == 2, day(Time) == 2)

p.model.outdoor = ggplot(plot.dataset.0202, aes(x = Time, y = Temperature, color = Category))+
  geom_line() + 
  labs(title = "Fluctuation of daily temperature", 
       subtitle = "Date:2020/2/2",y = "Air temperature",
       caption = "Model:outdoor field nowcast")+
  scale_color_manual(values=c('dark blue','dark red','#404040'))



plot.dataset.scatter.outdoor = data.frame(predict= predict,
                                        actual = actual)


p.scatter.actual.vs.predict.outdoor  = ggplot(plot.dataset.scatter.outdoor, aes(x = actual , y =predict),size = 0.5)+
  geom_point(alpha = 0.3,size = 0.7,color="#404040")+
  labs(x = "Actual values", y = "Predictive values",
       title = "Air temperature: Actual vs. Predictive values",
       caption = "Model:outdoor field nowcast")+
  coord_cartesian(xlim = c(22, 44), ylim = c(22, 44))



#discussion: SLR vs. ML
SLR = lm(model.3.dataset$AirTC_Avg_HS~model.3.dataset$AirTC_Avg_WS)
new = data.frame(model.3.dataset$AirTC_Avg_WS)
SLR.predict = predict(SLR,new) %>%
  as.numeric()
eval_results(actual, SLR.predict, model.1.dataset)

