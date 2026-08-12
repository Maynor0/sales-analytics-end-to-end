# Proyecto Ventas Módulo 

## Objetivo
Analizar una base de ventas para practicar limpieza de datos, métricas en Excel, consultas SQL y visualización en Power BI.

## Dataset
Archivo principal: `Ventas_modulo.xlsx`

Columnas principales:
- Lugar
- Cliente
- Vendedor
- Territorio
- Fecha
- Socio
- Ventas
- Cantidad
- Producto

## Proceso
1. Limpieza de datos:
   - Revisión de tipos de datos
   - Búsqueda de nulos y duplicados
   - Estandarización de columnas de texto
2. Análisis en Python:
   - Estadísticos descriptivos.
   - Comparación de grupos con pruebas paramétricas y no paramétricas.
   - Correlaciones.
   - ANOVA.
   - Regresión lineal.
   - Chi-cuadrado de independencia.
3. Transformación en Power Query:
   - Recorte de espacios
   - Cambio de tipos
   - Separación de Lugar en Ciudad y País
4. Consultas SQL:
   - Filtros por vendedor, territorio y fechas
   - Agregaciones con SUM, AVG y COUNT
5. Dashboard en Power BI:
   - Ventas totales
   - Cantidad total
   - Clientes distintos
   - Gráficos por vendedor, producto y fecha

## Herramientas usadas
- Excel para limpieza y análisis preliminar.
- Power Query para transformación de datos.
- SQL para consultas y agregaciones.
- Python (`pandas`, `numpy`, `scipy`) para análisis estadístico.
- Power BI para el dashboard final.