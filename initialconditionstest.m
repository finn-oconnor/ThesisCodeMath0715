%Creates the system of nonlinear ODES
ddt =@(t,X) [X(3)+(X(2)-0.5)*X(1);
    1-X(2)-(X(1))^2;
    -X(1)-0.2*X(3)];
%Solves the system using ode45 for the first set of initial conditions 
[t,X]= ode45(ddt, [0:0.1:25], [0.01,1.01,0.01]); 

%Rewwrites the system to be solved again
ddt2 =@(t,X2) [X2(3)+(X2(2)-0.5)*X2(1);
    1-X2(2)-(X2(1))^2;
    -X2(1)-0.2*X2(3)];
 %Solves the same nonlinear system using the second set of initial
 %conditions
[t,X2]= ode45(ddt2, [0:0.1:25], [0.05,1.05,0.05]); 

%Creates a plot of each set of time series solutions for the different initial
%conditions
figure(6)
tiledlayout(3,1)
nexttile
plot(t,X(:,1), 'LineWidth',1)
hold on 
plot(t,X2(:,1),'LineWidth',1)
legend('(0.01,1.01,0.01)','(0.05,1.05,0.05)','FontSize',12)
legend('Location', 'eastoutside');
hold off
title('Plot of Interest Rate Over Time, c=0.20', 'FontSize',16)
xlabel('t(months)', 'FontSize',14)
ylabel('Interest Rate, r','FontSize',14);
nexttile 

plot(t,X(:,2),'LineWidth',1)
hold on 
plot(t,X2(:,2),'LineWidth',1)
legend('(0.01,1.01,0.01)','(0.05,1.05,0.05)','FontSize',12)
legend('Location', 'eastoutside')
hold off
title('Plot of Investment Demand Over Time, c=0.20','FontSize',16)
xlabel('t(months)','FontSize',14)
ylabel('Investment Demand, d','FontSize',14);
nexttile 

plot(t,X(:,3),'LineWidth',1)
hold on 
plot(t,X2(:,3),'LineWidth',1)
legend('(0.01,1.01,0.01)','(0.05,1.05,0.05)','FontSize',12)
legend('Location', 'eastoutside')
title('Plot of Price Index Over Time, c=0.20','FontSize',16)
xlabel('t(months)','FontSize',14)
ylabel('Price Index, p','FontSize',14)
print(['my_figure5'], '-dpng', '-r600');

%Computes the euclidean distance between the solutions for the different
%initial conditions in 3 dimensions, stores the value in the 
save=(((X2-X)).^2)

sum= sqrt((save(:,1)+save(:,2)+save(:,3)))

%Computes the beginning distance of the trajectories for the two different
%initial conditions
beginning_distance= sqrt(0.04^2+0.04^2+0.04^2)

%Writes the distance function for initially close points using the
%Lyapunov exponent obtained for c=0.2 (0.0839)
y=beginning_distance*exp(0.0839*t)

%Plots the actual distance versus the distance predicted with the Lyapunov
%exponent
figure(100)
plot(t,sum, 'Linewidth',1.5)
legend('Location', 'eastoutside')
hold on
plot(t,y,'LineWidth',1.5)
legend('Actual Recorded Distances','Lyapunov Predicted Distances','FontSize',12)
hold off
title('Distances Between Solutions of Differential Initial Conditions','FontSize',16)
xlabel('t(months)','FontSize',14)
ylabel('Distance','FontSize',14)
print(['my_figure5'], '-dpng', '-r600')


%Plots the distance between points with varying initial conditions
figure(10)
tiledlayout(3,1)
nexttile
plot(t,abs(X2(:,1)-X(:,1)), 'LineWidth',1.5)
title('Distance Between Interest Rate Values Different Initial Conditions, c=0.20', 'FontSize',16)
xlabel('t(months)', 'FontSize',14)
ylabel('Difference in Interest Rate','FontSize',14);
nexttile 

plot(t,abs(X2(:,2)-X(:,2)),'LineWidth',1.5)
title('Distance Between Investment Demand Values Different Initial Conditions, c=0.20','FontSize',16)
xlabel('t(months)','FontSize',14)
ylabel('Difference In Investment Demand','FontSize',14);
nexttile 

plot(t,abs(X2(:,3)-X(:,3)),'LineWidth',1.5)
title('Distance Between Price Index Values Different Initial Conditions, c=0.20','FontSize',16)
xlabel('t(months)','FontSize',14)
ylabel('Difference In Price Index','FontSize',14)
print(['my_figure5'], '-dpng', '-r600');






 