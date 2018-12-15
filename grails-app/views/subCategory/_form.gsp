<%@ page import="in.jtechies.SubCategory" %>



<div class="fieldcontain ${hasErrors(bean: subCategoryInstance, field: 'category', 'error')} required">
	<label for="category">
		<g:message code="subCategory.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="category" name="category.id" from="${in.jtechies.Category.list()}" optionKey="id" required="" value="${subCategoryInstance?.category?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: subCategoryInstance, field: 'dateUpdated', 'error')} required">
	<label for="dateUpdated">
		<g:message code="subCategory.dateUpdated.label" default="Date Updated" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateUpdated" precision="day"  value="${subCategoryInstance?.dateUpdated}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: subCategoryInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="subCategory.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${subCategoryInstance?.description}"/>

</div>

