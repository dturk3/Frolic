
<%@ page import="frolic.Place" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'place.label', default: 'Place')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-place" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-place" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'place.name.label', default: 'Name')}" />
	
	                    <g:sortableColumn property="rating" title="${message(code: 'place.rating.label', default: 'Rating')}" />
	                    
                        <g:sortableColumn property="popularity" title="${message(code: 'place.popularity.label', default: 'Popularity')}" />
					
						<g:sortableColumn property="frolics" title="${message(code: 'place.frolics.label', default: 'Frolics')}" />
					
						<g:sortableColumn property="hits" title="${message(code: 'place.hits.label', default: 'Hits')}" />
					
						<g:sortableColumn property="summary" title="${message(code: 'place.summary.label', default: 'Summary')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${placeInstanceList}" status="i" var="placeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${placeInstance.id}">${fieldValue(bean: placeInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: placeInstance, field: "rating")}</td>
					
						<td>${fieldValue(bean: placeInstance, field: "popularity")}</td>
					
						<td>${fieldValue(bean: placeInstance, field: "frolics")}</td>
					
						<td>${fieldValue(bean: placeInstance, field: "hits")}</td>
					
						<td>${fieldValue(bean: placeInstance, field: "summary")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${placeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
