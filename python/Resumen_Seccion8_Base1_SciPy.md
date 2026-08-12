# 8. Resumen y conclusiones

En este proyecto se ha aplicado un conjunto de técnicas estadísticas con **SciPy** sobre la Base 1 de ventas, complementando el análisis descriptivo realizado con **pandas**, **gráficos** y **Power BI**. El objetivo ha sido pasar de una visión meramente descriptiva a un análisis **inferencial**, capaz de responder preguntas sobre diferencias entre grupos, relaciones entre variables y evolución temporal.

## 8.1 Comparación entre vendedores

La comparación de las ventas medias entre vendedores se abordó en dos niveles:

- **Prueba t de Welch** para dos vendedores concretos (por ejemplo, Víctor y Nora), que mostró una diferencia de medias pequeña y no significativa (valor p superior a 0,05). Con estos datos, no puede afirmarse estadísticamente que las ventas medias de ambos sean distintas.
- **ANOVA de un factor** para todos los vendedores, que arrojó un estadístico \(F \approx 2.46\) y un valor \(p \approx 0.0123\). Al ser \(p < 0.05\), se rechaza la hipótesis nula de igualdad de medias y se concluye que al menos un vendedor presenta un rendimiento de ventas diferente al resto.

Descriptivamente, Marco se sitúa en la parte alta de la distribución (media y mediana más elevadas), mientras que Edwin aparece en la parte baja. El diagrama de caja por vendedor refuerza esta idea, mostrando una mediana claramente superior para Marco y más baja para Edwin.

> **Conclusión parcial:** existen diferencias estadísticamente significativas entre las ventas medias de los vendedores, destacando algunos perfiles de mayor rendimiento. Este resultado es útil para análisis de desempeño comercial y decisiones de asignación de clientes o territorios.

## 8.2 Relaciones entre cantidad, ventas y precio unitario

Se estudiaron dos relaciones clave:

1. **Cantidad vs Ventas** (global): las correlaciones de Pearson y Spearman resultaron prácticamente nulas, con valores p superiores a 0,05. Esto indica que, en el conjunto completo de operaciones, vender más unidades no implica necesariamente obtener mayores ventas en importe.

2. **Cantidad vs PrecioUnitario** (global y por producto): la correlación de Spearman fue negativa y moderadamente fuerte (\(\rho \approx -0.55\)) y el valor p extremadamente pequeño, lo que muestra una relación inversa significativa entre cantidad y precio unitario. El análisis por producto confirmó este patrón en todas las categorías (Accesorios, Juguetes, Electrodomésticos, Viajes y Calzado), con coeficientes negativos y p-values muy bajos.

Las gráficas de dispersión evidencian una nube de puntos descendente: los pedidos de mayor volumen tienden a registrar precios unitarios más bajos. Este comportamiento es consistente con políticas de **descuento por volumen** o condiciones comerciales más ventajosas para operaciones grandes.

> **Conclusión parcial:** la base sugiere que el precio unitario se ajusta a la cantidad, de manera que las operaciones de mayor volumen suelen obtener precios más bajos. Este hallazgo es relevante para estrategias de pricing y negociación con clientes.

## 8.3 Valores atípicos en ventas y precios

Mediante el método del rango intercuartílico (IQR) se analizó la presencia de valores atípicos:

- En `Ventas`, los límites \(Q_1 - 1.5 \times IQR\) y \(Q_3 + 1.5 \times IQR\) no identificaron ningún registro atípico. Las ventas se distribuyen dentro de un rango coherente con la variabilidad esperada.
- En `PrecioUnitario`, en cambio, se detectaron 31 valores atípicos por encima del límite superior global. Estos casos se concentran principalmente en Accesorios y Electrodomésticos, con porcentajes de atípicos entre el 3 y el 4 % según producto.

> **Conclusión parcial:** no existen outliers según IQR en el importe total de ventas, pero sí operaciones con precio unitario excepcionalmente alto. Estos registros deben revisarse individualmente para distinguir entre transacciones especiales (productos premium, condiciones específicas) y posibles errores de registro.

## 8.4 Productos, vendedores y evolución temporal

El **ANOVA por producto** mostró un estadístico \(F \approx 1.68\) y un valor \(p \approx 0.1526\), por lo que no se encontraron diferencias estadísticamente significativas entre las ventas medias de las categorías Accesorios, Juguetes, Electrodomésticos, Viajes y Calzado. Aunque Viajes y Juguetes presentan medias algo superiores y Calzado la más baja, estas variaciones pueden atribuirse a la variabilidad normal de las operaciones.

En contraste, el **ANOVA por vendedor** sí detectó diferencias significativas, como se comentó anteriormente, lo que sugiere que el rendimiento comercial varía más entre personas que entre productos.

En cuanto a la **evolución temporal**, la regresión lineal sobre las ventas mensuales arrojó:

- una pendiente negativa (\(slope \approx -1.89 \times 10^6\));
- un coeficiente de correlación \(|R| \approx 0.70\);
- un valor p ≈ 0.0106.

Estos resultados indican una **tendencia decreciente significativa** en las ventas mensuales durante el periodo analizado: el comportamiento comercial fue mejor en los primeros meses que en los últimos. El gráfico de ventas mensuales muestra un máximo inicial seguido de una caída progresiva, con algunos repuntes intermedios pero un perfil global bajista.

> **Conclusión parcial:** por producto las diferencias no son significativas, pero por vendedor sí. Además, las ventas muestran una tendencia temporal descendente, lo que puede apuntar a cambios en demanda, campañas, estacionalidad o factores externos que afectan al rendimiento.

## 8.5 Relación territorio–producto

La prueba chi-cuadrado de independencia aplicada a la tabla de contingencia territorio–producto obtuvo:

- \(\chi^2 \approx 62.30\);
- \(p \approx 9.53 \times 10^{-13}\);
- 4 grados de libertad.

El valor p extremadamente pequeño permite rechazar con claridad la hipótesis de independencia entre territorio y producto.

> **Conclusión parcial:** el mix de productos vendidos **depende del territorio**. Algunos productos se concentran en determinadas zonas, mientras que otros son más frecuentes en territorios diferentes. Este resultado es clave para la planificación comercial por regiones y la asignación de catálogo.

## 8.6 Conclusión general

El uso de SciPy sobre la Base 1 ha permitido:

- pasar de un análisis descriptivo a un análisis **inferencial y de relaciones**;
- determinar qué diferencias entre vendedores son estadísticamente relevantes;
- evidenciar una relación inversa robusta entre cantidad y precio unitario;
- delimitar valores atípicos en precios unitarios y confirmar la ausencia de outliers en ventas;
- comprobar que las diferencias entre productos no son significativas a nivel global;
- detectar una tendencia temporal bajista en las ventas;
- demostrar que el territorio influye en el tipo de producto vendido.

En conjunto, estos resultados aportan una visión estadística sólida del comportamiento comercial y sirven de base para decisiones de **pricing**, **evaluación de vendedores**, **gestión de territorios** y **seguimiento de la evolución de ventas**. SciPy se integra así como una herramienta clave dentro del flujo de trabajo de análisis, ampliando las capacidades de pandas, Matplotlib y Power BI con contrastes estadísticos y modelos sencillos que añaden rigor a las conclusiones del proyecto.
