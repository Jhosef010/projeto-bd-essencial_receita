create table usuario (
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


create table ingrediente (
   id_ingrediente serial not null,
   nome  varchar(100) not null,
   categoria  varchar(50) not null,
   unidade_medida_padrao varchar(20) not null,
   constraint ingrediente_pkey primary key (id_ingrediente)
) TABLESPACE pg_default;


create table public.despesa_virtual (
  id_despesa serial not null,
  fk_ingrediente integer null,
  fk_usuario integer null,
  quantidade numeric(10, 2) null,
  unidade_medida character varying(20) null,
  data_atualizacao timestamp without time zone null,
  constraint despesa_virtual_pkey primary key (id_despesa),
  constraint fk_ingrediente foreign KEY (fk_ingrediente) references ingrediente (id_ingrediente),
  constraint fk_usuario foreign KEY (fk_usuario) references usuario (id_usuario)
) TABLESPACE pg_default;

SELECT * FROM despesa_virtual;


create table public.item_pedido (
  id_item_pedido serial not null,
  fk_pedido integer null,
  fk_ingrediente integer null,
  quantidade numeric(10, 2) null,
  preco_unitario numeric(10, 2) null,
  foi_substituido boolean null,
  constraint item_pedido_pkey primary key (id_item_pedido),
  constraint fk_ingrediente foreign KEY (fk_ingrediente) references ingrediente (id_ingrediente),
  constraint fk_item_pedido_pedido foreign KEY (fk_pedido) references pedido (id_pedido)
) TABLESPACE pg_default;
SELECT * FROM  item_pedido

create table public.receita (
  id_receita serial not null,
  id_autor_chef integer null,
  titulo character varying(150) not null,
  modo_preparo text not null,
  tempo_preparo_minutos integer not null,
  nivel_dificuldade character varying(255) null,
  eh_exclusive_premium boolean null,
  data_cadastro timestamp without time zone null,
  constraint receita_pkey primary key (id_receita)
) TABLESPACE pg_default;

SELECT * FROM receita;



create table public.pedido (
  id_pedido serial not null,
  fk_usuario integer null,
  fk_mercado integer null,
  fk_entregador integer null,
  fk_cupom integer null,
  tipo_entrega character varying(255) not null,
  status_pedido_enum character varying(255) not null,
  permite_substituicao_marca boolean null,
  valor_subtotal numeric(10, 2) null,
  valor_desconto numeric(10, 2) null,
  valor_total numeric(10, 2) null,
  data_pedido timestamp without time zone null,
  constraint pedido_pkey primary key (id_pedido),
  constraint fk_usuario foreign KEY (fk_usuario) references usuario (id_usuario),
  constraint fk_mercado foreign KEY (fk_mercado) references mercado_parceiro (id_mercado),
  constraint fk_entregador foreign KEY (fk_entregador) references usuario (id_entregador),
   constraint fk_cupom foreign KEY (fk_cupom) references cupom_desconto (id_cupom)
) TABLESPACE pg_default;

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




CREATE TABLE cupom_desconto(
id_cupom SERIAL PRIMARY KEY,
id_mercado int,
codigo_cupom  varchar(30) not null,
percentual_desconto  decimal(5,2),
valor_desconto_fixo  decimal(10,2),
data_validade   timestamp not null,
ativo  boolean
);


SELECT * FROM cupom_desconto;






CREATE TABLE ingrediente_receita(
id_ingrediente_receita SERIAL PRIMARY KEY,
fk_receita INT  not null,
fk_ingrediente INT not null,
quantidade  decimal(10,2),
unidade_medida  varchar(20),
id_ingrediente_substituto  INT,
eh_obrigatorio  boolean
);




SELECT * FROM ingrediente_receita;


