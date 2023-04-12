function [] = senddata(nMatrix, tcpip_client)
%SENDDATA Send data from the client to the server. 
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

% Convert the matrix into a string representation.
nMatrix_string = mat2str(nMatrix);

% Convert the string to a byte stream.
nByteStream = uint8(nMatrix_string);

% Send the length of the string as a header. Assuming the string length is 
% within the range of uint32.
fwrite(tcpip_client, length(nMatrix_string), 'uint32'); 

% Send the byte stream.
fwrite(tcpip_client, nByteStream);

end