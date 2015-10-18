classdef Partition < matlab.unittest.TestCase 
    
    methods(Test)
    
        function testPartitionDoubleArray0(testCase)
            act = {[1,2,3,4],[5,6,7,8],[9,10,11,12]};
            obs = F.Partition(1:15,4);
            testCase.verifyEqual(act,obs);
        end
        
        function testPartitionDoubleArray1(testCase)
            act = {                                                    ...
                   [ 1,  2,  3,  4], [ 4,  5,  6,   7], [7, 8, 9, 10], ...
                   [10, 11, 12, 13], [13, 14, 15, nan]                 ...
                  };
            obs = F.Partition(1:15,4,3,1,nan);
            testCase.verifyEqual(act,obs);
        end
        
        function testPartitionDoubleArray2(testCase)
            act = {...
                   [ 1,  2,  3,   4], [ 3,   4,   5,   6], [ 5,  6,  7,  8], ...
                   [ 7,  8,  9,  10], [ 9,  10,  11,  12], [11, 12, 13, 14], ...
                   [13, 14, 15, nan], [15, nan, nan, nan]                    ...
                  };
            obs = F.Partition(1:15,4,2,1,nan);
            testCase.verifyEqual(act,obs);
        end
    
        function testPartitionDoubleArray3(testCase)
            act = {                                                            ...
                   [ 1,  2,  3,  4 ], [ 2,  3,   4,   5], [3,    4,   5,   6], ...
                   [ 4,  5,  6,  7 ], [ 5,  6,   7,   8], [6,    7,   8,   9], ...
                   [ 7,  8,  9, 10 ], [ 8,  9,  10,  11], [9,   10,  11,  12], ...
                   [10, 11, 12, 13 ], [11, 12,  13,  14], [12,  13,  14,  15], ...
                   [13, 14, 15, nan], [14, 15, nan, nan], [15, nan, nan, nan]  ...
                  };
            obs = F.Partition(1:15,4,1,1,nan);
            testCase.verifyEqual(act,obs);
        end
        
        function testPartitionDoubleArray4(testCase)
            obs = F.Partition(1:2,3);
            testCase.verifyEqual(isempty(obs),true);
        end
        
        function testPartitionDoubleArray5(testCase)
            obs = F.Partition(1:2,3,1);
            testCase.verifyEqual(isempty(obs),true);
        end
        
        function testPartitionDoubleArray6(testCase)
            act = {[1,2,nan],[2,nan,nan]};
            obs = F.Partition(1:2,3,1,1,nan);
            testCase.verifyEqual(obs,act);
        end
        
        function testPartitionDoubleArray7(testCase)
            act = {[1,2,nan,nan]};
            obs = F.Partition(1:2,4,4,1,nan);
            testCase.verifyEqual(obs,act);
        end
        
        function testPartitionDoubleArray8(testCase)
            act = 10082;
            obs = F.Partition(1:10181,100,1);
            testCase.verifyEqual(numel(obs),act);
        end
        
        function testPartitionDoubleArray9(testCase)
            act = 10181;
            obs = F.Partition(1:10181,100,1,1,nan);
            testCase.verifyEqual(numel(obs),act);
        end
        
        function testPartitionDoubleArray10(testCase)
            act = {[4,5,1],[5,1,2],[1,2,3],[2,3,4],[3,4,5],[4,5,1],[5,1,2]};
            obs = F.Partition(1:5,3,1,[-1,1]);
            testCase.verifyEqual(obs,act);
        end
        
        function testPartitionDoubleArray11(testCase)
            act = {[nan,nan,1],[nan,1,2],[1,2,3],[2,3,4],[3,4,5],[4,5,nan],[5,nan,nan]};
            obs = F.Partition(1:5,3,1,[-1,1],nan);
            testCase.verifyEqual(obs,act);
        end
        
        function testPartitionDoubleArray12(testCase)
            act = {[nan,1,2],[1,2,3],[2,3,4],[3,4,5],[4,5,nan],[5,nan,nan]};
            obs = F.Partition(1:5,3,1,[-2,1],nan);
            testCase.verifyEqual(obs,act);
        end
        
        function testPartitionDoubleArray13(testCase)
            act = {[1,2,3],[2,3,4],[3,4,5],[4,5,nan],[5,nan,nan]};
            obs = F.Partition(1:5,3,1,[-3,1],nan);
            testCase.verifyEqual(obs,act);
        end
        
        function testPartitionDoubleArray14(testCase)
            act = {[NaN,NaN,1,2],[1,2,3,4],[3,4,5,NaN],[5,NaN,NaN,NaN]};
            obs = F.Partition(1:5,4,2,[-2,1],nan);
            testCase.verifyEqual(obs,act);
        end
        
        function testPartitionDoubleArray15(testCase)
            act = {[1,2,3,4],[3,4,5,NaN],[5,NaN,NaN,NaN]};
            obs = F.Partition(1:5,4,2,[1,1],nan);
            testCase.verifyEqual(obs,act);
        end
        
        function testPartitionDoubleArray16(testCase)
            act = {[1,2,3,4]};
            obs = F.Partition(1:5,4,2,[1,-1],nan);
            testCase.verifyEqual(obs,act);
        end
        
        function testPartitionDoubleArray17(testCase)
            act = {[NaN,NaN,NaN,1],[NaN,1,2,3],[2,3,4,5]};
            obs = F.Partition(1:5,4,2,[-1,-1],nan);
            testCase.verifyEqual(obs,act);
        end
        
        function testPartitionDoubleArray18(testCase)
            act = {[NaN,NaN,NaN,1],[NaN,1,2,3],[2,3,4,5],[4,5,NaN,NaN]};
            obs = F.Partition(1:5,4,2,[-1,1],nan);
            testCase.verifyEqual(obs,act);
        end
        
        function testPartitionDoubleArray19(testCase)
            act = {[3,4,5,1],[5,1,2,3],[2,3,4,5]};
            obs = F.Partition(1:5,4,2,-1);
            testCase.verifyEqual(obs,act);
        end
        
        function testPartitionDoubleArray20(testCase)
            act = {[5,1,2,3],[2,3,4,5],[4,5,1,2]};
            obs = F.Partition(1:5,4,2,-3);
            testCase.verifyEqual(obs,act);
        end
        
        function testPartitionDoubleArray21(testCase)
            act = {1:3,3:5,5:7,7:9,9:10};
            obs = F.Partition(1:10,3,2,1,[]);
            testCase.verifyEqual(obs,act);
        end
        
        function testPartitionCellArrayChar0(testCase)
            input = {'a','b','c','d','e','f','g'};
            act = {{'a','b','c'},{'d','e','f'}};
            obs = F.Partition(input,3);
            testCase.verifyEqual(obs,act);
        end
        
        function testPartitionCellArrayChar1(testCase)
            input = {'a','b','c','d','e','f','g'};
            act = {{'a','b','c'},{'c','d','e'},{'e','f','g'}};
            obs = F.Partition(input,3,2);
            testCase.verifyEqual(obs,act);
        end
        
        function testPartitionCellArrayChar2(testCase)
            input = {'a','b','c','d','e','f','g'};
            act = {{'a','b','c'},{'d','e','f'},{'g','x','x'}};
            obs = F.Partition(input,3,3,1,{'x'});
            testCase.verifyEqual(obs,act);
        end
        
        function testPartitionStructArray0(testCase)
            
            % init array of structs
            for i = 1:4; s(i).x = i; end %#ok<AGROW>
            
            % create the correct output
            act = {s(1:3)};
            
            % perform the partioning
            obs = F.Partition(s,3);
            
            % verify observed output
            testCase.verifyEqual(obs,act);
        end
        
        function testPartitionStructArray1(testCase)
            
            % init array of structs
            for i = 1:4; s(i).x = i; end %#ok<AGROW>
            
            % create the correct output
            act = {s(1:3),[s(3:4),struct('x',nan)]};
            
            % perform the partioning
            obs = F.Partition(s,3,2,1,struct('x',nan));
            
            % verify observed output
            testCase.verifyEqual(obs,act);
        end
        
        function testPartitionCellArrayPadding1(testCase)
            input = {1,2,3,4,5,6,7,8,9,10};
            act = {{1,2,3},{4,5,6},{7,8,9},{10,nan,nan}};
            obs = F.Partition(input,3,3,1,nan);
            
            % make sure observed matches actual result
            testCase.verifyEqual(obs,act);
            
            % also double check that the two calls produce equivalent output
            testCase.verifyEqual(F.Partition(input,3,3,1,{nan}),F.Partition(input,3,3,1,nan));
        end
        
        function testPartitionCellArrayPadding2(testCase)
            input = [1,2,3,4,5,6,7,8,9,10];
            act = {[1,2,3],[4,5,6],[7,8,9],[10,nan,nan]};
            obs = F.Partition(input,3,3,1,{nan});
            
            % make sure observed matches actual result
            testCase.verifyEqual(obs,act);
            
            % also double check that the two calls produce equivalent output
            testCase.verifyEqual(F.Partition(input,3,3,1,{nan}),F.Partition(input,3,3,1,nan));
        end
    end
end