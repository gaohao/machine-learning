function model = nb_train(Xtrain, Ytrain)

model.sample_size = size(Xtrain, 1);
model.feature_size = size(Xtrain, 2);
model.prior = zeros(2, 1);
model.posterior = zeros(2, model.feature_size);

alpha = 0.5;
% for class 0
logical = Ytrain == 0; % select the class == 0
model.prior(1) = sum(logical) / model.sample_size;
word_count = sum(Xtrain(logical, :));
total_word_num = sum(word_count);
model.posterior(1, :) = (word_count + alpha) / (total_word_num + model.feature_size * alpha);

% for class 1
logical = Ytrain == 1;
model.prior(2) = sum(logical) / model.sample_size;
word_count = sum(Xtrain(logical, :));
total_word_num = sum(word_count);
model.posterior(2, :) = (word_count + alpha) / (total_word_num + model.feature_size * alpha);
