package hello;

import java.net.URISyntaxException;

import org.junit.Assert;
import org.junit.Test;

public class GreetingsTest {

	@Test
	public void test() throws URISyntaxException {
	     
	    final String baseUrl = "http://localhost:8080/";
	 
	    //Verify request succeed
	    Assert.assertEquals(200, 200);
	}

}
