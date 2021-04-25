%do_makerefobj

%if occlusion-based
%%sensorlist=str2mat('MAX','NOSE','HL','HR','OCC1','OCC2');
sensorlist=str2mat('ref','nose','head_left','head_right','occ1','occ2'); % default; defective ref can be replaced with upper_lip
%sensorlist=str2mat('ref','nose','head_left','upper_lip','lower_lip') %example: lip sensors as occ1+occ1, head_right defective
posfile=['palocc' pathchar 'velrep' pathchar '0768']; % occ trial 


% %if REST-based or combination of refobj+REST trial
%%sensorlist=str2mat('TD',TB2','TB1','TT','MAX','NOSE','UL','LL','HL','HR');
%sensorlist=str2mat('t_back','t_mid','t_tip','ref','nose','upper_lip','lower_lip','head_left','head_right')
%posfile=['velrep' pathchar '0210']; % rest trial 

vdistance=10;

makerefobjn(posfile,sensorlist,vdistance);
