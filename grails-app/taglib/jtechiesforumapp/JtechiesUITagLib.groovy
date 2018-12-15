package jtechiesforumapp

class JtechiesUITagLib {
    //static defaultEncodeAs = [taglib:'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]
    static namespace = "jtechies"
    def navbar={attrs,body->
      out<<"""
<nav class='navbar navbar-expand-sm bg-light'>
  <ul class='navbar-nav'>
"""+body()+"""
  </ul>
</nav>
         """
       // out<<body().encodeAsRaw()
    }
    def nav={attrs,body->
        out<<"""
      <li class="nav-item">
      <a class="nav-link" href="${attrs?.action}"> <i class="fa fa-${attrs?.icon}"></i> &nbsp;${attrs?.name}</a>
    </li>

        """
        out<<body().encodeAsRaw()
    }
    def textArea = { attrs, body ->
        out << """\
			<div class="form-group">
				<label class="${attrs.labelCol ? "col-md-"+attrs.labelCol : "col-md-3"} control-label">${attrs.label ? attrs.label : ""} ${attrs.required ? "*" : ""}</label>
				<div class="${attrs.elementCol ? "col-md-"+attrs.elementCol : "col-md-6"}">
					<textArea class="form-control" id="${attrs.id ? attrs.id : ""}" ${attrs.required ? "required" : ""} ${attrs.readonly ? "readonly" : ""} type="${attrs.type ? attrs.type : "text"}" name="${attrs.name ? attrs.name : ""}" value="${attrs.value ? attrs.value : ""}" placeholder="${attrs.placeholder ? attrs.placeholder : ""}" cols="${attrs.cols ? attrs.cols : ""}" rows="${attrs.rows ? attrs.rows : ""}" maxlength="${attrs.maxlength ? attrs.maxlength : ""}">${body()}</textarea>
				</div>
			</div>
		"""
    }
}
