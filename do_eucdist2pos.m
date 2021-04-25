%%% do_eucdist2pos
%add euclidean distance between velrep(filtered) and kalman versions to parameter7 of velrep version
clear variables

%add list of trials as last input argument
%subdirectory names may need slight adjustment

%for speech trials
triallist=mymatin('basicsettings','triallist');
eucdist2pos(['velrep'],['calcpos'],triallist);

% %for palocc trials
%triallist=mymatin('basicsettings', 'palocc_triallist');
%eucdist2pos(['palocc' pathchar 'velrep'],['palocc' pathchar 'calcpos'],triallist);

