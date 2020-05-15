<!DOCTYPE html>

<html lang="en">
    <!-- BEGIN HEAD -->
    <head>
        <meta charset="utf-8" />
        <title>Metronic Admin Theme #1 | User Lock Screen 1</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta content="Preview page of Metronic Admin Theme #1 for " name="description" />
        <meta content="" name="author" />
        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
        <link href="<?php echo Theme::base('assets/global/plugins/font-awesome/css/font-awesome.min.css') ?>" rel="stylesheet" type="text/css" />
        <link href="<?php echo Theme::base('assets/global/plugins/simple-line-icons/simple-line-icons.min.css') ?>" rel="stylesheet" type="text/css" />
        <link href="<?php echo Theme::base('assets/global/plugins/bootstrap/css/bootstrap.min.css') ?>" rel="stylesheet" type="text/css" />
        <link href="<?php echo Theme::base('assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css') ?>" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- BEGIN THEME GLOBAL STYLES -->
        <link href="<?php echo Theme::base('assets/global/css/components.min.css') ?>" rel="stylesheet" id="style_components" type="text/css" />
        <link href="<?php echo Theme::base('assets/global/css/plugins.min.css') ?>" rel="stylesheet" type="text/css" />
        <!-- END THEME GLOBAL STYLES -->
        <!-- BEGIN PAGE LEVEL STYLES -->
        <link href="<?php echo Theme::base('assets/pages/css/lock.min.css') ?>" rel="stylesheet" type="text/css" />
        <link href="<?php echo Theme::base('assets/custom.css') ?>" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL STYLES -->
        <!-- BEGIN THEME LAYOUT STYLES -->
        <!-- END THEME LAYOUT STYLES -->
        <link rel="shortcut icon" href="favicon.ico" /> </head>
    <!-- END HEAD -->
    @section('lock')
    <body class="">
        <div class="page-lock">
            <div class="page-logo">
                <a class="brand" href="index.html">
                    <img src="<?php echo Theme::base('assets/pages/img/logo-big.png') ?>" alt="logo" /> </a>
            </div>
            <div class="page-body">
                <div class="lock-head"> Unauthorized </div>
                <div class="lock-body">
                    <div class="lock-cont">
                        <div class="lock-item lock-item-full">
                            <h4>
                                You are not authorized to access this page, maybe you should login first to access it
                            </h4>
                            <div class="form-actions">
                                <a href="" class="btn btn-block red uppercase">Login</a>
                            </div>
                            <h4> or you can go <a href="javascript:history.back()" class="button">Back</a> to previous page.</h4>
                        </div>
                    </div>
                </div>
                <div class="lock-bottom">
                    &nbsp;
                </div>
            </div>
            <div class="page-footer-custom"> 2014 &copy; Metronic. Admin Dashboard Template. </div>
        </div>
        
    </body>
    @show
    <!-- BEGIN CORE PLUGINS -->
    <script src="<?php echo Theme::base('assets/global/plugins/jquery.min.js') ?>" type="text/javascript"></script>
    <script src="<?php echo Theme::base('assets/global/plugins/bootstrap/js/bootstrap.min.js') ?>" type="text/javascript"></script>
    <script src="<?php echo Theme::base('assets/global/plugins/js.cookie.min.js') ?>" type="text/javascript"></script>
    <script src="<?php echo Theme::base('assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js') ?>" type="text/javascript"></script>
    <script src="<?php echo Theme::base('assets/global/plugins/jquery.blockui.min.js') ?>" type="text/javascript"></script>
    <script src="<?php echo Theme::base('assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js') ?>" type="text/javascript"></script>
    <!-- END CORE PLUGINS -->
    <!-- BEGIN THEME GLOBAL SCRIPTS -->
    <script src="<?php echo Theme::base('assets/global/scripts/app.min.js') ?>" type="text/javascript"></script>
    <!-- END THEME GLOBAL SCRIPTS -->
    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="<?php echo Theme::base('assets/pages/scripts/lock.min.js') ?>" type="text/javascript"></script>
    <!-- END PAGE LEVEL SCRIPTS -->
    <script>
        $(document).ready(function()
        {
            $('#clickmewow').click(function()
            {
                $('#radio1003').attr('checked', 'checked');
            });
        })
    </script>

</html>