function [v] = value_iteration(P,epsilon,v_init,actions,lambda,state_space,Cost,e_return)
%This is the value iteration algorithm to obtain the optimal policy
%   P is the transition probability matrix; note we combine them into a 3D
%       array where each frame corresponds to an action
%   Epsilon is the error tolerance
%   v_init is the intial valuation vector
%Number of states s; this is (e,w)
N = size(P,1);
v = zeros(N,1);
%number of actions
num_act  = length(actions);
for s=1:N
    max_in_action = zeros(num_act,1);
    for a=1:num_act
        max_in_action(a) = reward(s,a,state_space,Cost,e_return,actions);
        %Sum over possible states
        for j=1:N
            %p(i,j,k) = P(j|i,k)
            max_in_action(a) = max_in_action(a)+lambda*P(s,j,a)*v_init(j);
        end
    end
    v(s) = max(max_in_action);
end    
if abs(v-v_init) < epsilon*(1-lambda)/(2*lambda)
    %do arg max line
else
    v=value_iteration(P,epsilon,v,actions,lambda,state_space,Cost,e_return);
end
end

