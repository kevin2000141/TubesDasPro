unit F11_tidur;

interface

	uses  sysutils,F1,delete_array,Dateutils,uDef;
	
	procedure tidur (	var energiawal	:Integer; 			//energi awal chef
						var countm		:Integer; 			//menghitung jumlah makan
						var countis		:Integer; 			//menghitung jumlah istirahat
						var countd		:Integer;			//menghitung jumlah hari yg berlalu
						var datenow		:TDateTime);		//tanggal untuk dibaca di simulasi	

implementation

	procedure tidur (	var energiawal	:Integer; 		//energi awal chef
						var countm		:Integer; 		//menghitung jumlah makan
						var countis		:Integer; 		//menghitung jumlah istirahat
						var countd		:Integer;		//menghitung jumlah hari yg berlalu
						var datenow		:TDateTime);	//tanggal untuk dibaca di simulasi	

	begin
		if (countm<>1) or (countis<>1) then
			begin
				energiawal:=10;
				countm	  :=0;
				countis	  :=0;
				countd	  :=countd+1;
				writeln('Energi chef sekarang: 10');
			end;
		datenow:=datenow+1;
		writeln('tanggal sekarang: ',DateToStr(datenow));
		writeln('Jumlah Hari : ',countd);
		for i:=1 to NInvBM[NomorSim] do
			begin
				j:=i;
				if (DaysBetween(datenow,FEInventoriBahanMentah[NomorSim][i].tanggal)>FEBahanMentah[i].kadaluarsa) then
					begin
						deletearray(FEInventoriBahanMentah,NInvBM[NomorSim],j)	{i adalah index elemen array}
					end;
			end;
		for i:=1 to NInvBO[NomorSim] do
			begin
				j:=i;
				if (DaysBetween(datenow,FEInventoriBahanOlahan[NomorSim][i].tanggal)>3) then
					begin
						deletearray(FEInventoriBahanOlahan,NInvBO[NomorSim],j)	{i adalah index elemen array}
					end;
			end;
	end;
end.
