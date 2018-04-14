Program F9_F10_F11;

begin

//Inisialisasi
	countm	:=1;
	countis	:=1;
	i		:=2;
//Algoritma
	repeat
		writeln('Masukkan perintah yang diinginkan');
		readln(teks);
		if (teks='tidur') and (countm=1) and (countis=1) then	//perintah tidur jika belom dilakukan aksi apa-apa
			begin
				repeat
					writeln('Gabisa tidur sebelom kerja');
					readln(teks);
				until (teks<>'tidur');
			end else if (teks='tidur') and ((countm<>1) or (countis<>1)) then  	//perintah tidur jika sudah dilakukan at least 1 aksi
			tidur(FESimulasi[1].tEnergi,countm,countis,FESimulasi[NomorSim].tHarihidup,FESimulasi[NomorSim].tanggal);	
		if (teks='makan') then	
			begin
				makan(FESimulasi[i-1].tEnergi,countm);							
				FESimulasi[i].tEnergi:=(FESimulasi[i-1].tEnergi);
				i:=i+1;
			end;		
		if (teks='istirahat') then	
			begin
				istirahat(FESimulasi[i-1].tEnergi,countis);
				FESimulasi[i].tEnergi:=(FESimulasi[i-1].tEnergi);
				i:=i+1;
			end;	
	until (teks='tidur');	//Looping berhenti ketika text input text adalah tidur
