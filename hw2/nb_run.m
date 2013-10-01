function accuracy = nb_run(Xtrain, Ytrain, Xtest, Ytest)

model = nb_train(Xtrain, Ytrain);
Pred_nb = nb_test(model, Xtest);
save('Pred_nb.mat', 'Pred_nb');

a = sum((Pred_nb == 0) & (Ytest == 0));
b = sum((Pred_nb == 1) & (Ytest == 0));
c = sum((Pred_nb == 0) & (Ytest == 1));
d = sum((Pred_nb == 1) & (Ytest == 1));

precision = d / (b + d);
recall = d / (c + d);
accuracy = (a + d) / (a + b + c + d);

fprintf('P:%.3f, R:%.3f, A:%.3f\n', precision, recall, accuracy);
