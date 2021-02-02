N = 10;
p = 0.7;
q = 1 - p;

num_successes = linspace(0, N, N + 1);

probability_values = zeros(size(num_successes));

for k = num_successes
    
    probability_val = nchoosek(N, k) * p^k * q^(N-k);
    probability_values(k + 1) = probability_val;
end

figure;
plot(num_successes, probability_values)
xlabel('Number of successes');
ylabel('Probability(number of successes)');
title({'Discrete distribution for binomial distribution'}, {'N = 10, p = 0.7'});
saveas(gcf, 'StevenGraham_Module1_Part1_MATLAB.png');
close(figure)
