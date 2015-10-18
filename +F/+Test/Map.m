classdef Map < matlab.unittest.TestCase
    
    methods (Test)
        
        function testMap0(testCase)
            % base case with no elements
            testCase.verifyEqual({},F.Map(@plus,{}));
        end
        
        function testMap1(testCase)
            % base case with single element
            testCase.verifyEqual({1},F.Map(@ceil,1));
        end
        
        function testMap2(testCase)
            % case with vector
            testCase.verifyEqual(                            ...
                                 num2cell(false(1,10))     , ...
                                 F.Map(@(x)x>1,zeros(1,10))  ...
                                );
        end
        
        function testMap3(testCase)
            % case with matrix
            testCase.verifyEqual(                           ...
                                 num2cell(zeros(10,10))   , ...
                                 F.Map(@floor,rand(10,10))  ...
                                );
        end
        
        function testMap4(testCase)
            % case with mixed types
            testCase.verifyEqual(                                            ...
                                 {false,true,false}                        , ...
                                 F.Map(@(e)isa(e,'struct'),{0,struct(),{}})  ...
                                );
        end
    end
end

