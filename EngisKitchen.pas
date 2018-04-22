// Nama File: EngisKitchen.pas
// Deskripsi File: Program utama simulasi Engi's Kitchen
// Tanggal terakhir diubah: 22/04/2018

Program EngisKitchen;

uses uDef, sysutils, F1, F2, F3, F4, F5, F6, F7, F8, F9, F10, F11, F12, F13, F14, F15, F16, F17;
//uses B1_cekKesalahanLoading;
//uses B3_validasi;
//uses B4_restock;


var
	input: AnsiString;
	countis, countm, NomorSim : Integer;
	l: Boolean;

begin
l:=False;
writeln('Selamat datang di simulasi Engi''s Kitchen!');
writeln('Aksi yang tersedia:');
	writeln('1. Load');
	writeln('2. Exit');
write('> ');
readln(input);
while lowercase(input) <> 'exit' do
begin
	if lowercase(input) = 'load' then
	begin
		load(l, FEBahanMentah, FEBahanOlahan, FEInventoriBahanMentah, FEInventoriBahanOlahan, FEResep, FESimulasi, NBahanM, NBahanO, NInvBM, NInvBO, NResep, NSim); 
		writeln('Aksi yang tersedia:');
			writeln('1. Start [1-', NSim,']');
			writeln('2. LihatInventori');
			writeln('3. LihatResep');
			writeln('4. CariResep');
			writeln('5. TambahResep');
			writeln('6. Exit');
		write('> ');
		readln(input);
	end;
	if (lowercase(copy(input, 1, 5))='start') and l then
	begin
		delete(input,1,6);
		if StrToInt(input) <= NSim then
		begin
		NomorSim:=StrToInt(input);
		startSimulasi(countis, countm, aksi, FESimulasi, NomorSim, FEBahanMentah, NBahanM);
		writeln('Mulai simulasi ', NomorSim);
		writeln('Aksi yang tersedia:');
			writeln('1. BeliBahan');
			writeln('2. Olahbahan');
			writeln('3. JualOlahan');
			writeln('4. JualResep');
			writeln('5. Makan');
			writeln('6. Istirahat');
			writeln('7. Tidur');
			writeln('8. LihatStatistik');
			writeln('9. LihatInventori');
			writeln('10. LihatResep');
			writeln('11. CariResep');
			writeln('12. TambahResep');
			writeln('13. UpgradeInventori');
			writeln('14. Stop');
		write('>> ');
		readln(input);
		while lowercase(input) <> 'stop' do
		begin
				if lowercase(input) = 'belibahan' then
				begin
					beliBahan(FEInventoriBahanMentah, FEBahanMentah, FESimulasi, aksi, NInvBO, NInvBM, NomorSim,NBahanM);	
				end else if lowercase(input) = 'olahbahan' then
				begin
					olahbahan(FEBahanOlahan, FEInventoriBahanOlahan, FEInventoriBahanMentah, FESimulasi, NInvBO, NInvBM, NomorSim, aksi,NBahanO);
				end else if lowercase(input) = 'jualolahan' then
				begin
					jualolahan(FEBahanOlahan, FEInventoriBahanOlahan, FESimulasi, NInvBO, NBahanO, NomorSim, aksi);
				end else if lowercase(input) = 'jualresep'	then
				begin
					jualresep(FEResep, FESimulasi, FEInventoriBahanMentah, FEInventoriBahanOlahan, NInvBM, NInvBO, NomorSim, aksi);
				end else if lowercase(input) = 'makan' then
				begin
					makan(FESimulasi[NomorSim].tEnergi, countm);
				end else if lowercase(input) = 'istirahat' then
				begin
					istirahat(FESimulasi[NomorSim].tEnergi, countis);
				end else if lowercase(input) = 'tidur' then
				begin
					tidur(FESimulasi[NomorSim].tEnergi, countm, countis, FESimulasi[NomorSim].tHariHidup, FESimulasi[NomorSim].tanggal, NInvBM, NInvBO, aksi, FESimulasi, NomorSim, FEBahanMentah, NBahanM);
				end else if lowercase(input) = 'lihatstatistik' then
				begin
					lihatStatistik(FESimulasi[NomorSim]);
				end else if lowercase(input) = 'lihatinventori' then
				begin
					lihatInventori(NInvBO, NInvBM, FEInventoriBahanOlahan, FEInventoriBahanMentah);
				end else if lowercase(input) = 'lihatresep' then
				begin
					lihatResep(FEResep, NResep);
				end else if lowercase(input) = 'cariresep' then
				begin
					cariresep(FEResep, NResep);
				end else if lowercase(input) = 'tambahresep' then
				begin
					tambahresep(FEResep, NResep, FEBahanMentah, FEBahanOlahan, FEInventoriBahanMentah, FEInventoriBahanOlahan, NBahanM, NBahanO, NInvBM, NInvBO);
				end else if lowercase(input) = 'upgradeinventori' then
				begin
					upgradeInventori(FESimulasi[NomorSim].maxInventori);
				end else {Input salah}
				begin
					writeln('Masukan input simulasi yang benar.');
				end;
				writeln('Aksi yang tersedia:');
					writeln('1. BeliBahan');
					writeln('2. Olahbahan');
					writeln('3. JualOlahan');
					writeln('4. JualResep');
					writeln('5. Makan');
					writeln('6. Istirahat');
					writeln('7. Tidur');
					writeln('8. LihatStatistik');
					writeln('9. LihatInventori');
					writeln('10. LihatResep');
					writeln('11. CariResep');
					writeln('12. TambahResep');
					writeln('13. UpgradeInventori');
					writeln('14. Stop');
				write('>> ');
				readln(input);
		end;
		stopSimulasi(FESimulasi, NomorSim);
		writeln('Aksi yang tersedia:');
			writeln('1. Start [1-', NSim,']');
			writeln('2. LihatInventori');
			writeln('3. LihatResep');
			writeln('4. CariResep');
			writeln('5. TambahResep');
			writeln('6. Exit');
		write('> ');
		readln(input);
		end else
		begin
			writeln('Masukan nomor simulasi yang ada/valid.');
			writeln('Aksi yang tersedia:');
				writeln('1. Start [1-', NSim,']');
				writeln('2. LihatInventori');
				writeln('3. LihatResep');
				writeln('4. CariResep');
				writeln('5. TambahResep');
				writeln('6. Exit');
			write('> ');
			readln(input);
		end;
	end else if (lowercase(input)='lihatinventori') and l then  
	begin
		lihatInventori(NInvBO, NInvBM, FEInventoriBahanOlahan, FEInventoriBahanMentah);
		writeln('Aksi yang tersedia:');
			writeln('1. Start [1-', NSim,']');
			writeln('2. LihatInventori');
			writeln('3. LihatResep');
			writeln('4. CariResep');
			writeln('5. TambahResep');
			writeln('6. Exit');
		write('> ');
		readln(input);
	end else if (lowercase(input)='lihatresep') and l then 
	begin
		lihatResep(FEResep, NResep);
		writeln('Aksi yang tersedia:');
			writeln('1. Start [1-', NSim,']');
			writeln('2. LihatInventori');
			writeln('3. LihatResep');
			writeln('4. CariResep');
			writeln('5. TambahResep');
			writeln('6. Exit');
		write('> ');
		readln(input);
	end else if (lowercase(input)='cariresep') and l then 
	begin
		cariresep(FEResep, NResep);
		writeln('Aksi yang tersedia:');
			writeln('1. Start [1-', NSim,']');
			writeln('2. LihatInventori');
			writeln('3. LihatResep');
			writeln('4. CariResep');
			writeln('5. TambahResep');
			writeln('6. Exit');
		write('> ');
		readln(input);
	end else if (lowercase(input)='tambahresep') and l then 
	begin
		tambahresep(FEResep, NResep, FEBahanMentah, FEBahanOlahan, FEInventoriBahanMentah, FEInventoriBahanOlahan, NBahanM, NBahanO, NInvBM, NInvBO);
		writeln('Aksi yang tersedia:');
			writeln('1. Start [1-', NSim,']');
			writeln('2. LihatInventori');
			writeln('3. LihatResep');
			writeln('4. CariResep');
			writeln('5. TambahResep');
			writeln('6. Exit');
		write('> ');
		readln(input);
	end;
	if not(lowercase(input) = 'load') and (not(l)) then
	begin 
		writeln('File harus diload terlebih dahulu.');
		writeln('Aksi yang tersedia:');
			writeln('1. Load');
			writeln('2. Exit');
		write('> ');
		readln(input);
	end;
end;
writeln('Terima kasih telah menggunakan simulasi Engi''s Kitchen!');
exit(FEBahanMentah, FEInventoriBahanMentah, FEInventoriBahanOlahan, FEResep, NBahanM, NInvBM, NInvBO, NResep);
end.
