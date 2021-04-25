% deviding preProcessing.m into 4 separate functions
% autologEMA + filteringEMA can be applied to all data
% sensorCheckEMA is used to assess the quality of reference sensors and
%to find trials with detached sensors
% in headCorrectEMA the reference sensors can be chosen

[subjectID, triaList, excludeList, paloccList] = autologEMA(subjectFolder);

[chanList, matFolder, filtFolder] = filteringEMA(subjectFolder, subjectID, triaList, paloccList);

% no sense to compare nose to nose
sensorCheckEMA(chanList, triaList, excludeList, matFolder, filtFolder);

headCorrectEMA(subjectFolder, filtFolder, triaList);
