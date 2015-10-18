classdef ix < matlab.unittest.TestCase
    
    methods (Test)
        
        function testIx1(testCase)
            act = 5;
            obs = F.ix(5,1);
            testCase.verifyEqual(act,obs);
        end
        
        function testIx2(testCase)
            act = 5;
            obs = F.ix({5},1);
            testCase.verifyEqual(act,obs);
        end
        
        function testIx3(testCase)
            act = [5 1 4 2];
            obs = F.ix({[5 1 4 2]},1);
            testCase.verifyEqual(act,obs);
        end
        
        function testIx4(testCase)
            act = {5 1 4 2};
            obs = F.ix({{5 1 4 2}},1);
            testCase.verifyEqual(act,obs);
        end
    end
end
