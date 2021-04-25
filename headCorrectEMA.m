function headCorrectEMA(subjectFolder, filtFolder, triaList)
	
	%%%%%%%%%%%%%%%%%%%%%%%%
	%% head correction

	% occ trial wich later needed for creation of a EMA reference object
	if ~exist('occTrial', 'var')
		occTrial = input('Wich trial includes the occ sensors?: ','s');
	end

	% make reference object
	refSensorsOcc = str2mat('head_left','head_right', 'nose', 'upinc', 'occ_left', 'occ_right', 'occ_tip');

	occTrial = sprintf('%04d', str2double(occTrial));	
	occTrialDir = fullfile(filtFolder, occTrial);

	% distance from sensor at which to place the virtual sensor defined by
	% the orientation information (??)
	vdistance = 10;

	% initial idea was to expand makerefobjn.m to be able to read an additional argument,
	% but for reasons of sheer lazyness ended up hardcoding the following directory
	COMFileDir = 'D:\perturbator\fricationEMA\cmd_refobj.cmd';

	makerefobjn(occTrialDir, refSensorsOcc, vdistance);

	% 'D:\perturbator\fricationEMA\cmd_refobj.cmd'

	% insert following commands
	% r#xy#head_left#head_right#0
	% r#xz#head_left#head_right#0
	% a#xy#180
	% o#upinc
	% e

	close all;

	refObj = [occTrialDir '_refobj'];

	%chose reference sensors in pos data
	refSensors = str2mat('head_left','head_right', 'nose', 'upinc');

	% compute the correction
	corrFolder = fullfile(subjectFolder, ['kinematics_' subjectID], 'pos\');
	mkdir(corrFolder);

	rigidbodyname = 'headrig';
    rigidbodyana(filtFolder, corrFolder, triaList, refObj, refObj, refSensors, rigidbodyname);

    close all;
end