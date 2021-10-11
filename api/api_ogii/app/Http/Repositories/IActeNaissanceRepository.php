<?php

/**
 * Created by IntelliJ IDEA.
 * User: Modevbo
 * Date: 24/04/2021
 * Time: 11:56
 */

namespace App\Http\Repositories;


use App\Models\ActeNaissance;

interface IActeNaissanceRepository
{
    /**
     * @param int $page
     * @param int $page_size
     * @return mixed
     */
    function ActeNaissances($page = 0, $page_size = 10);

    /**
     * @param int $page
     * @param int $page_size
     * @return mixed
     */
    function ListesActeNaissancesEncours($page = 0, $page_size = 10);

     /**
     * @param int $page
     * @param int $page_size
     * @return mixed
     */
    function ListesActeNaissancesTraites($page = 0, $page_size = 10);

      /**
     * @param int $user_id
     * @param int $page
     * @param int $page_size
     * @return mixed
     */
    function ListesActeNaissancesEncoursUser(int $user_id,$page = 0, $page_size = 10);

    
     /**
     * @param int $user_id
     * @param int $page
     * @param int $page_size
     * @return mixed
     */
    function ListesActeNaissancesTraitesUser(int $user_id,$page = 0, $page_size = 10);

    /**
     * @param Bakery $bakery
     * @return mixed
     */
    function AddActeNaissance(ActeNaissance $acteNaissance);

    /**
     * @param int $id
     * @return mixed
     */
    function ActeNaissanceById(int $id);

    /**
     * @param int $id
     * @return mixed
     */
    function ActeById(int $id);

    /**
     * @param $id
     * @param ActeNaissance $acteNaissance
     * @return mixed
     */
    function  UpdateActe($id, ActeNaissance $acteNaissance);
}
