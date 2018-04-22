// Nama File: F10.pas
// Deskripsi File: Unit prosedur istirahat untuk program utama Engi's Kitchen
// Tanggal terakhir diubah: 22/04/2018

unit F10;

interface

	procedure istirahat(var energiawal:Longint; var countis:Integer );
	
	{procedure ini menerima input energi chef saat ini dan countis. countis merupakan counter yang menghitung berapa kali chef telah
	 makan dalam sehari}
	{I.S. energiawal = energi awal sebelum istirahat, diambil dari FESimulasi.tEnergi. Saat belum istirahat, countis=0}
	{F.S. energi awal bertambah 1 jika  masih bisa istirahat, countis akan bertambah satu setiap kali istirahat}

implementation

	procedure istirahat(var energiawal:Longint; var countis:Integer );
	{procedure ini menerima input energi chef saat ini dan countis. countis merupakan counter yang menghitung berapa kali chef telah
	 makan dalam sehari}
	{I.S. energiawal = energi awal sebelum istirahat, diambil dari FESimulasi.tEnergi. Saat belum istirahat, countis=0}
	{F.S. energi awal bertambah 1 jika  masih bisa istirahat, countis akan bertambah satu setiap kali istirahat}

	{KAMUS}

	{ALGORITMA}
	begin
		if (countis < 6) then					{Kondisi saat chef belum istirahat 6 kali}					
		begin
			if (energiawal<10) then				{Saat energi chef masih dibawah 10, maka energi chef akan bertambah 1}
			begin
				write('Energi chef sekarang: ');
				energiawal:=energiawal+1;		{Penambahan 1 energi pada energi chef}
				writeln(energiawal);			{Menuliskan energi setelah istirahat ke layar}
			end else							{Kondisi saat energi chef sudah 10 namun belum istirahat 6 kali}
			begin
				writeln('Sudah istirahat, tapi energi tidak nambah');
			end;
			countis:=countis+1;					{Menghitung sudah berapa kali chef istirahat}
		end else								{Kondisi ketika chef sudah istirahat 6 kali}
		begin
			writeln('Istirahat tidak boleh >6 kali');
		end;	
	end;
end.
