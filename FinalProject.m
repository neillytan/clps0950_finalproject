function response_cell = FexCode(original)

%initialize key codes for responses
zero=KbName('0'); %might not need this
one=KbName('1');
two=KbName('2');
three=KbName('3');
four=KbName('4');
five=KbName('5');
six=KbName('6');
seven=KbName('7');
eight=KbName('8');
nine=KbName('9');
quit=KbName('x'); %quitting key
cont=KbName('space'); %continue key
goback=KbName('a'); %'go back' key

%initialize the response cell matrix
cell_columns = size(original,2)*3;
cell_rows = size(original,1);
response_cell = cell(cell_rows, cell_columns);
%input the original data into the response cell matrix
for n= 1:size(original,2)
    for m= 1:size(original,1)
    %places the original data in every third column
    response_cell(m,(3*(n-1))+1)=original(m,n);
    end
end

%% PsychToolBox boilerplate
sca;
close all;
clear all;
Screen('Preference', 'SkipSyncTests', 1);
PsychDefaultSetup(2);
screenNumber = max(Screen('Screens'));
white = WhiteIndex(screenNumber);
grey = white / 2;
black = BlackIndex(screenNumber);
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, white, [], 32, 2);
[screenXpixels, screenYpixels] = Screen('WindowSize', window);
ifi = Screen('GetFlipInterval', window);
rr = FrameRate(window);
Screen('TextSize', window, 40);
isiTimeSecs = 1;
isiTimeFrames = round(isiTimeSecs / ifi);
waitframes = 1;

%Loop to go through the original matrix sentence by sentence
for ii=size(original,2)
    for jj=size(original,1)
%initialize empty variables for responses
first_response=[];
second_response=[];
third_response=[];
%% First digit
%code to display First Digit Choice & the appropriate sentence
hasAnswered = false;
%This chunk requires a correct answer to continue
    while ~hasAnswered
        [keyIsDown,secs, keyCode] = KbCheck;
        if keyIsDown
            if keyCode(quit)
                ShowCursor;
                sca;
                return
            %requires a 1,2,3,4, or 6, 
            elseif keyCode(one)||keyCode(two)|| keyCode(three)||keyCode(four)||keyCode(six)
                hasAnswered = true;
                %records the response into first_response 
                first_response= str2double(KbName(keyCode));
                continue
            end
        end
    end
    WaitSecs(.5)
%first_response is a variable created by user input

