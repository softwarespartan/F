function out = ix(obj,indx)
% F.ix returns obj{indx} if obj is a cell array and obj(indx) otherwise

    % enforce function signature
    if nargin ~= 2; error('USAGE: F.ix(obj,indx)'); end

    % check for cell array
    switch class(obj)   
        case 'cell'
            out = obj{indx};
        otherwise
            out = obj(indx);
    end
end
