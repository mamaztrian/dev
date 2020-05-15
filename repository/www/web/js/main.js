$(document).ready(function(){
    $('.result__filter__button').click(function(){
        $(this).siblings('.result').find('.result__filter').toggle();
    })
});