create table public.usuario (
    id_usuario serial not null,
    nome varchar(100) not null,
    email  varchar(100) not null,
    senha_hash varchar(255) not null,
    cpf_criptografado varchar(255) not null,
    tipo_perfil  varchar(255) not null,
    data_nascimento date not null,
    idioma_preferido  varchar(5) null,
    eh_assinante_premium boolean null,
    termo_lgpd_aceito boolean not null,
    data_criacao timestamp null,
    constraint usuario_pkey primary key (id_usuario)
) TABLESPACE pg_default;

create table public.mercado_parceiro (
    id_mercado integer not null,
    nome varchar(100) not null,
    categoria varchar(50) not null,
    unidade_medida_padrao  varchar(20) not null,
    constraint mercado_parceiro_pkey primary key (id_mercado)
) TABLESPACE pg_default;


create table public.ingrediente (
    id_ingrediente serial not null,
    nome  varchar(100) not null,
    categoria  varchar(50) not null,
    unidade_medida_padrao varchar(20) not null,
    constraint ingrediente_pkey primary key (id_ingrediente)
) TABLESPACE pg_default;


CREATE TABLE despesa_virtual (
    id_despesa SERIAL PRIMARY KEY,
    fk_despesa INT,
    fk_ingrediente INT,
    quantidade decimal(10,2),
    unidade_medida varchar(20),
    data_atualizacao timestamp
);

SELECT * FROM despesa_virtual;


CREATE TABLE item_pedido (
    id_item_pedido SERIAL PRIMARY KEY,
    fk_pedido int,
    fk_ingrediente int,
    quantidade decimal(10,2),
    preco_unitario decimal(10,2),
    foi_substituido boolean
);

SELECT * FROM item_pedido; 



CREATE TABLE receita (
  id_receita SERIAL PRIMARY KEY,
  id_autor_chef int,
  titulo varchar(150) not null,
  modo_preparo text not null,
  tempo_preparo_minutos int not null,
  nivel_dificuldade varchar (255),
  eh_exclusive_premium boolean,
  data_cadastro timestamp
);

SELECT * FROM receita; 


CREATE TABLE pedido (
 id_pedido SERIAL PRIMARY KEY,
 fk_cliente  INT,
 fk_mercado  INT,
 fk_entregador INT,
 fk_cupom  INT,
 tipo_entrega varchar(255) not null,
 status_pedido_enum varchar(255) not null,
 permite_substituicao_marca boolean,
 valor_subtotal decimal(10,2),
 valor_desconto decimal(10,2),
 valor_total decimal(10,2),
 data_pedido timestamp
);

SELECT * FROM pedido; 


CREATE TABLE estoque_mercado (
 id_mercado SERIAL PRIMARY KEY,
 fk_ingrediente  INT not null,
 preco_unitario  decimal(10,2) not null,
 quantidade_disponivel  decimal(10,2)   not null
);

SELECT * FROM estoque_mercado; 


CREATE TABLE mercado_parceiro(
 id_usuario_lojista SERIAL PRIMARY KEY,
 nome_fantasia varchar(120) not null,
 cnpj  varchar(18) not null,
 valor_pedido_minimo  decimal(10,2) not null,
 latitude  decimal(10,2) not null,
 longitude  decimal(10,2) not null,
 ativo  boolean
);

SELECT * FROM mercado_parceiro; 


