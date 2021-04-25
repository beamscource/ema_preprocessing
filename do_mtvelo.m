%%% do_mtvelo: articulator version

% for both runs:
myname=mymatin('basicsettings','subjectname'); %'Fletcher_S2';
mysuff='_ema_head'; 

cutfile=['finaldata' filesep myname '_cut'];
recpath=['finaldata' filesep 'mat' filesep myname mysuff];
reftrial='0207'; %any existing trial
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% % 1. run: velocity
% 
% exportname='_v_';
% ideriv=1;
% 
% 
% myfilter='kaiserd_20_30_60_250';  %filterspecs for ag501
% 
% tangstr=str2mat('t_back','t_mid','t_tip','jaw','upper_lip','lower_lip');
% reclist=str2mat(strcat(tangstr,'_posx'),strcat(tangstr,'_posy'),strcat(tangstr,'_posz'));
% reclist=strcat('_.',reclist);
% %reclist='_.LipAp.la';
% 
% %mtvelo(cutfile,recpath,reftrial,reclist,exportname,ideriv,tangstr,myfilter,idown,preprocfunc);
% mtvelo(cutfile,recpath,reftrial,reclist,exportname,ideriv,tangstr,myfilter);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% % 2. run: acceleration

exportname='_a_';
ideriv=2;


myfilter='kaiserd_20_30_60_250'; %filterspecs for ag501

tangstr=str2mat('t_tip','t_mid','t_back','jaw','lower_lip','upper_lip');
reclist=str2mat(strcat(tangstr,'_posx'),strcat(tangstr,'_posy'),strcat(tangstr,'_posz'));
reclist=strcat('_.',reclist);
%reclist='_.LipAp.la';

%mtvelo(cutfile,recpath,reftrial,reclist,exportname,ideriv,tangstr,myfilter,idown,preprocfunc);
mtvelo(cutfile,recpath,reftrial,reclist,exportname,ideriv,tangstr,myfilter);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
