%
% F: Functional Programing in Matlab 
%
% Methods:
%
%   Cix           - F.Cix(N,idx) ........... converts idx to circular indices for container of size N.
%   ix            - F.ix(obj,indx) ......... returns obj{indx}   if obj is a cell array and obj(indx) otherwise
%   Partition     - F.Partition(data,n) .... decomposes data into nonoverlapping partitions of length n 
%   Range         - F.Range(imax) .......... generates the list [1,2,...,imax]
%   Depth         - F.Depth(expr) .......... gives 1 plus the maximum number of indices needed to specify any part of the expr.
%   Dimensions    - F.Dimensions(expr) ..... gives a list of the dimensions of input expr
%   isCommutative - F.isCommutative(f,a,b)   tests if f(a,b) == f(b,a)
%   isAssociative - F.isAssociative(f,a,b,c) tests if f(a,f(b,c)) == f(f(a,b),c)
%   Reduce        - F.Reduce(f,list) ....... computes f(f(f(list{1},list{2}), ...),list{end})
%   Map           - F.Map(f,list) .......... applies f to the first level of each in list
%
% Tests:
%
%    run(matlab.unittest.TestSuite.fromPackage('F.Test'))
%
