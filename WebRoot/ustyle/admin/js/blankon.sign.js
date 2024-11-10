var BlankonSign = (function () {
    // =========================================================================
    // SETTINGS APP
    // =========================================================================
    var globalPluginsPath = "/assets/global/plugins/bower_components";

    return {
        // =========================================================================
        // CONSTRUCTOR APP
        // =========================================================================
        init: function () {
            BlankonSign.signIE();
            BlankonSign.signValidation();
            BlankonSign.signSettingHeight();
            BlankonSign.signInputSound();
        },

        // =========================================================================
        // IE SUPPORT
        // =========================================================================
        signIE: function () {
            // IE mode
            var isIE8 = false;
            var isIE9 = false;
            var isIE10 = false;

            // initializes main settings for IE
            isIE8 = !!navigator.userAgent.match(/MSIE 8.0/);
            isIE9 = !!navigator.userAgent.match(/MSIE 9.0/);
            isIE10 = !!navigator.userAgent.match(/MSIE 10.0/);

            if (isIE10) {
                $("html").addClass("ie10"); // detect IE10 version
            }

            if (isIE10 || isIE9 || isIE8) {
                $("html").addClass("ie"); // detect IE8, IE9, IE10 version
            }

            // Fix input placeholder issue for IE8 and IE9
            if (isIE8 || isIE9) {
                // ie8 & ie9
                // this is html5 placeholder fix for inputs, inputs with placeholder-no-fix class will be skipped(e.g: we need this for password fields)
                $("input[placeholder]:not(.placeholder-no-fix), textarea[placeholder]:not(.placeholder-no-fix)").each(function () {
                    var input = $(this);

                    if (input.val() == "" && input.attr("placeholder") != "") {
                        input.addClass("placeholder").val(input.attr("placeholder"));
                    }

                    input.focus(function () {
                        if (input.val() == input.attr("placeholder")) {
                            input.val("");
                        }
                    });

                    input.blur(function () {
                        if (input.val() == "" || input.val() == input.attr("placeholder")) {
                            input.val(input.attr("placeholder"));
                        }
                    });
                });
            }
        },

        // =========================================================================
        // FORM VALIDATION
        // =========================================================================
        signValidation: function () {
            // Just demo form validation on desktop view width screen large then 1024px, not available on tablet and mobile view.
            if ($(".sign-in").length && $(window).width() >= 1024) {
                $(".sign-in").validate({
                    invalidHandler: function () {
                        // Add effect animation css
                        //$('#sign-wrapper').addClass('animated shake');
                        //setTimeout(function(){$('#sign-wrapper').removeClass('animated shake')}, 1500);
                        // Add effect sound
                        /*if($('.page-sound').length){
                                    ion.sound.play("light_bulb_breaking");
                                }*/
                    },
                    rules: {
                        username: {
                            required: true,
                        },
                        password: {
                            required: true,
                        },
                        pagerandom: {
                            required: true,
                        },
                    },
                    messages: {
                        username: {
                            required: "请输入你的帐号",
                        },
                        password: {
                            required: "请输入你的密码",
                        },
                        pagerandom: {
                            required: "请输入你验证码",
                        },
                    },
                    highlight: function (element) {
                        $(element).parents(".form-group").addClass("has-error has-feedback");
                    },
                    unhighlight: function (element) {
                        $(element).parents(".form-group").removeClass("has-error");
                    },
                });
            }
        },

        // =========================================================================
        // SETTING HEIGHT
        // =========================================================================
        signSettingHeight: function () {
            $("#sign-wrapper").css("min-height", $(window).outerHeight());
        },
    };
})();

// Call main app init
BlankonSign.init();
