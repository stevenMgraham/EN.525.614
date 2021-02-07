function probability = compute_probability_given_interval(x, pdf, interval_low, interval_high)
% I am choosing to return a probability for a given interval using PDF
% interval_low: the lower bound in the interval, also controls the >
% operator if interval_high is NaN
% interval_high: the upper bound in the interval, also controls the <
% operator if interval_low is NaN
% interval_low, interval_high may be NaNs (but not both) to compute intervals 
%   like P[X < 3]

if isnan(interval_low) && isnan(interval_high)
    error('Function needs at least 1 interval to compute probability'); 
elseif isnan(interval_low)
    inds = find(x < interval_high);
elseif isnan(interval_high)
    inds = find(x > interval_low);
elseif interval_low == interval_high || interval_low > interval_high
    error('Intervals are equal in value, or lower bound interval is greater than upper bound');
else
    inds = find((x > interval_low) & (x < interval_high));
end
probability = trapz(x(inds), pdf(inds));
end