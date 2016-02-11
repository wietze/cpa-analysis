function [correlation, bestCandidate, candidates] = attack(in, traces)
    N = numel(in);
    
    % STEP 2: generate all possible variables y given in and all possible
    % values for k
    % STEP 3: Convert to hamming weight model
    sbox = [12 5 6 11 9 0 10 13 3 14 15 8 4 7 1 2];
    y = zeros([N 16]);
    hamming = zeros([N 16]);
    for k = 0:15
        for i = 1:numel(in)
            y(i, k+1) = sbox(bitxor(k, in(i))+1);
            hamming(i, k+1) = hammingweight(y(i, k+1));
        end
    end 
    
    % STEP 5: column-wise correlation
    correlation = corr(hamming, traces);
    
    % STEP 6: rank prediction best to worst
    candidates = zeros(16, 1);
    bestCandidate = 0;
    for k = 0:15
        candidates(k+1) = max(abs(correlation(k+1,:)));
        if candidates(k+1) > candidates(bestCandidate+1)
            bestCandidate = k;
        end
    end
    
    % ::HELPER FUNCTIONS
    % Computes the hamming weight of a given integer.
    function w = hammingweight(bits)
        w = 0;
        while ( bits > 0 )
            bits = bitand( bits, bits-1 );
            w = w + 1;
        end        
    end
end