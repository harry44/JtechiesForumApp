<%@ page import="in.jtechies.Category" %>



<div class=" form-group row fieldcontain ${hasErrors(bean: categoryInstance, field: 'categoryName', 'error')} required">
    <label for="categoryName" class="col-3">
        <g:message code="category.categoryName.label" default="Category Name"/>
        <span class="required-indicator">*</span>
    </label>
<div class="col-6">
    <g:textField name="categoryName" required="" value="${categoryInstance?.categoryName}" class="form-control"/>
</div>
    </div>
    <div class="form-group row fieldcontain">
        <label for="description" class="col-3">
            <g:message code="category.categoryName.label" default="Description"/>
            <span class="required-indicator">*</span>
        </label>
    <div class="col-6">
        <g:textArea name="description" value="${categoryInstance?.description}" class="form-control"></g:textArea>
    </div>
    </div>

<div class="form-group row">
    <label class="col-3">Logo</label>
    <input type="file" name="categoryLogo" >
</div>

