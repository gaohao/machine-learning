function model = perceptron_train(Xtrain, Ytrain)


feature_size = size(Xtrain, 2);
k = 1;
v = zeros(1, feature_size);
c = 0;

model.c = [];
model.v = [];

for t = 1 : 10
    for i = 1 : size(Xtrain, 1)
        x = Xtrain(i, :);
        y = 2 * Ytrain(i) - 1;
        if sign(x * v') == y
            c = c + 1;
        else 
            model.v = [model.v; v];
            model.c = [model.c; c];
            v = v + y * x;
            c = 1;
            k = k + 1;
        end
    end 
end

model.v = [model.v; v];
model.c = [model.c; c];