%Lets do 100 trials testing our optimization

tic
for test_num=1:1
    test_optimization;
    figure(1)
    hold on
    plot(return_made)
    hold off
    figure(2)
    hold on
    plot(return_actual)
    hold off
end
toc