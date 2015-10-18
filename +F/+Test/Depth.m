classdef Depth < matlab.unittest.TestCase
    
    methods (Test)
        
        function testDepth0(testCase)
            % test base case for empty array
            testCase.verifyEqual(2,F.Depth({}));
        end
        
        function testDepth1(testCase)
            % test base case for empty array
            testCase.verifyEqual(3,F.Depth({{}}));
        end
        
        function testDepth2(testCase)
            % test base case for empty array
            testCase.verifyEqual(4,F.Depth({{{}}}));
        end
        
        function testDepth3(testCase)
            % test base case for empty array
            testCase.verifyEqual(3,F.Depth({{},1}));
        end
        
        function testDepth4(testCase)
            % test base case for empty array
            testCase.verifyEqual(9,F.Depth({ {{{{}}}},{{{{{{}}}}}},{{{{{{{}}}}}}} }));
        end
    end
end

