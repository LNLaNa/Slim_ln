<?php

namespace App\Controllers;

use ORM;
use Slim\Psr7\Request;
use Slim\Psr7\Response;
use Slim\Views\PhpRenderer;

class PageController
{
    public function index(Request $request, Response $response, $args)
    {
        $renderer = new PhpRenderer('resources');
//        $categories = ORM::for_table('categories')
//            ->raw_join(
//                'LEFT JOIN jobs GROUP BY categories.id',
//                ['categories.id', '=', 'jobs.id_categories'],
//                'categories'
//            )
//            ->groupBy('categories.id')
//            ->orderByExpr('count(jobs.id_categories)')
//            ->limit(6)
//              ->findMany();

        $categories = ORM::for_table('categories')->raw_query('SELECT categories.id, categories.name, COUNT(jobs.category_id) 
    FROM categories LEFT JOIN jobs ON category_id = categories.id GROUP BY categories.id ORDER BY COUNT(jobs.category_id) DESC LIMIT 8')->findMany();
        $companies = ORM::for_table('companies')->raw_query('SELECT companies.id, companies.name,companies.logo, COUNT(jobs.company_id) 
    FROM companies LEFT JOIN jobs ON company_id = companies.id GROUP BY companies.id ORDER BY COUNT(jobs.company_id) DESC LIMIT 4')->findMany();

//        $jobs = ORM::for_table('jobs')->raw_query('SELECT natures.id, companies.logo, natures.name as natures_name, jobs.id,jobs.name,jobs.category_id, jobs.company_id,jobs.location,jobs.publication
//    FROM jobs INNER JOIN natures ON jobs.nature_id=natures.id
//              INNER JOIN companies ON jobs.company_id=companies.id')->findMany();
        $jobs = ORM::for_table('jobs')
            ->select('jobs.id')
            ->select('natures.id')
            ->select('natures.name','natures_name')
            ->select('companies.logo')
            ->select('jobs.name')
            ->select('jobs.category_id')
            ->select('jobs.company_id')
            ->select('jobs.location')
            ->select('jobs.publication')
            ->innerJoin('natures',array('jobs.nature_id','=','natures.id'))
            ->innerJoin('companies',array('jobs.company_id','=','companies.id'))
            ->findMany();

    //    $jobs_list = ORM::for_table('categories')->raw_query('SELECT jobs.id, jobs.name, locations.name AS l_name, job_types.name as types_name, firms.src, jobs.date FROM jobs INNER JOIN job_types ON jobs.id_job_types = job_types.id INNER JOIN locations ON locations.id = jobs.id_locations INNER JOIN firms ON firms.id = jobs.id_firm ORDER BY `jobs`.`date` DESC LIMIT 6')->findMany();

        return $renderer->render($response, "index.php", ['categories' => $categories,'companies' => $companies, 'jobs'=>$jobs]);
    }

    public function job_details(Request $request, Response $response, $args)
    {
        $id = $args['id'];

        $renderer = new PhpRenderer('resources');

//        $jobs = ORM::for_table('jobs')->raw_query("SELECT natures.id, natures.name as natures_name, companies.logo,jobs.id as id_job,jobs.name as name_job,
//          jobs.category_id, jobs.company_id,jobs.location,jobs.publication,jobs.vacancy,jobs.salary
//    FROM jobs
//    INNER JOIN companies ON jobs.company_id=companies.id
//    INNER JOIN natures ON jobs.nature_id=natures.id WHERE jobs.id={$id}")->findOne();
        $jobs = ORM::for_table('jobs')
            ->select('jobs.id','id_job')
            ->select('natures.id')
            ->select('natures.name','natures_name')
            ->select('companies.logo')
            ->select('jobs.name','name_job')
            ->select('jobs.category_id')
            ->select('jobs.company_id')
            ->select('jobs.location')
            ->select('jobs.publication')
            ->select('jobs.vacancy')
            ->select('jobs.salary')
            ->innerJoin('natures',array('jobs.nature_id','=','natures.id'))
            ->innerJoin('companies',array('jobs.company_id','=','companies.id'))
            ->where('jobs.id',[$id])
            ->findOne();

        return $renderer->render($response, "job_details.php", ['jobs' => $jobs]);
    }

    public function jobs(Request $request, Response $response, $args)
    {
        $id = $args['id'];

        $renderer = new PhpRenderer('resources');

//        $jobs = ORM::for_table('jobs')->raw_query("SELECT natures.id, natures.name as natures_name, companies.logo,jobs.id as id_job,jobs.name as name_job,
//          jobs.category_id, jobs.company_id,jobs.location,jobs.publication,jobs.vacancy,jobs.salary
//    FROM jobs
//    INNER JOIN companies ON jobs.company_id=companies.id
//    INNER JOIN natures ON jobs.nature_id=natures.id WHERE jobs.id={$id}")->findOne();
        $jobs = ORM::for_table('jobs')
            ->select('jobs.id','id_job')
            ->select('natures.id')
            ->select('natures.name','natures_name')
            ->select('companies.logo')
            ->select('jobs.name','name_job')
            ->select('jobs.category_id')
            ->select('jobs.company_id')
            ->select('jobs.location')
            ->select('jobs.publication')
            ->select('jobs.vacancy')
            ->select('jobs.salary')
            ->innerJoin('natures',array('jobs.nature_id','=','natures.id'))
            ->innerJoin('companies',array('jobs.company_id','=','companies.id'))
            ->where('jobs.id',[$id])
            ->findOne();

        return $renderer->render($response, "job_details.php", ['jobs' => $jobs]);
    }

    public function footer(Request $request, Response $response, $args)
    {
        $renderer = new PhpRenderer('resources');

//      $categories = ORM::for_table('categories')->raw_query("SELECT * FROM categories")->findMany();
        $categories = ORM::for_table('categories')->findMany();

        return $renderer->render($response, "/parts/footer_category.php", ['categories' => $categories]);
    }
}