x = 0:0.01:10; % define x axis
% make Rayleigh and Weibull distributions
dist_rayleigh = makedist('Rayleigh');
dist_weibull = makedist('Weibull');
% make Rayleigh and Weibull PDFs
pdf_rayleigh = pdf(dist_rayleigh, x); 
pdf_weibull = pdf(dist_weibull, x); 

x_values_array = [0, 1; 0, 5; 6, 10];
[rows, cols] = size(x_values_array);

for i = 1:rows
    x_low_bound = x_values_array(i, 1);
    x_high_bound = x_values_array(i, 2);
    inds_x_low_high = find((x < x_high_bound) & (x > x_low_bound));
    
    p_rayleigh_x_bounds = trapz(x(inds_x_low_high), pdf_rayleigh(inds_x_low_high)); % integrate
    p_weibull_x_bounds = trapz(x(inds_x_low_high), pdf_weibull(inds_x_low_high)); % integrate
    
    txt = sprintf('Rayleigh: P[%d < X < %d] = %f\nWeibull: P[%d < X < %d] = %f\n',...
    x_low_bound, x_high_bound, p_rayleigh_x_bounds, x_low_bound, x_high_bound, p_weibull_x_bounds);
    disp(txt);
end