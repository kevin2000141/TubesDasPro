unit F4;

interface
uses uDef, sysutils;

	procedure stopSimulasi(var FESimulasi: Asimulasi; NomorSim: Integer);

implementation

	procedure stopSimulasi(var FESimulasi: Asimulasi; NomorSim: Integer);
	begin
		writeln ('Nomor Simulasi: ', FESimulasi[NomorSim].nomor);
		writeln ('Tanggal: ', FESimulasi[NomorSim].tanggal);
		writeln ('Jumlah Hari Hidup: ', FESimulasi[NomorSim].tHariHidup);
		writeln ('Jumlah Energi: ', FESimulasi[NomorSim].tEnergi);
		writeln ('Kapasitas Maksimum Inventori: ', FESimulasi[NomorSim].maxInventori);
		writeln ('Total Bahan Mentah Dibeli: ', FESimulasi[NomorSim].tBMentahDibeli);
		writeln ('Total Bahan Olahan Dibuat: ', FESimulasi[NomorSim].tBOlahanDibuat);
		writeln ('Total Bahan Olahan Dijual: ', FESimulasi[NomorSim].tBOlahanDijual);
		writeln ('Total Resep Dijual: ', FESimulasi[NomorSim].tResepDijual);
		writeln ('Total Pemasukan: ', FESimulasi[NomorSim].tPemasukan);
		writeln ('Total Pengeluaran: ', FESimulasi[NomorSim].tPengeluaran);
		writeln ('Total Uang: ', FESimulasi[NomorSim].tUang);
	end;
			
end.
