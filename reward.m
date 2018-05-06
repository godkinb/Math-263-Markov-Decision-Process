function [r] = reward(s,a,state_space)
%This function computes the reward when we are in state s, take action a
%   s is the state we choose, should be a vector [e,w]
%   a is the action, should be a scalar
%   e_return is either a function, or already allocated vector which
%       translates expectation of stock return states to the actual expected
%       values
%   Cost is either a function, or can simply be computed in the 1 stock
%   case; note cost function also needs 
return_index = state_space(s,1)+1;
weight = state_space(s,2);
e_return = [-0.01,0.0001,0.005];
Cost = 0.003;
actions = -2:2;
action = actions(a);
r = (weight+action)*e_return(return_index)-Cost*abs(action);
end

