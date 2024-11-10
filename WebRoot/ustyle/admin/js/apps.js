/* ==========================================================================
 * Template: Blankon Fullpack Admin Theme
 * Version: 1.0.7
 * ---------------------------------------------------------------------------
 * Author: Djava UI
 * Website: http://djavaui.com
 * Email: maildjavaui@gmail.com
 * ========================================================================== */

var BlankonApp = (function () {
    // =========================================================================
    // SETTINGS APP
    // =========================================================================
    var globalPluginsPath = "/blankon-fullpack-admin-theme/1.0.7/assets/global/plugins/bower_components",
        globalDataPath = "assets/admin/data";

    return {
        // =========================================================================
        // CONSTRUCTOR APP
        // =========================================================================
        init: function () {
            BlankonApp.handleSidebarNavigation();
            BlankonApp.handleSidebarScroll();
        },

        // =========================================================================
        // SIDEBAR LEFT NICESCROLL
        // =========================================================================
        handleSidebarScroll: function () {
            // Optimalisation: Store the references outside the event handler:
            function checkHeightSidebar() {
                // Check if there is class page-sidebar-fixed
                if ($(".page-sidebar-fixed").length) {
                    // Setting dinamic height sidebar menu
                    var heightSidebarLeft = $(window).outerHeight() - $("#header").outerHeight() - $(".sidebar-footer").outerHeight() - $(".sidebar-content").outerHeight();

                    $("#sidebar-left .sidebar-menu").height(heightSidebarLeft).niceScroll({
                        cursorwidth: "10px",
                        cursorborder: "0px",
                        railalign: "left",
                    });
                }
            }
            // Execute on load
            checkHeightSidebar();
            // Bind event listener
            $(window).resize(checkHeightSidebar);
        },

        // =========================================================================
        // SIDEBAR NAVIGATION
        // =========================================================================
        handleSidebarNavigation: function () {
            // Create trigger click for open menu sidebar
            $(".submenu > a").click(function () {
                var parentElement = $(this).parent(".submenu"),
                    nextElement = $(this).nextAll(),
                    arrowIcon = $(this).find(".arrow"),
                    plusIcon = $(this).find(".plus");

                if (parentElement.parent("ul").find("ul:visible")) {
                    parentElement.parent("ul").find("ul:visible").slideUp("fast");
                    parentElement.parent("ul").find(".open").removeClass("open");
                }

                if (nextElement.is("ul:visible")) {
                    arrowIcon.removeClass("open");
                    plusIcon.removeClass("open");
                    nextElement.slideUp("fast");
                    arrowIcon.removeClass("fa-angle-double-down").addClass("fa-angle-double-right");
                }

                if (!nextElement.is("ul:visible")) {
                    arrowIcon.addClass("open");
                    plusIcon.addClass("open");
                    nextElement.slideDown("fast");
                    arrowIcon.removeClass("fa-angle-double-right").addClass("fa-angle-double-down");
                }
            });

            // This action available on mobile view
            $(".navbar-minimize-mobile.left").on("click", function () {
                // Add effect sound button click
                if ($(".page-sound").length) {
                    //ion.sound.play("button_click");
                }
                if ($("body.page-sidebar-right-show").length) {
                    $("body").removeClass("page-sidebar-right-show");
                    $("body").removeClass("page-sidebar-minimize");
                }
                $("body").toggleClass("page-sidebar-left-show");
            });
        },
    };
})();

// Call main app init
BlankonApp.init();
