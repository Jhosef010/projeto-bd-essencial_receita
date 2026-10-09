create table public.usuario (
    id_usuario serial not null,
    nome character varchar(100) not null,
    email character varchar(100) not null,
    senha_hash character var(255) not null,
    cpf_criptografado character varchar(255) not null,
    tipo_perfil character varchar(255) not null,
    data_nascimento date not null,
    idioma_preferido character varchar(5) null,
    eh_assinante_premium boolean null,
    termo_lgpd_aceito boolean not null,
    data_criacao timestamp without time zone null,
    constraint usuario_pkey primary key (id_usuario)
) TABLESPACE pg_default;

create table public.mercado_parceiro (
    id_mercado integer not null,
    nome character varchar(100) not null,
    categoria character varchar(50) not null,
    unidade_medida_padrao character varchar(20) not null,
    constraint mercado_parceiro_pkey primary key (id_mercado)
) TABLESPACE pg_default;


create table public.ingrediente (
    id_ingrediente serial not null,
    nome character varchar(100) not null,
    categoria character varchar(50) not null,
    unidade_medida_padrao character varchar(20) not null,
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


