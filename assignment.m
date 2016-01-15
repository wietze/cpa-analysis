function [] = assignment( )
    % STEP 1: Load the inputs
    in = load('in.mat');
    in = in.in;
    
    % STEP 2: generate all possible variables y given in and all possible
    % values for k
    % STEP 3: Convert to hamming weight model
    sbox = [12 5 6 11 9 0 10 13 3 14 15 8 4 7 1 2];
    y = zeros([numel(in) 16]);
    hamming = zeros([numel(in) 16]);
    for k = 0:15
        for i = 1:numel(in)
            y(i, k+1) = sbox(bitxor(k, in(i))+1);
            hamming(i, k+1) = hammingweight(y(i, k+1));
        end
    end 
            
    % STEP 4: Load the traces
    traces = load('traces.mat');
    traces = traces.traces;
    
    
    % STEP 5: column-wise correlation
    %correlation = corr(traces, hamming);
    
    % STEP 6: rank prediction best to worst
    
    % STEP 7: plot 1
    
    % STEP 8: plot 2
    
    
    % ::HELPER FUNCTIONS
    % Computes the hamming weight of a given integer.
    function w = hammingweight(bits)
        w = 0;
        while ( bits > 0 )
            bits = bitand( bits, bits-1 );
            w = w + 1;
        end        
    end
    
    % Efficiently computes correlation between two matrices of equal size. 
    function C = corr(A, B)
        An=bsxfun(@minus,A,mean(A,1)); %%% zero-mean
        Bn=bsxfun(@minus,B,mean(B,1)); %%% zero-mean
        An=bsxfun(@times,An,1./sqrt(sum(An.^2,1))); %% L2-normalization
        Bn=bsxfun(@times,Bn,1./sqrt(sum(Bn.^2,1))); %% L2-normalization
        C=sum(An.*Bn,1); %% correlation        
    end
end