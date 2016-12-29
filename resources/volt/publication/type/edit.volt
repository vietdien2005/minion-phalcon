<div class="row">
    <div class="col-md-12">
        <div class="box">
            <form method="post" action="" enctype="multipart/form-data">
                <div class="box-header">
                    <div class="btn-group">
                        <a href="{{ url.get() }}publication/type?lang={{ constant('LANG') }}" class="btn btn-default">
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
                            <a href="{{ url.get() }}publication/type/delete/{{ model.getId() }}?lang={{ constant('LANG') }}" class="btn btn-danger">
                                <i class="fa fa-trash"></i> {{ helper.at('Delete') }}
                            </a>
                        </div>
                        <div class="btn-group">
                            <a class="btn btn-primary" target="_blank" href="{{ helper.langUrl(['for':'publications','type':model.getSlug()]) }}">
                                <i class="fa fa-globe"></i> See section on site
                            </a>
                        </div>
                    {% endif %}
                </div>
                <div class="box-body">
                    {{ form.renderDecorated('title') }}
                    {{ form.renderDecorated('slug') }}
                    {{ form.renderDecorated('limit') }}
                    {{ form.renderDecorated('format') }}
                    {{ form.renderDecorated('display_date') }}
                    {{ form.renderDecorated('head_title') }}
                    {{ form.renderDecorated('meta_description') }}
                    {{ form.renderDecorated('meta_keywords') }}
                    {{ form.renderDecorated('seo_text') }}
                </div>
            </form>
        </div>
    </div>
</div>