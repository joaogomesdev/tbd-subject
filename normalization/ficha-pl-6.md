
## Normalize a seguinte relação até à terceira forma normal (3FN):

 
````
Equipa = { Id_Equipa, Nome_Equipa, Nome_Estádio, Id_Treinador, Nome_Treinador, Telefone_Treinador, 
            {
                {Id_Jogador_1, Nome_Jogador_1, Telefone_Jogador_1},
                {Id_Jogador_2, Nome_Jogador_2, Telefone_Jogador_2}, …, 
               {Id_Jogador_n, Nome_Jogador_n, Telefone_Jogador_n}
            }
````
### 1 Forma Normal

- Cada linha deve corresponder a um só registo e cada coluna a um só campo.
- Cada campo deve conter dados atómicos, ou seja, um só dado por cada registo. 
- Cada dado só deve tomar um valor dentro do domínio definido para esse campo.

````Equipa = { id_equipa (chave primaria), Nome_Equipa, Nome_Estádio, Id_Treinador, Nome_Treinador, Telefone_Treinador

Jogador = {Id_Jogador (chave primaria), id_equipa, Nome_Jogador, Telefone_Jogador
````

### 2 Forma Normal

 - A chave primária é constituída por um só atributo (chave elementar) 
 - A chave primária é constituída por mais que um atributo (chave primária composta) 

````
Equipa = { id_equipa (chave primaria), Nome_Equipa, Nome_Estádio, Id_Treinador, Nome_Treinador, Telefone_Treinador

Jogador = {Id_Jogador_1 (chave primaria), id_equipa (chave primaria), Nome_Jogador, Telefone_Jogador
````


### 3 Forma normal 

````
Equipa = { id_equipa (chave primaria), Nome_Equipa, Nome_Estádio }

Jogador = {Id_Jogador (chave primaria), id_equipa (chave estrangeira), Nome_Jogador, Telefone_Jogador }

Treinador = { Id_Treinador (chave primaria),  id_equipa (chave estrangeira) , Nome_Treinador, Telefone_Treinador }

````

- Considerar a relação GESTAO que permitirá auxiliar a gestão de projetos.
- Na Tabela 2 está representada uma instância desta relação e nela verificamos que um projeto é caracterizado pelos seguintes atributos:
    
    - Cod_Projeto: código que identifica o projeto;
    - ID_Chefe: identificador do chefe;
    - Nome_Chefe: nome do chefe;
    - Telefone_Chefe: número de telefone do chefe;
    - ID_Empregado: identificador do empregado;
    - Horas_Trabalho: número de horas de trabalho que o empregado despendeu
    no projeto;
    - Salario_Hora: valor do salário hora auferido pelo empregado.

### a)

   ````
   cod_projeto -> id_chefe
   ````

   ````
   id_chefe -> telefone_chefe
   ````

   ````
    id_empregado -> salario_hora
  ````

### b)

  ````
    cod_projeto , id_empregado
  ````

### c)

- Normalize

````
Projeto = {Cod_Projeto,ID_Chefe,Nome_Chefe,Telefone_Chefe, { 
            {ID_Empregado_1, Horas_Trabalho_1, Salario_Hora_1}
                {ID_Empregado_2, Horas_Trabalho_2, Salario_Hora_2}
                {ID_Empregado_3, Horas_Trabalho_3, Salario_Hora_3}
            }
        }
````
        

#### 1 FN

````
Projeto = {Cod_Projeto (chave primaria),ID_Chefe,Nome_Chefe,Telefone_Chefe}
````

````
Empregado = {id_Empregado (chave primaria),cod_projeto (chave primaria), Horas_Trabalho, Salario_Hora}
````

#### 2 FN

````
Projeto = {Cod_Projeto (chave primaria),ID_Chefe,Nome_Chefe,Telefone_Chefe

Empregado = {id_Empregado (chave primaria), Salario_Hora

Empregado_Projeto = {id_Empregado (chave primaria), cod_projeto (chave primaria), Horas_Trabalho
````

#### 3 FN

````
Projeto = {Cod_Projeto (chave primaria), id_chefe (chave estrangeira

Empregado = {id_Empregado (chave primaria), Salario_Hora

Chefe = {ID_Chefe (chave primaria), Nome_Chefe, Telefone_Chefe}
````


### d)

````
Projeto = {Cod_Projeto (chave primaria)}

Projeto_Chefe = {Cod_Projeto (chave primaria), , id_chefe (chave estrangeira

Empregado = {id_Empregado (chave primaria), Salario_Hora}

Chefe = {ID_Chefe (chave primaria), Nome_Chefe, Telefone_Chefe}
````


## Uma academia de natação usa fichas para controlar os seus atletas: (Tabela na ficha 06)

- Considerar o seguinte:

  - A academia tem um código numérico único para cada competição. Por exemplo, os
campeonatos Inte-Países de 2016 e 2018 têm códigos diferentes;
  - Cada prova realizada faz parte de uma competição;
  - A academia tem um código numérico único para cada tipo de prova. Por exemplo, a
prova do tipo 100 metros em estilo livre tem o código 12, independentemente da
competição onde ela ocorra;
  - Cada treinador pode treinar vários atletas;
  - Um atleta pode ter o mesmo treinador em diferentes períodos de tempo;
  - Cada atleta pertence a uma das seguintes categorias: sénior, júnior, juvenil ou
infantil.

- Elaborar um modelo relacional para representar todos os dados registados nas fichas dos
atletas. O modelo deve satisfazer os seguintes requisitos:
  - Identificar as principais entidades e os relacionamentos entre essas entidades. As
entidades devem ser caracterizadas por atributos. Os relacionamentos devem
indicar as cardinalidades;
  - Normalizado até à 3FN.


## Edenficação das entidades

```` 
Atleta = {numero,nome, categoria,endereço, data_nasc, 
                 { codigo,designacao, local, data, 
                   {codigo, estilo, distancia, classificacao, marca} 
                  {codigo, nome, genero, telefone, pediodo_em_que_treino_atleta} 
                 }, `
               } 
````

### 1 FN

````
Atleta = {numero , nome, categora,  data_nasc}

Competicao = { codigo , numero_atleta, designacao, local, data 

Prova_Realizada = { codigo_prova, codigo_competicao, numero_atleta, estilo, distancia, classificacao, marca 

Trinador_atleta = { codigo, codigo_prova, codigo_competicao, numero_atleta, nome , genero, telefone, pediodo_em_que_treino_atleta }
````



