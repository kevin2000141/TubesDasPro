unit F10;

interface

	procedure istirahat(var energiawal:Integer; var countis:Integer );

implementation

	procedure istirahat(var energiawal:Integer; var countis:Integer );
	
	begin
		if (countis <= 6) then
			begin
				if (energiawal<10) then
					begin
						write('Energi chef sekarang: ');
						energiawal:=energiawal+1;
						writeln(energiawal);
					end else
					begin
						writeln('Sudah istirahat, tapi energi tidak nambah');
					end;
				countis:=countis+1;
			end else
			begin
				writeln('Istirahat tidak boleh >6 kali');
			end;	
	end;
end.
