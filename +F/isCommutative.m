function bool = isCommutative(f,varargin)
% F.isCommutative(f,a,b) tests if f(a,b) == f(b,a)
% F.isCommutative(f,{a,b}) 
% F.isCommutative(f,{a,b,c,d,...})

    % enforce function signature
    if nargin < 2
        error('invalid number of input args: input must be (f,{a,b}) or (f,a,b)'); 
    end
    
    % enforce input arg types
    if ~isa(f,'function_handle'); error('input arg1 must be of type function_handle'); end
    
    % extract the test arguments
    if numel(varargin) == 1; list = varargin{1}; else list = varargin; end
    
    % enforce input parameter size
    if numel(list) < 2
        error('invalid number of input args: input must be (f,{a,b}) or (f,a,b)'); 
    end
    
    % compute left and right hand sides of the tests
    lhs = f(F.ix(list,1),F.ix(list,2));  rhs = f(F.ix(list,2),F.ix(list,1));

    % do the test ... use F.ix for list = {1,2,3} or list = [1,2,3]
    try
        % since we computed lhs and rhs in advance likely to succeed here
        bool = ( lhs == rhs );
    catch
        % proly dimension mismatch like [3, 7] == [3; 7]
        bool = false;
    end
end