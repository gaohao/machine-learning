function LR_NormalEquation(Xtrain, Ytrain, Xtest, Ytest)
newXtrain = PolynomialBasis(Xtrain);
theta = inv(newXtrain' * newXtrain) * newXtrain' * Ytrain;
newXtest = PolynomialBasis(Xtest);
Ypred_NE = (theta' * newXtest')';
save('Ypred_NE.mat', 'Ypred_NE');
error = norm(Ypred_NE - Ytest);
fprintf('Error = %.3f\n', error);