# ThesisCodeMath0715

This repository includes all of the necesarry code to create the plots and run simulations for my thesis. 

c020simulations.m will run the plots for all phase simulations for the case of c=0.20. The system of equations is written in that code, and the comments highlight where the initial conditions and c values are implemented. 

c05simulations.m will run the plots for all phase simulations for the case of c=0.5. The system of equations is written in that code, and the comments highlight where the initial conditions and c values are implemented. 

c12simulations.m will run the plots for all phase simulations for the case of c=1.20. The system of equations is written in that code, and the comments highlight where the initial conditions and c values are implemented. 

lyapunovloop.m will run a for loop that computes the lyapunov exponent for c values in a given interval and stores the results in a vector. The system of equations is included, as well as explains where the c value and initial conditions are define (the same as with previous simulations). Using the vector, it then produces a plot of the lyapunov exponent over the different c values. 

initialconditions.m will solve the system for two different initial conditions and the same c value, the instances of this are denoted in the code. This also computes the distances between the solutions of different initial conditions, and plots this over time t. Lastly, it computes the euclidean distance between the points in 3d for the 2 initial conditions, and uses the lyapunov exponent from lyapunov loop for c=0.2 to plot the actual euclidean distances against the predicted Lyapunov distances. 
