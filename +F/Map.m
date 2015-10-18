function list = Map(f,expr)
%F.Map applies f to the first level of each element in list

    % enforce function signature
    if nargin ~= 2; error('invalid input args.  input must be Map(f,list)'); end

    % enforce parameter types for function
    if ~isa(f,'function_handle'); error('input arg1 must be of type function_handle'); end
    
    % init list
    list = cell(size(expr));  if isempty(expr); return; end
    
    % apply the function f to each element of expr
    for i = 1:numel(expr); try list{i} = f(F.ix(expr,i)); catch ME; list{i}=ME; end; end
end
