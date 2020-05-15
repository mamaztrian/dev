<?php
	if (empty($value)) {
		$value = array();
	} else {
		$value = $value->toArray();
	}
?>

@foreach ($self->optionData() as $key => $entry)
	<div>
		<input
			name="{{ $self['name'] }}[]"
			type="checkbox"
			value="{{{ $self->optionValue($key, $entry) }}}"
			{{ in_array($self->optionValue($key, $entry), $value) ? 'checked' : '' }}
		/>
		&nbsp; {{ $self->optionLabel($key, $entry) }}
	</div>
@endforeach