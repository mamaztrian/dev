
<select class="select2reference select2 <?php echo $class ?>" name="<?php echo $self['name'] ?>"  data-value="<?php echo $value ?>" >
    <option></option>
    <?php foreach ($self->optionData() as $key => $entry): ?>
        <option value="<?php echo $self->optionValue($key,$entry) ?>" <?php echo ($self->optionValue($key,$entry) == $value ? 'selected' : '') ?>>
            <?php echo $self->optionLabel($key,$entry) ?>
        </option>
    <?php endforeach ?>
 </select>
