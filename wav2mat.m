%wav2mat
%JB May 2014

audiofilename='wav/';
artfilename='finaldata/mat/child01_ema_head_';
outfilename='finaldata/mat/child01_audio_';
erstes=4;
letztes=63;

for nummer=erstes:letztes
    if nummer<10
        nummer_str=['000' num2str(nummer)];
    elseif nummer<100
        nummer_str=['00' num2str(nummer)];
    elseif nummer<1000
        nummer_str=['0' num2str(nummer)];
    else
        nummer_str=num2str(nummer);
    end
    %item_id ermitteln
    load([artfilename nummer_str '.mat']);
    clear comment data descriptor dimension private samplerate unit
    
    [data, samplerate]=wavread([audiofilename nummer_str '.wav']);
    descriptor='Audio_Child';
    unit='Voltage';
    comment='see wav2mat';
    
  save([outfilename nummer_str '.mat'], 'comment', 'data', 'descriptor', 'item_id', 'samplerate', 'unit');
   clear comment data descriptor item_id samplerate unit
end
    