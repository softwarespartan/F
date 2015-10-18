function dmax = Depth( expr )
% F.DEPTH gives one plus the maximum number of indices needed to specify any part of the expr. 

    % enforce function signature
    if nargin ~=1; error('input must be exactly 1 argument of type cell'); end
        
    % enforce input type (maybe structs etc later)
    if ~isa(expr,'cell'); error('input must be of type cell'); end
    
    % alloc for traversal
    ds = ones(numel(expr),1); ix = 1; dmax = 1;
    
    % how deep can we go ...
    for i = 1:numel(expr)
        
        % if it's a cell then it can be traversed
        if isa(expr{i},'cell');
            
            % do traverse
            [ds,dmax] = do(expr{i},ds,ix,dmax);
        end
        
        % update parent index
        ix = ix+1;
    end
    
    % note: after this loop, max(ds) is equal to dmax
    
    % finally, add one to dmax
    dmax = dmax + 1;
    
    function [ds,dmax] = do(expr,ds,ix,dmax)
        
        % update the current depth
        ds(ix) = ds(ix) + 1; 
        
        % update max depth if we've exceeded it
        if ds(ix) > dmax; dmax = ds(ix); end
        
        % traverse any other levels if possible
        for j = 1:numel(expr)
            
            % if it's a cell then it can be traversed
            if isa(expr{j},'cell');
                
                % do traverse
                [ds,dmax] = do(expr{j},ds,ix,dmax);
            end
        end
    end
end