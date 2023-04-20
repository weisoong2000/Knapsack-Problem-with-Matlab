clc
clear all
% Define problem
items = {'Phone', 'Laptop', 'First aid box', 'Shoes', 'Clothes', 'Drinks', 'Toiletries', 'Hair dryer'};
weights = [1, 3, 2, 2, 4, 3, 5, 1];
values = [10, 3, 4, 8, 6, 2, 5, 1];
capacity = 10;

% Parameters
pop_size = 100;
n_generations = 100;
crossover_rate = 0.8;
mutation_rate = 0.1;
mean_fitness = zeros(n_generations, 1);
max_fitness = zeros(n_generations, 1);
min_fitness = zeros(n_generations, 1);

% Initialize population
pop = init_pop(pop_size, numel(items));

% Evaluate fitness
fitness = eval_fitness(pop, items, weights, values, capacity);

% Main loop
for i = 1:n_generations
    % Selection
    parents = selection(pop, fitness);
    
    % Crossover
    offspring = crossover(parents, crossover_rate);
    
    % Mutation
    offspring = mutation(offspring, mutation_rate);
    
    % Evaluate fitness
    fitness = eval_fitness(offspring, items, weights, values, capacity);
    mean_fitness(i) = mean(fitness);
    max_fitness(i) = max(fitness(find(fitness)));
    min_fitness(i) = min(fitness(find(fitness)));

    % Update population
    pop = update_pop(pop, offspring, fitness);
    
end

% Plot the graph
figure;
plot(mean_fitness);
hold on
plot(max_fitness);
hold on
plot(min_fitness);
xlabel('Generation');
ylabel('Fitness Value');
legend('Mean','Max','Min');

average_gens = mean(mean_fitness)
average_max_gens = mean(max_fitness)
average_min_gens = mean(min_fitness)

% Get the best solution
%nonzero_index = find(fitness)
%fitness(nonzero_index)
%min(fitness(find(fitness)))
%[~, idx] = min(fitness(find(fitness)));
[~, idx] = max(fitness(find(fitness)));
best_sol = pop(idx, :);