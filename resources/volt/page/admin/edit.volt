<div class="row">
    <div class="col-md-12">
        <div class="box">
            <form method="post" action="" enctype="multipart/form-data">
                <div class="box-header">
                    <div class="btn-group">
                        <a href="{{ url.get() }}page/admin?lang={{ constant('LANG') }}" class="btn btn-default">
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
                            <a href="{{ url.get() }}page/admin/delete/{{ model.getId() }}?lang={{ constant('LANG') }}" class="btn btn-danger">
                                <i class="fa fa-trash"></i> {{ helper.at('Delete') }}
                            </a>
                        </div>
                        <div class="btn-group">
                            <a class="btn btn-primary" target="_blank" href="{{ helper.langUrl(['for':'page','slug':model.getSlug()]) }}">
                                <i class="fa fa-globe"></i> {{ helper.at('View Online') }}
                            </a>
                        </div>
                    {% endif %}
                </div>
                <div class="box-body">
                    {{ form.renderDecorated('title') }}
                    {{ form.renderDecorated('slug') }}
                    {{ form.renderDecorated('meta_title') }}
                    {{ form.renderDecorated('meta_description') }}
                    {{ form.renderDecorated('meta_keywords') }}
                    {{ form.renderDecorated('text') }}
                </div>
            </form>
        </div>
    </div>
</div>

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