classdef CircularBuffer < handle
% F.CIRCULARBUFFER create a bounded circular/ring buffer of size N
    
    properties(Access = 'public')
        N   ;
        head;
        idx ;
        raw ;
    end
    
    methods (Access = 'public')
        
        function this = CircularBuffer(N)
            this.N = N;  this.head = 1; this.idx = 1:N; this.raw = cell(1,N);
        end
        
        function append(this,data)
            
            % enforce function signature
            if nargin ~= 2; error('append takes on input argument'); end
            
            % base case 
            if isempty(data); return; end
            
            % if the length of the data to append is larger than the buffer then trim
            if numel(data) > this.N; 
                
                % consume the whole buffer
                this.raw = data(this.N-numel(data):end); 
                
                % reset metadata variables
                this.head = 1; this.idx = 1:this.N;
                
                % and we're done
                return;
            end
            
            % generate ciruclar index for data insertion
            indx = F.Cix(this.N,this.head:this.head+numel(data)-1);
            
            % just add in the elements at the head
            this.raw(indx) = data;
            
            % update metadata
            this.head = F.Cix(this.N,this.head+numel(data)); this.idx = circshift(this.idx,[0,numel(data)]);
        end
    end
end

