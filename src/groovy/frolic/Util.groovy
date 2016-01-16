package frolic

class Util {
	static String PERMALINK_CHARS = "abcdefghijklmnopqrstuvwxyz0123456789"
	static Random RAND = new Random()
	
	static String generateStringOfLength(int length) {
		String string = ""
		(0..length).each {
			string += PERMALINK_CHARS[randomNumber(0, PERMALINK_CHARS.size() - 1)]
		}
		return string
	}
	
	static int randomNumber(int min, int max) {
		return RAND.nextInt(max) + min
	}
}
