### Hallazgos principales

- K-Means identificó dos segmentos de clientes; la solución con `k = 2` obtuvo el mejor coeficiente silhouette, cercano a 0.551.
- El segmento de alto valor presenta mayor frecuencia de compra, mayor cantidad acumulada y mayores ventas totales.
- Accesorios concentró el mayor valor económico de ventas en la red Cliente–Producto.
- Electrodomésticos fue el producto conectado con más clientes distintos: 78.
- Varios clientes adquirieron las cinco categorías disponibles, lo que evidencia un patrón de compra diversificado y potencial para acciones de fidelización.
- Los clientes con pocas categorías compradas representan oportunidades para estrategias de venta cruzada.

## Conclusión de la ampliación analítica

La ampliación del análisis de ventas incorporó técnicas de *machine learning* no supervisado y análisis de redes para complementar las métricas tradicionales desarrolladas en Excel, SQL y Power BI.

En primer lugar, se aplicó el algoritmo K-Means para segmentar a los clientes a partir de sus ventas totales, cantidad acumulada, número de compras y ticket medio. La evaluación de distintas alternativas mediante el coeficiente silhouette mostró que la solución con dos segmentos ofrece la mejor separación. El primer segmento agrupa clientes con menor frecuencia de compra y menor volumen total de ventas, mientras que el segundo concentra clientes recurrentes y de alto valor comercial. Esta clasificación permite diferenciar estrategias de activación para clientes ocasionales de estrategias de fidelización para clientes estratégicos.

En segundo lugar, se construyó una red bipartita Cliente–Producto con NetworkX. La red permitió analizar las relaciones comerciales desde tres perspectivas complementarias: valor económico acumulado, alcance por número de clientes y diversidad de categorías adquiridas. Accesorios concentró el mayor volumen de ventas dentro de la red, mientras que Electrodomésticos alcanzó la mayor cantidad de clientes distintos. Por otra parte, clientes como IFH Peru LTD, Banco Egipcio Nacional, Banco Interno, Compañía Minera Poderosa, S.A. y Minera de Cobre Supremo combinaron una alta relevancia comercial con una compra diversificada de productos.

En conjunto, la ampliación demuestra que el rendimiento comercial no debe analizarse únicamente mediante ventas totales. La segmentación identifica perfiles de comportamiento de clientes, mientras que la red Cliente–Producto permite distinguir entre clientes de alto valor, clientes con compras diversificadas, productos de mayor volumen y productos de mayor penetración comercial. Estos resultados pueden utilizarse para priorizar cuentas estratégicas, diseñar campañas de fidelización y detectar oportunidades de venta cruzada.