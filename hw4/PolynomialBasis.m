function result = PolynomialBasis(X)
result = [ones(size(X)) X X.^2 X.^3];