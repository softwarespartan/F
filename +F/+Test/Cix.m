classdef Cix < matlab.unittest.TestCase
    
    methods (Test)
        
        function testCix1(testCase)
            act = [5,1];
            obs = F.Cix(5,-1:1);
            testCase.verifyEqual(act,obs);
        end
        
        function testCix2(testCase)
            act = [5,1:5,1:5,1];
            obs = F.Cix(5,-6:6);
            testCase.verifyEqual(act,obs);
        end
        
        function testCix3(testCase)
            % test random access
            act = [5 1 4 2];
            obs = F.Cix(5,[0 -1 1 0 -2 0 2]);
            testCase.verifyEqual(act,obs);
        end
    end
end

