/*----------------------------------------------------- 01 -------------------------------------------------------------*/

/* 1 - Lista de todas as meninas */

select * from gafanhotos
where sexo = 'F'
order by nome;

/* 2 - Lista com dados de todos aqueles que nasceram entre 1/jan/2000 e 31/Dez/2015 */

select * from gafanhotos
where nascimento between '2000-01-01' and '2015-12-31'
order by nascimento;

/* 3 - Lista de todo homem programador */

select * from gafanhotos
where profissao = 'Programador' and sexo = 'M'
order by nome;

/* 4 - Mulheres brasileiras que tenham J no inicio do nome */

select * from gafanhotos
where nacionalidade = 'Brasil' and sexo = 'F' and nome like 'J%';

/* 5 - Homem nao brasileiro que tem silva no nome com menos de 100 kg */

select nome, nacionalidade from gafanhotos
where nacionalidade != 'Brasil' and nome like '%Silva%' and peso <= 100;

/* 6- Maior altura de um homem brasileiro */

select max(altura) from gafanhotos
where sexo = 'M' and nacionalidade = 'Brasil';

/* 7- Media de peso dos gafanhotos */

select avg(peso) from gafanhotos;

/* 8- Menor peso das mulheres que nasceram fora do brasil entre 01/01/1990 e 31/12/2000 */

select min(peso) from gafanhotos
where sexo = 'F' and nacionalidade != 'Brasil' and nascimento between '1990-01-01' and '2000-12-31';

/* 9- Mulheres com mais de 1.90 de altura */ 

select count(*) from gafanhotos
where sexo = 'M' and altura > 1.90;

/*----------------------------------------------------- 02 -------------------------------------------------------------*/

/* 1 - Lista de quais profissoes existem em gafanhotos e quantos em cada uma*/

select profissao, count(*) from gafanhotos
group by profissao
order by nome;

/* 2 - Quantos homens e quantas mulheres nasceram apos 1 jan 2015 */

select sexo, count(*) from gafanhotos
where nascimento > '2005-01-01'
group by sexo
;

/* 3 - Lista dos que nasceram fora do brasil. mostrando o pais de origem e o taotal de pessoas nascidas la, so interessa os paises que tiverem mais de 3 */

select nacionalidade, count(*) from gafanhotos
where nacionalidade != 'Brasil'
group by nacionalidade
having count(*) > 3
;

/* 4 - Lista agrupa pela altura dos gafanhotos, mostrando quantas pessoas pesam mais de 100kg e que estao acima da media de altura de todos os cadastrados */

select altura, peso, count(*) from gafanhotos
where peso > 100 and altura > (select avg(altura) from gafanhotos)  /*modo 1*/
group by altura
;

select altura, peso, count(*) from gafanhotos  /*modo 2*/
where peso > 100
group by altura
having altura > (select avg(altura) from gafanhotos) /* having so pode ser usado depois de agrupar*/
;


/*----------------------------------------- Modelo relacional -----------------------------------------*/

alter table gafanhotos
add column cursopreferido int;

alter table gafanhotos
add foreign key (cursopreferido)
references cursos(idcurso);

update gafanhotos set cursopreferido = '6' where id = '1';

select gafanhotos.nome, gafanhotos.cursopreferido, cursos.nome from gafanhotos join cursos
on idcurso = cursopreferido;

select g.nome, g.cursopreferido, c.nome from gafanhotos as g left outer join cursos as c
on c.idcurso = g.cursopreferido
order by g.nome;

/*------------------join com varias tabelas---------------------*/

create table assiste (
	id int not null auto_increment,
    data date,
    id_gafanhoto int,
    id_curso int,
    primary key(id),
    foreign key(id_gafanhoto) references gafanhotos(id),
    foreign key(id_curso) references cursos(idcurso)
    
) default charset = utf8;

insert into assiste values
(default, '2014-03-01', '1', '2');

select * from cursos;

select g.id,g.nome, id_curso, c.nome from gafanhotos g join assiste a
on g.id = a.id_gafanhoto
join cursos c
on a.id_curso = c.idcurso;