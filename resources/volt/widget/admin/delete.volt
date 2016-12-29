<div class="row">
    <div class="col-md-12 text-center">
        <div class="box">
            <div class="box-header ">
                <h3>{{ helper.at('Delete widget') }} <b>{{ model.getId() }} | {{ model.getTitle() }}</b>?</h3>
            </div>
            <div class="box-body">
                <div class="btn-group">
                    <a href="{{ url.get() }}widget/admin/edit/{{ model.getId() }}?lang={{ constant('LANG') }}" class="btn btn-default">
                        <i class="fa fa-arrow-left"></i> {{ helper.at('Back') }}
                    </a>
                </div>
                <div class="btn-group">
                    <form method="post"action="">
                        <button class="btn btn-danger" type="submit">
                            <i class="fa fa-trash"></i> {{ helper.at('Delete') }}
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
