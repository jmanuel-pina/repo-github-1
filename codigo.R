library(tidyverse)

datos_covid <- read_csv(file = "https://cnecovid.isciii.es/covid19/resources/casos_hosp_uci_def_sexo_edad_provres.csv", "NC")

datos_madrid <-
  +     datos_covid |>
  +     # Filtrado por Madrid y fecha
  +     filter(provincia_iso == "M" & fecha <= "2020-12-31" & sexo != "NC") |> 
  +     # Selección de columnas
  +     select(fecha, sexo, grupo_edad, num_casos) |> 
  +     # Resumen de casos diarios por fecha y sexo
  +     summarise(num_casos = sum(num_casos), .by = c(fecha, sexo))

write_csv(datos_madrid, file = "./datos_madrid.csv")

