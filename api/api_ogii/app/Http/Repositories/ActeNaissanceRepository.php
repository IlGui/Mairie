<?php



namespace App\Http\Repositories;


use App\Models\ActeNaissance;

class ActeNaissanceRepository implements IActeNaissanceRepository
{

    /**
     * @param int $page
     * @param int $page_size
     * @return mixed
     */
    function ActeNaissances($page = 0, $page_size = 10)
    {
        $acteNaissances = ActeNaissance::all()->skip($page)->take($page_size);
        return $acteNaissances;
    }

    /**
     * @param int $id
     * @return mixed
     */
    function ActeById(int $id)
    {
        return ActeNaissance::find($id);
    }

    /**
     * @param $id
     * @param ActeNaissance $acteNaissance
     * @return mixed
     * @throws \Exception
     */
    function UpdateActe($id, ActeNaissance $acteNaissance)
    {
        // TODO: Implement UpdateBakery() method.
        $acte = $this->ActeById($id);
        if($acte){
            
            $acte->commune = $acteNaissance->commune;
            $acte->user_id = $acteNaissance->user_id;
            $acte->first_name = $acteNaissance->first_name;
            $acte->last_name = $acteNaissance->last_name;
            $acte->first_name_father = $acteNaissance->first_name_father;
            $acte->last_name_father = $acteNaissance->last_name_father;
            $acte->first_name_mother = $acteNaissance->first_name_mother;
            $acte->last_name_mother = $acteNaissance->last_name_mother;
            $acte->father_job = $acteNaissance->father_job;
            $acte->mother_job = $acteNaissance->mother_job;
            $acte->date_born = $acteNaissance->date_born;
            $acte->address = $acteNaissance->address;
            $acte->state = 1;
            $acte->save();
            return $acte;
        }
        throw new \Exception("No data found");
    }


     /**
     * @param int $page
     * @param int $page_size
     * @return mixed
     */
    function ListesActeNaissances($page = 0, $page_size = 10)
    {
        $acteNaissances = ActeNaissance::all()->skip($page)->take($page_size);
        return $acteNaissances;
    }

      /**
     * @param int $page
     * @param int $page_size
     * @return mixed
     */
    function ListesActeNaissancesEnCours($page = 0, $page_size = 10)
    {
        $acteNaissances = ActeNaissance::where('state', 0)->skip($page)->take($page_size)->get();
        return $acteNaissances;
    }

    /**
     * @param int $user_id
     * @param int $page
     * @param int $page_size
     * @return mixed
     */
    function ListesActeNaissancesEncoursUser(int $user_id,$page = 0, $page_size = 10)
    {
        $acteNaissances = ActeNaissance::where([['state','=',0],['user_id','=', $user_id]])->skip($page)->take($page_size)->get();
        return $acteNaissances;
    }

    /**
     * @param int $page
     * @param int $page_size
     * @return mixed
     */
    function ListesActeNaissancesTraites($page = 0, $page_size = 10)
    {
        $acteNaissances = ActeNaissance::where('state', 1)->skip($page)->take($page_size)->get();
        return $acteNaissances;
    }

     /**
     * @param int $user_id
     * @param int $page
     * @param int $page_size
     * @return mixed
     */
    function ListesActeNaissancesTraitesUser(int $user_id,$page = 0, $page_size = 10)
    {
        $acteNaissances = ActeNaissance::where([['state','=',1],['user_id','=', $user_id]])->skip($page)->take($page_size)->get();
        return $acteNaissances;
    }       

    /**
     * @param ActeNaissance $acteNaissance
     * @return mixed
     */
    function AddActeNaissance(ActeNaissance $acteNaissance)
    {
        return ActeNaissance::create($acteNaissance->toArray());
    }

    /**
     * @param int $id
     * @return mixed
     */
    function ActeNaissanceById(int $id)
    {
        return ActeNaissance::find($id);
    }
}
