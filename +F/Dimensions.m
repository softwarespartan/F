function dims = Dimensions( expr,n )
% F.DIMENSIONS gives a list of the dimensions of input expr
% F.DIMENSIONS gives a list of the dimensions of input expr down to level n
%

    % enforce the function signature
    if nargin ~= 1 && nargin ~= 2; error('F.Dimensions expects 1 or 2 input arguments'); end
    
    % enforce params
    if nargin == 2 && (n < 0 || n ~=floor(n)); error('arg2 must be nonnegative integer');end
    
    % default max depth
    dmax = inf; if nargin == 2; dmax = n; end
    
    % init dims 
    dims = {};
    
    % proly just cells for now ...
    validTypes = {'cell','struct'};
    
    % this should likely be if ~isa(expr,'cell')
    if isa(expr,'double'); dims = size(expr); 
        if numel(dims) == 2 && any(dims<=1); 
            dims = {max(dims)}; 
        else
            dims = num2cell(dims); 
        end
        return;
    end
    
    % check case that n = 0
    if dmax == 0; return; end;
    
    % compute dims recursively ...
    dims = loop(expr,1,dims,class(expr),dmax);

    function dims = loop(expr,l,dims,type,lmax)
        
        % compute i'th level dimension
        dims{l} = numel(expr);
        
        % check for empty expression
        if dims{l} == 0; return; end
        
        % check if we are at max level depth
        if l == lmax; return; end
        
        % if incoming expression is not valid we're done
        if ~any(strcmpi(validTypes,class(expr))); return; end 
        
        % init book keeping
        sz = nan(dims{l},1);  cls = cell(dims{l},1);
        
        % compute the size and type for each element
        for i = 1:dims{l}
            sz(i) = numel(F.ix(expr,i)); cls{i} = class(F.ix(expr,i));
        end
        
        % if any sub expression is 'ragged' we're done
        if ~all(sz == sz(1)); return; end
            
        % if not all sub expressions of same type we're done
        ucls = unique(cls);  if numel(ucls) ~= 1; return; end
        
        % make sure unique type is valid type and matches parent type
        if ~ any(strcmp(ucls{1},validTypes)) || ~strcmp(ucls{1},type); return; end
        
        % look ahead at next iteration ... 
        for i = 1:dims{l};  e = expr{i};
            for j = 1:numel(e); 
                if ~isa(e{j},'cell'); dims{l+1} = sz(1); return; end
            end
        end
        
        % ok, traverse to next level
        dims = loop(expr{1},l+1,dims,type,lmax);
    end
end