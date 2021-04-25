%%% do_rawpos2mat

%for speech data
rawbase=''; %if not empty include pathchar 
rawpath=['rawpos'];
matpath='calcpos';
mkdir(matpath);
triallist=mymatin('basicsettings','triallist');	%for speech trials

% %for palocc
% rawbase=['palocc' pathchar]; 
% rawpath=[rawbase pathchar 'rawpos'];
% matpath=['palocc' pathchar 'calcpos'];
% mkdir(matpath);
% triallist=mymatin('basicsettings','palocc_triallist');

samplerate=[];      %will be determined from pos header

%this version when not filtering the amps
%assume makebasicsettings has been run
briefcomment='No filtering of amps before calcpos';
sensornames=mymatin('basicsettings','usersensornames');
%chanlist=mymatin('basicsettings','chanlist');
maxchan=12;     %use to exclude completely unused channels
sensornames=sensornames(1:maxchan,:);

%filteramps stores an info file with the raw filtered amps
%infofile=[rawbase pathchar 'amps' pathchar 'info'];
%briefcomment=mymatin(infofile,'comment');
%sensornames=mymatin(infofile,'sensornames'); %for speech trials
%for palocc if/when sensor is renamed: copy from makebasicsettings and change sensornames:
%sensornames=str2mat('t_back','t_mid','t_tip','jaw','ref','nose','upper_lip','lower_lip','head_left','head_right','occ1','occ2','D1','D2','D3','D4'); 
%use this if possible to pass on documentation of filtering and the
%original amp files, as currently not possible to place everything in the
%header of the raw pos files
%myprivate=mymatin(infofile,'private');


posampflag=1;
rmslim=30; %may be adjusted (Phil: limit=30 vs. Carstens: limit=60)
%rawpos2mat(rawpath,matpath,triallist,samplerate,briefcomment,sensornames,posampflag,rmslim,myprivate)
%no private variable if filteramps has not been used before calcpos
rawpos2mat(rawpath,matpath,triallist,samplerate,briefcomment,sensornames,posampflag,rmslim)