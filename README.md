# ¡Ignorad esto! Es para ver como funciona GitHub

** EL SISTEMA ESTA INCOMPLETO, ES SOLO PARA VER COMO FUNCIONAN LAS FUNCIONES DE GITHUB, GRACIAS POR ENTENDERLO **


# Sistema de casas

Este script de **MTA:SA** permite a los jugadores crear casas con un sistema de entrada y salida interactivo. Al usar un comando, los jugadores pueden establecer un marcador de acceso a una casa y teletransportarse a un interior predeterminado.

## 🚀 Instalación

1. **Descargar o Clonar el Repositorio**
   ```bash
   git clone https://github.com/simplex0x00/test-lua.git
   ```
2. **Colocar en la Carpeta de Recursos**
   Mueve la carpeta descargada a la carpeta `resources` del servidor de **MTA:SA**.
3. **Configurar el `meta.xml`**
   Asegúrate de que el archivo `meta.xml` contiene la siguiente configuración:
   ```xml
   <meta>
       <info author="SimpleX" type="script" name="Casas MTA" />
       <script src="server.lua" type="server" />
   </meta>
   ```
4. **Iniciar el Recurso**
   Ejecuta el siguiente comando en la consola del servidor de MTA:
   ```
   start nombredelrecurso (Si no aplicaste ningún nombre sería: test-lua)
   ```
   Reemplaza `nombredelrecurso` con el nombre real de la carpeta del recurso.

## 🎮 Uso del Script

- Para crear una casa, usa el comando:
  ```
  /crearCasa
  ```
  Esto generará un marcador en la ubicación del jugador.
- Para **entrar a la casa**, camina sobre el marcador amarillo.
- Una vez dentro, aparecerá un marcador rojo para **salir de la casa**.

## ⚙️ Personalización

Puedes cambiar la ubicación del interior editando esta línea en `server.lua`:
```lua
local intX, intY, intZ = 2496.04, -1692.73, 1014.74
```
Sustituye estos valores por las coordenadas del interior deseado.

## 🛠 Solución de Problemas

- **El script no funciona**: Asegúrate de que el recurso está correctamente instalado y activado.
- **No aparecen los marcadores**: Verifica que el comando `/crearCasa` se ejecuta correctamente y que el jugador tiene permisos suficientes.

¡Disfruta del sistema de casas en tu servidor de **MTA:SA**! 🚀
