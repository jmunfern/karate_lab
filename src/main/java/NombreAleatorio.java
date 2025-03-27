import java.util.Random;
import java.util.regex.Pattern;

public class NombreAleatorio {
    private static final String[] NOMBRES = {"Odie", "Snoopy", "Toto", "Balto", "Marley", "Beethoven", "Lassie", "Rex", "Milú", "Pancho"};
    private static final Pattern PATRON = Pattern.compile("^[A-Za-z]+$");

    public static String obtenerNombreAleatorio() {
        Random random = new Random();
        String nombre;
        do {
            nombre = NOMBRES[random.nextInt(NOMBRES.length)];
        } while (!PATRON.matcher(nombre).matches());
        return nombre;
    }
}