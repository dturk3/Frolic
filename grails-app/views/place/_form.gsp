<%@ page import="frolic.Place" %>



<div class="fieldcontain ${hasErrors(bean: placeInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="place.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${placeInstance?.address}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: placeInstance, field: 'downvotes', 'error')} required">
	<label for="downvotes">
		<g:message code="place.downvotes.label" default="Downvotes" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="downvotes" type="number" value="${placeInstance.downvotes}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: placeInstance, field: 'frolics', 'error')} required">
	<label for="frolics">
		<g:message code="place.frolics.label" default="Frolics" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="frolics" type="number" value="${placeInstance.frolics}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: placeInstance, field: 'hits', 'error')} required">
	<label for="hits">
		<g:message code="place.hits.label" default="Hits" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="hits" type="number" value="${placeInstance.hits}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: placeInstance, field: 'lat', 'error')} required">
	<label for="lat">
		<g:message code="place.lat.label" default="Lat" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="lat" value="${fieldValue(bean: placeInstance, field: 'lat')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: placeInstance, field: 'link', 'error')} required">
	<label for="link">
		<g:message code="place.link.label" default="Link" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="link" required="" value="${placeInstance?.link}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: placeInstance, field: 'lon', 'error')} required">
	<label for="lon">
		<g:message code="place.lon.label" default="Lon" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="lon" value="${fieldValue(bean: placeInstance, field: 'lon')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: placeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="place.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${placeInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: placeInstance, field: 'phone', 'error')} required">
	<label for="phone">
		<g:message code="place.phone.label" default="Phone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="phone" required="" value="${placeInstance?.phone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: placeInstance, field: 'popularity', 'error')} required">
	<label for="popularity">
		<g:message code="place.popularity.label" default="Popularity" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="popularity" type="number" value="${placeInstance.popularity}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: placeInstance, field: 'rating', 'error')} required">
	<label for="rating">
		<g:message code="place.rating.label" default="Rating" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="rating" type="number" value="${placeInstance.rating}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: placeInstance, field: 'summary', 'error')} required">
	<label for="summary">
		<g:message code="place.summary.label" default="Summary" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="summary" required="" value="${placeInstance?.summary}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: placeInstance, field: 'tags', 'error')} ">
	<label for="tags">
		<g:message code="place.tags.label" default="Tags" />
		
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: placeInstance, field: 'upvotes', 'error')} required">
	<label for="upvotes">
		<g:message code="place.upvotes.label" default="Upvotes" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="upvotes" type="number" value="${placeInstance.upvotes}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: placeInstance, field: 'yelpId', 'error')} required">
	<label for="yelpId">
		<g:message code="place.yelpId.label" default="Yelp Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="yelpId" required="" value="${placeInstance?.yelpId}"/>

</div>

