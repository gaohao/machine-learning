function model = lr_train(Xtrain, Ytrain)

model.feature_size = size(Xtrain, 2);
model.sample_size = size(Xtrain, 1);
rounds = 120;
alpha = 1e-2;
epsilon = 2e-1;
lambda = 1e-8;
w = zeros(model.feature_size, 1);

prev_lcl = compute_lcl(Xtrain, Ytrain, w, lambda);
for round = 1 : rounds
    shuffled_order = randperm(size(Xtrain, 1));
    for i = 1 : model.sample_size 
        X = Xtrain(shuffled_order(i), :);
        Y = Ytrain(shuffled_order(i), :);
        p = sigmoid(X * w);
        w = w + alpha * ((Y - p) * X' - 2 * lambda * w);
    end
    cur_lcl = compute_lcl(Xtrain, Ytrain, w, lambda);
    diff = abs(cur_lcl - prev_lcl);
    fprintf('round %d: lcl = %f, diff = %f\n', round, cur_lcl, diff);
    if diff < epsilon
        fprintf('Converge\n');
        break;
    end
    prev_lcl = cur_lcl;
end

model.w = w;