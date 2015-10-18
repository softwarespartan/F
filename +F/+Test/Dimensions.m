classdef Dimensions < matlab.unittest.TestCase
    
    methods (Test)
        
        function testDimensions0(testCase)
            % test base case for empty array
            testCase.verifyEqual({0},F.Dimensions([]));
        end
        
        function testDimensions1(testCase)
            % simple test for array of doubles
            testCase.verifyEqual({4},F.Dimensions(1:4));
        end
        
        function testDimensions2(testCase)
            % simple test for multi dimensional array of doubles
            testCase.verifyEqual({2,4},F.Dimensions([1:4;10:13]));
        end
        
        function testDimensions3(testCase)
            % test for 3 dimensional array of doubles
            x(1,1,1:3) = 4:6;
            testCase.verifyEqual({1,1,3},F.Dimensions(x));
        end
        
        function testDimensions4(testCase)
            % test base case for empty cell array
            testCase.verifyEqual({0},F.Dimensions({}));
        end
        
        function testDimensions5(testCase)
            % test for cell array of emtpy cell arrays
            testCase.verifyEqual({2,0},F.Dimensions({{},{}}));
        end
        
        function testDimensions6(testCase)
            % test for ragged dims
            testCase.verifyEqual({2},F.Dimensions({{1,2,3},{4,5,6,7}}));
        end
        
        function testDimensions7(testCase)
            % test for arbitrary objects
            testCase.verifyEqual({3},F.Dimensions({struct(),{37,28},containers.Map}));
        end
        
        function testDimensions8(testCase)
            % non-trivial nested cell arrays
            list = {                                                    ...
                    {  {1,2,3}  ,  {4,5,6}  ,  {7,8,9}  , {10,11,12} }, ...
                    { {13,14,15}, {16,17,18}, {19,20,21}, {22,23,24} }, ...
                    { {25,26,27}, {28,29,30}, {31,32,33}, {34,35,36} }, ...
                    { {37,38,39}, {40,41,42}, {43,44,45}, {46,47,48} }  ...
                   };
            testCase.verifyEqual({4,4,3},F.Dimensions(list));
        end
        
        function testDimensions9(testCase)
            % non-trivial nested cell arrays with max level input
            list = {                                                    ...
                    {  {1,2,3}  ,  {4,5,6}  ,  {7,8,9}  , {10,11,12} }, ...
                    { {13,14,15}, {16,17,18}, {19,20,21}, {22,23,24} }, ...
                    { {25,26,27}, {28,29,30}, {31,32,33}, {34,35,36} }, ...
                    { {37,38,39}, {40,41,42}, {43,44,45}, {46,47,48} }  ...
                   };
               
            testCase.verifyEqual({}      ,F.Dimensions(list,0));
            testCase.verifyEqual({4}     ,F.Dimensions(list,1));
            testCase.verifyEqual({4,4}   ,F.Dimensions(list,2));
            testCase.verifyEqual({4,4,3} ,F.Dimensions(list,3));
            testCase.verifyEqual({4,4,3} ,F.Dimensions(list,4));
        end
    end
end

