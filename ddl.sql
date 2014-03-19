create table arquivo (id bigint,
	formato varchar(255) not null,
	tamanho integer not null,
	trabalho_id bigint not null,
	url varchar(255) not null,
	primary key (id));
create table autor (id bigint,
	nome varchar(255) not null,
	primary key (id));
create table categoria (id bigint,
	nome varchar(255) not null,
	primary key (id));
create table orientador (id bigint,
	nome varchar(255) not null,
	primary key (id));
create table role (id bigint,
	authority varchar(255) not null unique,
	primary key (id));
create table termo_chave (id bigint,
	nome varchar(255) not null,
	primary key (id));
create table trabalho (id bigint,
	aprovado boolean not null,
	assunto varchar(255),
	categoria_id bigint not null,
	enviado timestamp not null,
	orientador_id bigint not null,
	publicado timestamp,
	resumo varchar(255),
	titulo varchar(255) not null,
	primary key (id));
create table trabalho_autores (trabalho_id bigint not null,
	autor_id bigint not null,
	primary key (trabalho_id, autor_id));
create table trabalho_termos_chave (termo_chave_id bigint not null,
	trabalho_id bigint not null,
	primary key (trabalho_id, termo_chave_id));
create table user (id bigint,
	account_expired boolean not null,
	account_locked boolean not null,
	enabled boolean not null,
	"password" varchar(255) not null,
	password_expired boolean not null,
	username varchar(255) not null unique,
	primary key (id));
create table user_role (role_id bigint not null,
	user_id bigint not null,
	primary key (role_id, user_id));
alter table arquivo add constraint foreign key (trabalho_id) references trabalho;
alter table trabalho add constraint foreign key (categoria_id) references categoria;
alter table trabalho add constraint foreign key (orientador_id) references orientador;
alter table trabalho_autores add constraint foreign key (trabalho_id) references trabalho;
alter table trabalho_autores add constraint foreign key (autor_id) references autor;
alter table trabalho_termos_chave add constraint foreign key (trabalho_id) references trabalho;
alter table trabalho_termos_chave add constraint foreign key (termo_chave_id) references termo_chave;
alter table user_role add constraint foreign key (role_id) references role;
alter table user_role add constraint foreign key (user_id) references user;
