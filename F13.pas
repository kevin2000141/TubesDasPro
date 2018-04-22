// Nama File: F13.pas
// Deskripsi File: Unit prosedur lihat inventori untuk program utama Engi's Kitchen
// Tanggal terakhir diubah: 22/04/2018

unit F13;

interface
	uses uDef, F1, sysutils;
	
	var
		tukarString : string;
		tukarInt : integer;
		tukarTanggal: TDateTime;
		urutan : string;
		j,k : integer;
	
	procedure lihatInventori(NInvBO, NInvBM: Integer; var FEInventoriBahanOlahan, FEInventoriBahanMentah: Ainventori);
	{Menampilkan data daftar Bahan Mentah dan Bahan Olahan yang tersedia di inventori}
	
	procedure lihatInventoriBahanMentah(urutan: String; NInvBM:Integer; var FEInventoriBahanMentah: Ainventori);
	{Menampilkan data daftar Bahan Mentah yang tersedia di inventori secara berurutan sesuai dengan abjad}
	
	procedure lihatInventoriBahanOlahan(urutan: String; NInvBO:Integer; var FEInventoriBahanOlahan: Ainventori);
	{Menampilkan data daftar Bahan Olahan yang tersedia di inventori secara berurutan sesuai dengan abjad}

implementation
	procedure lihatInventori(NInvBO, NInvBM: Integer; var FEInventoriBahanOlahan, FEInventoriBahanMentah: Ainventori);
	
	{KAMUS}

	{ALGORITMA}
	begin
		repeat
			write ('Penampilan sesuai abjad "membesar" atau "mengecil" : '); 
			readln (urutan);
			if not(urutan = 'membesar') and not (urutan = 'mengecil') then
			begin
				writeln ('Input salah. Masukkan lagi!');
			end;
		until (urutan = 'membesar') or (urutan = 'mengecil');
		lihatInventoriBahanMentah(urutan, NInvBM, FEInventoriBahanMentah);
		writeln();
		lihatInventoriBahanOlahan(urutan, NInvBO, FEInventoriBahanOlahan);
	end;
	
	procedure lihatInventoriBahanMentah(urutan: String; NInvBM:Integer; var FEInventoriBahanMentah: Ainventori);
	
	{KAMUS}

	{ALGORITMA}
	begin
		{Mengurutkan array berdasarkan nama sesui abjad}
		writeln ('DAFTAR BAHAN MENTAH DI INVENTORI');
		writeln ('Nama Bahan Mentah | Tanggal Beli | Jumlah');
		repeat
			k := 0; i:= NInvBM;
			for j:=1 to i do
			begin
				if (FEInventoriBahanMentah[j-1].nama > FEInventoriBahanMentah[j].nama) then
				begin
					tukarString := FEInventoriBahanMentah[j-1].nama;
					FEInventoriBahanMentah[j-1].nama := FEInventoriBahanMentah[j].nama;
					FEInventoriBahanMentah[j].nama := tukarString;
					tukarInt := FEInventoriBahanMentah[j-1].jumlah;
					FEInventoriBahanMentah[j-1].jumlah := FEInventoriBahanMentah[j].jumlah;
					FEInventoriBahanMentah[j].jumlah := tukarInt;
					tukarTanggal := FEInventoriBahanMentah[j-1].tanggal;
					FEInventoriBahanMentah[j-1].tanggal := FEInventoriBahanMentah[j].tanggal;
					FEInventoriBahanMentah[j].tanggal := tukarTanggal;
					k := j;
				end;
			end;	
			i := k;	
		until i = 0;
		{Menampilkan array dengan abjad A ke Z, membaca dari depan}
		if (urutan = 'membesar') then
		begin
			i := 1;
			while (NInvBM>=i) do
			begin
				write (FEInventoriBahanMentah[i].nama, ' | ');
				DefaultFormatSettings.ShortDateFormat := 'd/m/yyyy';
				DefaultFormatSettings.DateSeparator := '/';
				write (FormatDateTime('ddddd',FEInventoriBahanMentah[i].tanggal));
				writeln (' | ', FEInventoriBahanMentah[i].jumlah);
				i := i+1;
			end;
		end else {Menampilkan array dengan abjad Z ke A, membaca dari belakang}
		begin
			i := NInvBM;
			while (i>=1) do
			begin
				write (FEInventoriBahanMentah[i].nama, ' | ');
				DefaultFormatSettings.ShortDateFormat := 'd/m/yyyy';
				DefaultFormatSettings.DateSeparator := '/';
				write (FormatDateTime('ddddd',FEInventoriBahanMentah[i].tanggal));
				writeln (' | ', FEInventoriBahanMentah[i].jumlah);
				i := i-1;
			end;
		end;
	end;
		
	procedure lihatInventoriBahanOlahan(urutan: String; NInvBO:Integer; var FEInventoriBahanOlahan: Ainventori);
	
	{KAMUS}

	{ALGORITMA}
	begin
		{Mengurutkan array berdasarkan nama dari A ke Z}
		writeln ('DAFTAR BAHAN OLAHAN DI INVENTORI');
		writeln ('Nama Bahan Olahan | Tanggal Buat | Jumlah');
		repeat
			k := 0; i:=NInvBO;
			for j:=1 to i do
			begin
				if (FEInventoriBahanOlahan[j-1].nama > FEInventoriBahanOlahan[j].nama) then
				begin
					tukarString := FEInventoriBahanOlahan[j-1].nama;
					FEInventoriBahanOlahan[j-1].nama := FEInventoriBahanOlahan[j].nama;
					FEInventoriBahanOlahan[j].nama := tukarString;
					tukarInt := FEInventoriBahanOlahan[j-1].jumlah;
					FEInventoriBahanOlahan[j-1].jumlah := FEInventoriBahanOlahan[j].jumlah;
					FEInventoriBahanOlahan[j].jumlah := tukarInt;
					tukarTanggal := FEInventoriBahanOlahan[j-1].tanggal;
					FEInventoriBahanOlahan[j-1].tanggal := FEInventoriBahanOlahan[j].tanggal;
					FEInventoriBahanOlahan[j].tanggal := tukarTanggal;
					k := j;
				end;
			end;	
			i := k;	
		until i = 0;
		{Menampilkan array dengan abjad A ke Z, membaca dari depan}
		if (urutan = 'membesar') then
		begin
			i := 1;
			while (NInvBO>=i) do
			begin
				write (FEInventoriBahanOlahan[i].nama, ' | ');
				DefaultFormatSettings.ShortDateFormat := 'd/m/yyyy';
				DefaultFormatSettings.DateSeparator := '/';
				write (FormatDateTime('ddddd',FEInventoriBahanOlahan[i].tanggal));
				writeln (' | ', FEInventoriBahanOlahan[i].jumlah);
				i := i+1;
			end;
		end else {Menampilkan array dengan abjad Z ke A, membaca dari belakang}
		begin
			i := NInvBO;
			while (i>=1) do
			begin
				write (FEInventoriBahanOlahan[i].nama, ' | ');
				DefaultFormatSettings.ShortDateFormat := 'd/m/yyyy';
				DefaultFormatSettings.DateSeparator := '/';
				write (FormatDateTime('ddddd',FEInventoriBahanOlahan[i].tanggal));
				writeln (' | ', FEInventoriBahanOlahan[i].jumlah);
				i := i-1;
			end;
		end;
	end;
end.
