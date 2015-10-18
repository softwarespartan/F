classdef Range < matlab.unittest.TestCase
    
    methods (Test)
        
        function testRange1(testCase)
            testCase.verifyEqual(1:5,F.Range(5));
        end
        
        function testRange2(testCase)
            testCase.verifyEqual({1:5},F.Range({5}));
        end
        
        function testRange3(testCase)
            testCase.verifyEqual(1:5,F.Range([5]));
        end
        
        function testRange4(testCase)
            act = {1:1,1:2,1:3,1:4};
            obs = F.Range({1 2 3 4});
            testCase.verifyEqual(act,obs);
        end
        
        function testRange5(testCase)
            act = {1:1,1:2,1:3,1:4};
            obs = F.Range([1 2 3 4]);
            testCase.verifyEqual(act,obs);
        end
        
        function testRange6(testCase)
            act = {1:4,2:5};
            obs = F.Range({1,2},{4,5});
            testCase.verifyEqual(act,obs);
        end
        
        function testRange7(testCase)
            act = {1:4,2:2:4};
            obs = F.Range({1,2},{4,5},{1,2});
            testCase.verifyEqual(act,obs);
        end
        
        function testRange8(testCase)
            act = {1:4,2:2:4};
            obs = F.Range({1,2},[4,5],[1,2]);
            testCase.verifyEqual(act,obs);
        end
        
        function testRange9(testCase)
            act = {1:4,2:2:4};
            obs = F.Range({1,2},[4,5],[1,2]);
            testCase.verifyEqual(act,obs);
        end
        
        function testRange10(testCase)
            act = {1,{1:2,1:3}};
            obs = F.Range({1,{2,3}});
            testCase.verifyEqual(act,obs);
        end
        
        function testRange11(testCase)
            act = {1,{1:2,{1:3}}};
            obs = F.Range({1,{2,{3}}});
            testCase.verifyEqual(act,obs);
        end
        
        function testRange12(testCase)
            act = {1:5};
            obs = F.Range(1,5,{1});
            testCase.verifyEqual(act,obs);
        end
    end
end