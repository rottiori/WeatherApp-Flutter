
# WeatherApp

**ClimaApp** es un proyecto en Flutter que permite visualizar información del clima. Este repositorio incluye todos los archivos necesarios para ejecutar la aplicación en cualquier dispositivo compatible.

<p align="center">
  <img src="https://github.com/rottiori/WeatherApp-Flutter/blob/main/assets/icons/icon.png" alt="ClimaApp Icon" width="150" height="150">
</p>

> **⚠️ Nota:** He notado que la API_KEY no debería ser visible en el código al hacer push a GitHub y debería agregarse en un .env o cifrarse por razones de seguridad y buenas prácticas, tal vez debería implementar esto en el futuro y tenerlo en cuenta para proyectos futuros.

## Tabla de contenidos
- [Requisitos](#requisitos)
- [Instalación](#instalación)
- [Ejecución del Proyecto](#ejecución-del-proyecto)
- [Actualización de Dependencias](#actualización-de-dependencias)
- [Créditos](#créditos)
- [Enlaces Adicionales](#enlaces-adicionales)

---

## Requisitos
- Flutter SDK: [Instalación de Flutter](https://flutter.dev/docs/get-started/install)
- Editor de código compatible (recomendado: Visual Studio Code o Android Studio)
- Dispositivo Android/iOS físico o emulador para pruebas

## Instalación
1. **Clonar el repositorio:**
   ```bash
   git clone https://github.com/usuario/clima_app.git
   ```
2. **Acceder al directorio del proyecto:**
   ```bash
   cd clima_app
   ```

## Ejecución del Proyecto
1. **Instalar las dependencias necesarias:**  
   En la raíz del proyecto, ejecuta:
   ```bash
   flutter pub get
   ```

2. **Ejecutar la aplicación:**  
   Asegúrate de tener un emulador activo o un dispositivo conectado, y luego usa el comando:
   ```bash
   flutter run
   ```

## Actualización de Dependencias
Para actualizar todas las dependencias del proyecto a sus últimas versiones compatibles, ejecuta:
```bash
flutter pub upgrade
```

En caso de que encuentres algún conflicto de versión, revisa el archivo `pubspec.yaml` y ajusta las versiones manualmente según la [documentación de Flutter](https://flutter.dev/docs/development/packages-and-plugins/using-packages).

## Créditos
Desarrollado por [Rottioris](https://rottioris.site).
> "No creo que mi futuro sea aquí, aquí estoy muy cómodo, pero si me acostumbro lo único que madurará será mi edad."

## Enlaces Adicionales
- [Documentación de Flutter](https://flutter.dev/docs)
- [Rottioris Website](https://rottioris.site)

---

Este README ofrece los pasos básicos para configurar el proyecto. Para más información, consulta los enlaces adicionales.



