package logging.problem;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LoggingProblemApp {

    private static final Logger logger = LoggerFactory.getLogger(LoggingProblemApp.class);

    public static void main(String[] args) {
        logger.info("Test");

        logger.info("Wait for 10 sec...");
        
        try {
          Thread.sleep(10000);
        } catch (InterruptedException e) {
          // TODO Auto-generated catch block
          e.printStackTrace();
        }

        logger.info("Exit");
    }
}