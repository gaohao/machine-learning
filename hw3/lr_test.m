function pred_lr = lr_test(model, Xtest)
pred_lr = (Xtest * model.w) >= 0;
