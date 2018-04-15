unit F9;

interface

	procedure makan(var energiawal:Integer; var countm:Integer );

implementation

	procedure makan(var energiawal:Integer; var countm:Integer );
	
	begin
		if (countm <= 3) then
			begin
				if (energiawal<10) then
					begin
						write('Energi chef sekarang: ');
						energiawal:=energiawal+3;
							if (energiawal>10) then
							begin
								energiawal:=10;
							end;
						writeln(energiawal);
					end else
					begin
						writeln('Sudah makan, tapi energi tidak nambah');
					end;
				countm:=countm+1;
			end else
			begin
				writeln('Makan tidak boleh >3 kali');
			end;	
	end;
end.
