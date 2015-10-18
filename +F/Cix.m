function idx = Cix(N,idx)
% F.Cix(N,idx) converts idx to circular indices for container of size N.

    % enforce function signature
    if nargin ~=2; error('two input args required');end

    % enforce input rquirements [arg1]
    if N<1 || N ~= floor(N); error('arg1 -- must be positive nonzero integer'); end

    % remove zeros 
    idx = idx(idx~=0);

    % convert positive indicies
    %ix = idx>0;  idx(ix) = idx(ix) - floor((idx(ix)-1)/N)*N;

    % convert negative indicies
    %ix = idx<0;  idx(ix) = idx(ix) - floor((idx(ix))/N)*N + 1;

    % 2x speedup
    idx = idx - floor((idx-max(0,sign(idx)))/N)*N - min(0,sign(idx));
end