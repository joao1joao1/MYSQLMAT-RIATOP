-- 1. Exibir lista de alunos e seus cursos
-- Crie uma view que mostre o nome dos alunos e as disciplinas em que estão matriculados, incluindo o nome do curso.

create view listaAlunos as
select aluno.nome, disciplina.nome, curso.nome
from aluno al
left join matricula mt on al.id_aluno = matricula.id_aluno
left join disciplina dsc on mt.id_disciplina = dsc.id_disciplina
left join curso on dsc.id_curso = curso.id_curso;

select * from listaAlunos;
