classdef isCommutative < matlab.unittest.TestCase
    
    methods (Test)
        
        function testCommutative0(testCase)
            % positive test case with explicit input
            testCase.verifyEqual(true,F.isCommutative(@plus,1,2));
        end
        
        function testCommutative1(testCase)
            % negative test case with explicit input
            testCase.verifyEqual(false,F.isCommutative(@sum,1,2));
        end
        
        function testCommutative2(testCase)
            % positive test case with implicit input
            testCase.verifyEqual(true,F.isCommutative(@plus,{1,2}));
        end
        
        function testCommutative3(testCase)
            % negative test case with implicit input
            testCase.verifyEqual(false,F.isCommutative(@sum,{1,2}));
        end
        
        function testCommutative4(testCase)
            % positive test case with explicit input
            testCase.verifyEqual(true,F.isCommutative(@plus,1,2,3));
        end
        
        function testCommutative5(testCase)
            % negative test case with explicit input
            testCase.verifyEqual(false,F.isCommutative(@sum,1,2,3));
        end
        
        function testCommutative6(testCase)
            % positive test case with implicit input
            testCase.verifyEqual(true,F.isCommutative(@plus,{1,2,3}));
        end
        
        function testCommutative7(testCase)
            % negative test case with implicit input
            testCase.verifyEqual(false,F.isCommutative(@sum,{1,2,3}));
        end
        
        function testCommutative8(testCase)
            % not sure if this is valid test
            % @plus works but @sum is error
            x = [1,2;3 4]; y = [5 6; 7 8]; z = [9 10; 11 12]; 
            testCase.verifyEqual([true true; true true],F.isCommutative(@plus,x,y,z));
        end
        
        function testCommutative9(testCase)
            % again not sure if this is valid test but whatever
            x = [1,2;3 4]; y = [5 6; 7 8]; z = [9 10; 11 12]; 
            testCase.verifyEqual([true true; true true],F.isCommutative(@plus,{x,y,z}));
        end
        
        function testCommutative10(testCase)
            % test matrix multiply for 4x4
            x = [1,2;3 4]; y = [5 6; 7 8]; z = [9 10; 11 12]; 
            testCase.verifyEqual([true true; true true],F.isCommutative(@times,{x,y,z}));
        end
    end
end