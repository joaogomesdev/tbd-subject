# Normalization exercices

## 1 - Considere a seguinte fatura:

![Fatura](https://i.imgur.com/f9umQ6q.png)

Considerar o seguinte:

    • O cliente pode ter uma morada fiscal e várias moradas de entrega dos
        equipamentos;
    • O vendedor é um dos trabalhadores da IT@Z e pode prestar vários tipos de   serviços
        (ex. Venda, Reparação, …)
    • O desconto aplicado é sempre por linha diretamente na fatura, não existindo
        descontos na totalidade da fatura.
        Elaborar um modelo relacional para representar o sistema de faturação desta empresa, verificado nesta Fatura. O modelo deve satisfazer os seguintes requisitos:
    • Identificar as principais entidades e os relacionamentos entre essas      entidades. As entidades devem ser caracterizadas por atributos. Os relacionamentos devem indicar as cardinalidades;
    • Normalizado até à 3FN.

```
Fatura = {data, numero_fatura, nif_cliente, nome_cliente_fiscal, empresa_filcal, morada_fiscal, telefone_fiscal, nome_entrega, empresa_entrega, morada_entrega, telefone_entrega, vendedor, servico, 
{num_item, qtd, descricao_itempunit, desc, total_linha}, desconto_total, subtotal, iva, total }

```

### Normalização


#### 1 Forma normal

````
Fatura = {data, num_fatura, nif_cliente, nome_cliente_fiscal, empresa_filcal, morada_fiscal, telefone_fiscal, nome_entrega, empresa_entrega, morada_entrega, telefone_entrega, vendedor, servico,  desconto_total, subtotal, iva, total}

Linha_Fatura = {num_fatura, num_item, qtd, descricao_item, punit, desc, total_linha}
````

#### 2 Forma normal

````
Fatura = {data, num_fatura, nif_cliente, nome_cliente_fiscal, empresa_filcal, morada_fiscal, telefone_fiscal, nome_entrega, empresa_entrega, morada_entrega, telefone_entrega, vendedor, servico,  desconto_total, subtotal, iva, total}

Linha_Fatura = {num_fatura, qtd, num_item, desconto, total_linha}


Linha_Fatura_Item = {num_item, descricao_item ,punit}
````

#### 3 Forma normal

````
Fatura = { num_fatura (chave primaria), data, nif_cliente(chave estrangeira),nome_entrega,  vendedor (chave estrangeira), servico (chave estrangeira)}

(desconto_total, subtotal, iva, total, nao se calcula pois sao valores calculaveis que nao se armazenam)

Cliente = {nif_cliente (chave primaria), nome_cliente_fiscal, empresa_filcal, morada_fiscal, telefone_fiscal}

Empresa_entrega = { nif (chave primaria e secundaria), nome_entrega (chave primaria), empresa_entrega, morada_entrega, telefone_entrega}

Linha_Fatura = {num_fatura, qtd, num_item, desconto}

(total_linha nao se calcula pois sao valores calculaveis que nao se armazenam)


Linha_Fatura_Item = {num_item, descricao_item ,punit}

Entrega_servico = {vendedor (chave primaria), servico (chave primaria)}

````

#### Modelo relacional

Adicionar a imagem


## 2 - Considere a seguinte Ficha Médica:

![Ficha Medica](https://i.imgur.com/YYQvzvU.png)

Considerar o seguinte:
    • O Paciente pode ter vários telefones;
    • Em cada consulta podem ser requisitados vários exames.
Elaborar um modelo relacional para representar a Ficha Médica desta clínica. O modelo
deve satisfazer os seguintes requisitos:
    • Identificar as principais entidades e os relacionamentos entre essas entidades. As
    entidades devem ser caracterizadas por atributos. Os relacionamentos devem
    indicar as cardinalidades;
    • Normalizado até à 3FN.

````
Ficha = { numero_paciente, nome_paciente, data_nasc_paciente, sexo_paciente, {telefone_paciente}}
        {numero_consulta, data_consulta, codigo_medico, nome_medico, tipo_diagnostico}
        {id_exame, numero_consulta, descricao_exame, data_exame}
````

## Normalizacao

### 1 FN

````
Paciente = {numero_paciente (chave primaria), nome_paciente, data_nasc_paciente, sexo_paciente}

Ficha_Telefone = {num_paciente (chave primaria), telefone_paciente}

Consulta = {numero_paciente (chave primaria), numero_consulta (chave primaria), data_consulta, codigo_medico, nome_medico, tipo_diagnostico}

Exame = {numero_paciente(chave primaria), id_exame(chave primaria), numero_consulta(chave primaria), descricao_exame, data_exame}
````

### 2 FN

````
Paciente = {numero_paciente(chave primaria), nome_paciente, data_nasc_paciente, sexo_paciente}

Ficha_Telefone = {num_paciente(chave secundaria), telefone_paciente(chave primaria)}

Consulta = {numero_consulta (chave primaria),numero_paciente  , data_consulta, codigo_medico, nome_medico, tipo_diagnostico}

Exame_Consulta = { id_exame (chave primaria), numero_consulta (chave primaria), data_exame}

Exame = {id_exame, descricao_exame}
````

### 3 FN

````
Paciente = {numero_paciente, nome_paciente, data_nasc_paciente, sexo_paciente}

Ficha_Telefone = {num_paciente, telefone_paciente}

Consulta = {numero_consulta (chave primaria), numero_paciente (chave estrangeira), data_consulta, codigo_medico, tipo_diagnostico}

Medico = {codigo_medico (chave primaria), nome_medico,}

Exame_Consulta = { id_exame (chave primaria), numero_consulta (chave primaria), data_exame}

Exame = {id_exame, descricao_exame}    
````

#### Modelo relacional

Adicionar a imagem