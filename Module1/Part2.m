N = 10;
p = 0.7;
q = 1 - p;

num_successes = linspace(0, N, N + 1);

M10 = 10;
M100 = 100;
M1000000 = 1000000;

probability_values_array_M10 = zeros(M10, N+1);
probability_values_array_M100 = zeros(M100, N+1);
probability_values_array_M1000000 = zeros(M1000000, N+1);

for m = 1:M10
    
    for k = num_successes
        
        probability_val = nchoosek(N, k) * p^k * q^(N-k);
        probability_values_array_M10(m, k + 1) = probability_val;
        
    end
end
for m = 1:M100
    
    for k = num_successes
        
        probability_val = nchoosek(N, k) * p^k * q^(N-k);
        probability_values_array_M100(m, k + 1) = probability_val;
        
    end
end
for m = 1:M1000000
    
    for k = num_successes
        
        probability_val = nchoosek(N, k) * p^k * q^(N-k);
        probability_values_array_M1000000(m, k + 1) = probability_val;
        
    end
end

norm_probability_M10 = sum(probability_values_array_M10) / M10;
norm_probability_M100 = sum(probability_values_array_M100) / M100;
norm_probability_M1000000 = sum(probability_values_array_M1000000) / M1000000;

figure
hold all
subplot(1, 3, 1)
histogram(norm_probability_M10, num_successes);
subplot(1, 3, 2)
histogram(norm_probability_M100, num_successes);
subplot(1, 3, 3)
histogram(norm_probability_M1000000, num_successes);


