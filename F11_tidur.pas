unit F11_tidur;

interface

	uses  sysutils,F1;
	
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
	end;
end.
