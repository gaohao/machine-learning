function Pred_nb = nb_test(model, Xtest)

class_size = 2;
test_size = size(Xtest, 1);
results = zeros(test_size, 2);

for i = 1 : test_size
    for j = 1 : class_size
        posterior_log_sum = dot(log(model.posterior(j, :)), Xtest(i, :));
        results(i, j) = sum(log(model.prior(j))) + posterior_log_sum;
    end
end

[~, Pred_nb] = max(results, [], 2);
Pred_nb = Pred_nb - 1;