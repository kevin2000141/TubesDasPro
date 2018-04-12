unit F1;

interface
uses uDef, sysutils;		
	
	var
		a,b,c,d,e,f: Text;
		i,j : Integer;
	
	{ Deklarasi Fungsi/Prosedur }
	function shorten(panjang:AnsiString):AnsiString;

	procedure load( var FEBahanMentah: Abahanmentah; 
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
	begin
		shorten := StringReplace(panjang, ' | ', '|', [rfReplaceAll]);
	end;

	procedure load( var FEBahanMentah: Abahanmentah; 
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
	assign(a,'bahanmentah.txt');
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
	
	NBahanM:=1;
	while not(eof(a)) do
		begin
		readln (a, temp);
		temp := shorten(temp);
		FEBahanMentah[NBahanM].nama:=copy(temp, 1, (pos('|',temp) -1));
		delete(temp,1,(pos('|',temp)));
		FEBahanMentah[NBahanM].harga:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
		delete(temp,1,(pos('|',temp)));
		FEBahanMentah[NBahanM].kadaluarsa:=StrToInt(temp);
		NBahanM:=NBahanM+1;
		end;
	NBahanM:=NBahanM-1;	
	{for i:=1 to NBahanM do
	begin
		writeln(FEBahanMentah[i].nama, ' ', FEBahanMentah[i].harga, ' ', FEBahanMentah[i].kadaluarsa);
	end;
	writeln();}

	NBahanO:=1;
	while not(eof(b)) do
		begin
		readln (b, temp);
		temp := shorten(temp);
		FEBahanOlahan[NBahanO].nama:=copy(temp, 1, (pos('|',temp) -1));
		delete(temp,1,(pos('|',temp)));
		FEBahanOlahan[NBahanO].harga:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
		delete(temp,1,(pos('|',temp)));
		FEBahanOlahan[NBahanO].n:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
		delete(temp,1,(pos('|',temp)));
		if FEBahanOlahan[NBahanO].n>1 then 
		begin
			for i:=1 to (FEBahanOlahan[NBahanO].n - 1) do
			begin
				FEBahanOlahan[NBahanO].bahan[i]:=(copy(temp, 1, (pos('|',temp) -1)));
				delete(temp,1,(pos('|',temp)));
			end;
		end;
		FEBahanOlahan[NBahanO].bahan[FEBahanOlahan[NBahanO].n]:=temp;
		NBahanO:=NBahanO+1;
		end;
	NBahanO:=NBahanO-1;
	{for i:=1 to NBahanO do
	begin
		write(FEBahanOlahan[i].nama, ' ', FEBahanOlahan[i].harga, ' ', FEBahanOlahan[i].n);
		for j:=1 to FEBahanOlahan[NBahanO].n do
		begin
			write(' ', FEBahanOlahan[i].bahan[j]);
		end;
		writeln();
	end;
	writeln();}

	NInvBM:=1;
	while not(eof(c)) do
		begin
		readln (c, temp);
		temp := shorten(temp);
		FEInventoriBahanMentah[NInvBM].nama:=copy(temp, 1, (pos('|',temp) -1));
		delete(temp,1,(pos('|',temp)));
		DefaultFormatSettings.ShortDateFormat := 'dd/mm/yy';
		DefaultFormatSettings.DateSeparator := '/';
		FEInventoriBahanMentah[NInvBM].tanggal:=StrToDate(copy(temp, 1, (pos('|',temp) -1)));
		delete(temp,1,(pos('|',temp)));
		FEInventoriBahanMentah[NInvBM].jumlah:=StrToInt(temp);
		NInvBM:=NInvBM + 1;
		end;
	NInvBM:= NInvBM - 1;
	{for i:=1 to NInvBM do
	begin
		writeln (FEInventoriBahanMentah[1,i].nama, ' ', DateToStr(FEInventoriBahanMentah[1,i].tanggal), ' ', FEInventoriBahanMentah[1,i].jumlah);
	end;
	writeln();}

	NInvBO:=1;
	while not(eof(d)) do
		begin
		readln (d, temp);
		temp := shorten(temp);
		FEInventoriBahanOlahan[NInvBO].nama:=copy(temp, 1, (pos('|',temp) -1));
		delete(temp,1,(pos('|',temp)));
		DefaultFormatSettings.ShortDateFormat := 'dd/mm/yy';
		DefaultFormatSettings.DateSeparator := '/';
		FEInventoriBahanOlahan[NInvBO].tanggal:=StrToDate(copy(temp, 1, (pos('|',temp) -1)));
		delete(temp,1,(pos('|',temp)));
		FEInventoriBahanOlahan[NInvBO].jumlah:=StrToInt(temp);
		NInvBO:=NInvBO + 1;
		end;
	NInvBO:= NInvBO - 1;
	{for i:=1 to NInvBO do
	begin
		writeln (FEInventoriBahanOlahan[1,i].nama, ' ', DateToStr(FEInventoriBahanOlahan[1,i].tanggal), ' ', FEInventoriBahanOlahan[1,i].jumlah);
	end;
	writeln();}

	NResep:=1;
	while not(eof(e)) do
		begin
		readln (e, temp);
		temp := shorten(temp);
		FEResep[NResep].nama:=copy(temp, 1, (pos('|',temp) -1));
		delete(temp,1,(pos('|',temp)));
		FEResep[NResep].harga:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
		delete(temp,1,(pos('|',temp)));
		FEResep[NResep].n:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
		delete(temp,1,(pos('|',temp)));
		for i:=1 to (FEResep[NResep].n - 1) do
		begin
			FEResep[NResep].bahan[i]:=(copy(temp, 1, (pos('|',temp) -1)));
			delete(temp,1,(pos('|',temp)));
		end;
		FEResep[NResep].bahan[FEResep[NResep].n]:=temp;
		NResep:=NResep+1;
		end;
	NResep:=NResep-1;
	{for i:=1 to NResep do
	begin
		write(FEResep[i].nama, ' ', FEResep[i].harga, ' ', FEResep[i].n);
		for j:=1 to FEResep[NResep].n do
		begin
			write(' ', FEResep[i].bahan[j]);
		end;
		writeln();
	end;
	writeln();}

	NSim:=1;
	while not(eof(f)) do
		begin
		readln (f, temp);
		temp := shorten(temp);
		FESimulasi[NSim].nomor:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
		delete(temp,1,(pos('|',temp)));
		DefaultFormatSettings.ShortDateFormat := 'dd/mm/yy';
		DefaultFormatSettings.DateSeparator := '/';
		FESimulasi[NSim].tanggal:=StrToDate(copy(temp, 1, (pos('|',temp) -1)));
		delete(temp,1,(pos('|',temp)));
		FESimulasi[NSim].tHariHidup:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
		delete(temp,1,(pos('|',temp)));
		FESimulasi[NSim].tEnergi:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
		delete(temp,1,(pos('|',temp)));
		FESimulasi[NSim].maxInventori:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
		delete(temp,1,(pos('|',temp)));
		FESimulasi[NSim].tBMentahDibeli:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
		delete(temp,1,(pos('|',temp)));
		FESimulasi[NSim].tBOlahanDibuat:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
		delete(temp,1,(pos('|',temp)));
		FESimulasi[NSim].tBOlahanDijual:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
		delete(temp,1,(pos('|',temp)));
		FESimulasi[NSim].tResepDijual:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
		delete(temp,1,(pos('|',temp)));
		FESimulasi[NSim].tPemasukan:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
		delete(temp,1,(pos('|',temp)));
		FESimulasi[NSim].tPengeluaran:=StrToInt(copy(temp, 1, (pos('|',temp) -1)));
		delete(temp,1,(pos('|',temp)));
		FESimulasi[NSim].tUang:=StrToInt(temp);
		NSim:=NSim + 1;
		end;
	NSim:= NSim - 1;
	{for i:=1 to NSim do
	begin
		writeln(FESimulasi[i].nomor, ' ', DateToStr(FESimulasi[NSim].tanggal), ' ', FESimulasi[NSim].tHariHidup, ' ', FESimulasi[NSim].tEnergi, ' ', FESimulasi[NSim].maxInventori, ' ', FESimulasi[NSim].tBMentahDibeli, ' ', FESimulasi[NSim].tBOlahanDibuat, ' ', FESimulasi[NSim].tBOlahanDijual, ' ',FESimulasi[NSim].tResepDijual, ' ', FESimulasi[NSim].tPemasukan, ' ', FESimulasi[NSim].tPengeluaran, ' ', FESimulasi[NSim].tUang);
	end;}

	close(a);
	close(b);
	close(c);
	close(d);
	close(e);					
	close(f);
	writeln('Loading file sukses.');	
	end;
end.
