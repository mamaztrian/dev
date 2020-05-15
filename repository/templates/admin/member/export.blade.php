<table border="1">
	<tr>
		<td>No</td>
		<td>Member ID</td>
		<td>Nama</td>
		<td>Gender</td>
		<td>Birth Date</td>
		<td>Member Type</td>
		<td>Address</td>
		<td>Mail Address</td>
		<td>Email</td>
		<td>Postal Code</td>
		<td>Personal Id Number</td>
		<td>Inst Name</td>
		<td>Member Since</td>
		<td>Register Date</td>
		<td>Expire Date</td>
		<td>Phone Number</td>
		<td>Fax Number</td>
		<td>Notes</td>
	</tr>
	<?php $no = 1; ?>
	<?php foreach ($collection as $key => $value) : ?>
		<tr>
			<td><?php echo $no ?></td>
			<td><?php echo $value['member_id'] ?></td>
			<td><?php echo $value['member_name'] ?></td>
			<td><?php echo $value['gender'] ?></td>
			<td><?php echo date('d/m/y', strtotime($value['birth_date'])) ?></td>
			<td><?php echo $value['member_type_id'] ?></td>
			<td><?php echo $value['member_address'] ?></td>
			<td><?php echo $value['member_mail_address'] ?></td>
			<td><?php echo $value['member_email'] ?></td>
			<td><?php echo $value['postal_code'] ?></td>
			<td><?php echo $value['personal_id_number'] ?></td>
			<td><?php echo $value['inst_name'] ?></td>
			<td><?php echo date('d/m/y', strtotime($value['member_since_date'])) ?></td>
			<td><?php echo date('d/m/y', strtotime($value['register_date'])) ?></td>
			<td><?php echo date('d/m/y', strtotime($value['expire_date'])) ?></td>
			<td><?php echo $value['phone_number'] ?></td>
			<td><?php echo $value['fax_number'] ?></td>
			<td><?php echo $value['member_notes'] ?></td>
		</tr>
	<?php $no++; ?>
	<?php endforeach ?>
</table>