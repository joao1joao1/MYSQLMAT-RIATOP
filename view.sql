-- 1. Exibir lista de alunos e seus cursos
-- Crie uma view que mostre o nome dos alunos e as disciplinas em que estão matriculados, incluindo o nome do curso.

create view listaAlunos as
select aluno.nome, disciplina.nome, curso.nome
from aluno
left join matricula on aluno.id_aluno = matricula.id_aluno
left join disciplina on matricula.id_disciplina = disciplina.id_disciplina
left join curso on disciplina.id_curso = curso.id_curso;

select * from listaAlunos;

/*
2. Exibir total de alunos por disciplina
Crie uma view que mostre o nome das disciplinas e a quantidade de alunos matriculados em cada uma.
*/

create view nomeQtd as
select disciplina.nome, count(matricula.id_aluno)
from disciplina
left join matricula on disciplina.id_disciplina = matricula.id_disciplina
group by disciplina.nome;

select * from nomeQtd;

/*
3. Exibir alunos e status das suas matrículas
Crie uma view que mostre o nome dos alunos, suas disciplinas e o status da matrícula (Ativo, Concluído, Trancado).
*/

create view alunoMatric as
select aluno.nome, disciplina.nome, matricula.status
from aluno
inner join matricula on aluno.id_aluno = matricula.id_aluno
inner join disciplina on matricula.id_disciplina = disciplina.id_disciplina;

select * from alunoMatric;

/*
4. Exibir professores e suas turmas
Crie uma view que mostre o nome dos professores e as disciplinas que eles lecionam, com os horários das turmas.
*/

create view profsDisc as
select professor.nome, disciplina.nome, turma.horario
from professor
inner join turma on professor.id_professor = turma.id_professor
inner join disciplina on turma.id_disciplina = disciplina.id_disciplina;

select * from profsDisc;

/*
5. Exibir alunos maiores de 20 anos
Crie uma view que exiba o nome e a data de nascimento dos alunos que têm mais de 20 anos.
*/

/*
6. Exibir disciplinas e carga horária total por curso
Crie uma view que exiba o nome dos cursos, a quantidade de disciplinas associadas e a carga horária total de cada curso.
*/

create view cursoDC as
select curso.nome, count(disciplina.id), sum(disciplina.carga_horaria)
from curso
left join disciplina on curso.id_curso = disciplina.id_curso 
group by curso.nome;

select * from cursoDC;

/*
7. Exibir professores e suas especialidades
Crie uma view que exiba o nome dos professores e suas especialidades.
*/

create view profEspec as
select professor.nome, professor.especialidade
from professor

select * from profEspec;

/*
8. Exibir alunos matriculados em mais de uma disciplina
Crie uma view que mostre os alunos que estão matriculados em mais de uma disciplina.
*/

/*
9. Exibir alunos e o número de disciplinas que concluíram
Crie uma view que exiba o nome dos alunos e o número de disciplinas que eles concluíram.
*/

create view discEstatus
select aluno.nome, count(matricula.id_disciplina)
from aluno
inner join matricula on aluno.id_aluno = matricula.id_aluno
where matricula.status = 'Concluído'
group by aluno.nome;

select * from discEstatus;
    
/*
10. Exibir todas as turmas de um semestre específico
Crie uma view que exiba todas as turmas que ocorrem em um determinado semestre (ex.: 2024.1).
*/
/*
11. Exibir alunos com matrículas trancadas
Crie uma view que exiba o nome dos alunos que têm matrículas no status "Trancado".
*/

create view matricTrancada as
select aluno.nome
from aluno
inner join matricula on aluno.id_aluno = matricula.id_aluno
where matricula.status = 'Trancado';

select * from matricTrancada;

/*
12. Exibir disciplinas que não têm alunos matriculados
Crie uma view que exiba as disciplinas que não possuem alunos matriculados.
*/

create view discSEMALUNO as
select disciplina.nome
from disciplina
left join matricula on disciplina.id_disciplina = matricula.id_disciplina
where matricula.id_aluno is null;

select * from discSEMALUNO;

/*
13. Exibir a quantidade de alunos por status de matrícula
Crie uma view que exiba a quantidade de alunos para cada status de matrícula (Ativo, Concluído, Trancado).
*/

/*
14. Exibir o total de professores por especialidade
Crie uma view que exiba a quantidade de professores por especialidade (ex.: Engenharia de Software, Ciência da Computação).
*/

create view profespecial as
select professor.especialidade, count(professor.id_professor)
from professor
group by professor.especialidade;

select * from profespecial;

/*
15. Exibir lista de alunos e suas idades
Crie uma view que exiba o nome dos alunos e suas idades com base na data de nascimento.
*/
/*
16. Exibir alunos e suas últimas matrículas
Crie uma view que exiba o nome dos alunos e a data de suas últimas matrículas.
*/

create view  as
    
select * from ;

/*
17. Exibir todas as disciplinas de um curso específico
Crie uma view que exiba todas as disciplinas pertencentes a um curso específico, como "Engenharia de Software".
*/

create view CursoDisc as
select disciplina.nome
from disciplina
inner join curso on disciplina.id_curso = curso.id_curso
where curso.nome = 'Engenharia de Software';

select * from CursoDisc;

/*
18. Exibir os professores que não têm turmas
Crie uma view que exiba os professores que não estão lecionando em nenhuma turma.
*/

create view profSemSala as
select professor.nome, turma.id_professor
from professor
left join turma on professor.id_professor = turma.id_professor;

select * from profSemSala;

/*
19. Exibir lista de alunos com CPF e email
Crie uma view que exiba o nome dos alunos, CPF e email.
*/

create view alunoInfos as
select aluno.nome, aluno.cpf, aluno.email
from aluno;

select * from alunoInfos;

/*
20. Exibir o total de disciplinas por professor
Crie uma view que exiba o nome dos professores e o número de disciplinas que cada um leciona.
*/

create view profMaterias as
select professor.nome, count(turma.id_disciplina)
from professor
join turma on professor.id_professor = turma.id_professor
group by professor.nome

select * from profMaterias;
