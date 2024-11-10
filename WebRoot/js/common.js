(function(){

    (function () {
        function selectRadio(obj) {
            var form = $(obj).parents('form');
            var div = $(obj).parent();
            div.find('input').val($(obj).attr('data-value'));
            var isSeach = false;
            $('.search-radio-tree').each(function (i) {
                if(isSeach){
                    $(this).remove();
                }
                if(this == div[0])
                {
                    isSeach=true
                }
            });
            form.submit();
        }
        window.selectRadio = selectRadio;
        $('.search-radio').each(function () {

            var val = $(this).find('input').val();
            $(this).find('a[data-value="'+val+'"]').addClass('active');

        })
    })()



})();
(function(){

    $(function () {
        $('.resp-tabs').on('click', '.resp-tab-item', function () {
            var index = $(this).index();
            var par   = $(this).parents('.resp-tabs');

            par.find('.resp-tab-item.resp-tab-active').removeClass('resp-tab-active');
            $(this).addClass('resp-tab-active');
            par.find('.resp-tabs-container .resp-tab-content.resp-content-active').removeClass('resp-content-active');
            par.find('.resp-tabs-container .resp-tab-content:eq(' + index + ')').addClass('resp-content-active');
        });
        $('.resp-tabs').each(function () {
            $(this).find('.resp-tab-item:eq(0)').click();
        })
    });

})();