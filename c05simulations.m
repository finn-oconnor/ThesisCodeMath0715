%This produces the necessary and code in order to solve the nonlinear
%system using a c value of 0.5 and the proper initial condition

%Creates the system of equations, note the use of 0.5 as the c value
ddt =@(t,X) [X(3)+(X(2)-0.5)*X(1);
    1-X(2)-(X(1))^2;
    -X(1)-0.5*X(3)];

%Uses the ode45 function in order to provide the solutions for each
%dependent variable over the time period. Note the initial condition set at
%this point in the code
[t,X]= ode45(ddt, [0:0.1:25], [0.01,1.01,0.01]); 
 
%Creates a tiled figure to output the time series of each dependent
%variable and the 2 dimmensional phase portraits
figure(3)
tiledlayout(3,1)
nexttile
plot(X(:,1),X(:,3))
hold on 
plot(0,0, 'x', 'LineWidth',3)
plot(0.01,0.01, 'x', 'LineWidth',3,'color','k')
hold off
title('Plot of interest rate and price index, c=0.50','FontSize',16)
xlabel('Interest Rate, r','FontSize',14)
ylabel('Price Index, p','FontSize',14);

nexttile
plot(X(:,1),X(:,2))
hold on
plot(0,1,'x','LineWidth',3)
plot(0.01,1.01, 'x', 'LineWidth',3,'color','k')
hold off
title('Plot of interest rate and investment demand, c=0.50','FontSize',16)
xlabel('Interest Rate, r','FontSize',14)
ylabel('Investment Demand, d','FontSize',14);
 
nexttile
plot(X(:,2),X(:,3))
hold on
plot(1,0,'x','LineWidth',3)
plot(1.01,0.01, 'x', 'LineWidth',3,'color','k')
title('Plot of Investment Demand and Price Index, c=0.50','FontSize',16)
xlabel('Investment Demand, d','FontSize',14)
ylabel('Price Index, p','FontSize',14)
print(['my_figure4'], '-dpng', '-r600');

figure(4)
tiledlayout(3,1)
nexttile
plot(t,X(:,1), 'Linewidth',1)
title('Plot of Interest Rate Over Time, c=0.50','FontSize',16)
xlabel('t(months)','FontSize',14)
ylabel('Interest Rate, r','FontSize',14);

nexttile 
plot(t,X(:,2), 'Linewidth',1)
title('Plot of Investment Demand Over Time, c=0.50','FontSize',16)
xlabel('t(months)','FontSize',14)
ylabel('Investment Demand, d','FontSize',14);

nexttile 
plot(t,X(:,3), 'Linewidth',1)
title('Plot of Price Index Over Time, c=0.50','FontSize',16)
xlabel('t(months)','FontSize',14)
ylabel('Price Index, p','FontSize',14)
print(['my_figure4'], '-dpng', '-r600')

%Produces the 3 dimmensional phase portrait for the solutions when c=0.5
figure(1)
plot3(X(:,1),X(:,2),X(:,3),'b')
hold on
plot3(0,1,0,'x','LineWidth',3,'color','r')
plot3(0.01,1.01,0.01, 'x', 'LineWidth',3,'color','k')
grid on
title('Plot of interest rate, investment demand, and price index, c=0.5','FontSize',16)
xlabel('Interest Rate, r','FontSize',14)
zlabel('Price Index, p','FontSize',14)
ylabel('Investment Demand, d','FontSize',14)
print(['my_figure2'], '-dpng', '-r600');
 
