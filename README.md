# Real Madrid + Arda Güler — proyecto iOS

Este ZIP contiene un proyecto **nativo SwiftUI para iOS 16 o posterior**, con recursos gráficos y un flujo de Codemagic. Es código fuente; no es una IPA compilada ni firmada. No se ha compilado en Xcode en este entorno, así que la compilación de Codemagic sigue siendo una comprobación necesaria.

## Importante: repositorio correcto

El error anterior ocurrió porque Codemagic estaba compilando `SevillaFC.xcodeproj`, un proyecto diferente y dañado. Este proyecto se llama `RealMadrid.xcodeproj` y usa el esquema compartido `RealMadrid`. **No lo subas dentro de la carpeta del proyecto Sevilla FC.** Lo más sencillo es crear un repositorio nuevo, por ejemplo `real-madrid-iphone`.

## Subir desde Windows

1. Descomprime el ZIP.
2. En GitHub, crea un repositorio nuevo llamado `real-madrid-iphone`.
3. Sube el contenido de la carpeta `RealMadrid_iPhone_Xcode` directamente a la raíz del repositorio (no subas el ZIP como único archivo).
4. Comprueba que la raíz contiene `codemagic.yaml`, `RealMadrid.xcodeproj/` y `RealMadrid/`.
5. En Codemagic, añade ese repositorio nuevo y pulsa **Check for configuration files**. Selecciona el workflow `Real Madrid iPhone`.
6. Configura las credenciales de firma de Apple si Codemagic las solicita y ejecuta la compilación.

## Costes y firma

No actives facturación de pago si quieres permanecer en el plan gratuito; revisa en Codemagic los minutos disponibles de tu cuenta. Para instalar una IPA en un iPhone real, la app debe estar firmada de una forma aceptada por iOS. La firma de desarrollo gratuita tiene limitaciones y no garantiza instalación permanente. La distribución mediante TestFlight/App Store requiere la membresía de Apple Developer.

## Funciones y limitaciones

Esta es una base inicial con identidad visual Real Madrid, imagen de Arda, pantalla principal y campo para guardar una URL M3U. No es una conversión automática del APK Android y aún no reproduce todas las funciones de ese APK. El reproductor/compatibilidad de streams debe probarse y ampliarse en iOS; AVPlayer no admite todos los protocolos o códecs. Solo usa listas y contenido que tengas autorización para reproducir.
