unit C_Maks;
interface
	uses uDef,sysutils;

	{ Deklarasi Fungsi/Prosedur }

	function cekmaksimum(c: Asimulasi; NInvBO, NInvBM, NomorSim,j{untuk jumlah benda yang akan dimasukkan}:Integer;FEInventoriBahanMentah,FEInventoriBahanOlahan:Ainventori): Boolean;
	{Fungsi yang menghasilkan true jika jumlah inventori bahan mentah dan olahan tidak melebihi maksimum inventori simulasi
	dan false jika jumlah inventori bahan mentah dan olahan melebihi maksimum inventori simulasi}

implementation
	
	{ Implementasi Fungsi/Prosedur }

	function cekmaksimum(c: Asimulasi; NInvBO, NInvBM, NomorSim,j:Integer;FEInventoriBahanMentah,FEInventoriBahanOlahan:Ainventori): Boolean;
	{Fungsi yang menghasilkan true jika jumlah inventori bahan mentah dan olahan tidak melebihi maksimum inventori simulasi
	dan false jika jumlah inventori bahan mentah dan olahan melebihi maksimum inventori simulasi}

	{KAMUS}
	var
		i,sum : longint;
	
	{ALGORITMA}
	begin
		sum:=0;
		{Penjumlahan inventori bahan mentah dan inventori bahan olahan}
		for i:=1 to NInvBM do
		begin
			sum := sum + FEInventoriBahanMentah[i].jumlah;
		end;
		for i:=1 to NInvBO do
		begin
			sum := sum + FEInventoriBahanOlahan[i].jumlah;
		end;
		sum:=sum+j;
		if (sum <= c[NomorSim].maxInventori) then {Pengecekan}
		begin
			cekmaksimum:=True;
		end else
			cekmaksimum:=False;
		end;
	end.
		
	
	
		
		
