#returns boilerplate for new modal
def getModal(name, title)
	modalBoilerPlate = """
	<div class=\"modal fade\" id=\"#{name}\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"#{name}\" aria-hidden=\"true\">
	    <div class=\"modal-dialog\">
	        <div class=\"modal-content\">
	            <div class=\"modal-header\">
	                <h1 class=\"modal-title\">#{title}</h1>
	            </div>
	            <div class=\"modal-body\">
	            	<!-- Insert Code Here -->
	            </div>
	            <div class=\"modal-footer\">
	                <a href=\"#\" data-dismiss=\"modal\">Close</a>
	             </div>
	        </div>
	    </div>
	</div>
	"""
	return modalBoilerPlate
end
