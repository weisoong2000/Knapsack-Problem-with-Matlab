function fitness = eval_fitness(pop, items, weights, values, capacity)
    n_chromosomes = size(pop, 1);
    fitness = zeros(n_chromosomes, 1);
    for i = 1:n_chromosomes
        chromosome = pop(i, :);
        total_weight = sum(chromosome .* weights);
        total_value = sum(chromosome .* values);
        if total_weight > capacity
            fitness(i) = 0;
        else
            fitness(i) = total_value;
        end
    end
end