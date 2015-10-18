classdef Reduce < matlab.unittest.TestCase
    
    methods (Test)
        
        function testReduce0(testCase)
            % base case with no elements
            testCase.verifyEqual({},F.Reduce(@plus,{}));
        end
        
        function testReduce1(testCase)
            % base case with only one element
            testCase.verifyEqual(1,F.Reduce(@plus,{1}));
        end
        
        function testReduce2(testCase)
            % base case with only two elements
            testCase.verifyEqual(3,F.Reduce(@plus,{1,2}));
        end
        
        function testReduce3(testCase)
            % convert input to cell array
            testCase.verifyEqual(362880,F.Reduce(@times,1:9));
        end
        
        function testReduce4(testCase)
            % test for summing arrays
            for i = 1000:1000:10000
                x = 1:i; testCase.verifyEqual(sum(x),F.Reduce(@plus,num2cell(x)));
            end
        end
        
        function testReduce5(testCase)
            % test for multiplying matrices
            
            % test setup params
            N = 100; M = 100; m = cell(1,N);
            
            % init matricies
            for i = 1:N;  m{i} = ones(M); end
            
            % test
            testCase.verifyEqual(ones(M),F.Reduce(@times,m));
        end
        
        function testReduce6(testCase)
            % test for combination (pizzahut and tacobell)
            testCase.verifyEqual(1:21,F.Reduce(@horzcat,num2cell(1:21)));
        end
        
        function testReduce7(testCase)
            
            % params setup
            p = {'x','y','z'}; N = 100;
            
            % function to aggregate struct fields rather than array of structs
            function s = scat(s1,s2)
                flds = fieldnames(s1);  s = struct();
                for i = 1:numel(flds); s.(flds{i}) = [s1.(flds{i}),s2.(flds{i})]; end
            end
            
            % init the input and result
            s = struct();  s.x = []; s.y = []; s.z = []; sT = s;
            
            % create bunch of random structs
            for j = 1:N
                for k = 1:numel(p); 
                    r = rand(1);  s(j).(p{k}) = r;  sT.(p{k}) = [sT.(p{k}) r];
                end
            end
            
            % test for equality
            testCase.verifyEqual(sT,F.Reduce(@scat,num2cell(s)));
        end
        
        function testReduce8(testCase)
            testCase.verifyEqual(true,F.Reduce(@(a,b)a<b,1:10));
        end
    end
end