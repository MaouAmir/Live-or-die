Screen('Preference', 'SkipSyncTests', 0);
% Clear the workspace and the screen
close all;
clear;
sca

id=input('SAMPLE ID(Do NOT enter 1): ');
% Randomly seed the random number generation


% Here we call some default settings for setting up Psychtoolbox
PsychDefaultSetup(2);

% Get the screen numbers
screens = Screen('Screens');

% Select the external screen if it is present, else revert to the native
% screen
screenNumber = max(screens);

% Define black
black = BlackIndex(screenNumber);

% Open an on screen window and color it grey
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, black);

% Get the vertical refresh rate of the monitor
ifi = Screen('GetFlipInterval', window);


topPriorityLevel = MaxPriority(window);
Priority(topPriorityLevel);


escapeKey = KbName('ESCAPE');
LKey = KbName('L');
DKey = KbName('D');

% Get the size of the on screen window in pixels
% For help see: Screen WindowSize?
[screenXpixels, screenYpixels] = Screen('WindowSize', window);

% Get the centre coordinate of the window in pixels
% For help see: help RectCenter
[xCenter, yCenter] = RectCenter(windowRect);

% We set the text size to be nice and big here
Screen('TextSize', window, 100);
% Enable unified mode of KbName, so KbName accepts identical key names on
% all operating systems:
KbName('UnifyKeyNames');



% Start the keyboard queue: this will log keypresses continously. We start
% the queue on the default keyboard device.


% Stop the key presses vomiting out into the script or command window

% We will be presenting each of our numbers 10 through 0 for one seconds
% each
presSecs = 1;
waitframes = 5;

% We change the color of the number every "nominalFrameRate" frames
colorChangeCounter = 0;

% Randomise a start color
countcolor = [1 1 1];

% Starting number
currentNumber = 100;
wholenumber =100;
% Maximum priority level
topPriorityLevel = MaxPriority(window);
Priority(topPriorityLevel);

% Flip to the vertical retrace rate
vbl = Screen('Flip', window);
exitDemo = false;
testdata(1)=id;
currency= 0;
currency_color= [1 1 1];
previous= 1;

% We use a while loop to count down. On each iteration of the loop we use a
% waitframes value greater than 1 so that each number is presented for one
% second
for i= 1:7


    % Randomise a start color
countcolor = [1 1 1];

% Starting number
currentNumber = 100;
wholenumber =100;
exitDemo = false;
while ((currentNumber >= 0)&&(exitDemo == false))

    % Convert our current number to display into a string
    numberString = num2str(currentNumber);
    currencystring = num2str(currency);

    % Draw our number to the screen
    DrawFormattedText(window, numberString, 300 , 300, countcolor);
    DrawFormattedText(window, 'Live(L) or Die(D)?', 'center' , 'center', [1 1 1]);
    DrawFormattedText(window, currencystring, 300 , 900, currency_color);

    % Check the queue for key presses.
       [keyIsDown,secs, keyCode] = KbCheck;

    % Depending on the button press, either move ths position of the square
    % or exit the demo
    if keyCode(escapeKey)
        exitDemo = true;end
    if keyCode(LKey)
        testdata(3*(i-1)+2) = 'L';  testdata(3*(i-1)+4) = currentNumber; exitDemo = true;
        if previous==1
            DrawFormattedText(window, 'Right :)', 700 , 750, [0 1 0]);
            currency= currency +1;
            testdata(3*(i-1)+3) = 'R';
        else
        DrawFormattedText(window, 'Wrong!!!', 700 , 750, [1 0 0]);
        currency= currency -1;
        testdata(3*(i-1)+3) = 'W';
        end
        previous=1;
      %  BasicSoundOutputDemo(0,'wrong.mp3');
    end
    if keyCode(DKey)
        testdata(3*(i-1)+2) = 'D'; testdata(3*(i-1)+4) = currentNumber; exitDemo = true;
        if previous==-1
            DrawFormattedText(window, 'Right :)', 700 , 750, [0 1 0]);
            currency= currency +1;
            testdata(3*(i-1)+3) = 'R';
        else
        DrawFormattedText(window, 'Wrong!!!', 700 , 750, [1 0 0]);
        currency= currency -1;
        testdata(3*(i-1)+3) = 'W';
        end
       % BasicSoundOutputDemo(0,'right.mka');
        previous=-1;
    end
   
    

          %  xlswrite(filename,sht30,sheet,'A2');
        
    % Flip to the screen
    vbl = Screen('Flip', window, vbl + (waitframes - 0.5) * ifi);

    % New random colour for the next number
    countcolor = [countcolor(1) countcolor(2)-(1/wholenumber) countcolor(3)-(1/wholenumber)];

    % Increment the number
    currentNumber = currentNumber - 1;

 
end
WaitSecs(1);
end
close all;
sca
            filename = 'data1.xlsx';
            sheet = 1;
            xlRange = append('A',num2str(id));
           % xlswrite(filename,testdata);
            xlswrite(filename,testdata(1),sheet,append('A',num2str(id)));
            xlswrite(filename,char(testdata(2)),sheet,append('B',num2str(id)));
            xlswrite(filename,char(testdata(3)),sheet,append('C',num2str(id)));
            xlswrite(filename,testdata(4),sheet,append('D',num2str(id)));
            xlswrite(filename,char(testdata(5)),sheet,append('E',num2str(id)));
            xlswrite(filename,char(testdata(6)),sheet,append('F',num2str(id)));
            xlswrite(filename,testdata(7),sheet,append('G',num2str(id)));
            xlswrite(filename,char(testdata(8)),sheet,append('H',num2str(id)));
            xlswrite(filename,char(testdata(9)),sheet,append('I',num2str(id)));
            xlswrite(filename,testdata(10),sheet,append('J',num2str(id)));
            xlswrite(filename,char(testdata(11)),sheet,append('K',num2str(id)));
            xlswrite(filename,char(testdata(12)),sheet,append('L',num2str(id)));
            xlswrite(filename,testdata(13),sheet,append('M',num2str(id)));
            xlswrite(filename,char(testdata(14)),sheet,append('N',num2str(id)));
            xlswrite(filename,char(testdata(15)),sheet,append('O',num2str(id)));
            xlswrite(filename,testdata(16),sheet,append('P',num2str(id)));
% Wait a second before closing the screen

% Clear the screen

