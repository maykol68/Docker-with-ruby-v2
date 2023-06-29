# Lista de comandos usados

### Comandos Docker

Crear un contenedor nuevo de postgres:

``` 
 docker run -e POSTGRES_PASSWORD=password -p 5432:5432 -d --name postgres --network cats --network-alias postgres --mount type=volume,src=cats-db,target=/var/lib/postgresql/data postgres
```

- -e -> declarar variables de entorno
- -p -> declarar puertos (exterior:servicioDentroDelContenedor)
- -d -> modo dettach (correr en segundo plano)
- --name -> crear un alias para el contenedor
- --network -> crear una red
- --network-alias -> crear un alias de red
- --mount -> montar un volumen o bindear un directorio

Crear un contenedor nuevo de redis:

``` 
 docker run --name redis -p 6379:6379 -d --network cats --network-alias redis redis
```

Crear un contenedor nuevo de cats-api:

``` 
docker run --name cats-api -p 3000:3000 -d --network cats -e DATABASE_URL=postgres://postgres:password@postgres:5432/cats_db -e REDIS_URL=redis://redis:6379 --mount type=bind,src="$(pwd)",target=/app cats-api
```

Ver contenedores que están en ejecución:

```
docker ps
```

Ver todos los contenedores (estén en ejecución o detenidos):

``` 
docker ps -a
```

Detener un contenedor en ejecución:

``` 
docker stop idContenedor (o alias)
```

Arrancar un contenedor que ya existe:

```
docker start idContenedor (o alias)
```

Borrar un contenedor:

``` 
docker rm idContenedor (o alias)
```

Borrar todos los contenedores parados:

```
docker container prune
```

Ver los logs del contenedor:

``` 
docker logs idContenedor (o alias)
```

Ver los logs en tiempo real:

```
docker logs -f idContenedor (o alias)
```

Buscar imágenes:

``` 
docker search términoABuscar
```

Descargar imagen:

``` 
docker pull nombreImagen
```

Ver imágenes descargadas:

```
docker images
```

Borrar imagen (no tiene que estar siendo usada por ningún contenedor):

``` 
docker rmi nombreImagen
```

Ver monitor de contenedores (cpu/memoria/red):

``` 
docker stats
```

Generar imagen propia (tienes que estar dentro de tu repositorio):

``` 
docker build -t nombreImagen .
```

Ver detalles de un contenedor:

``` 
docker inspect idContenedor (o alias)
```

Ver redes:

```
docker network ls
```

Crear red:

``` 
docker network create nombreRed
```

Ejecutar comando en un contenedor:

``` 
docker exec idContenedor rails db:seed
```

Ejecutar comando de forma interactiva:

``` 
docker exec -it idContenedor rails console
```

Crear un volumen:

``` 
docker volume create nombreVolumen
```

Ver redes creadas:

```
docker network ls
```

Borrar una red:

```
docker network rm nombreRed
```

Ver volúmenes:

``` 
docker volume ls
```

Borrar un volumen:

``` 
docker volume rm nombreVolumen
```

Crear contenedores usando Docker compose:

``` 
docker-compose up
```

Arrancar contenedores de Docker compose:

```
docker-compose start
```

Detener contenedores de Docker compose:

``` 
docker-compose stop
```

Ver logs usando Docker compose:

``` 
docker-compose -f logs
```

Ver logs usando Docker compose de un servicio en específico:

```
docker-compose -f logs aliasServicio
```

Ejecutar comando en contenedor usando Docker compose:

```
docker-compose exec aliasServicio rails db:setup
```

Borrar imágenes, contenedores, redes y volúmenes del Docker compose del repositorio actual:

```  
docker-compose down --volumes
```


### Otros comandos usados durante el curso:

Conectarse a una base de datos de Postgres donde el usuario se llama postgres:

```
psql -h 127.0.0.1 -U postgres
```

Conectarse a una base de datos Redis:

``` 
redis-cli
```

Limpiar pantalla en la terminal:

```
clear
```

Petición curl formateada:

``` 
curl localhost:3000 | json_pp
```

Borrar todos los contenedores, imágenes, volúmenes y redes ¡CUIDADO CON ESTE COMANDO!

``` 
 docker system prune --all --volumes
```

### Otros datos útiles:

Repositorio de imágenes:

``` 
hub.docker.com
```