<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>{{ helper.title().append('Administrative Panel') }}{{ helper.title().get() }}</title>
    <link href="{{ url.path() }}favicon.ico" rel="shortcut icon" type="image/x-icon">

    <link rel="stylesheet" href="{{ url.path() }}minion/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="{{ url.path() }}minion/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="{{ url.path() }}minion/css/ionicons.min.css" type="text/css">
    <link rel="stylesheet" href="{{ url.path() }}minion/css/dataTables.bootstrap.css" type="text/css">
    <link rel="stylesheet" href="{{ url.path() }}minion/css/AdminLTE.min.css" type="text/css">
    <link rel="stylesheet" href="{{ url.path() }}minion/css/_all-skins.min.css" type="text/css">
    <link rel="stylesheet" href="{{ url.path() }}minion/css/blue.css" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Raleway:100,600" rel="stylesheet" type="text/css">

    <script src="{{ url.path() }}minion/js/jQuery-2.1.4.min.js"> </script>

    

</head>
<body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">

        {{ partial('admin/header') }}

        {{ partial('admin/nav') }}

        <div class="content-wrapper">
            <section class="content-header">
                {% if registry.cms['TECHNICAL_WORKS'] %}
                    <div class="ui red inverted segment">
                        The site under maintenance.<br>
                        Please do not perform any action until the work is completed.
                    </div>
                {% endif %}

                {% if title is defined %}
                    <h1>{{ title }}</h1>
                {% endif %}

                {% if languages_disabled is not defined %}
                    {{ partial('admin/languages') }}
                {% endif %}
            </section>
            
            <section class="content-header">
                {{ flash.output() }}
            </section>

            <section class="content">
                {{ content() }}
            </section>
        </div>
    </div>

    <script src="{{ url.path() }}minion/js/jquery-ui.min.js"> </script>
    <script src="{{ url.path() }}minion/js/bootstrap.min.js"> </script>
    <script src="{{ url.path() }}minion/js/jquery.dataTables.min.js"> </script>
    <script src="{{ url.path() }}minion/js/raphael-min.js"> </script>
    <script src="{{ url.path() }}minion/js/jquery.sparkline.min.js"> </script>
    <script src="{{ url.path() }}minion/js/jquery.knob.js"> </script>
    <script src="{{ url.path() }}minion/js/moment.min.js"> </script>
    <script src="{{ url.path() }}minion/js/jquery.slimscroll.min.js"> </script>
    <script src="{{ url.path() }}minion/js/fastclick.min.js"> </script>
    <script src="{{ url.path() }}minion/js/app.min.js"> </script>
    <script src="{{ url.path() }}minion/js/demo.js"> </script>

</body>
</html>