%% Second Digit
%code to display Second (1-7)
hasAnswered = false;
%This chunk requires a correct answer to continue
    while ~hasAnswered
        [keyIsDown,secs, keyCode] = KbCheck;
        if keyIsDown
            if keyCode(quit)
                ShowCursor;
                sca;
                return
            %requires a 1,2,3,4,5,6, or 7
            elseif keyCode(one)||keyCode(two)|| keyCode(three)||keyCode(four)||keyCode(five)||keyCode(six)||keyCode(seven)
                hasAnswered = true;
                %records the response into second_response 
                second_response= str2double(KbName(keyCode));
                continue
            elseif keyCode(goback)
                %code to display First Digit Choice AGAIN & the appropriate sentence
                hasAnswered = false;
                %This chunk requires a correct answer to continue
                    while ~hasAnswered
                        [keyIsDown,secs, keyCode] = KbCheck;
                        if keyIsDown
                            if keyCode(quit)
                                ShowCursor;
                                sca;
                                return
                                %requires a 1,2,3,4, or 6, 
                                elseif keyCode(one)||keyCode(two)|| keyCode(three)||keyCode(four)||keyCode(six)
                                    hasAnswered = true;
                                    %records the response into first_response 
                                    first_response= str2double(KbName(keyCode));
                                    continue
                            end
                            end
                    end
                    WaitSecs(.5)
              end
        end
    end
    WaitSecs(.5)
  %% Third Digit  
    if (first_response == 1 || first_response == 2 || first_response == 6) 
        if (second_response == 1 || second_response == 3 ||...
            second_response == 5 || second_response == 7)
        %% code to display ThirdA (agent cause 3rd digits 1-9)
            hasAnswered = false;
            %This chunk requires a correct answer to continue
                while ~hasAnswered
                    [keyIsDown,secs, keyCode] = KbCheck;
                    if keyIsDown
                        if keyCode(quit)
                            ShowCursor;
                            sca;
                            return
                        %requires a 1,2,3,4,5,6,7,8,9
                        elseif keyCode(one)||keyCode(two)|| keyCode(three)||keyCode(four)||keyCode(five)||keyCode(six)||keyCode(seven)||keyCode(eight)||keyCode(nine)
                            hasAnswered = true;
                            %records the response into third_response 
                            third_response= str2double(KbName(keyCode));
                        elseif keyCode(goback)
                            %code to display Second Digit Choice AGAIN (1-7)
                            hasAnswered = false;
                            %This chunk requires a correct answer to continue
                                while ~hasAnswered
                                    [keyIsDown,secs, keyCode] = KbCheck;
                                    if keyIsDown
                                        if keyCode(quit)
                                            ShowCursor;
                                            sca;
                                            return
                                        %requires a 1,2,3,4,5,6, or 7
                                        elseif keyCode(one)||keyCode(two)|| keyCode(three)||keyCode(four)||keyCode(five)||keyCode(six)||keyCode(seven)
                                            hasAnswered = true;
                                            %records the response into second_response 
                                            second_response= str2double(KbName(keyCode));
                                            continue
                                        elseif keyCode(goback)
                                            %code to display First Digit Choice AGAIN & the appropriate sentence
                                            hasAnswered = false;
                                            %This chunk requires a correct answer to continue
                                                while ~hasAnswered
                                                    [keyIsDown,secs, keyCode] = KbCheck;
                                                    if keyIsDown
                                                        if keyCode(quit)
                                                            ShowCursor;
                                                            sca;
                                                            return
                                                            %requires a 1,2,3,4, or 6, 
                                                            elseif keyCode(one)||keyCode(two)|| keyCode(three)||keyCode(four)||keyCode(six)
                                                                hasAnswered = true;
                                                                %records the response into first_response 
                                                                first_response= str2double(KbName(keyCode));
                                                                continue
                                                            end
                                                     end
                                                end
                                                WaitSecs(.5)
                                          end
                                    end
                                end
                                WaitSecs(.5)
                        end
                    end
                end
        WaitSecs(.5)
        elseif second_response == 2 || second_response == 6
        %no display necessary because third response is always zero
        third_response = 0;
        elseif second_response == 4
        %% code to display ThirdB (other person cause 3rd digits 1-9)
            hasAnswered = false;
                %This chunk requires a correct answer to continue
                    while ~hasAnswered
                        [keyIsDown,secs, keyCode] = KbCheck;
                        if keyIsDown
                            if keyCode(quit)
                                ShowCursor;
                                sca;
                                return
                            %requires a 1,2,3,4,5,6,7,8,9
                            elseif keyCode(one)||keyCode(two)|| keyCode(three)||keyCode(four)||keyCode(five)||keyCode(six)||keyCode(seven)||keyCode(eight)||keyCode(nine)
                                hasAnswered = true;
                                %records the response into third_response 
                                third_response= str2double(KbName(keyCode));
                                continue
                            elseif keyCode(goback)
                                %code to display Second Digit Choice AGAIN (1-7)
                                hasAnswered = false;
                                %This chunk requires a correct answer to continue
                                    while ~hasAnswered
                                        [keyIsDown,secs, keyCode] = KbCheck;
                                        if keyIsDown
                                            if keyCode(quit)
                                                ShowCursor;
                                                sca;
                                                return
                                            %requires a 1,2,3,4,5,6, or 7
                                            elseif keyCode(one)||keyCode(two)|| keyCode(three)||keyCode(four)||keyCode(five)||keyCode(six)||keyCode(seven)
                                                hasAnswered = true;
                                                %records the response into second_response 
                                                second_response= str2double(KbName(keyCode));
                                                continue
                                            elseif keyCode(goback)
                                                %code to display First Digit Choice AGAIN & the appropriate sentence
                                                hasAnswered = false;
                                                %This chunk requires a correct answer to continue
                                                    while ~hasAnswered
                                                        [keyIsDown,secs, keyCode] = KbCheck;
                                                        if keyIsDown
                                                            if keyCode(quit)
                                                                ShowCursor;
                                                                sca;
                                                                return
                                                                %requires a 1,2,3,4, or 6, 
                                                                elseif keyCode(one)||keyCode(two)|| keyCode(three)||keyCode(four)||keyCode(six)
                                                                    hasAnswered = true;
                                                                    %records the response into first_response 
                                                                    first_response= str2double(KbName(keyCode));
                                                                    continue
                                                            end
                                                            end
                                                    end
                                                    WaitSecs(.5)
                                              end
                                        end
                                    end
                                    WaitSecs(.5)
                            end
                        end
                    end
                    WaitSecs(.5)
        end
    elseif (first_response == 3 || first_response == 4)
        %% code to display ThirdC (Reason Explanation 3rd digits 1-3)
        hasAnswered = false;
            %This chunk requires a correct answer to continue
                while ~hasAnswered
                    [keyIsDown,secs, keyCode] = KbCheck;
                    if keyIsDown
                        if keyCode(quit)
                            ShowCursor;
                            sca;
                            return
                        %requires a 1,2, or 3
                        elseif keyCode(one)||keyCode(two)|| keyCode(three)
                            hasAnswered = true;
                            %records the response into third_response 
                            third_response= str2double(KbName(keyCode));
                            continue
                        elseif keyCode(goback)
                            %code to display Second Digit Choice AGAIN (1-7)
                                hasAnswered = false;
                                %This chunk requires a correct answer to continue
                                    while ~hasAnswered
                                        [keyIsDown,secs, keyCode] = KbCheck;
                                        if keyIsDown
                                            if keyCode(quit)
                                                ShowCursor;
                                                sca;
                                                return
                                            %requires a 1,2,3,4,5,6, or 7
                                            elseif keyCode(one)||keyCode(two)|| keyCode(three)||keyCode(four)||keyCode(five)||keyCode(six)||keyCode(seven)
                                                hasAnswered = true;
                                                %records the response into second_response 
                                                second_response= str2double(KbName(keyCode));
                                                continue
                                            elseif keyCode(goback)
                                                %code to display First Digit Choice AGAIN & the appropriate sentence
                                                hasAnswered = false;
                                                %This chunk requires a correct answer to continue
                                                    while ~hasAnswered
                                                        [keyIsDown,secs, keyCode] = KbCheck;
                                                        if keyIsDown
                                                            if keyCode(quit)
                                                                ShowCursor;
                                                                sca;
                                                                return
                                                                %requires a 1,2,3,4, or 6, 
                                                                elseif keyCode(one)||keyCode(two)|| keyCode(three)||keyCode(four)||keyCode(six)
                                                                    hasAnswered = true;
                                                                    %records the response into first_response 
                                                                    first_response= str2double(KbName(keyCode));
                                                                    continue
                                                            end
                                                            end
                                                    end
                                                    WaitSecs(.5)
                                              end
                                        end
                                    end
                                    WaitSecs(.5)
                        end
                    end
                end
                WaitSecs(.5)
    end
%code to ask you to confirm your choice
%code asking you to enter any comments
code = (first_response*100) + (second_response*10) + (third_response);
%writes the code into the appropriate column in the same row as before
response_cell(jj, 3*(ii-1)+2 )=code;
response_cell(jj,3*(ii-1)+3)=comment;
    end
    end
end
