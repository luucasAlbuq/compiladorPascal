import java.io.*;

public class Main {
	static PascalLexer pascalLexer;

	static public void main(String argv[]) {
		/* Start the parser */
		try {
			pascalLexer = new PascalLexer(new FileReader(argv[0]));
			parser p = new parser(pascalLexer);
			p.parse();
			if (parser.errors == 0)
				try {
					FileOutputStream fStream;
					PrintWriter myStream;
					fStream = new FileOutputStream(argv[0] + ".s");
					myStream = new PrintWriter(fStream);
					myStream.println(parser.code);
					myStream.flush();
					myStream.close();
					System.out.println("\nCode written to \"" + argv[0]+ ".s\".");
				} catch (IOException e) {
					e.printStackTrace(System.out);
					System.exit(1);
				}
			else
				System.out.println("\nNo code produced.");
		} catch (Exception e) {
			/* do cleanup here -- possibly rethrow e */
			e.printStackTrace();
		}
	}
}
