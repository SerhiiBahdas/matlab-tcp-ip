function nMatrix = getdata(tcpip_server)
%GETDATA Get data from the client. 
%  
%   INPUT =================================================================
%
%   nMatrix (numeric array)
%   Data matrix. 
%   Example: rand(4,5)
%
%   tcpip_client (object)
%   TCP/IP client.
%
%   AUTHOR ================================================================
%
%   Serhii Bahdasariants, NEL, WVU, https://github.com/SerhiiBahdas
%
%   =======================================================================

% Wait for incoming data.
while tcpip_server.BytesAvailable == 0
    pause(1e-3);
end

% Read the length of the string from the header.
nStringLen = fread(tcpip_server, 1, 'uint32');

% Wait for the string data to arrive.
while tcpip_server.BytesAvailable < nStringLen
    pause(1e-3);
end

% Read the string data.
nByteStream = fread(tcpip_server, tcpip_server.BytesAvailable);
nMatrix_string = char(nByteStream');

% Convert the string back into a matrix.
nMatrix = eval(nMatrix_string);

end

