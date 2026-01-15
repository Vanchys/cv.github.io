# 🚀 Instrucciones para Ejecutar el Portfolio

## Instalación Rápida

1. **Abre una terminal en la carpeta del proyecto:**
```bash
cd portfolio-3d
```

2. **Instala las dependencias:**
```bash
npm install
```

3. **Inicia el servidor de desarrollo:**
```bash
npm run dev
```

4. **Abre tu navegador en:**
```
http://localhost:5173
```

## 🌐 Ejecutar con HTTPS (Opcional)

Para ejecutar con HTTPS localmente, puedes usar:

### Opción 1: Usando mkcert (Recomendado)

1. **Instala mkcert:**
   - Windows: `choco install mkcert` o descarga desde https://github.com/FiloSottile/mkcert
   - Mac: `brew install mkcert`
   - Linux: `sudo apt install mkcert`

2. **Crea certificados locales:**
```bash
mkcert -install
mkcert localhost 127.0.0.1 ::1
```

3. **Actualiza `vite.config.js` para usar HTTPS:**
```js
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import fs from 'fs'

export default defineConfig({
  plugins: [react()],
  server: {
    host: true,
    port: 5173,
    https: {
      key: fs.readFileSync('./localhost-key.pem'),
      cert: fs.readFileSync('./localhost.pem'),
    }
  }
})
```

4. **Ejecuta:**
```bash
npm run dev
```

5. **Abre:**
```
https://localhost:5173
```

### Opción 2: Usando ngrok (Para compartir en internet)

1. **Instala ngrok:**
   - Descarga desde https://ngrok.com/

2. **Inicia el servidor normal:**
```bash
npm run dev
```

3. **En otra terminal, ejecuta ngrok:**
```bash
ngrok http 5173
```

4. **Usa la URL HTTPS que ngrok proporciona**

## 📝 Personalización

Edita `src/App.jsx` y modifica el objeto `portfolioData` con tu información:

- Nombre, título, biografía
- Habilidades y niveles
- Proyectos
- Experiencia laboral
- Educación
- Información de contacto
- Pasatiempos
- Idiomas

## 🎨 Características Implementadas

✅ Ventanas flotantes 3D con efectos de perspectiva
✅ Animaciones fluidas con Framer Motion
✅ Fondos animados con partículas
✅ Efectos interactivos que responden al mouse
✅ Diseño responsive
✅ Navegación suave entre secciones
✅ Barra de progreso de scroll
✅ Efectos de hover 3D

## 🐛 Solución de Problemas

**Error: Cannot find module**
- Ejecuta `npm install` nuevamente

**Puerto 5173 ya en uso**
- Cambia el puerto en `vite.config.js` o cierra la aplicación que lo está usando

**Las animaciones no funcionan**
- Asegúrate de que todas las dependencias estén instaladas: `npm install`

## 📦 Build para Producción

```bash
npm run build
```

Los archivos estarán en la carpeta `dist/` listos para desplegar.

