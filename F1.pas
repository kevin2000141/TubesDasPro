// Nama File: F1.pas
// Deskripsi File: Unit prosedur load untuk program utama Engi's Kitchen
// Tanggal terakhir diubah: 22/04/2018

unit F1;

interface
uses uDef, sysutils;		
	
	const
		NMax = 100;
	
	var
		a,b,c,d,e,f: Text;
		counterror, i,j : Integer;
		S:String;
		error: Boolean;
	
	{ Deklarasi Fungsi/Prosedur }
	function shorten(panjang:AnsiString):AnsiString;
	{Fungsi yang mengubah ' | ' atau ' |' atau '| ' menjadi '|'}

	function jumlahchar(S: Ansistring): integer;
	{Fungsi yang mengeluarkan jumlah karakter '|' pada sebuah string}

	procedure load( var l : Boolean;
					var FEBahanMentah: Abahanmentah; 
					var FEBahanOlahan: Abahanolahan;
					var FEInventoriBahanMentah: Ainventori;
					var FEInventoriBahanOlahan: Ainventori;
					var FEResep: Aresep;
					var FESimulasi: Asimulasi;
					var NBahanM: Integer;
					var NBahanO: Integer;
					var NInvBM: Integer;
					var NInvBO: Integer;
					var NResep: Integer;
					var NSim: Integer);


