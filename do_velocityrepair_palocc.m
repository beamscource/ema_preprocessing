
%%% do_velocityrepair
%Filtering of position data. Repair of outliers also possible

clear variables

nsensor=16;			%do not change
%actually only used below for veldifflim which is not used anyway

% %for speech data 
% inpath=['calcpos' pathchar];
% amppath=['amps' pathchar];
% outpath=['velrep' pathchar];

%for palocc data
inpath=['palocc' pathchar 'calcpos' pathchar];
amppath=['palocc' pathchar 'amps' pathchar];
outpath=['palocc' pathchar 'velrep' pathchar];

%mkdir([outpath 'posamps']);
mkdir(outpath);

%copy in here the filter specification exactly as used by do_filteramps (or
%the equivalent script used when running the experiment
%Sensor names: must be a complete list of 12 sensors. Use dummy names if some sensors are
%not in use
%usersensornames=str2mat(??);
usersensornames=mymatin('basicsettings', 'usersensornames');
%
%this creates a struct P with sensor names as fields, and sensor number as
%the value of the field (useful for defining the filter lists below)
%P=desc2struct(usersensornames);
P=mymatin('basicsettings', 'P');

%this will happen if sensor names are ambiguous (or not legal field names
%for a struct)
if isempty(P)
	disp('Check sensor names');
	return;
end;

%copy this from do_filteramps

%set up filtering (lists of sensor numbers; use P.t_tip etc. to refer to
%them symbolically)
%all sensors in the same list will be filtered the same way

%important: if e.g. LL was used for palocc trials, remove LL from "articulator"
%filterspecs{1,2} and move to "reference" filterspecs{2,2} here:
filterspecs{1,1}='kaiserd_20_30_60_250';
filterspecs{1,2}=[P.t_back P.t_mid P.jaw P.upper_lip P.lower_lip]; %[P.TD P.TB2 P.TB1 P.JAW P.UL P.LL];
filterspecs{2,1}='kaiserd_05_15_60_250';
filterspecs{2,2}=[P.ref P.nose P.head_left P.head_right]; %[P.MAX P.NOSE P.HL P.HR P.OCC1 P.OCC2];
filterspecs{3,1}='kaiserd_40_50_60_250'; %t_tip: usual filterspecs
%filterspecs{3,1}='kaiserd_60_70_60_250'; %t_tip: filterspecs for fast Polish data /r,l/ 
filterspecs{3,2}=[P.t_tip]; %[P.TT];

fchanall=[filterspecs{1,2} filterspecs{2,2} filterspecs{3,2}];
nf1=length(fchanall);
nf2=length(unique(fchanall));
disp(['Total number of channels in filterspecs: ' int2str(nf1)]);
if nf1~=nf2
    disp('Filter channel lists not unique');
    disp(fchanall);
end;

%for speech data
%triallist=mymatin('basicsettings','triallist');
 %for palocc data
triallist=mymatin('basicsettings','palocc_triallist');

%chanlist=[??];
%chanlist=mymatin('basicsettings','chanlist'); %speech data
chanlist=mymatin('basicsettings','palocc_chanlist'); %palocc data

%data is repaired if difference between measured and predicted velocity
%exceeds threshold specified here (in mm/s). If threshold is left as NaN then the
%data is filtered but no repairs are made
veldifflim=ones(nsensor,1)*NaN;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%repair:
%add lines like the following to activate repairs for specific sensors (e.g
%for sensor 3)
%veldifflim(3)=300;		%threshold for measure minus predicted = 300mm/s

velocityrepair(inpath,amppath,outpath,triallist,chanlist,filterspecs,veldifflim);
