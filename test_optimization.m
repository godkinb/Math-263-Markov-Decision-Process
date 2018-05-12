%Now let's test our optimized strategy
%This is the number of days we want to test out our strategy
T=100;
%This is the sequence of states of the expected return
e_return_seq = randi(3,T+1,1);
%Lets find our value after 100 days, return made after each day
return_made = ones(T+1,1);
%Your asset position
position = 0;
%actual return???
return_actual = ones(T+1,1);
for i=1:T
    e_return_seq(i);
    %Find the row corresponding to the state of return 
    e = find(state_space(:,1)==(e_return_seq(i)-1));
    %Find the row corresponding to our current position
    w = find(state_space(:,2)==position);
    %Now find the state index in state_space s=(e,w)
    s = intersect(e,w);
    %fprintf(
    %state_space(s,:)
    %pause
    action_take_now = acts_take(s);
    %This is our new position
    position_new = position+acts_take_paper(s);
    position = position_new;
    %This is the reward
    return_made(i+1) = return_made(i)+reward(s,action_take_now,state_space,Cost,e_return,actions);
    e_actual = find(state_space(:,1)==(e_return_seq(i+1)-1));
    s_actual = intersect(e_actual,w);
    return_actual(i+1) = return_actual(i) + reward(s_actual,action_take_now,state_space,Cost,e_return,actions);
end