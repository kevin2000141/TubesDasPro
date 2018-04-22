unit C_Maks;
interface
	uses uDef,sysutils;
	function cekmaksimum(c: Asimulasi; NInvBO, NInvBM, NomorSim,j{untuk jumlah benda yang akan dimasukkan}:Integer;FEInventoriBahanMentah,FEInventoriBahanOlahan:Ainventori): Boolean;
implementation
	function cekmaksimum(c: Asimulasi; NInvBO, NInvBM, NomorSim,j:Integer;FEInventoriBahanMentah,FEInventoriBahanOlahan:Ainventori): Boolean;
	var
		i,sum : longint;
	begin
		sum:=0;
		for i:=1 to NInvBM do
		begin
			sum := sum + FEInventoriBahanMentah[i].jumlah;
		end;
		for i:=1 to NInvBO do
		begin
			sum := sum + FEInventoriBahanOlahan[i].jumlah;
		end;
		sum:=sum+j;
		if (sum <= c[NomorSim].maxInventori) then
		begin
			cekmaksimum:=True;
		end else
			cekmaksimum:=False;
		end;
	end.
		
	
	
		
		
