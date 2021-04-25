
dims = size(data);
sampleNum = round(dims(1)/20);
channelNum = dims(3);

figure; hold on

for i = 1:sampleNum

	for j = 1:channelNum

		
		plot(data(1:450,2,j), data(1:450,3,j))

	end

	clf

end
