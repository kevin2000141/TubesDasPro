Program EngisKitchen;

uses uDef, sysutils, F1, F2, F3, F4, F5, F6, F7, {F8,} F9, F10, F11{, F12, F13, F14,F15, F16, F17};
//uses B1_cekKesalahanLoading;
//uses B3_validasi;
//uses B4_restock;


var
	input: AnsiString;
	countis, countm, NomorSim : Integer;

begin
write('> ');
readln(input);
while input <> 'exit' do
begin
	if input = 'load' then
	begin
		load(FEBahanMentah, FEBahanOlahan, FEInventoriBahanMentah, FEInventoriBahanOlahan, FEResep, FESimulasi, NBahanM, NBahanO, NInvBM, NInvBO, NResep, NSim); 
		write('> ');
		readln(input);
		if copy(input, 1, 5)='start' then
		begin
			NomorSim:=StrToInt(copy(input, 7, 7));
			startSimulasi(countis, countm);
			writeln('Mulai simulasi ', NomorSim);
			write('>> ');
			readln(input);
			while input <> 'stop' do
			begin
				if input = 'belibahan' then
				begin
					beliBahan(FEInventoriBahanMentah, FEBahanMentah, FESimulasi, NomorSim);	
				end else
				if input = 'olahbahan' then
				begin
					olahbahan(FEBahanOlahan, FEInventoriBahanOlahan,FEInventoriBahanMentah, FESimulasi, NomorSim);
				end else if input = 'jualolahan' then
				begin
					jualolahan(FEBahanOlahan, FEInventoriBahanOlahan, FESimulasi, NomorSim);
				end else if input = 'jualresep'	then
				begin
					
				end else if input = 'makan' then
				begin
					makan(FESimulasi[NomorSim].tEnergi, countm);
				end else if input = 'istirahat' then
				begin
					istirahat(FESimulasi[NomorSim].tEnergi, countis);
				end else if input = 'tidur' then
				begin
					tidur(FESimulasi[NomorSim].tEnergi, countm, countis, FESimulasi[NomorSim].tHariHidup, FESimulasi[NomorSim].tanggal);
				end else if input = 'lihatstatistik' then
				begin
					
				end else if input = 'lihatinventori' then
				begin
					
				end else if input = 'lihatresep' then
				begin
					
				end else if input = 'cariresep' then
				begin
					cariresep(FEResep, NResep);
				end else if input = 'upgradeinventori' then
				begin
					upgradeInventori(FESimulasi[NomorSim].tEnergi);
				end else {Input salah}
				begin
					writeln('Masukan input simulasi yang benar.');
				end;
				write('>> ');
				readln(input);
			end;
			stopSimulasi(FESimulasi, NomorSim);
		end;	
	end else
	begin
		writeln('File harus diload terlebih dahulu.');
	end;
	write('> ');
	readln(input);
end;
exit(FEInventoriBahanMentah, FEInventoriBahanOlahan, FEResep, NInvBM, NInvBO, NResep, NSim);
end.