implementation
	
	function shorten(panjang:AnsiString):AnsiString;
	{Fungsi yang mengubah ' | ' atau ' |' atau '| ' menjadi '|'}

	{KAMUS}

	{ALGORITMA}
	begin
		panjang := StringReplace(panjang, ' | ', '|', [rfReplaceAll]);
		panjang := StringReplace(panjang, '| ', '|', [rfReplaceAll]);
		panjang := StringReplace(panjang, ' |', '|', [rfReplaceAll]);
		shorten := panjang;
	end;

	function jumlahchar(S: Ansistring): integer;
	{Fungsi yang mengeluarkan jumlah karakter '|' pada sebuah string}

	{KAMUS}
	var
		i: Integer;
	
	{ALGORITMA}
	begin
		jumlahchar := 0;
		for i := 1 to Length(S) do
		begin
			if S[i] = '|' then
			begin
				jumlahchar:=jumlahchar+1;
			end;
		end;
		end;

	procedure load( var l : Boolean;
					var FEBahanMentah: Abahanmentah; 
					var FEBahanOlahan: Abahanolahan;
					var FEInventoriBahanMentah: Ainventori;
					var FEInventoriBahanOlahan: Ainventori;
					var FEResep: Aresep;
					var FESimulasi: Asimulasi;
					var NBahanM: Integer;
					var NBahanO: Integer;
					var NInvBM: Integer;
					var NInvBO: Integer;
					var NResep: Integer;
					var NSim: Integer);

	var
	 	temp : AnsiString;
	
	begin
	if (FileExists('BahanMentah.txt')) and (FileExists('BahanOlahan.txt')) and (FileExists('InvBahanMentah.txt')) and (FileExists('InvBahanOlahan.txt')) and (FileExists('Resep.txt')) and (FileExists('Simulasi.txt')) then
	begin
		assign (a, 'BahanMentah.txt');
		reset (a);
		assign (b, 'BahanOlahan.txt');
		reset (b);
		assign (c, 'InvBahanMentah.txt');
		reset (c);
		assign (d, 'InvBahanOlahan.txt');
		reset (d);
		assign (e, 'Resep.txt');
		reset (e);
		assign (f, 'Simulasi.txt');
		reset (f);
		
		NBahanM:=0;
		counterror:=0;
		while not(eof(a)) do
			begin
			error:=False;
			NBahanM:=NBahanM+1;
			readln (a, temp);
			temp := shorten(temp);
			if jumlahchar(temp) <> 3 then
			begin
				error:=True;
			end;
			FEBahanMentah[NBahanM].nama:=copy(temp, 1, (pos('|',temp) -1));
			delete(temp,1,(pos('|',temp)));
			if TryStrToInt(copy(temp, 1, (pos('|',temp) -1)),FEBahanMentah[NBahanM].harga) then
			begin
				FEBahanMentah[NBahanM].harga:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
			end else
			begin
				error:=True;
			end;
			delete(temp,1,(pos('|',temp)));
			if TryStrToInt(copy(temp, 1, (pos('|',temp) -1)),FEBahanMentah[NBahanM].kadaluarsa) then
			begin
				FEBahanMentah[NBahanM].kadaluarsa:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
			end else
			begin
				error:=True;
			end;
			delete(temp,1,(pos('|',temp)));
			if TryStrToInt(temp,FEBahanMentah[NBahanM].jumlah) then
			begin
				FEBahanMentah[NBahanM].jumlah:=StrToInt(temp);
			end else
			begin
				error:=True;
			end;
			if error then
			begin
				NBahanM:=NBahanM-1;
				counterror:=counterror+1;
			end;
			end;	
		if counterror > 0 then
		begin
			writeln(counterror, ' line pada file BahanMentah.txt tidak diload karena ada kesalahan data.');
		end;

		NBahanO:=0;
		counterror:=0;
		while not(eof(b)) do
			begin
			error:=False;
			NBahanO:=NBahanO+1;
			readln (b, temp);
			temp := shorten(temp);
			FEBahanOlahan[NBahanO].nama:=copy(temp, 1, (pos('|',temp) -1));
			delete(temp,1,(pos('|',temp)));
			if TryStrToInt(copy(temp, 1, (pos('|',temp) -1)),FEBahanOlahan[NBahanO].harga) then
			begin
				FEBahanOlahan[NBahanO].harga:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
			end else
			begin
				error:=True;
			end;
			delete(temp,1,(pos('|',temp)));
			if TryStrToInt(copy(temp, 1, (pos('|',temp) -1)),FEBahanOlahan[NBahanO].n) then
			begin
				FEBahanOlahan[NBahanO].n:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
				delete(temp,1,(pos('|',temp)));
				if jumlahchar(temp) <> (FEBahanOlahan[NBahanO].n-1) then
				begin
					error:=True;
				end;
				if FEBahanOlahan[NBahanO].n>1 then 
				begin
					j:=FEBahanOlahan[NBahanO].n - 1;
					for i:=1 to j do
					begin
						if StringReplace((copy(temp, 1, (pos('|',temp) -1))), ' ', '', [rfReplaceAll, rfIgnoreCase]) = '' then
						begin
							delete(temp,1,(pos('|',temp)));
							FEBahanOlahan[NBahanO].n:=FEBahanOlahan[NBahanO].n-1;
						end else
						begin
							FEBahanOlahan[NBahanO].bahan[i]:=(copy(temp, 1, (pos('|',temp) -1)));
							delete(temp,1,(pos('|',temp)));
						end;
					end;
					if StringReplace(temp, ' ', '', [rfReplaceAll, rfIgnoreCase]) <> '' then
					begin
						FEBahanOlahan[NBahanO].bahan[FEBahanOlahan[NBahanO].n]:=temp;
					end;
				end;
			end else
			begin
				error:=True;
			end;
			if error then
			begin
				NBahanO:=NBahanO-1;
				counterror:=counterror+1;
			end;
			end;
		if counterror > 0 then
		begin
			writeln(counterror, ' line pada file BahanOlahan.txt tidak diload karena ada kesalahan data.');
		end;

		NSim:=0;
		counterror:=0;
		while not(eof(f)) do
			begin
			error:=False;
			NSim:=NSim + 1;
			readln (f, temp);
			temp := shorten(temp);
			if jumlahchar(temp) <> 11 then
			begin
				error:=True;
			end;
			if TryStrToInt(copy(temp, 1, (pos('|',temp) -1)),FESimulasi[NSim].nomor) then
			begin
				FESimulasi[NSim].nomor:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
			end else
			begin
				error:=True;
			end;
			delete(temp,1,(pos('|',temp)));
			DefaultFormatSettings.ShortDateFormat := 'd/m/yyyy';
			DefaultFormatSettings.DateSeparator := '/';
			if TryStrToDate((copy(temp, 1, (pos('|',temp) -1))),FESimulasi[NSim].tanggal) then
			begin
				FESimulasi[NSim].tanggal:=StrToDate(copy(temp, 1, (pos('|',temp) -1)));
			end else
			begin
				error:= True;
			end;
			delete(temp,1,(pos('|',temp)));
			if TryStrToInt(copy(temp, 1, (pos('|',temp) -1)),FESimulasi[NSim].tHariHidup) then
			begin
				FESimulasi[NSim].tHariHidup:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
			end else
			begin
				error:=True;
			end;
			delete(temp,1,(pos('|',temp)));
			if TryStrToInt(copy(temp, 1, (pos('|',temp) -1)),FESimulasi[NSim].tEnergi) then
			begin
				FESimulasi[NSim].tEnergi:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
			end else
			begin
				error:=True;
			end;
			delete(temp,1,(pos('|',temp)));
			if TryStrToInt(copy(temp, 1, (pos('|',temp) -1)),FESimulasi[NSim].maxInventori) then
			begin
				FESimulasi[NSim].maxInventori:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
			end else
			begin
				error:=True;
			end;
			delete(temp,1,(pos('|',temp)));
			if TryStrToInt(copy(temp, 1, (pos('|',temp) -1)),FESimulasi[NSim].tBMentahDibeli) then
			begin
				FESimulasi[NSim].tBMentahDibeli:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
			end else
			begin
				error:=True;
			end;
			delete(temp,1,(pos('|',temp)));
			if TryStrToInt(copy(temp, 1, (pos('|',temp) -1)),FESimulasi[NSim].tBOlahanDibuat) then
			begin
				FESimulasi[NSim].tBOlahanDibuat:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
			end else
			begin
				error:=True;
			end;
			delete(temp,1,(pos('|',temp)));
			if TryStrToInt(copy(temp, 1, (pos('|',temp) -1)),FESimulasi[NSim].tBOlahanDijual) then
			begin
				FESimulasi[NSim].tBOlahanDijual:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
			end else
			begin
				error:=True;
			end;
			delete(temp,1,(pos('|',temp)));
			if TryStrToInt(copy(temp, 1, (pos('|',temp) -1)),FESimulasi[NSim].tResepDijual) then
			begin
				FESimulasi[NSim].tResepDijual:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
			end else
			begin
				error:=True;
			end;
			delete(temp,1,(pos('|',temp)));
			if TryStrToInt(copy(temp, 1, (pos('|',temp) -1)),FESimulasi[NSim].tPemasukan) then
			begin
				FESimulasi[NSim].tPemasukan:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
			end else
			begin
				error:=True;
			end;
			delete(temp,1,(pos('|',temp)));
			if TryStrToInt(copy(temp, 1, (pos('|',temp) -1)),FESimulasi[NSim].tPengeluaran) then
			begin
				FESimulasi[NSim].tPengeluaran:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
			end else
			begin
				error:=True;
			end;
			delete(temp,1,(pos('|',temp)));
			if TryStrToInt(temp,FESimulasi[NSim].tUang) then
			begin
				FESimulasi[NSim].tUang:=StrToInt(temp);
			end else
			begin
				error:=True;
			end;
			if error then
			begin
				NSim:=NSim-1;
				counterror:=counterror+1;
			end;
			end;
		if counterror > 0 then
		begin
			writeln(counterror, ' line pada file Simulasi.txt tidak diload karena ada kesalahan data.');
		end;

		NInvBM:=0;
		counterror:=0;
		while not(eof(c)) do
			begin
			error:=False;
			NInvBM:=NInvBM + 1;
			readln (c, temp);
			temp := shorten(temp);
			if jumlahchar(temp) <> 2 then
			begin
				error:=True;
			end;
			FEInventoriBahanMentah[NInvBM].nama:=copy(temp, 1, (pos('|',temp) -1));
			delete(temp,1,(pos('|',temp)));
			DefaultFormatSettings.ShortDateFormat := 'd/m/yyyy';
			DefaultFormatSettings.DateSeparator := '/';
			if TryStrToDate((copy(temp, 1, (pos('|',temp) -1))),FEInventoriBahanMentah[NInvBM].tanggal) then
			begin
				FEInventoriBahanMentah[NInvBM].tanggal:=StrToDate(copy(temp, 1, (pos('|',temp) -1)));
			end else
			begin
				error:=True;
			end;
			delete(temp,1,(pos('|',temp)));
			if TryStrToInt(temp,FEInventoriBahanMentah[NInvBM].jumlah) then
			begin
				FEInventoriBahanMentah[NInvBM].jumlah:=StrToInt(temp);
			end else
			begin
				error:=True;
			end;
			if error then
			begin
				NInvBM:=NInvBM-1;
				counterror:=counterror+1;
			end;
			end;
		if counterror > 0 then
		begin
			writeln(counterror, ' line pada file InvBahanMentah.txt tidak diload karena ada kesalahan data.');
		end;
		
		NInvBO:=0;
		counterror:=0;
		while not(eof(d)) do
			begin
			error:=False;
			NInvBO:=NInvBO + 1;
			readln (d, temp);
			temp := shorten(temp);
			if jumlahchar(temp) <> 2 then
			begin
				error:=True;
			end;
			FEInventoriBahanOlahan[NInvBO].nama:=copy(temp, 1, (pos('|',temp) -1));
			delete(temp,1,(pos('|',temp)));
			DefaultFormatSettings.ShortDateFormat := 'd/m/yyyy';
			DefaultFormatSettings.DateSeparator := '/';
			if TryStrToDate((copy(temp, 1, (pos('|',temp) -1))),FEInventoriBahanOlahan[NInvBO].tanggal) then
			begin
				FEInventoriBahanOlahan[NInvBO].tanggal:=StrToDate(copy(temp, 1, (pos('|',temp) -1)));
			end else
			begin
				error:=True;
			end;
			delete(temp,1,(pos('|',temp)));
			if TryStrToInt(temp,FEInventoriBahanOlahan[NInvBO].jumlah) then
			begin
				FEInventoriBahanOlahan[NInvBO].jumlah:=StrToInt(temp);
			end else
			begin
				error:=True;
			end;
			if error then
			begin
				NInvBO:=NInvBO-1;
				counterror:=counterror+1;
			end;
			end;
		if counterror > 0 then
		begin
			writeln(counterror, ' line pada file InvBahanOlahan.txt tidak diload karena ada kesalahan data.');
		end;


		NResep:=0;
		counterror:=0;
		while not(eof(e)) do
			begin
			error:=False;
			NResep:=NResep+1;
			readln (e, temp);
			temp := shorten(temp);
			FEResep[NResep].nama:=copy(temp, 1, (pos('|',temp) -1));
			delete(temp,1,(pos('|',temp)));
			if TryStrToInt(copy(temp, 1, (pos('|',temp) -1)),FEResep[NResep].harga) then
			begin
				FEResep[NResep].harga:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
			end else
			begin
				error:=True;
			end;
			delete(temp,1,(pos('|',temp)));
			if TryStrToInt(copy(temp, 1, (pos('|',temp) -1)),FEResep[NResep].n) then
			begin
				FEResep[NResep].n:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
				delete(temp,1,(pos('|',temp)));
				if jumlahchar(temp) <> (FEResep[NResep].n-1) then
				begin
					error:=True;
				end;
				j:=FEResep[NResep].n - 1;
				for i:=1 to j do
				begin
					if StringReplace((copy(temp, 1, (pos('|',temp) -1))), ' ', '', [rfReplaceAll, rfIgnoreCase]) = '' then
					begin
						delete(temp,1,(pos('|',temp)));
						FEResep[NResep].n:=FEResep[NResep].n - 1;
					end else
					begin
						FEResep[NResep].bahan[i]:=(copy(temp, 1, (pos('|',temp) -1)));
						delete(temp,1,(pos('|',temp)));
					end;
				end;
				if StringReplace(temp, ' ', '', [rfReplaceAll, rfIgnoreCase]) <> '' then
				begin
					FEResep[NResep].bahan[FEResep[NResep].n]:=temp;
				end;
			end else
			begin
				error:=True;
			end;
			if error then
			begin
				NResep:=NResep-1;
				counterror:=counterror+1;
			end;
			end;
		if counterror > 0 then
		begin
			writeln(counterror, ' line pada file Resep.txt tidak diload karena ada kesalahan data.');
		end;

		close(a);
		close(b);
		close(c);
		close(d);
		close(e);					
		close(f);
		writeln('Loading file sukses.');
		l:= True;	
	end else
	begin
		writeln('Salah satu file tidak ada, loading file gagal.');
	end;
	end;
end.
