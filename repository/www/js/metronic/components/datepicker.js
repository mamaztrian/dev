var DatePicker = function() {

    return {
        //main function to initiate the module
        init: function(obj = null) {
            var element = $('.input-group.date.date-picker-bono');
            if (obj) {
                element = $(obj).find('.input-group.date.date-picker-bono');
            }

            element.each(function(e) {
                var d = new Date($(this).data('value'));
                var open = false;
                var input = $(this).find('input[type="text"]');
                var input_hidden = $(this).find('input[type="hidden"]');

                var datepicker = input.datepicker({ autoclose: true, format: $(this).attr('date-format'), embedded: true });

                datepicker.datepicker('update', new Date($(this).data('value')));
                datepicker.on('changeDate', function(e) {
                    input_hidden.val(moment(e.date).format('YYYY-MM-DD'));
                    open = false;
                });
                $(this).find('button').click(function(e) {
                    if (!open) {
                        datepicker.datepicker('show');
                        open = true;
                    } else {
                        datepicker.datepicker('hide');
                        open = false;
                    }
                });
            });
        }

    };

}();

jQuery(document).ready(function() {
    DatePicker.init();
});