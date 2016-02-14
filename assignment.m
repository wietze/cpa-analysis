% STEP 1: Load the inputs
load('in.mat');
% STEP 4: Load the traces
load('traces.mat');

[correlation, bestCandidate] = attack(in, traces);

disp(['Top Candidate: ', num2str(bestCandidate)]);

% STEP 7: plot 1
hold off
subplot(2,1,1);
for k = 0:15
    if k ~= bestCandidate
        bar(correlation(k+1,:), 'FaceColor', [0.5 0.5 0.5], 'EdgeColor', [0.5 0.5 0.5])
    end
    hold on
end
bar(correlation(bestCandidate+1,:), 'FaceColor', [0 0 0.6], 'EdgeColor', [0 0 0.6])
title('Correlation Graph');

% STEP 8: plot 2
[correlation1k, bestCandidate1k, candidates1k] = attack(in(1:1000,:), traces(1:1000,:));
[correlation4k, bestCandidate4k, candidates4k] = attack(in(1:4000,:), traces(1:4000,:));
[correlation8k, bestCandidate8k, candidates8k] = attack(in(1:8000,:), traces(1:8000,:));
[correlation12k, bestCandidate12k, candidates12k] = attack(in(1:12000,:), traces(1:12000,:));

candidates_list = [candidates1k, candidates4k, candidates8k, candidates12k];
x               = 1:4;
y               = zeros(4,1);
for i=0:3
    [sorted, index] = sort(candidates_list(:,i+1));
    rank = length(index) - find(index==bestCandidate,1);
    y(i+1) = rank;
end

hold off
subplot(2,1,2);
bar(x,y);
title('Rankings');
set(gca,'XTickLabel',{'1k', '4k', '8k', '12k'});

disp('---')
disp(['Top Candidate 1k: ', num2str(bestCandidate1k)]);
disp(['Top Candidate 4k: ', num2str(bestCandidate4k)]);
disp(['Top Candidate 8k: ', num2str(bestCandidate8k)]);
disp(['Top Candidate 12k: ', num2str(bestCandidate12k)]);