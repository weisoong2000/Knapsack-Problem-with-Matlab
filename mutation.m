% Bit flip mutation
function offspring = mutation(offspring, mutation_rate)
    n_chromosomes = size(offspring, 1);
    for i = 1:n_chromosomes
        chromosome = offspring(i, :);
        for j = 1:numel(chromosome)
            r = rand();
            if r < mutation_rate
                chromosome(j) = ~chromosome(j);
            end
        end
        offspring(i, :) = chromosome;
    end
end