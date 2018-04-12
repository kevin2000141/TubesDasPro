unit F2;

interface
uses uDef, sysutils;
	
	const
		NMax = 100;	

	var
		a,b,e,f: Text;
		c,d: array[1..NMax] of Text;
		i,j : Integer;
		S:String;
	
	{ Deklarasi Fungsi/Prosedur }
	
	procedure exit( var FEInventoriBahanMentah: Ainventori;
					var FEInventoriBahanOlahan: Ainventori;
					var FEResep: Aresep;
					var NInvBM: Integer;
					var NInvBO: Integer;
					var NResep: Integer;
					var NSim: Integer);

implementation
	
	procedure exit( var FEInventoriBahanMentah: Ainventori;
					var FEInventoriBahanOlahan: Ainventori;
					var FEResep: Aresep;
					var NInvBM: Integer;
					var NInvBO: Integer;
					var NResep: Integer;
					var NSim: Integer);

	var
	 	temp : AnsiString;
	
	begin
	assign (e, 'Resep.txt');
	reset (e);
	
	for i:=1 to NSim do
	begin
	S:='InvBahanMentah.txt';
	Insert (IntToStr(i),s,15);
	assign (c[i], s);
	reset (c[i]);
	NInvBM[i]:=1;
	while not(eof(c[i])) do
		begin
		readln (c[i], temp);
		temp := shorten(temp);
		FEInventoriBahanMentah[i,NInvBM[i]].nama:=copy(temp, 1, (pos('|',temp) -1));
		delete(temp,1,(pos('|',temp)));
		DefaultFormatSettings.ShortDateFormat := 'dd/mm/yyyy';
		DefaultFormatSettings.DateSeparator := '/';
		FEInventoriBahanMentah[i,NInvBM[i]].tanggal:=StrToDate(copy(temp, 1, (pos('|',temp) -1)));
		delete(temp,1,(pos('|',temp)));
		FEInventoriBahanMentah[i,NInvBM[i]].jumlah:=StrToInt(temp);
		NInvBM[i]:=NInvBM[i] + 1;
		end;
	NInvBM[i]:= NInvBM[i] - 1;
	close(c[i]);
	{for j:=1 to NInvBM[i] do
	begin
		writeln (FEInventoriBahanMentah[i,j].nama, ' ', DateToStr(FEInventoriBahanMentah[i,j].tanggal), ' ', FEInventoriBahanMentah[i,j].jumlah);
	end;
	writeln();}

	S:='InvBahanOlahan.txt';
	Insert (IntToStr(i),s,15);
	assign (d[i], s);
	reset (d[i]);
	NInvBO[i]:=1;
	while not(eof(d[i])) do
		begin
		readln (d[i], temp);
		temp := shorten(temp);
		FEInventoriBahanOlahan[i,NInvBO[i]].nama:=copy(temp, 1, (pos('|',temp) -1));
		delete(temp,1,(pos('|',temp)));
		DefaultFormatSettings.ShortDateFormat := 'dd/mm/yyyy';
		DefaultFormatSettings.DateSeparator := '/';
		FEInventoriBahanOlahan[i,NInvBO[i]].tanggal:=StrToDate(copy(temp, 1, (pos('|',temp) -1)));
		delete(temp,1,(pos('|',temp)));
		FEInventoriBahanOlahan[i,NInvBO[i]].jumlah:=StrToInt(temp);
		NInvBO[i]:=NInvBO[i] + 1;
		end;
	NInvBO[i]:= NInvBO[i] - 1;
	close(d[i]);
	{for j:=1 to NInvBO[i] do
	begin
		writeln (FEInventoriBahanOlahan[i,j].nama, ' ', DateToStr(FEInventoriBahanOlahan[i,j].tanggal), ' ', FEInventoriBahanOlahan[i,j].jumlah);
	end;
	writeln();}

	end;

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
	close(e);
	end;
end.
