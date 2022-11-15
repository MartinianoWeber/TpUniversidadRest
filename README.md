
# Api rest con PHP

Este trabajo fue creado para la universidad en la materia Web 2



## EndPoints de mi api

#### Obtener todos los items

```http
  GET BASEURL/api/autos
```

| Parametro | Tipo     | Descripcion                |
| :-------- | :------- | :------------------------- |
| `?sort=desc` | `string` | Esto sirve para listar descendiente |
| `Default ASC` |`string`| Este metodo viene por default y para listar ascendiente |

Estos parametros se deben enviar por la URL, el default no es necesario
#### Obtener item Individual

```http
  GET BASEURL/api/autos/:id
```

| Parametro | Tipo     | Descripcion                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `number` | **Required**. ID para el item requerido |

#### Modificar item individual

```http
  PUT BASEURL/api/autos/:id
```

| Parametro | Tipo     | Descripcion                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `number` | **Required**. ID para el item requerido |

Para el body irian los siguientes items:
| Variables | Tipo     
| :-------- | :------- 
| `id`      | `number` 
| `patente`      | `varchar(30)` 
| `cliente`      | `number` 
| `estacionamiento`      | `number`

#### Eliminar item individual

```http
  DELETE BASEURL/api/autos/:id
```

| Parametro | Tipo     | Descripcion                       |
| :-------- | :------- | :-------------------------------- |
| `id`      | `number` | **Required**. ID para el item requerido |


#### Agregar nuevo item

```http
  POST BASEURL/api/autos
```


Para el body irian los siguientes items:
| Variables | Tipo     
| :-------- | :------- 
| `patente`      | `varchar(30)` 
| `cliente`      | `number` 
| `estacionamiento`      | `number`


## Detalles de las FK enviar y modificar vehiculos.
Tabla de estacionamiento(Existentes)
| id | Tipo     
| :-------- | :------- 
| `1`      | `number` 
| `5`      | `number` 

Tabla de cliente(Existentes)
| id | Nombre     
| :-------- | :------- 
| `1`      | `number` 
| `2`      | `number` 
 `3`      | `number` 
