package frolic.parameter;

public enum YelpSortMode {
	RELEVANCE(0),
	DISTANCE(1),
	RATING(2);
	
	final int value;
	
	private YelpSortMode(int val) {
		value = val;
	}
	
	public int getValue() {
		return value;
	}
}
