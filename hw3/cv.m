function avg_acuracy = cv()
lambdas = [0, 1e-7, 1e-6, 1e-5, 1e-4, 1e-3, 1e-2, 1e-1, 1];
acuracy = zeros(1, size(lambdas, 2));
fold = 10;
[xtrain, ytrain, xtest, ytest] = partition()

for i = 1 : size(lambdas, 2)
    for j = 1 : fold
        acuracy(i) = acuracy(i) + lr_run_lambda(xtrain{j}, ytrain{j}, xtest{j}, ytest{j}, lambdas(i));
    end
    acuracy(i) = acuracy(i) / fold;
end

plot(lambdas, acuracy);
xlabel('lambda');
ylabel('accuracy');