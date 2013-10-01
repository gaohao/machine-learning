function Pred_per = perceptron_test(model, Xtest)

s = sign(Xtest * model.v') * model.c;
Pred_per = (sign(s) + 1) / 2;
