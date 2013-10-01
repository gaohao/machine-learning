function LR_SteepestDescent(Xtrain, Ytrain, Xtest, Ytest)
newXtrain = PolynomialBasis(Xtrain);
sample_size = size(newXtrain, 1);
feature_size = size(newXtrain, 2);
rounds = 20000;
alpha = 1e-5;
epsilon = 1e-9;
theta = rand(feature_size, 1);
prev_cost = (newXtrain * theta - Ytrain)' * (newXtrain * theta - Ytrain) / 2;

for round = 1 : rounds      
    theta = theta + alpha * newXtrain' * (Ytrain - newXtrain * theta);
    cur_cost = (newXtrain * theta - Ytrain)' * (newXtrain * theta - Ytrain) / 2;
    diff = abs(cur_cost - prev_cost);
    %fprintf('round %d: lcl = %f, diff = %f\n', round, cur_cost, diff);
    if diff < epsilon
        fprintf('Converge\n');
        break;
    end
    prev_cost = cur_cost;
end

newXtest = PolynomialBasis(Xtest);
Ypred_SD = (theta' * newXtest')';
save('Ypred_SD.mat', 'Ypred_SD');
error = norm(Ypred_SD - Ytest);
fprintf('Error = %.3f\n', error);
