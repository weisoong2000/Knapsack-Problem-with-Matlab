% Roulette wheel selection
% function parents = selection(pop, fitness)
%     n_chromosomes = size(pop, 1);  
%     cumulative_fitness = cumsum(fitness);
%     parents = zeros(n_chromosomes, size(pop, 2));   % create parents chromosomes storage
%     for i = 1:n_chromosomes
%         r = rand() * cumulative_fitness(end);   % rand() is 0 to 1 probability
%         parent_idx = find(cumulative_fitness >= r, 1); % in the 50 rows of chromosomes in the 
%                                                         % cumulative fitness from up to bottom get the 
%                                                         % first value that greater than r then this 
%                                                         % will be the index for parents to choose 
%                                                         % chromosomes belongs in the pop.
%         parents(i, :) = pop(parent_idx, :);     % assign index of value in the pop to the parents row
%     end
% end

% Tournament selection
function parents = selection(pop, fitness)
    n_chromosomes = size(pop, 1);
    K = 4; % tournament size
    parents = zeros(n_chromosomes, size(pop, 2)); % create parents chromosomes storage

    for i = 1:n_chromosomes
        tournament = randi(n_chromosomes, [1, K]); % choose K random individuals from the population
        [~, best_idx] = max(fitness(tournament)); % find the best fitness among the K individuals
        parent_idx = tournament(best_idx); % select the individual with the best fitness
        parents(i, :) = pop(parent_idx, :); % assign index of value in the pop to the parents row
    end
end