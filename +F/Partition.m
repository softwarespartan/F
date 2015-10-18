function p = Partition(l,n,offset,k,x)
% F.Partition(data,n) decomposes data into nonoverlapping partitions of length n 
% F.Partition(data,n,d) generates partitions with offset d (overlap)
% F.Partition(data,n,d,[kL,kR]) specifies that the first element of list should appear 
%                               at position kL in the first partition, and the last element
%                               of data should appear at or after position kR in the last
%                               partition. If additional elements are needed, F.Partition fills 
%                               them in by treating data as cyclic,
% F.Partition(data,n,d,[kL,kR],x) pads partitions if necessary by repeating the element x
%
% NOTE: data must have operators [] and () defined

    % enforce function signature
    if nargin <2; error('USAGE: p = F.Partition(l,n,[offset],[null])'); end

    % set the default offset
    if nargin == 2; offset = n; end

    % make sure that offset is nonzero positive
    if nargin >= 3 && offset <= 0
        error('arg3 -- offset must be nonzero positive integer'); end

    % set the default values for latteral offsets (k)
    kL = 1; kR = nan;

    % unpak k if needed
    if nargin >= 4

        % handle cell array for kL and kR
        if isa(k,'cell'); k = cell2mat(k); end
        
        % make sure that overhang is not empty
        if isempty(k); error('arg4 -- must contain 1 or 2 integer elements'); end

        % expand k to both right and left if needed
        if numel(k) == 1; k = [k,k]; end

        % extract overhang
        kL = k(1); kR = k(2);
    end

    % make sure that overhang specified are integers
    if (~isnan(kL)&&kL~=floor(kL)) || (~isnan(kR)&&kR~=floor(kR))
        error('arg4 -- must be of type integer');
    end

    % make sure that overhang specified are <= partition size
    % NOTE: Mathematica allows this but not sure it makes sense(?)
    if any(abs([kL,kR])>n); 
        error('arg4 -- magnitude must be less and or equal to partition size [arg2]');
    end

    % make sure that padding element matches type of list
    if nargin == 5 && ~strcmp(class(l),class(x))
        
        % init error message
        errmsg = 'class(arg5) must match class(arg1)';
        
        % if l is a double and x is a cell try cell2mat
        if     isa(l,'double') && isa(x,'cell'  ); try x = cell2mat(x); catch; error(errmsg); end %#ok<ALIGN>
            
        % if l is a cell array and x is a double try convert to cell
        elseif isa(l,'cell'  ) && isa(x,'double'); try x = num2cell(x); catch; error(errmsg); end
            
        % out of ideas ... yell at the user
        else   error(errmsg);  end
    end

    % init number of left padding elements
    nPl = 0;

    % compute left pad elements
    if nargin >= 4 && kL ~=1

        % fist compute the number of pad elements
        nPl = abs(n-abs(kL)); 

        % now figure out what pad elements are
        if nargin == 4

            % cyclic element selection
            l = [l(end-nPl+1:end) l];
        else

            % use padding element
            l = [repmat(x,1,nPl) l];
        end
    end

    % compute number of whole partitions and partial partitions
    nP = floor((numel(l)-n)/offset)+1;  mP = ceil(numel(l)/offset)-nP; 

    % compute number of additional elements to pad on the right
    npR = (nP + mP - 1)*offset + n - numel(l);

    % now add pad right
    if nargin >=4 && npR ~= 0 && kR ~= -1 

        % update number of partitions
        nP = nP + mP;

        % compute padding element
        if nargin == 4

            % cyclic selection
            l = [l l(1+nPl:npR+nPl)];
        else
            % padding element 
            l = [l repmat(x,1,npR)];
        end
    end

    % mem alloc for partitions
    p = cell(1,nP);

    % do partition
    for i = 1:nP

        % compute indices for the i'th partition
        start = (i-1)*offset + 1;  stop = start + n - 1;

        % extract the elements
        p{i} = l(start:min(stop,numel(l)));
    end
end 