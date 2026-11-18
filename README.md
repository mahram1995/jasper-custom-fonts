# JasperReports Bangla Font Extension Project

This project packages Unicode Bangla TrueType Fonts (`.ttf`) into a standard **JasperReports Font Extension JAR** so Bangla text renders and exports cleanly to PDF without broken conjuncts (*juktakkhor*) or missing glyphs.

## Included Fonts
1. **Noto Sans Bengali** (`Regular` & `Bold`)
2. **Noto Serif Bengali** (`Regular` & `Bold`)

## Project Structure
```text
jasper-bangla-fonts/
├── pom.xml                                              # Maven build configuration
├── build-jar.bat                                        # One-click JAR builder for Windows
├── build-jar.sh                                         # JAR builder script for Linux/macOS
└── src/main/resources/
    ├── jasperreports_extension.properties               # Registers font factory with JasperReports
    └── fonts/
        ├── fonts.xml                                    # Maps font names to TTF files & Identity-H encoding
        ├── NotoSansBengali-Regular.ttf
        ├── NotoSansBengali-Bold.ttf
        ├── NotoSerifBengali-Regular.ttf
        └── NotoSerifBengali-Bold.ttf
```

## How to Build the `.jar` File
- **Windows:** Double-click `build-jar.bat` (or run `mvn clean package` in terminal).
- **Linux / macOS:** Run `./build-jar.sh` (or `mvn clean package`).
- **Without Maven (using JDK only):**
  ```bash
  jar cf target/jasper-bangla-fonts.jar -C src/main/resources .
  ```
Your compiled library will be created at: `target/jasper-bangla-fonts.jar`.

## How to Add More Bangla Fonts Later (e.g., Kalpurush, SolaimanLipi, Nikosh)
1. Copy your `.ttf` font files into `src/main/resources/fonts/`.
2. Open `src/main/resources/fonts/fonts.xml` and add a `<fontFamily>` entry:
   ```xml
   <fontFamily name="Kalpurush">
       <normal><![CDATA[fonts/Kalpurush.ttf]]></normal>
       <bold><![CDATA[fonts/Kalpurush-Bold.ttf]]></bold>
       <pdfEncoding><![CDATA[Identity-H]]></pdfEncoding>
       <pdfEmbedded><![CDATA[true]]></pdfEmbedded>
       <exportFonts/>
   </fontFamily>
   ```
   *(Note: If you only have a single `.ttf` file without a separate Bold file, omit the `<bold>` tag or point `<bold>` to the same `.ttf` file.)*
3. Re-run `build-jar.bat` / `mvn clean package` to generate the updated `.jar`.

## How to Use in JasperReports / Jaspersoft Studio
1. **Jaspersoft Studio:** Right-click your project -> **Properties** -> **Java Build Path** -> **Libraries** -> **Add External JARs** -> select `jasper-bangla-fonts.jar`.
2. **Java / Spring Boot Application:** Place `jasper-bangla-fonts.jar` on your application classpath (e.g., `WEB-INF/lib` or local Maven repository).
3. **JRXML Text Field Settings:**
   - Set **Font Name** (`fontName`) to `Noto Sans Bengali` or `Noto Serif Bengali` (must match the `name` attribute in `fonts.xml` exactly).
   - Ensure text data is Unicode UTF-8.
