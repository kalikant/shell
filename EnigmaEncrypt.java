import java.io.PrintStream;
import org.jetel.util.crypto.Enigma;

public class EnigmaEncrypt
{
  public static void main(String[] paramArrayOfString)
    throws Exception
  {
    Enigma localEnigma = new Enigma("standard");
    if ("E".equals(paramArrayOfString[0])) {
      System.out.println(localEnigma.encrypt(paramArrayOfString[1]));
    } else {
      System.out.println(localEnigma.decrypt(paramArrayOfString[1]));
    }
  }
}
