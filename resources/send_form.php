<!-- форма для отправки на почту и в базу -->
<?php
/** @var PDO $db */
$db = require '../db.php';

$id = $_POST['id'];
$name = $_POST['name'];
$email = $_POST['email'];
$link_p = $_POST['link_p'];
$coverletter = $_POST['coverletter'];

$jobs=$db->query("SELECT natures.id, natures.name as natures_name, jobs.id as id_job,jobs.name as name_job,jobs.category_id, jobs.company_id,jobs.location,jobs.publication,jobs.vacancy,jobs.salary
    FROM jobs
    INNER JOIN natures ON jobs.nature_id=natures.id WHERE jobs.id={$id}")->fetch(PDO::FETCH_ASSOC);

$message = "ФИО: $name \r\nPorfolio link: $link_p \r\nCoverletter: $coverletter \r\nJob: $jobs[name_job]";


$db->query("INSERT INTO forms (name ,email, link_p, coverletter, job_id) VALUES ('{$name}','{$email}','{$link_p}','{$coverletter}','{$id}')");
mail('example.1@mail.ru', 'Заявка на работу', $message, "From: $email");
header('Location: ../index.php');