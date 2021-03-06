function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

thetaLength = length(theta);

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Cost function
%for i = 1:m  
%    h = sigmoid(X(i,:) * theta);
%    J += -y(i)*log(h) - (1 - y(i))*log(1-h);
%end

%J = J / m + norm(theta(2:size(theta)))^2 * lambda / (2*m);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% costFunction
hx = sigmoid(X * theta); % 118 �~ 1
J = (1/m) * ((log(hx)' * (-y)) - (log( 1 - hx )' * ( 1 - y ))) + (lambda/(2*m)) * sum(theta(2:thetaLength,:).**2,1);


% Gradient
%for j = 1:size(theta)  
%    for i = 1:m
%        h = sigmoid(X(i,:) * theta);
%        grad(j) += (h - y(i)) * X(i,j);
%    end
%    if j > 1
%      grad(j) += lambda * theta(j);
%    end
%end
%
% grad = grad / m;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% �Y�ݒ�
k = hx - y;
theta0 = (1/m) * (sum(k(1,:) * X(1,:),2))
theta1 = (1/m) * (sum(k(2:m,:)' * X(2:m,:))) + ((lambda / m ) * theta(2:thetaLength));
grad = [theta0;theta1];

end
