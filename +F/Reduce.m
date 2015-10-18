function result = Reduce(f,list)
% F.Reduce(f,list) computes f(f(f(list{1},list{2}), ...),list{end})

    % enforce function signature
    if nargin ~= 2; error('invalid number of input args: input must be (f,{a,b,c,...})'); end
    
    % enforce input arg1 type
    if ~isa(f,'function_handle'); error('input arg1 must be of type function_handle'); end
    
    % enforce input arg2 type
    if ~isa(list,'cell'); list = num2cell(list); end
    
    % figure out how many elements
    N = numel(list);
    
    % check empty list, return empty if empty
    if N==0; result = {}; return; end
    
    % check for single element, return that element
    if N==1; result = list{1}; return; end
    
    % if only two elemens then apply directly
    if N==2; result = f(list{1},list{2}); return; end
    
    % init the stride, index, number of iterations
    stride = 2;  indx = 1:stride:N;  numIter = nextpow2(N);
        
    % reduce elements to 1
    for i = 1:numIter
        
        % perform pair wise apply: f(a,b)
        for j = indx; if j+stride/2 > N; continue; end
            list{j} = f(list{j},list{j+stride/2}); 
        end
        
        % update stride and index
        stride = 2 * stride;  indx = 1:stride:N;
    end

    % and we're done ...
    result = list{1};
end