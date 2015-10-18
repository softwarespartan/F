classdef isAssociative < matlab.unittest.TestCase
    
    methods (Test)
        
        function testAssociative0(testCase)
            testCase.verifyEqual(true,F.isAssociative(@plus,1,2,3));
        end
        
        function testAssociative1(testCase)
            testCase.verifyEqual(true,F.isAssociative(@sum,1,2,3));
        end
        
        function testAssociative2(testCase)
            testCase.verifyEqual(true,F.isAssociative(@plus,{1,2,3}));
        end
        
        function testAssociative3(testCase)
            testCase.verifyEqual(true,F.isAssociative(@sum,{1,2,3}));
        end
        
        function testAssociative4(testCase)
            testCase.verifyEqual(true,F.isAssociative(@plus,1,2,3,4));
        end
        
        function testAssociative5(testCase)
            testCase.verifyEqual(true,F.isAssociative(@sum,1,2,3,4));
        end
        
        function testAssociative6(testCase)
            testCase.verifyEqual(true,F.isAssociative(@plus,{1,2,3,4}));
        end
        
        function testAssociative7(testCase)
            testCase.verifyEqual(true,F.isAssociative(@sum,{1,2,3,4}));
        end
        
        function testAssociative8(testCase)
            % is this valid?
            x = [1,2;3 4]; y = [5 6; 7 8]; z = [9 10; 11 12]; 
            testCase.verifyEqual([true,true; true,true],F.isAssociative(@plus,{x,y,z}));
        end
        
        function testAssociative9(testCase)
            % test matrix multiply
            x = [1,2;3 4]; y = [5 6; 7 8]; z = [9 10; 11 12]; 
            testCase.verifyEqual([true,true; true,true],F.isAssociative(@times,{x,y,z}));
        end
    end
end