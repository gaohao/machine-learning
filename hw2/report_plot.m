function report_plot(Xtrain, Ytrain, Xtest, Ytest)

sample_size = size(Xtrain, 1);
nb_a1 = nb_run(Xtrain(1 : sample_size / 100, :), Ytrain(1 : sample_size / 100, :), Xtest, Ytest);
nb_a2 = nb_run(Xtrain(1 : sample_size / 100 * 2, :), Ytrain(1 : sample_size / 100 * 2, :), Xtest, Ytest);
nb_a3 = nb_run(Xtrain(1 : sample_size / 100 * 5, :), Ytrain(1 : sample_size / 100 * 5, :), Xtest, Ytest);
nb_a4 = nb_run(Xtrain(1 : sample_size / 100 * 10, :), Ytrain(1 : sample_size / 100 * 10, :), Xtest, Ytest);
nb_a5 = nb_run(Xtrain(1 : sample_size / 100 * 20, :), Ytrain(1 : sample_size / 100 * 20, :), Xtest, Ytest);
nb_a6 = nb_run(Xtrain(1 : sample_size / 100 * 100, :), Ytrain(1 : sample_size / 100 * 100, :), Xtest, Ytest);

per_a1 = perceptron_run(Xtrain(1 : sample_size / 100, :), Ytrain(1 : sample_size / 100, :), Xtest, Ytest);
per_a2 = perceptron_run(Xtrain(1 : sample_size / 100 * 2, :), Ytrain(1 : sample_size / 100 * 2, :), Xtest, Ytest);
per_a3 = perceptron_run(Xtrain(1 : sample_size / 100 * 5, :), Ytrain(1 : sample_size / 100 * 5, :), Xtest, Ytest);
per_a4 = perceptron_run(Xtrain(1 : sample_size / 100 * 10, :), Ytrain(1 : sample_size / 100 * 10, :), Xtest, Ytest);
per_a5 = perceptron_run(Xtrain(1 : sample_size / 100 * 20, :), Ytrain(1 : sample_size / 100 * 20, :), Xtest, Ytest);
per_a6 = perceptron_run(Xtrain(1 : sample_size / 100 * 100, :), Ytrain(1 : sample_size / 100 * 100, :), Xtest, Ytest);

x1 = [0.01, 0.02, 0.05, 0.1, 0.2, 1]
y1 = [nb_a1, nb_a2, nb_a3, nb_a4, nb_a5, nb_a6];

x2 = [0.01, 0.02, 0.05, 0.1, 0.2, 1]
y2 = [per_a1, per_a2, per_a3, per_a4, per_a5, per_a6];

plot(x1, y1, x2, y2);
xlabel('percent of training data')
ylabel('accuracy')