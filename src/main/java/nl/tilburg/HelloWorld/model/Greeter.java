package nl.tilburg.HelloWorld.model;

public class Greeter {

    private String message;

    public Greeter(String message) {
        this.message = message;
    }

    public Greeter() {
        this("Default message");
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
