

% too bad
% 'D:\perturbator\fricationEMA\data\fricEMA_christine',
% 'D:\perturbator\fricationEMA\data\fricEMA_katarina',
% 'D:\perturbator\fricationEMA\data\fricEMA_elisa',

subjectList = {'D:\perturbator\fricationEMA\data\fricEMA_alina',
'D:\perturbator\fricationEMA\data\fricEMA_dagmar',
'D:\perturbator\fricationEMA\data\fricEMA_doro',
'D:\perturbator\fricationEMA\data\fricEMA_imke',
'D:\perturbator\fricationEMA\data\fricEMA_julia',
'D:\perturbator\fricationEMA\data\fricEMA_leonie',
'D:\perturbator\fricationEMA\data\fricEMA_marie',
'D:\perturbator\fricationEMA\data\fricEMA_silvia',
'D:\perturbator\fricationEMA\data\fricEMA_sabrina',
'D:\perturbator\fricationEMA\data\fricEMA_carry',
'D:\perturbator\fricationEMA\data\fricEMA_martina',
'D:\perturbator\fricationEMA\data\fricEMA_melanie',
'D:\perturbator\fricationEMA\data\fricEMA_kat',
'D:\perturbator\fricationEMA\data\fricEMA_stefanie'
'D:\perturbator\fricationEMA\data\fricEMA_sophia',
'D:\perturbator\fricationEMA\data\fricEMA_sophie'};

for i = 1:length(subjectList)

	disp(['Processing subject ' subjectList{i}])
	
	subjectFolder = subjectList{i};
	[subjectID, triaList, excludeList, paloccList] = autologEMA(subjectFolder);

	matFolder = fullfile(subjectFolder, ['kinematics_' subjectID], 'calcpos\');
	filtFolder = fullfile(subjectFolder, ['kinematics_' subjectID], 'filtpos\');

	[chanList, sensornames] = channelSettingsEMA(subjectID);

	sensorCheckEMA(chanList, triaList, excludeList, matFolder, filtFolder);

end


