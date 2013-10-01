function accuracy = perceptron_run(Xtrain, Ytrain, Xtest, Ytest)

model = perceptron_train(Xtrain, Ytrain);
Pred_per = perceptron_test(model, Xtest);
save('Pred_per.mat', 'Pred_per');

a = sum((Pred_per == 0) & (Ytest == 0));
b = sum((Pred_per == 1) & (Ytest == 0));
c = sum((Pred_per == 0) & (Ytest == 1));
d = sum((Pred_per == 1) & (Ytest == 1));

precision = d / (b + d);
recall = d / (c + d);
accuracy = (a + d) / (a + b + c + d);

fprintf('P:%.3f, R:%.3f, A:%.3f\n', precision, recall, accuracy);