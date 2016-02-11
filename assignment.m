% STEP 1: Load the inputs
load('in.mat');
% STEP 4: Load the traces
load('traces.mat');

[correlation, bestCandidate] = attack(in, traces);

disp(['Top Candidate: ', num2str(bestCandidate)]);

% STEP 7: plot 1
hold off
for k = 0:15
    if k ~= bestCandidate
        bar(correlation(k+1,:), 'FaceColor', [0.5 0.5 0.5], 'EdgeColor', [0.5 0.5 0.5])
    end
    hold on
end
bar(correlation(bestCandidate+1,:), 'FaceColor', 'k', 'EdgeColor', 'k')

% STEP 8: plot 2
[correlation1k, bestCandidate1k, candidates1k] = attack(in(1:1000,:), traces(1:1000,:));
[correlation4k, bestCandidate4k, candidates4k] = attack(in(1:4000,:), traces(1:4000,:));
[correlation8k, bestCandidate8k, candidates8k] = attack(in(1:8000,:), traces(1:8000,:));
[correlation12k, bestCandidate12k, candidates12k] = attack(in(1:12000,:), traces(1:12000,:));

disp('---')
disp(['Top Candidate 1k: ', num2str(bestCandidate1k)]);
disp(['Top Candidate 4k: ', num2str(bestCandidate4k)]);
disp(['Top Candidate 8k: ', num2str(bestCandidate8k)]);
disp(['Top Candidate 12k: ', num2str(bestCandidate12k)]);