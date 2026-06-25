public class Logger {
    // Step 1: create private static instance
    private static Logger instance;

    // Step 2: private constructor
    private Logger() {
        System.out.println("Logger instance created");
    }

    // Step 3: public method to get instance
    public static Logger getInstance() {
        if (instance == null) {
            instance = new Logger();
        }
        return instance;
    }

    // Method for logging
    public void log(String message) {
        System.out.println("Log: " + message);
    }
}
