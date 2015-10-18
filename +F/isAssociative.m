function bool = isAssociative(f,varargin)
% F.isAssociative(f,a,b,c) tests if f(a,f(b,c)) == f(f(a,b),c)
% F.isAssociative(f,{a,b,c}) 
% F.isAssociative(f,{a,b,c,d,e,...})

    % enforce function signature
    if nargin < 2
        error('invalid number of input args: input must be (f,{a,b,c}) or (f,a,b,c)'); 
    end
    
    % enforce input arg types
    if ~isa(f,'function_handle'); error('input arg1 must be of type function_handle'); end
    
    % extract the test arguments
    if numel(varargin) == 1; list = varargin{1}; else list = varargin; end
    
    % enforce input parameter size
    if numel(list) < 3
        error('invalid number of input args: input must be (f,{a,b}) or (f,a,b)'); 
    end
    
    % precompute left and right hand sides of test
    lhs = f(f(F.ix(list,1),F.ix(list,2)),F.ix(list,3));
    rhs = f(F.ix(list,1),f(F.ix(list,2),F.ix(list,3)));
    
    % do the test ... use F.ix for list = {1,2,3} or list = [1,2,3]
    try
        % since we computed lhs and rhs in advance likely to succeed here
        bool = ( lhs == rhs );
    catch
        % proly dimension mismatch like [3, 7] == [3; 7]
        bool = false;
    end
end

