function accuracy = lr_run(Xtrain, Ytrain, Xtest, Ytest)

model = lr_train(Xtrain, Ytrain);
Pred_lr = lr_test(model, Xtest);
save('Pred_lr.mat', 'Pred_lr');

a = sum((Pred_lr == 0) & (Ytest == 0));
b = sum((Pred_lr == 1) & (Ytest == 0));
c = sum((Pred_lr == 0) & (Ytest == 1));
d = sum((Pred_lr == 1) & (Ytest == 1));

precision = d / (b + d);
recall = d / (c + d);
accuracy = (a + d) / (a + b + c + d);

fprintf('P:%.3f, R:%.3f, A:%.3f\n', precision, recall, accuracy);