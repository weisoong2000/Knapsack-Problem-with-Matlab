% Single point
% function offspring = crossover(parents, crossover_rate)
%     n_chromosomes = size(parents, 1);
%     offspring = zeros(n_chromosomes, size(parents, 2));
%     for i = 1:2:n_chromosomes
%         parent1 = parents(i, :);
%         parent2 = parents(i+1, :);
%         r = rand();
%         if r < crossover_rate
%             crossover_point = randi(size(parent1, 2));
%             offspring(i, 1:crossover_point) = parent1(1:crossover_point);
%             offspring(i, (crossover_point+1):end) = parent2((crossover_point+1):end);
%             offspring(i+1, 1:crossover_point) = parent2(1:crossover_point);
%             offspring(i+1, (crossover_point+1):end) = parent1((crossover_point+1):end);
%         else
%             offspring(i, :) = parent1;
%             offspring(i+1, :) = parent2;
%         end
%     end
% end

% Two point
function offspring = crossover(parents, crossover_rate)
    n_chromosomes = size(parents, 1);
    offspring = zeros(n_chromosomes, size(parents, 2));
    for i = 1:2:n_chromosomes
        parent1 = parents(i, :);
        parent2 = parents(i+1, :);
        r = rand();
        if r < crossover_rate
            crossover_point1 = randi(size(parent1, 2) - 1);
            crossover_point2 = randi(crossover_point1+1, size(parent1, 2));
            offspring(i, 1:crossover_point1) = parent1(1:crossover_point1);
            offspring(i, (crossover_point1+1):crossover_point2) = parent2((crossover_point1+1):crossover_point2);
            offspring(i, (crossover_point2+1):end) = parent1((crossover_point2+1):end);
            offspring(i+1, 1:crossover_point1) = parent2(1:crossover_point1);
            offspring(i+1, (crossover_point1+1):crossover_point2) = parent1((crossover_point1+1):crossover_point2);
            offspring(i+1, (crossover_point2+1):end) = parent2((crossover_point2+1):end);
        else
            offspring(i, :) = parent1;
            offspring(i+1, :) = parent2;
        end
    end
end

% uniform
% function offspring = crossover(parents, crossover_rate)
%     n_chromosomes = size(parents, 1);
%     offspring = zeros(n_chromosomes, size(parents, 2));
%     for i = 1:2:n_chromosomes
%         parent1 = parents(i, :);
%         parent2 = parents(i+1, :);
%         for j = 1:size(parent1, 2)
%             r = rand();
%             if r < crossover_rate
%                 offspring(i, j) = parent2(j);
%                 offspring(i+1, j) = parent1(j);
%             else
%                 offspring(i, j) = parent1(j);
%                 offspring(i+1, j) = parent2(j);
%             end
%         end
%     end
% end