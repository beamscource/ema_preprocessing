%%% makebasicsettings

% certain settings that recur in several wrapper scripts, such as do_do_comppos, 
% can be specified universally as shown below:

triallist=[36:202]; % exclude palocc trials
restlist=[67 68 101 102 135 136 169 170]; %REST, Rubbish, head movement, Marked
chanlist=[1:10];    % exclude occ1,occ2

compsensor=3; % preferably nose, but use most stable sensor
subjectname='AL';

%vpname=subjectname;

%for AG501: specify all sensors 1:16 
%if only 12 were used, specify 13-16 as 'unused1', 'unused2',etc.
usersensornames=str2mat('head_left', 'head_right', 'nose', 't_back', 't_mid', 't_tip', 'upinc', ...
	'jaw', 'upper_lip', 'lower_lip','unused1', 'unused2', 'unused3' 'occ_left','occ_right','occ_tip');


P=desc2struct(usersensornames);
logfile=['alina_complete_log']; %specify without the .txt extension 

%commentfile=[subjectname '_comment.txt'];

%% for palocc:
%% 11= apex; 12=hypo
palocc_triallist=[204:205]; %use palocc trials only
palocc_chanlist=[1:10 15:17]; % include occ1, occ2, occ3
%palocc_logfile=['FS2_palocc_adj']; %specify without the .txt extension 

% and saved here:
save('basicsettings','triallist','restlist','chanlist','compsensor','subjectname','usersensornames',...
'P','logfile','commentfile','palocc_triallist','palocc_chanlist','palocc_logfile');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% specify universal settings in the relevant wrapper scripts, examples:
%% for speech data:
% triallist=mymatin('basicsettings','triallist');
% restlist=mymatin('basicsettings', 'restlist'); 
% chanlist=mymatin('basicsettings','chanlist');
% compsensor=mymatin('basicsettings','compsensor');
% usersensornames=mymatin('basicsettings','usersensornames');
% subjectname=mymatin('basicsettings','subjectname');
% P=mymatin('basicsettings','P');
% logfile=mymatin('basicsettings','logfile');
% commentfile=mymatin('basicsettings','commentfile');

%%for palocc data
% triallist=mymatin('basicsettings_palocc','triallist_palocc');
% logfile=mymatin('basicsettings_palocc','logfile_palocc');
% chanlist=mymatin('basicsettings_palocc','chanlist_palocc');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% FINALLY: run makebasicsettings
% then proceed with post-processing
