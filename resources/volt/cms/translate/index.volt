{% if phrases is defined %}
<div class="row">
    <div class="col-md-12">
        <div class="box">
            <form method="post" action="" enctype="multipart/form-data">
                <div class="box-header">
                    <div class="btn-group">
                        <button type="submit" class="btn btn-success">
                            <i class="fa fa-floppy-o"></i> {{ helper.at('Save') }}
                        </button>
                    </div>
                    <div class="btn-group">
                        <button type="button" class="btn btn-primary" onclick="fillEmpties();">Auto fill empty cells</button>
                    </div>
                </div>
                <div class="box-body">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th style="text-align: right; width: 25%;">Phrase</th>
                                <th>Translation</th>
                            </tr>
                        </thead>
                        <tbody>
                            {% for phrase in phrases %}
                                <tr>
                                    <td style="text-align: right;">
                                        <h5>{{ phrase }}</h5>
                                    </td>
                                    <td class="ui input small">
                                        {% set translation = model.findByPhraseAndLang(phrase) %}
                                        <input class="form-control" type="text" name="{{ phrase|escape }}" value="{% if translation %}{{ translation.getTranslation()|escape }}{% endif %}">
                                    </td>
                                </tr>
                            {% endfor %}
                        </tbody>
                    </table>
                </div>
                <div class="box-header">
                    <div class="btn-group">
                        <button type="submit" class="btn btn-success">
                            <i class="fa fa-floppy-o"></i> {{ helper.at('Save') }}
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
{% else %}
<div class="row">
    <div class="col-md-12">
        <div class="box">
            <form method="post" action="" enctype="multipart/form-data">
                <div class="box-header">
                    <h3>Sources translations not found</h3>
                </div>
            </form>
        </div>
    </div>
</div>
{% endif %}

<script>
    function fillEmpties() {
        $("input[type='text']").each(function(index, object){
            var input = $(object);
            if (!input.val()) {
                input.val(input.attr('name'));
            }
        });
    }
</script>
