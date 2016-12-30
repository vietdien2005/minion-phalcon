<div class="row">
    <div class="col-md-12">
        <div class="box">
            <form method="post" action="" enctype="multipart/form-data">
                <div class="box-header">
                    <div class="btn-group">
                        <a href="{{ url.get() }}publication/admin?lang={{ constant('LANG') }}" class="btn btn-default">
                            <i class="fa fa-arrow-left"></i> {{ helper.at('Back') }}
                        </a>
                    </div>
                    <div class="btn-group">
                        <button type="submit" class="btn btn-success">
                            <i class="fa fa-floppy-o"></i> {{ helper.at('Save') }}
                        </button>
                    </div>
                    {% if model.getId() %}
                        <div class="btn-group">
                            <a href="{{ url.get() }}publication/admin/delete/{{ model.getId() }}?lang={{ constant('LANG') }}" class="btn btn-danger">
                                <i class="fa fa-trash"></i> {{ helper.at('Delete') }}
                            </a>
                        </div>
                        <div class="btn-group">
                            <a class="btn btn-primary" target="_blank" href="{{ helper.langUrl(['for':'publication','type':model.getTypeSlug(), 'slug':model.getSlug()]) }}">
                                <i class="fa fa-globe"></i> {{ helper.at('View Online') }}
                            </a>
                        </div>
                    {% endif %}
                </div>
                <div class="box-body">
                    <div class="col-xs-12 col-md-8">
                        {{ form.renderDecorated('title') }}
                        {{ form.renderDecorated('slug') }}
                        {{ form.renderDecorated('meta_title') }}
                        {{ form.renderDecorated('meta_description') }}
                        {{ form.renderDecorated('meta_keywords') }}
                    </div>
                    <div class="col-xs-12 col-md-4">
                        {{ form.renderDecorated('type_id') }}
                        {{ form.renderDecorated('date') }}
                        {{ form.renderDecorated('preview_src') }}
                        {{ form.renderDecorated('preview_inner') }}
                    </div>
                    <div class="col-md-12">
                        {{ form.renderDecorated('text') }}
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<link rel="stylesheet" href="{{ url.path() }}minion/css/bootstrap-datetimepicker.min.css">
<script src="{{ url.path() }}minion/js/moment.js"></script>
<script src="{{ url.path() }}minion/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript">
    $('#date').datetimepicker({
        locale: 'en',
        format: 'YYYY-MM-DD HH:mm:ss',
        showClose: true
    });
</script>

<link rel="stylesheet" href="{{ url.path() }}minion/css/jasny-bootstrap.min.css">
<script src="{{ url.path() }}minion/js/jasny-bootstrap.min.js"></script>
<script type="text/javascript">
    // define function render image 
    function selectText(element) {
        var selection = window.getSelection();
        var range = document.createRange();
        range.selectNodeContents(element);
        selection.removeAllRanges();
        selection.addRange(range);
    }
</script>

<script type="text/javascript" src="{{ url.get() }}minion/js/tinymce/tinymce.min.js"></script>
<script type="text/javascript">
    tinymce.init({
        // General options
        selector : "#text",
        language: "en",
        height: "500px",
        plugins : "link,autolink,lists,pagebreak,layer,table,save,emoticons,insertdatetime,preview,media,searchreplace,contextmenu,paste,directionality,noneditable,visualchars,nonbreaking",
        relative_urls : false,
        convert_urls : true,
        element_format : "html5",
    });
</script>