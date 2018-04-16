unit F11;

interface

	uses  sysutils,F1,delete_array,Dateutils,uDef;
	
	procedure tidur (	var energiawal	:Integer; 			//energi awal chef
						var countm		:Integer; 			//menghitung jumlah makan
						var countis		:Integer; 			//menghitung jumlah istirahat
						var countd		:Integer;			//menghitung jumlah hari yg berlalu
						var datenow		:TDateTime;
						var NInvBM: Integer;
						var NInvBO: Integer;
						var aksi: Integer);		//tanggal untuk dibaca di simulasi	

implementation

	procedure tidur (	var energiawal	:Integer; 		//energi awal chef
						var countm		:Integer; 		//menghitung jumlah makan
						var countis		:Integer; 		//menghitung jumlah istirahat
						var countd		:Integer;		//menghitung jumlah hari yg berlalu
						var datenow		:TDateTime;
						var NInvBM: Integer;
						var NInvBO: Integer;
						var aksi: Integer);	//tanggal untuk dibaca di simulasi	
	var
		k: Integer;
	begin
		if (countm=0) and (countis=0) and (aksi=0) then
			begin 
				writeln('Ga boleh langsung tidur boe')
			end else 
		begin	
		if (countm<>1) or (countis<>1) or (aksi<>0) then
			begin
				energiawal:=10;
				countm	  :=0;
				countis	  :=0;
				aksi	  :=0;
				countd	  :=countd+1;
				writeln('Energi chef sekarang: 10');
			end;
		datenow:=datenow+1;
		writeln('Tanggal sekarang: ',DateToStr(datenow));
		writeln('Jumlah Hari : ',countd);
		for i:=1 to NInvBM do
			begin
				j:=i;
				for k:=1 to NBahanM do
				begin
					if (FEInventoriBahanMentah[i].nama = FEBahanMentah[k].nama) then
					begin
						if (DaysBetween(datenow,FEInventoriBahanMentah[i].tanggal)>FEBahanMentah[k].kadaluarsa) or (FEInventoriBahanMentah[i].jumlah=0) then
						begin
							deletearray(FEInventoriBahanMentah,NInvBM,j)	{i adalah index elemen array}
						end;
					end;
				end;
			end;
		for i:=1 to NInvBO do
			begin
				j:=i;
				if (DaysBetween(datenow,FEInventoriBahanOlahan[i].tanggal)>3) or (FEInventoriBahanOlahan[i].jumlah=0) then
				begin
					deletearray(FEInventoriBahanOlahan,NInvBO,j)	{i adalah index elemen array}
			 	end;
			end;
		end;
	end;

end.
