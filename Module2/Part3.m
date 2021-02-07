x = 0:0.01:10; % define x axis
% make exponential, Rayleigh, Weibull distributions
dist_exponential = makedist('Exponential');
dist_rayleigh = makedist('Rayleigh');
dist_weibull = makedist('Weibull');
% make exponential, Rayeligh, Weibull CDFs
cdf_exponential = cdf(dist_exponential, x);
cdf_rayleigh = cdf(dist_rayleigh, x);
cdf_weibull = cdf(dist_weibull, x);

x_values_array = [0, 1; 0, 5; 6, 10];
[rows, cols] = size(x_values_array);

for i = 1:rows
    x_low_bound = x_values_array(i, 1);
    x_high_bound = x_values_array(i, 2);
    
    ind_x_low = find(x == x_low_bound);
    ind_x_high = find(x == x_high_bound);
    % subtract lower bound value from upper bound value
    p_exponential_x_bounds = cdf_exponential(ind_x_high) - cdf_exponential(ind_x_low); 
    p_rayleigh_x_bounds = cdf_rayleigh(ind_x_high) - cdf_rayleigh(ind_x_low);
    p_weibull_x_bounds = cdf_weibull(ind_x_high) - cdf_weibull(ind_x_low);
    
    txt = sprintf('Exponential: P[%d < X < %d] = %f\nRayleigh: P[%d < X < %d] = %f\nWeibull: P[%d < X < %d] = %f\n',...
    x_low_bound, x_high_bound, p_exponential_x_bounds, x_low_bound, x_high_bound, p_rayleigh_x_bounds,...
    x_low_bound, x_high_bound, p_weibull_x_bounds);
    disp(txt);
end