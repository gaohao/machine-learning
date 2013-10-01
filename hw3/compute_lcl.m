function lcl = compute_lcl(X, Y, w, lambda)
p = sigmoid(X * w);
lcl = dot(Y, log(p)) + dot((1 - Y), log(1 - p)) - lambda * dot(w, w);
