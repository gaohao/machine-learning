function LR_LMS(Xtrain, Ytrain, Xtest, Ytest)
newXtrain = PolynomialBasis(Xtrain);
sample_size = size(newXtrain, 1);
feature_size = size(newXtrain, 2);
rounds = 20000;
alpha = 1e-5;
epsilon = 1e-7;
theta = rand(feature_size, 1);
prev_cost = (newXtrain * theta - Ytrain)' * (newXtrain * theta - Ytrain) / 2;

for round = 1 : rounds
    shuffled_order = randperm(sample_size);
    for i = 1 : sample_size 
        X = newXtrain(shuffled_order(i), :);
        Y = Ytrain(shuffled_order(i), :);
        theta = theta + alpha * ((Y - X * theta) * X');
    end
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
Ypred_LMS = (theta' * newXtest')';
save('Ypred_LMS.mat', 'Ypred_LMS');
error = norm(Ypred_LMS - Ytest);
fprintf('Error = %.3f\n', error);