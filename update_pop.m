function pop = update_pop(pop, offspring, fitness)
    n_chromosomes = size(pop, 1);
    new_pop = [pop; offspring];
    new_fitness = [fitness; fitness];
    [~, idx] = sort(new_fitness, 'descend');
    pop = new_pop(idx(1:n_chromosomes), :);
    fitness = new_fitness(idx(1:n_chromosomes));
end