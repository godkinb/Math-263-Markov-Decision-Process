%error tolerance
epsilon = 0.01;
%stock transition states;
stock_states = 0:2;
%possible weights
weights = -1:1;
%possible actions
actions = -2:2;
%discount rate
lambda=0.95;
%Cost of transaction
Cost = 0.003;
%Vector of expected returns with entries corresponding to 1+stock_states
e_return = [-0.01,0.0001,0.005];
%initial valuation, its size is 
%   (number of stock states)*(number of allowed weights)
v_init = zeros(length(stock_states)*length(weights),1);
%This probability transition matrix is for the simple examples from the
%paper
P = zeros(9,9,5);
P(7:9,1:3,1) = [0.5,0.4,0.1;0.1,0.6,0.3;0.05,0.05,0.9];
P(4:6,1:3,2) = P(7:9,1:3,1);
P(7:9,4:6,2) = P(7:9,1:3,1);
P(1:3,1:3,3) = P(7:9,1:3,1);
P(4:6,4:6,3) = P(1:3,1:3,3);
P(7:9,7:9,3) = P(1:3,1:3,3);
P(1:3,4:6,4) = P(1:3,1:3,3);
P(4:6,7:9,4) = P(1:3,1:3,3);
P(1:3,7:9,5) = P(1:3,1:3,3);
%This 9x2 vector lists all of the states from the simple example from the
%   paper
state_space = zeros(9,2);
state_space(1:3,2) = -1;
state_space(4:7,2) = 0;
state_space(7:9,2) = 1;
state_space(1,1) = 0;
state_space(2,1) = 1;
state_space(3,1) = 2;
state_space(4,1) = 0;
state_space(5,1) = 1;
state_space(6,1) = 2;
state_space(7,1) = 0;
state_space(8,1) = 1;
state_space(9,1) = 2;

port_valuation = value_iteration(P,epsilon,v_init,actions,lambda,state_space,Cost,e_return);





%{
while iter>0
    v_curr = value_iteration(P,epsilon,v_init,actions,lambda);
    if abs(v_init - v_curr) < epsilon*(1-lambda)/(2*lambda)
        iter = -1;
    end
end
%}