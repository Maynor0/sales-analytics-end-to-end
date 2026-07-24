/*========================================================
  PROYECTO SQL: ANÁLISIS DE VENTAS - MÓDULO 4
  OBJETIVO: Explorar la base, limpiar datos y responder
  preguntas de negocio con consultas claras y reutilizables.
========================================================*/

--========================================================
-- 1. CREACIÓN DE TABLA TEMPORAL
--========================================================
IF OBJECT_ID('tempdb..#ventas_modulo_4') IS NOT NULL
    DROP TABLE #ventas_modulo_4;

CREATE TABLE #ventas_modulo_4 (
    Ciudad      VARCHAR(100),
    Lugar       VARCHAR(100),
    Cliente     NVARCHAR(100),
    Vendedor    VARCHAR(100),
    Territorio  VARCHAR(100),
    Socio       VARCHAR(100),
    Ventas      INT,
    Cantidad    INT,
    Producto    VARCHAR(100),
    Fecha       DATE
);

--========================================================
-- 2. CARGA DE DATOS
--========================================================
BULK INSERT #ventas_modulo_4
FROM 'C:\Users\Usuario\Desktop\base1\SQL.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

--========================================================
-- 3. LIMPIEZA BÁSICA
--========================================================
UPDATE #ventas_modulo_4
SET Cliente = 'Compañia Minera Poderosa, S.A.'
WHERE Cliente = 'Compa±ia Minera Poderosa, S.A.';

--========================================================
-- 4. EXPLORACIÓN INICIAL
--========================================================

-- Vista general de la tabla
SELECT *
FROM #ventas_modulo_4;

-- Tipos de dato de una columna clave
SELECT SQL_VARIANT_PROPERTY(Fecha, 'BaseType') AS Tipo_Fecha
FROM #ventas_modulo_4;

-- Rango de fechas disponible
SELECT
    MIN(Fecha) AS Fecha_Minima,
    MAX(Fecha) AS Fecha_Maxima
FROM #ventas_modulo_4;

-- Número de registros
SELECT COUNT(*) AS Total_Registros
FROM #ventas_modulo_4;

--========================================================
-- 5. KPI GENERALES
--========================================================

SELECT
    COUNT(*) AS Total_Operaciones,
    COUNT(DISTINCT Cliente) AS Clientes_Distintos,
    COUNT(DISTINCT Vendedor) AS Vendedores_Distintos,
    COUNT(DISTINCT Producto) AS Productos_Distintos,
    SUM(Cantidad) AS Cantidad_Total,
    SUM(Ventas) AS Ventas_Totales,
    AVG(Ventas) AS Venta_Promedio
FROM #ventas_modulo_4;

--========================================================
-- 6. ANÁLISIS POR VENDEDOR
--========================================================

-- Ranking de vendedores por ventas totales
SELECT
    Vendedor,
    COUNT(*) AS Total_Operaciones,
    SUM(Ventas) AS Ventas_Totales,
    AVG(Ventas) AS Venta_Promedio
FROM #ventas_modulo_4
GROUP BY Vendedor
ORDER BY Ventas_Totales DESC;

-- Top 3 vendedores
SELECT TOP 3
    Vendedor,
    SUM(Ventas) AS Ventas_Totales
FROM #ventas_modulo_4
GROUP BY Vendedor
ORDER BY Ventas_Totales DESC;

--========================================================
-- 7. ANÁLISIS POR PRODUCTO
--========================================================

-- Ventas por producto
SELECT
    Producto,
    COUNT(*) AS Total_Operaciones,
    SUM(Cantidad) AS Cantidad_Total,
    SUM(Ventas) AS Ventas_Totales,
    AVG(Ventas) AS Venta_Promedio
FROM #ventas_modulo_4
GROUP BY Producto
ORDER BY Ventas_Totales DESC;

-- Participación de cada producto sobre el total
SELECT
    Producto,
    SUM(Ventas) AS Ventas_Totales,
    CAST(100.0 * SUM(Ventas) / SUM(SUM(Ventas)) OVER () AS DECIMAL(10,2)) AS Participacion_Porcentual
FROM #ventas_modulo_4
GROUP BY Producto
ORDER BY Ventas_Totales DESC;

--========================================================
-- 8. ANÁLISIS POR TERRITORIO
--========================================================

-- Comparación por territorio
SELECT
    Territorio,
    COUNT(*) AS Total_Operaciones,
    SUM(Ventas) AS Ventas_Totales,
    AVG(Ventas) AS Venta_Promedio
FROM #ventas_modulo_4
GROUP BY Territorio
ORDER BY Ventas_Totales DESC;

-- Desglose por territorio y producto
SELECT
    Territorio,
    Producto,
    SUM(Ventas) AS Ventas_Totales
FROM #ventas_modulo_4
GROUP BY Territorio, Producto
ORDER BY Territorio, Ventas_Totales DESC;

--========================================================
-- 9. ANÁLISIS DE CLIENTES
--========================================================

-- Top 10 clientes por ventas
SELECT TOP 10
    Cliente,
    COUNT(*) AS Total_Operaciones,
    SUM(Cantidad) AS Cantidad_Total,
    SUM(Ventas) AS Ventas_Totales
FROM #ventas_modulo_4
GROUP BY Cliente
ORDER BY Ventas_Totales DESC;

-- Clientes con compras altas
SELECT
    Cliente,
    SUM(Ventas) AS Ventas_Totales
FROM #ventas_modulo_4
GROUP BY Cliente
HAVING SUM(Ventas) > 1000000
ORDER BY Ventas_Totales DESC;

--========================================================
-- 10. ANÁLISIS TEMPORAL
--========================================================

-- Ventas por año y mes
SELECT
    YEAR(Fecha) AS Anio,
    MONTH(Fecha) AS Mes,
    SUM(Ventas) AS Ventas_Totales,
    SUM(Cantidad) AS Cantidad_Total
FROM #ventas_modulo_4
GROUP BY YEAR(Fecha), MONTH(Fecha)
ORDER BY Anio, Mes;

-- Ventas por trimestre
SELECT
    YEAR(Fecha) AS Anio,
    DATEPART(QUARTER, Fecha) AS Trimestre,
    SUM(Ventas) AS Ventas_Totales
FROM #ventas_modulo_4
GROUP BY YEAR(Fecha), DATEPART(QUARTER, Fecha)
ORDER BY Anio, Trimestre;

--========================================================
-- 11. SEGMENTACIÓN DE VENTAS
--========================================================

SELECT
    Producto,
    Vendedor,
    Ventas,
    CASE
        WHEN Ventas > 200000 THEN 'Venta Alta'
        WHEN Ventas BETWEEN 100000 AND 200000 THEN 'Venta Media'
        ELSE 'Venta Baja'
    END AS Clasificacion_Venta
FROM #ventas_modulo_4
ORDER BY Ventas DESC;

--========================================================
-- 12. LIMPIEZA FINAL OPCIONAL
--========================================================
-- DROP TABLE #ventas_modulo_4;