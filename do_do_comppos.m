%do_do_comppos
%wrapper script to call two different display functions for EMA data:
%1) do_comppos_a_f
%   typical use: get statistics to set up amplitude adjustment
%2) show_trialox
%       this is the display function also used while the experiment is running
%       Use in conjunction with showstats to store start positions
%
%Use the doshowtrial flag to swap between these two functions

clear variables

doshowtrial=0;      %1: show_trialox; 0: do_comppos_a_f

%just for show_trial
tanflag=0;      %0=parameter7=compdist now, 1 for tang. vel., (2 for compdist=superfluous now)
maxminflag=0;	% 0=stdev; 1=max-min

%main path to the position data, after using do_velocityrepair:
basepath=['velrep' pathchar];
%Additional path only used by the do_comppos_a_f branch.
%Allows different processing of the same set of data to be compared.
%Uncomment and set appropriately, if required.
%position data right after rawpos2mat / before do_velocityrepair:
%altpath=['calcpos' pathchar];


if ~exist('altpath','var') altpath=''; end;


%triallist=[1:388]; %list of trials to display; e.g. problematic trials
triallist=mymatin('basicsettings','triallist');
%restlist=[??]; %list of trials to skip
restlist=mymatin('basicsettings', 'restlist');

triallist=setdiff(triallist,restlist);


%for reference, put a list of sensor names as a comment here
%kanallist=[3]; %channels to be displayed; e.g. problematic t_tip
kanallist=mymatin('basicsettings', 'chanlist');
compsensor=mymatin('basicsettings', 'compsensor');
%'t_back','t_mid','t_tip','ref','jaw','nose','upper_lip','lower_lip','mouth_left','mouth_right','head_left','head_right','unused1','unused2','unused3','unused4');

if ~doshowtrial
    
    %Comparison sensor: Sensor to show in combination with the other sensors
    %Euclidean distance between this sensor and the other sensors will be
    %displayed. Uncomment if required.
    %compsensor=??;
    %compsensor=mymatin('basicsettings', 'compsensor');
    if ~exist('compsensor','var') compsensor=[]; end;
    
    %   autoflag: must be 0, 1 or 2
    %   0: display pauses after every trial; use this to investigate problematic trials
    %   1: display is done for all trials of one sensor, then pauses
    %   2: No pauses. Convenient in combination with a diary file for running
    %   the script unattended. The graphics are stored and can be looked at
    %   later.
    autoflag=2;		
    
    %default settings for name of diary file (and fig files)
    diaryname=['comppos_stats_' basepath];
    if ~isempty(compsensor) diaryname=[diaryname '_comp' int2str(compsensor)]; end;
    if ~isempty(altpath) diaryname=[diaryname '_alt_' altpath]; end;
    diaryname=[diaryname '.txt'];
    diaryname=strrep(diaryname,pathchar,'_');
    diaryname=strrep(diaryname,'ampsfilt','');
    diaryname=strrep(diaryname,'rawpos','');
    diaryname=strrep(diaryname,'__','_');
    %If a diary file is defined, various statistics are stored in it (on rms,
    %tangential velocity, euclidean distance). These can be used to set up the
    %amplitude adjustment. In addition all the graphics are stored in
    %subdirectory 'figs/'.
    %Uncomment if required. Change name if desired
    diaryfile=diaryname;
    
    if ~exist('diaryfile','var') diaryfile=''; end;
    
    
    do_comppos_a_f(basepath,altpath,triallist,kanallist,compsensor,autoflag,diaryfile);
    
else
    hf=[];
    plotstep=100;
    [statxb,sstatsdb,nancntb,hf]=show_trialox(basepath,triallist(1),kanallist,hf,plotstep,tanflag,maxminflag,compsensor);
%    [statxb,sstatsdb,nancntb,hf]=show_trialox(basepath,-triallist(1),[4 6 11 12],hf,plotstep,tanflag,maxminflag,compsensor);
    disp('Arrange figures. Adjust plotstep if desired');
    disp('Set plotstep to a large value to speed up display'); 
    disp('if you are mainly interested in the overview of all trials,');
    disp('and not in the display of individual trials');
	disp('');
	disp('Type ''return'' when ready to continue');
    
    
    keyboard;
    [statxb,statsdb,nancntb,hf]=show_trialox(basepath,triallist(2:end),kanallist,hf,plotstep,tanflag,maxminflag,compsensor);
    
end;
