package com.mycompany.app;
import org.apache.log4j.Logger;

public class App {
    final static Logger logger = Logger.getLogger(App.class);

    public static void main( String[] args ) {
        (new App()).log("Hello World!");        
    }
    private void log(String msg){
        if(logger.isDebugEnabled()) {
            logger.debug("This is debug : " + msg);
        }
        if(logger.isInfoEnabled()) {
            logger.info("This is info : " + msg);
        }
        logger.warn("This is warn : " + msg);
        logger.error("This is error : " + msg);
        logger.fatal("This is fatal : " + msg);
    }
}

