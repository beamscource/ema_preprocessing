function [chanList, sensornames] = channelSettingsEMA(subjectID)

	switch subjectID
		case 'alina'
			chanList=[1:10];

			sensornames=str2mat('head_left', 'head_right', 'nose', 't_back', 't_mid', 't_tip', 'upinc', ...
			'jaw', 'upper_lip', 'lower_lip','unused1', 'unused2', 'unused3', 'occ_left','occ_right','occ_tip');

		case 'dagmar'

			chanList=[1:10];

			sensornames=str2mat('head_left', 'head_right', 'nose', 't_back', 't_mid', 't_tip', 'upinc', ...
			'jaw', 'upper_lip', 'lower_lip','unused1', 'unused2', 'unused3', 'occ_left','occ_right','occ_tip');

		case 'doro'
			
			chanList=[1:10];

			sensornames=str2mat('head_left', 'head_right', 'nose', 't_back', 't_mid', 't_tip', 'upinc', ...
			'jaw', 'upper_lip', 'lower_lip','unused1', 'unused2', 'unused3', 'occ_left','occ_right','occ_tip');

		case 'imke'
			
			chanList=[1:4 11 6:10];

			sensornames=str2mat('head_left', 'head_right', 'nose', 't_back', 'unused1', 't_tip', 'upinc', ...
			'jaw', 'upper_lip', 'lower_lip','t_mid', 'unused2', 'unused3', 'occ_left','occ_right','occ_tip');

		case 'julia'
			
			chanList=[1:3 12 5:8 11 10];

			sensornames=str2mat('head_left', 'head_right', 'nose', 'unused2', 't_mid', 't_tip', 'upinc', ...
			'jaw', 'unused1', 'lower_lip','upper_lip', 't_back', 'unused3', 'occ_left','occ_right','occ_tip');

		case 'leonie'
			
			chanList=[1:10];

			sensornames=str2mat('head_left', 'head_right', 'nose', 't_back', 't_mid', 't_tip', 'upinc', ...
			'jaw', 'upper_lip', 'lower_lip','unused1', 'unused2', 'unused3', 'occ_left','occ_right','occ_tip');

		case 'marie'

			chanList=[1:10];

			sensornames=str2mat('head_left', 'head_right', 'nose', 't_back', 't_mid', 't_tip', 'upinc', ...
			'jaw', 'upper_lip', 'lower_lip','unused1', 'unused2', 'unused3', 'occ_left','occ_right','occ_tip');

		
		case 'silvia'

			chanList=[1:10];

			sensornames=str2mat('head_left', 'head_right', 'nose', 't_back', 't_mid', 't_tip', 'upinc', ...
			'jaw', 'upper_lip', 'lower_lip','unused1', 'unused2', 'unused3', 'occ_left','occ_right','occ_tip');

		
		case 'sabrina'

			chanList=[1:10];

			sensornames=str2mat('head_left', 'head_right', 'nose', 't_back', 't_mid', 't_tip', 'upinc', ...
			'jaw', 'upper_lip', 'lower_lip','unused1', 'unused2', 'occ_right', 'occ_left','unused3','occ_tip');

		
		case 'carry'
			chanList=[1:10];

			sensornames=str2mat('head_left', 'head_right', 'nose', 't_back', 't_mid', 't_tip', 'upinc', ...
			'jaw', 'upper_lip', 'lower_lip','unused1', 'unused2', 'occ_tip', 'occ_left','occ_right','unused3');

		case 'martina'
			
			chanList=[1:10];

			sensornames=str2mat('head_left', 'head_right', 'nose', 't_back', 't_mid', 't_tip', 'upinc', ...
			'jaw', 'upper_lip', 'lower_lip','unused1', 'unused2', 'unused3', 'occ_left','occ_right','occ_tip');

		case 'melanie'
			
			chanList=[1:10];

			sensornames=str2mat('head_left', 'head_right', 'nose', 't_back', 't_mid', 't_tip', 'upinc', ...
			'jaw', 'upper_lip', 'lower_lip','unused1', 'unused2', 'unused3', 'occ_left','occ_right','occ_tip');

		case 'kat'
			
			chanList=[1:6 11 8:10];

			sensornames=str2mat('head_left', 'head_right', 'nose', 't_back', 't_mid', 't_tip', 'unused1', ...
			'jaw', 'upper_lip', 'lower_lip','upinc', 'unused2', 'occ_tip', 'occ_left','occ_right','unused3');

		case 'stefanie'

			chanList=[1:10];

			sensornames=str2mat('head_left', 'head_right', 'nose', 't_back', 't_mid', 't_tip', 'upinc', ...
			'jaw', 'upper_lip', 'lower_lip','unused1', 'unused2', 'unused3', 'occ_left','occ_right','occ_tip');

		
		case 'sophia'
			
			chanList=[1:10];

			sensornames=str2mat('head_left', 'head_right', 'nose', 't_back', 't_mid', 't_tip', 'upinc', ...
			'jaw', 'upper_lip', 'lower_lip','unused1', 'unused2', 'unused3', 'occ_left','occ_right','occ_tip');

		case 'sophie'

			chanList=[1:6 11 8:10];

			sensornames=str2mat('head_left', 'head_right', 'nose', 't_back', 't_mid', 't_tip', 'unused1', ...
			'jaw', 'upper_lip', 'lower_lip','upinc', 'unused2', 'unused3', 'occ_left','occ_right','occ_tip');
	
	end
end
