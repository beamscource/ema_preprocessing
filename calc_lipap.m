%do_mtvelo

%myname='DFG9_S3';
myname=mymatin('basicsettings','subjectname');
mysuff='_ema_head';       
cutfile=['finaldata' filesep myname '_cut'];
recpath=['finaldata' filesep 'mat' filesep myname];
reftrial='0207';

%signallist=str2mat('e0.LLipX.LLipX','e0.ULipX.ULipX','e0.LLipY.LLipY','e0.ULipY.ULipY');
signallist=str2mat('_ema_head_.lower_lip_posy.ll_a_p','_ema_head_.upper_lip_posy.ul_a_p','_ema_head_.lower_lip_posz.ll_lon','_ema_head_.upper_lip_posz.ul_lon');
calcstr=str2mat('sqrt((ul_a_p-ll_a_p).^2+(ul_lon-ll_lon).^2)');

newdescriptor=str2mat('LipAp');

newunit=str2mat('mm');
mtsigcalc(cutfile,recpath,reftrial,signallist,'_lipap_',calcstr,newdescriptor,newunit);

%signallist=str2mat('e0.t_tipY.tipy','e0.t_bladeY.bladey','e0.jaw_outY.jawy','i0.int_tipy','i0.int_bladey');
%[data,label,comment,descriptor,unit]=mulpf_t(cutfile,recpath,reftrial,signallist,0,str2mat('mean'));

