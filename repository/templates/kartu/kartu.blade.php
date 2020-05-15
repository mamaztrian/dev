<!DOCTYPE html>
<html>
<head>
	<title></title>
	<style type="text/css">
		table#konten { width: 100%; }
		table#konten tr td.bordered { width: 50%; height: 50px; padding: 10px }
		img.kartu { width: 9cm; height: 5.5cm }
		table#isi { width: 100%; position: absolute; margin-top: -300px;}
		table#isi tr td.tes	{ width: 50%; padding: 15px}
		.bold { font-weight: bold; }
		.konten1 { position: absolute; margin-left: -330px; margin-top: 10px}
		.konten2 { }
		#barcode { background-color: white; margin-top: 180px; margin-right: 360px; float: right; }
	</style>
</head>
<body>
	<p>CETAK KARTU</p>
	<table id="konten">
		<tr>
			<td class="bordered">
				<img class="kartu" src="{{ dirname(__DIR__).'/www/img/contoh-kartu.jpg' }}">
			</td>
			<td>
				<img class="kartu" src="{{ dirname(__DIR__).'/www/img/contoh-kartu.jpg' }}">
			</td>
		</tr>
	</table>
	<table id="isi">
		<tr>
			<td class="tes">
				<table style="width: 100%; font-size: 12px">
					<tr>
						<td colspan="3" style="text-align: center; color: red; font-size: 14px">Library Member Card <br> My Library</td>
					</tr>
					<tr>
						<td style="width: 35%; padding: 0px">Member ID</td>
						<td style="width: 2%; padding: 0px">:</td>
						<td style="width: 63%; padding: 0px">Habibudin</td>
					</tr>
					<tr>
						<td style="padding: 0px">Member Name</td>
						<td style="padding: 0px">:</td>
						<td style="padding: 0px">Habibudin</td>
					</tr>
					<tr>
						<td style="padding: 0px">Personal ID Number</td>
						<td style="padding: 0px">:</td>
						<td style="padding: 0px">Habibudin</td>
					</tr>
					<tr>
						<td style="padding: 0px">Address / Phone Number</td>
						<td valign="top" style="padding: 0px">:</td>
						<td valign="top" style="padding: 0px">Serang Banten Indonesia</td>
					</tr>
				</table>
			</td>
			<td class="tes">
				<table style="width: 100%;">
					<tr>
						<td style="width: 10%;">Nama</td>
						<td style="width: 2%;">:</td>
						<td style="width: 88%">Habibudin</td>
					</tr>
					<tr>
						<td style="width: 10%;">Alamat</td>
						<td style="width: 2%;">:</td>
						<td style="width: 88%">Serang Banten Indonesia</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<div style="width: 1.5cm; height: 1.8cm; position: absolute; border: 1px solid black; margin-top: 180px; margin-left: 20px"></div>
	<div style="font-size: 8px; margin-top: 150px; position: absolute; margin-left: 125px">
		City Name, 2018-01-01 <br>
		Library manager <br>
		<img src=""> <br>
		Librarian Name <br>
		Librarian ID
	</div>
	<?php echo $code ?>
</body>
</html>