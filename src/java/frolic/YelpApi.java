package frolic;

import org.apache.commons.lang.StringUtils;
import org.scribe.builder.ServiceBuilder;
import org.scribe.builder.api.TwitterApi;
import org.scribe.model.OAuthRequest;
import org.scribe.model.Response;
import org.scribe.model.Token;
import org.scribe.model.Verb;
import org.scribe.oauth.OAuthService;

import frolic.parameter.YelpSortMode;

public class YelpApi {
	private static final String API_HOST = "api.yelp.com";
	private static final int SEARCH_LIMIT = 20;
	private static final String SEARCH_PATH = "/v2/search";
	private static final String BUSINESS_PATH = "/v2/business";

	private static final String CONSUMER_KEY = "_lwYHVceAKihsx2ktVsOGg";
	private static final String CONSUMER_SECRET = "_5HybrG5T26syBujGKkJApg_5pA";
	private static final String TOKEN = "8VIyprHK9xklzThYR7dFSH6f70UV84rL";
	private static final String TOKEN_SECRET = "1pmhHQUflxJEi0dPxWR7CrWIf4Q";

	final OAuthService service;
	final Token accessToken;

	public YelpApi() {
		this.service = new ServiceBuilder().provider(TwitterApi.class)
				.apiKey(CONSUMER_KEY).apiSecret(CONSUMER_SECRET).build();
		this.accessToken = new Token(TOKEN, TOKEN_SECRET);
	}

	public String searchForBusinessesByLocation(String term, String location, String lon, String lat, int radiusMetres, YelpSortMode sortMode, String categories, int maxResults) {
		final OAuthRequest request = createOAuthRequest(SEARCH_PATH);
		if (!StringUtils.isBlank(term)) {
			request.addQuerystringParameter("term", term);
		}
		if (!StringUtils.isBlank(lat) && !StringUtils.isBlank(lon)) {
			request.addQuerystringParameter("cll", lat + "," + lon);
		}
		if (!StringUtils.isBlank(location)) {
			request.addQuerystringParameter("location", location);
		}
		request.addQuerystringParameter("radius_filter", String.valueOf(radiusMetres));
		request.addQuerystringParameter("limit", String.valueOf(SEARCH_LIMIT));
//		request.addQuerystringParameter("limit", String.valueOf(maxResults));
		
		if (sortMode != null) {
			request.addQuerystringParameter("sort", String.valueOf(sortMode.getValue()));
		}
		if (!StringUtils.isBlank(categories)) {
			request.addQuerystringParameter("category_filter", categories);
		}
		return sendRequestAndGetResponse(request);
	}

	public String searchByBusinessId(String businessID) {
		final OAuthRequest request = createOAuthRequest(BUSINESS_PATH + "/"
				+ businessID);
		return sendRequestAndGetResponse(request);
	}

	private OAuthRequest createOAuthRequest(String path) {
		final OAuthRequest request = new OAuthRequest(Verb.GET, "https://" + API_HOST
				+ path);
		return request;
	}

	private String sendRequestAndGetResponse(OAuthRequest request) {
		System.out.println("Querying " + request.getCompleteUrl() + " ...");
		this.service.signRequest(this.accessToken, request);
		Response response = request.send();
		return response.getBody();
	}
}
