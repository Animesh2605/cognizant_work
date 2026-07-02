import org.junit.Before;
import org.junit.After;
import org.junit.Test;
import static org.junit.Assert.*;

public class CalculatorTest {

    private Calculator calculator;

    @Before
    public void setUp() {
        calculator = new Calculator();
        System.out.println("Setup complete");
    }

    @Test
    public void testAdd() {
        // Arrange
        int num1 = 10;
        int num2 = 20;

        // Act
        int result = calculator.add(num1, num2);

        // Assert
        assertEquals(30, result);
    }

    @After
    public void tearDown() {
        System.out.println("Teardown complete");
    }
}