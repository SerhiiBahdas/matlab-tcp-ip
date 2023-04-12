
%% CREATE A SERVER (RUN ON THE COMPUTER #1)

% If the connection alredy exists, clean it. 
clear tcpip_server

% IP Address of the server. This address can be found by typing ipconfig in
% the cmd on Windows or ifconfig on Mac/Linux.
sIPAddress = '10.3.29.251';

% Specify port number (a number from 49152 to 65535, spanning dynamic or 
% private port range).
idPort = 30000; 

% Create a TCP/IP server.
tcpip_server = tcpserver(sIPAddress, idPort);

% Add input buffer size. 
set(tcpip_server, 'InputBufferSize', 4096);

% Add timeout. 
set(tcpip_server, 'Timeout', 5*60);

% Display the server status message. 
disp('Server is listening for connections');

% Open server for incoming connections. 
fopen(tcpip_server);

%% CREATE A CLIENT (RUN ON THE COMPUTER #2)

% If the connection alredy exists, clean it. 
clear tcpip_client

% Copy the IP Address of the server. 
sIPAddress = '10.3.29.251';

% Copy the port number of the server.
idPort = 30000; 

% Create a TCP/IP client.
tcpip_client = tcpclient(sIPAddress, idPort);

% Add input buffer size. 
set(tcpip_client, 'InputBufferSize', 4096);

% Add timeout. 
set(tcpip_client, 'Timeout', 5*60);

% Connect to the server. 
fopen(tcpip_client);

% Display the server status message. 
disp('Connected to the server');