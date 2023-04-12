function tTimeInSeconds = getSystemTimeInSeconds()
%GETSYSTEMTIMEINSECONDS Get system time in seconds. 
%
%   tTimeInSeconds = getSystemTimeInSeconds()
%
%   OUTPUT ============================================================
%   
%   tTimeInSeconds (numeric array)
%   Current time in seconds. 
%
%   AUTHOR ============================================================
%
%   S.Bahdasariants, NEL, WVU, https://github.com/SerhiiBahdas
%
%   ===================================================================

    % Get the current date and time as a datetime object.
    nCurrentTime = datetime('now', 'Format', 'yyyy-MM-dd HH:mm:ss.SSS');
    
    % Convert the datetime object to a string.
    sCurrentTime = datestr(nCurrentTime, 'yyyy-mm-dd HH:MM:SS.FFF');
    
    % Split the string into date and time components.
    [~, timeStr] = strtok(sCurrentTime, ' ');
    
    % Split the time components into hours, minutes, seconds, 
    % and milliseconds.
    tTimeComponents = sscanf(timeStr, ' %d:%d:%d.%d');
    tHours = tTimeComponents(1);
    tMinutes = tTimeComponents(2);
    tSeconds = tTimeComponents(3);
    tMilliseconds = tTimeComponents(4);
    
    % Calculate the total number of seconds
    tTimeInSeconds = tHours * 3600 + tMinutes * 60 + tSeconds +...
                     tMilliseconds*0.001;

end




