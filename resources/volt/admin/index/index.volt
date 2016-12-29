{% if bello is defined %}
	<style>
		.content .row .title {
			font-size: 84px;
			font-family: 'Raleway',sans-serif;
			font-weight: 100;
			text-align: center;
		}
		.content .row .links {
			text-align: center;
		}
		.content .row .links a {
			color: #636b6f;
			padding: 0 25px;
			font-size: 12px;
			font-weight: 600;
			letter-spacing: .1rem;
			text-decoration: none;
			text-transform: uppercase;
		}
	</style>
	<div class="row">
		<div class="col-lg-12 col-xs-12">
		    <div class="title">
		   		{{ bello }}
		    </div>
		    <div class="links">
		        <a href="https://github.com/vietdien2005/minion-phalcon">
		        	GitHub
		        </a>
		    </div>
	    </div>	
	</div>
{% endif %}
