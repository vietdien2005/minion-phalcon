<header>
    {{ partial('main/header') }}
</header>

{{ partial('main/menu') }}

{{ content() }}

{% if seo_text is defined and seo_text_inner is not defined %}
    <div class="seo-text">
        {{ seo_text }}
    </div>
{% endif %}

<footer class="footer">
    {{ partial('main/footer') }}
</footer>

{% if registry.cms['PROFILER'] %}
    {{ helper.dbProfiler() }}
{% endif %}
