# Cambios de la rama `update-2026`

> Esta rama es el mismo curso —Estadística inferencial para ML y Big Data—, con el código adaptado a R y los
> paquetes de hoy (R 4.5.3, rmarkdown 2.32, knitr 1.52, reticulate 1.47; para los bloques de Python,
> pandas 3 y SciPy 1.18; octubre de 2026). La rama principal sigue exactamente como en el vídeo.

> **Cómo se ha comprobado.** Se han renderizado los 47 documentos del curso (`.Rmd` de teoría, ejercicios y
> talleres) dos veces: con R y paquetes de finales de 2019 y con los de hoy. Lo que solo fallaba hoy se ha
> arreglado, y también tres rutas que ya no funcionaban (abajo): **45 de 47 se generan sin errores**.
> **No comprobados:** `taller_problemas_resueltos_extra_1.Rmd` descarga los datos de la web del NIST, que no era
> accesible desde el entorno de prueba, y `Tema-9---Clustering.Rmd` dibuja sus figuras con TikZ, que necesita
> LaTeX instalado (en RStudio: `install.packages("tinytex"); tinytex::install_tinytex()`).

## Qué ha cambiado y por qué

- **R 4.0: `read.csv()` ya no convierte el texto en factores** (`stringsAsFactors = FALSE` por defecto). El
  taller del FIFA usa `droplevels()` sobre los clubs y las nacionalidades, que solo funciona con factores: la
  lectura de `players_20.csv` lleva ahora `stringsAsFactors = TRUE`, como hacía R cuando se grabó.
- **knitr:** un `` `r t.test(...)` `` dentro del texto escribía el objeto entero del contraste; hoy da error.
  En el taller 2 del tema 4 la frase habla del p-valor, así que ahora es `` `r t.test(...)$p.value` ``.
- **reticulate:** `use_python("/Users/juangabriel/anaconda3/bin/python3")` apunta a una ruta de mi ordenador y
  hoy reticulate **para el documento** si no existe (`contrastes-de-hipotesis.Rmd`, `ejercicios-contrastes.Rmd`,
  `Tema-1---Muestreo.Rmd`). Ahora lleva `required = FALSE`: si en tu ordenador no existe, reticulate usa el
  Python que encuentre. Si quieres uno concreto, cambia la ruta por la tuya.
- **Caché de knitr subida al repositorio** (`talleres_resueltos_extra/taller_problemas_resueltos_extra_1_cache`):
  se ha borrado. Guardaba resultados de los paquetes de entonces; RStudio la vuelve a crear.

### Rutas que ya no funcionaban (no es por las versiones)

Al reorganizar el repositorio, algunos documentos quedaron en otra carpeta y dejaron de encontrar sus datos:

- `ejercicios-contrastes.Rmd`: `../datasets/…` → `../../datasets/…`.
- Taller 2 del tema 4 (soluciones): `zinc.txt` → `../zinc.txt`.
- `contrastes-de-hipotesis.Rmd`: la dirección de `nhanes_2015_2016.csv` llevaba un permiso temporal de cuando el
  repositorio era privado y daba error 404; ahora es la dirección pública.
