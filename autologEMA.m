function [subjectID, triaList, excludeList, paloccList] = autologEMA(subjectFolder)
	
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%% general log stuff
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

	%extract subject's name
	folderBits = strsplit(subjectFolder, '\');
	folderBits = strsplit(folderBits{5}, '_');
	subjectID = folderBits{2};

	content = dir(subjectFolder);
	folderList = content(find(vertcat(content.isdir)));

	%{
% check number of soundcheck trials to adjust the trial numbers starting with the baseline
	% open the log file
    logFile = fullfile(subjectFolder, 'soundcheck', ['soundcheck_' subjectID '_log.txt']);
    fileID = fopen(logFile,'r');
	phaseLog = {};

	% read soundcheck log file line for line into a struct
	txtLine = fgetl(fileID);
	phaseLog(1,1) = cellstr(txtLine);
	l = 2;
		
	while ischar(txtLine)
    	txtLine = fgetl(fileID);

    	if ischar(txtLine)
    		phaseLog(l,1) = cellstr(txtLine);
    		l = l + 1;
    	end
	end

	lastLine = phaseLog{end};
	lastBits = strsplit(lastLine);

	if isstrprop(lastBits{1}, 'digit');
		shiftTrial = str2double(lastBits{1});
	end
%}


	% combine all logs into one file 
	for folder = 1:length(folderList)

		phase = folderList(folder).name;

    	%skip uneccessary folders
    	if strcmp(phase, '.') || strcmp(phase, '..') || strcmp(phase, 'soundcheck') || strcmp(phase, 'figures') || strcmp(phase, ['kinematics_' subjectID])
    		continue
    	end

    	% open the log file
    	logFile = fullfile(subjectFolder, phase, [phase '_' subjectID '_log.txt']);
    	fileID = fopen(logFile,'r');

    	if strcmp(phase, '0familiarization')

    		phaseLog = {};

			% read log file line for line into a struct
			txtLine = fgetl(fileID);
			
			phaseLog(1,1) = cellstr(txtLine);
			l = 2;

			while ischar(txtLine)
				txtLine = fgetl(fileID);

				if ischar(txtLine)
					phaseLog(l,1) = cellstr(txtLine);
					l = l + 1;
				end
			end

			completeLog = phaseLog;

		else

			phaseLog = {};
    		
    		try
    			% ignore the lines starting without digits (i.e. skip header)
    			txtLine = fgetl(fileID);
    		catch
    			disp('Log file not found.')
    			keyboard
    		end

    		l = 1;
    		while ischar(txtLine)
    			txtLine = fgetl(fileID);
    			
   				%check if the line begins with a digit (trial number)
   				if ischar(txtLine)
   					lineBits = strsplit(txtLine);
   					lineBitsType = isstrprop(lineBits,'digit');
   				end

   				if lineBitsType{1}

   					if ischar(txtLine)
   						phaseLog(l,1) = cellstr(txtLine);
   						l = l + 1;	
   					end
   				end				
   			end

   			completeLog = [completeLog; phaseLog];
   		end
   	end

				    % save the new combined log file
				    newLogFile = fullfile(subjectFolder, [subjectID '_complete_log.txt']);
				    newLogFileID = fopen(newLogFile,'wt');

				    for i = 1:length(completeLog)
				    	fprintf(newLogFileID, '%s\n', completeLog{i});
				    end

	% extract the first experimental trial
	for i = 1:length(completeLog)
		logBits = strsplit(completeLog{i});
		logBitsType = isstrprop(logBits,'digit');

		if logBitsType{1}
			firstTrialEx = str2double(logBits{1});
			break
		end
	end

   	% last experimental trial
   	logBits = strsplit(completeLog{length(completeLog)});
   	lastTrialEx = str2double(logBits{1});

   	% define experimental trials
   	triaList = [firstTrialEx:lastTrialEx];

	%extract trials to exclude with repetitions/task description
	excludeList=[];

	for i = 1:length(completeLog)
		logBits = strsplit(completeLog{i});
		
		for j = 1:length(logBits)

			if ~isempty(strfind(logBits{j}, '[Aufgabenbeschreibung')) || strcmp(logBits{j}, '[ENDE]')

				excludeList(i) = str2double(logBits{1});
				excludeList = nonzeros(excludeList);
			end
		end
	end

	% define palloc trials
   	posFiles = dir(fullfile(subjectFolder, ['kinematics_' subjectID], 'rawpos'));
   	paloccList = [lastTrialEx+1:size(posFiles,1)-2];

 end