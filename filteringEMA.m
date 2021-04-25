function [chanList, matFolder, filtFolder] = filteringEMA(subjectFolder, subjectID, triaList, paloccList)	
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   	%% EMA stuff
   	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   	% active channels
	%default settings
	chanList=[1:10];

	sensornames=str2mat('head_left', 'head_right', 'nose', 't_back', 't_mid', 't_tip', 'upinc', ...
		'jaw', 'upper_lip', 'lower_lip','unused1', 'unused2', 'unused3', 'occ_left','occ_right','occ_tip');

	%adjusted settings
	% chanList=[1:10];

	% sensornames=str2mat('head_left', 'head_right', 'nose', 't_back', 't_mid', 't_tip', 'upinc', ...
	% 'jaw', 'upper_lip', 'lower_lip','unused1', 'unused2', 'unused3', 'occ_left','occ_right','occ_tip');

	%%%%%%%%%%%%%%
	% convert pos data to mat files (do_rawpos2mat)

	posFolder = fullfile(subjectFolder, ['kinematics_' subjectID], 'rawpos\');
	matFolder = fullfile(subjectFolder, ['kinematics_' subjectID], 'calcpos\');
	mkdir(matFolder);

	samplerate=[];      %will be determined from pos header

	%this version when not filtering the amps
	briefcomment='No filtering of amps before calcpos';

	rmslim = 30; %(Phil: limit=30 vs. Carstens: limit=60)

	% for experimental trials
	% use only active channels
	maxChan = max(chanList);
	usedSensors = sensornames(1:maxChan,:);
	%keyboard
	rawpos2mat(posFolder, matFolder, triaList, samplerate, briefcomment, usedSensors, [], rmslim);

	% for head correction sensors
	maxChan = length(sensornames); % ==16 (including occ-sensors)
	usedSensors = sensornames(1:maxChan,:);
	rawpos2mat(posFolder, matFolder, paloccList, samplerate, briefcomment, usedSensors, [], rmslim);
	
	%%%%%%%%%%%%%
	% filtering the converted data
	
	% directory of the originally recorded amplitudes
	% (probably not needed anyway as repair function is ignored)
	ampsFolder = fullfile(subjectFolder, ['kinematics_' subjectID], 'amps\');

	% output directory for filtered data
	filtFolder = fullfile(subjectFolder, ['kinematics_' subjectID], 'filtpos\');
	mkdir(filtFolder);

	P = desc2struct(sensornames); % helpful to get the correct number of each channel

	%set up filtering : all sensors in the same list will be filtered the same way

	filterspecs{1,1}='kaiserd_20_30_60_250';
	filterspecs{1,2}=[P.t_back P.t_mid P.jaw P.upper_lip P.lower_lip]; 
	filterspecs{2,1}='kaiserd_05_15_60_250';
	filterspecs{2,2}=[P.upinc P.nose P.head_left P.head_right];
	filterspecs{3,1}='kaiserd_40_50_60_250'; %t_tip: usual filterspecs
	filterspecs{3,2}=[P.t_tip];

	% set threshold to NaN which turns out repairing of the signal (dead option)
	veldifflim=ones(length(sensornames),1)*NaN; 

	% filter experimental data
	velocityrepair(matFolder, ampsFolder, filtFolder, triaList, chanList, filterspecs, veldifflim);

	%keyboard
	% filter palloc data
	velocityrepair(matFolder, ampsFolder, filtFolder, paloccList, chanList, filterspecs, veldifflim);

	%keyboard
	% compute and add info on euclidian distance between filtered and original pos data
	eucdist2pos(filtFolder, matFolder, triaList);

	close all;
end