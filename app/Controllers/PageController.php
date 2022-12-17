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
        $jobs_list = ORM::for_table('jobs')
            ->select('jobs.id')
            ->select('jobs.name')
            ->select('jobs.date')
            ->select('locations.name','id_locations')
            ->select('firm.src','id_firm')
            ->innerJoin( 'job_types', array('id_jobs','=','job'))
        ;
        $categories = ORM::for_table('categories')->raw_query('SELECT categories.id, categories.name, COUNT(jobs.id_categories) FROM categories LEFT JOIN jobs ON categories.id = jobs.id_categories GROUP BY categories.id ORDER BY COUNT(jobs.id_categories) DESC LIMIT 8')->findMany();
    //    $jobs_list = ORM::for_table('categories')->raw_query('SELECT jobs.id, jobs.name, locations.name AS l_name, job_types.name as types_name, firms.src, jobs.date FROM jobs INNER JOIN job_types ON jobs.id_job_types = job_types.id INNER JOIN locations ON locations.id = jobs.id_locations INNER JOIN firms ON firms.id = jobs.id_firm ORDER BY `jobs`.`date` DESC LIMIT 6')->findMany();

        return $renderer->render($response, "index.php", ['popular_categories' => $categories, 'jobs_list'=>$jobs_list]);
    }

    public function job_details(Request $request, Response $response, $args)
    {
        $id = $args['id'];

        $renderer = new PhpRenderer('resources');

        $job = ORM::for_table('job')->raw_query("SELECT jobs.id, jobs.name as name,jobs.description, locations.name AS l_name, job_types.name as types_name, firms.src, jobs.date, jobs.Salary FROM jobs INNER JOIN job_types ON jobs.id_job_types = job_types.id INNER JOIN locations ON locations.id = jobs.id_locations INNER JOIN firms ON firms.id = jobs.id_firm WHERE jobs.id={$id}")->findOne();

        return $renderer->render($response, "job_details.php", ['job' => $job]);

    }
}