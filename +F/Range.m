function r = Range(imin,imax,d)
% F.Range(imax) generates the list [1,2,...,imax]
% F.Range(imin,imax) generates the list [imin, imin+1, ..., imax]
% F.Range(imin,imax,di) uses stepsize di

    % enforce function signature
    if nargin > 3 || nargin < 1
        error('USAGE:  r = F.Range({imin},{imax},{di})');
    end
    
    % set defaults
    if nargin == 1; imax = imin; imin = 1; d = 1; end
    if nargin == 2;                        d = 1; end
    
    % get dimensions of input arguments
    dims = [numel(imin),numel(imax),numel(d)];
    
    % figure out max dimension
    N = max(dims);
    
    % enforce input dimensions
    if any(dims ~= 1 & dims ~= N); error('input dimension mismatch'); end
    
    % check if the input contains any cell arrays for the base case
    isaCell = strcmp(cellfun(@(c)class(c),{imin,imax,d},'UniformOutput',0),'cell');
    
    % base case
    if all(dims==1) && ~any(isaCell)
        r = F.ix(imin,1):F.ix(d,1):F.ix(imax,1); return; end
    
    % mem alloc
    r = cell(1,N);
    
    % process elements 
    for i = 1:N        
        r{i} = F.Range(...
                       F.ix(imin,F.Cix(numel(imin),i)),...
                       F.ix(imax,F.Cix(numel(imax),i)),...
                       F.ix(   d,F.Cix(numel(   d),i)) ...
                      );
    end
end