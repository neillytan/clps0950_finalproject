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
cell_columns = 1:size(original,2)*3;
cell_rows = 1:size(original,1);
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

%displaying instructions
DrawFormattedText(window, 'This program will assist coders to code explanations of behavior using the F.Ex. coding scheme (Malle, 1997, 2004, 2011) \n There are five major categories of F.Ex. codes and they are as followed: \n 1 - Cause Explanations\n 2 - Causal History of Reason\n 3 - Reason Explanations (marked)\n 4 - Reason Explanations (unmarked)\n 6 - Enabling Factor Explanations\n\n If you are ready, press the ''SPACEBAR'' to continue.','center', 'center', black);
Screen('Flip', window);
KbStrokeWait;
%Loop to go through the original matrix sentence by sentence
for ii=size(original,2)
    for jj=size(original,1)
%initialize empty variables for responses
first_response=[];
second_response=[];
third_response=[];
%% First digit
%code to display First Digit Choice & the appropriate sentence
Screen('TextSize', window, 50);
DrawFormattedText(window, char(this_sentence), 'center', 'center', black);
[vbl stim flip Missed beampos] = Screen('Flip', window);   
Screen('TextSize', window, 20);
DrawFormattedText(window, 'Choosing the first digit:\n\n Below are some instructions for choosing the first digits. \n 1: If the behavior was unintentional, it is probably a CAUSE EXPLANATION \n 2: If the intention of the behavior is explained, but the content of the explanation was NOT consciously considered by the agent, it is probably a CAUSAL HISTORY EXPLANATION \n 3: If the intention of the behavior is explained, and was a marked desire, belief, or valuing of the agent, it is probably a marked REASON EXPLANATION \n 4: If the intention of the behavior is explained, and was an unmarked desire, belief, or valuing of the agent, it is probably an unmarked REASON EXPLANATION \n 6: If the intention of the behavior is not explained, but rather answers the question “how is this possible?” then it is probably an ENABLING FACTOR EXPLANATION the word says. \n Please press the corresponding key to your decision','center', 'center', black);
Screen('Flip', window);
KbStrokeWait;
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
DrawFormattedText(window, char(this_sentence), 'center', 'center', black);
DrawFormattedText(window, 'Choosing the second digit: \n\n Below are some instructions for choosing the second digits.\n 1: agent cause: the cause operates within the agent themselves\n 2: situation cause: the cause is outside of the agent and impersonal\n 3: agent + situation: interaction \n 4: other person cause: the cause is outside of the agent but is another person’s states or attributes\n 5: agent + other person: interaction \n 6: situation + other person: interaction \n 7: agent + situation + other person: the cause is an interaction between the agent, another person, and the situation\n Please press the corresponding key to your decision','center', 'center', black);
Screen('Flip', window);
KbStrokeWait;
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
            DrawFormattedText(window, char(this_sentence), 'center', 'center', black);
            DrawFormattedText(window, 'Choosing the third digit: \n\n Below are some instructions for choosing the third digits.\n 1: cause is the agent’s behavior \n 2: cause is the agent’s internal state (emotion, bodily states)\n 3: cause is the agent’s perceptions (attention, imagination, etc.)\n 4: cause is the agent’s desires, beliefs, thoughts\n 5: cause is the agent’s traits (personality, chronic illness, etc.)\n 6: cause is the agent’s passive behaviors (receiving, becoming, dying)\n 7: cause is the agent’s habitual beliefs, desires, attitudes\n 8: cause is the agent’s category membership (clubs, social category, age cohort, etc.)\n 9: cause is the agent’s beliefs, desires, and attitudes that are a part of their character \n Please press the corresponding key to your decision','center', 'center', black);
            Screen('Flip', window);
            KbStrokeWait;
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
            DrawFormattedText(window, char(this_sentence), 'center', 'center', black);
            DrawFormattedText(window, 'Choosing the third digit: \n\n Below are some instructions for choosing the third digits.\n 1: cause is the agent’s behavior \n 2: cause is the other person’s internal state (emotion, bodily states) \n 3: cause is the other person’s perceptions (attention, imagination, etc.) \n 4: cause is the other person’s desires, beliefs, thoughts \n 5: cause is the other person’s traits (personality, chronic illness, etc.)\n 6: cause is the other person’s passive behaviors (receiving, becoming, dying)\n 7: cause is the other person’s habitual desires, beliefs, thoughts \n 8: cause is the other person’s category membership (clubs, social category, age cohort, etc.)\n 9: cause is the other person’s character desires, beliefs, thoughts \n Please press the corresponding key to your decision','center', 'center', black);
            Screen('Flip', window);
            KbStrokeWait;
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
        DrawFormattedText(window, char(this_sentence), 'center', 'center');
        DrawFormattedText(window, 'Choosing the third digit: \n\n Below are some instructions for choosing the third digits.\n 1: Desires: mental states that can be fulfilled \n 2: Beliefs: events that may or may not exist but that the agent presumes to be factual. \n 3: Valuing:  appreciations, attitudes, likings. \n Please press the corresponding key to your decision','center', 'center', black);
        Screen('Flip', window);
        KbStrokeWait;
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
code = (first_response*100) + (second_response*10) + (third_response);
DrawFormattedText(window, 'Your code for this explanation is ','center', 'center', black);
DrawFormattedText(window, char(code), 'center', 'center', black);
DrawFormattedText(window, 'Please press the spacebar to confirm your choice', 'center', 'center', black);
Screen('Flip', window);
KbStrokeWait;
%code asking you to enter any comments
% base code from https://stackoverflow.com/questions/41693336/how-to-make-participant-input-appear-on-screen-and-be-wrapped-psychtoolbox

Screen('FrameRect',window, black, [300 300 700 500],4);    
msg = ['Your comments: '];

maxNumChar = 20;
vLineSpacing = 1;
string = '';
while true
    if 0
        char = GetKbChar(varargin{:});
    else
        char = GetChar;
    end
    if isempty(char)
        string = '';
        break;
    end
    switch (abs(char))
        case {13, 3, 10}
            
            break;
        case 8
            
            if ~isempty(string)
               
                string = string(1:length(string)-1);
            end
        otherwise
            string = [string, char];
    end

    comment = [msg, ' ', string];
    comment2 = WrapString(comment,maxNumChar);
    Screen('FrameRect',window, black, [300 300 700 500],4);
    DrawFormattedText(window,comment2,320,320,0,[],0,0,vLineSpacing);
    DrawFormattedText(window, 'Please press "Enter" to proceed', 300, 530, black);
    Screen('Flip',window);
end
%writes the code into the appropriate column in the same row as before
response_cell(jj, 3*(ii-1)+2 )=code;
response_cell(jj,3*(ii-1)+3)=comment;
    end
    end
end
%creates a csv file
temp_table = cell2table(response_cell, 'VariableNames',{'Preparsed_Sentence' 'Code' 'Comments'});
writetable(temp_table,'Final.csv')
