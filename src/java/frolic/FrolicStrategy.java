package frolic;

import frolic.parameter.Distance;
import frolic.parameter.Duration;
import frolic.parameter.TimeOfDay;

public interface FrolicStrategy {
	
	Frolic execute(TimeOfDay time, Duration duration, Distance distance) throws Exception;
	
}
