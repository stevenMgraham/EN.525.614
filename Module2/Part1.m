x = 0:0.01:10; % define x axis

dist_exp = makedist('Exponential'); % create exponential distribution
pdf_exp = pdf(dist_exp, x); % make exponential PDF

x_values_array = [0, 1; 0, 5; 6, 10]; % intervals, values of X in question
[rows, cols] = size(x_values_array);

for i = 1:rows
    x_low_bound = x_values_array(i, 1);
    x_high_bound = x_values_array(i, 2);
    inds_x_low_high = find((x < x_high_bound) & (x > x_low_bound));
    
    p_x_bounds = trapz(x(inds_x_low_high), pdf_exp(inds_x_low_high)); % integrate
    txt = sprintf('Exponential: P[%d < X < %d] = %f\n', x_low_bound, x_high_bound, p_x_bounds);
    disp(txt);
end

    
