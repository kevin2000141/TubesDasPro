unit F10_istirahat;

interface

	procedure istirahat(var energiawal:Integer; var countis:Integer );

implementation

	procedure istirahat(var energiawal:Integer; var countis:Integer );
	
	begin
		if (countis <= 6) then
			begin
				if (energiawal<10) then
					begin
						write('energi chef sekarang: ');
						energiawal:=energiawal+1;
						writeln(energiawal);
					end else
					begin
						writeln('Sudah istirahat, tapi energi tidak nambah');
					end;
				countis:=countis+1;
			end else
			begin
				writeln('istirahat tidak boleh >6 kali');
			end;	
	end;
end.
