<?php

namespace App\Http\Controllers;

use App\Http\Repositories\IActeNaissanceRepository;
use App\Models\ActeNaissance;
use App\Traits\ApiResponser;
use Illuminate\Http\Request;

class ActeNaissanceController extends Controller
{
    use ApiResponser;
    /**
     * @var IActeNaissanceRepository
     */
    private $repository;

    /**
     * BakeryController constructor.
     * @param IActeNaissanceRepository $repository
     */
    public function __construct(IActeNaissanceRepository $repository)
    {
        $this->repository = $repository;
    }

    /**
     * @param int $page
     * @param int $pagesize
     * @return \Illuminate\Http\JsonResponse
     */
    public function ActeNaissances($page = 0, $pagesize = 10)
    {
        try {
            $data = $this->repository->ActeNaissances($page, $pagesize);
            return $this->success($data, "Liste des acte de naissances");
        } catch (\Exception $ex) {
            return $this->error($ex->getMessage(), 500);
        }
    }


    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function AddActeNaissance(Request $request)
    {
        try {
            $messages = [
                'first_name.required' => 'first_name doit être obligatoire',
                'last_name.required' => 'first_name doit être obligatoire',
                'first_name_father.required' => 'first_name father doit être obligatoire',
                'last_name_father.required' => 'last_name father doit être obligatoire',
                'first_name_mother.required' => 'first_name  mother doit être obligatoire',
                'last_name_mother.required' => 'last_name mother doit être obligatoire',
                'father_job.required' =>
                'father job doit etre obligatoire',
                'mother_job.required' => 'mother job doit etre obligatoire',
                'address.required' =>
                'address doit etre obligatoire',
                'date_born.required' => 'date_born doit etre obligatoire',
                'state.required' => 'state doit etre obligatoire',
                'user_id.required' => 'user_id doit etre obligatoire',
                'commune.required' => 'commune doit etre obligatoire',
            ];
            $request->validate([
                'first_name' => 'required|string|max:255',
                'last_name' => 'required|string|max:255',
                'first_name_father' => 'required|string|max:255',
                'last_name_father' => 'required|string|max:255',
                'first_name_mother' => 'required|string|max:255',
                'last_name_mother' => 'required|string|max:255',
                'father_job' =>
                'required|string|max:255',
                'mother_job' => 'required|string|max:255',
                'address' =>
                'required|string|max:255',
                'date_born' => 'required|string|max:255',
                'commune' => 'required|string|max:255',
                'user_id' => 'required|int',
            ], $messages);
            $acte = new ActeNaissance();
            $acte->commune = $request->commune;
            $acte->user_id = $request->user_id;
            $acte->first_name = $request->first_name;
            $acte->last_name = $request->last_name;
            $acte->first_name_father = $request->first_name_father;
            $acte->last_name_father = $request->last_name_father;
            $acte->first_name_mother = $request->first_name_mother;
            $acte->last_name_mother = $request->last_name_mother;
            $acte->father_job = $request->father_job;
            $acte->mother_job = $request->mother_job;
            $acte->date_born = $request->date_born;
            $acte->address = $request->address;
            $acte->state = 0;
            $acte = $this->repository->AddActeNaissance($acte);
            return $this->success($acte, "Acte de naissance créée avec succès");
        } catch (\Illuminate\Validation\ValidationException $ex) {
            return $this->error($ex->getMessage(), 500, $ex->validator->errors()->toArray(),);
        } catch (\Exception $ex) {
            return $this->error($ex->getMessage(), 500);
        }
    }
    public function UpdateActe($id, Request $request)
    {
        try{
            $messages = [
                'first_name.required' => 'first_name doit être obligatoire',
                'last_name.required' => 'first_name doit être obligatoire',
                'first_name_father.required' => 'first_name father doit être obligatoire',
                'last_name_father.required' => 'last_name father doit être obligatoire',
                'first_name_mother.required' => 'first_name  mother doit être obligatoire',
                'last_name_mother.required' => 'last_name mother doit être obligatoire',
                'father_job.required' =>
                'father job doit etre obligatoire',
                'mother_job.required' => 'mother job doit etre obligatoire',
                'address.required' =>
                'address doit etre obligatoire',
                'date_born.required' => 'date_born doit etre obligatoire',
                'state.required' => 'state doit etre obligatoire',
                'user_id.required' => 'user_id doit etre obligatoire',
                'commune.required' => 'commune doit etre obligatoire',
            ];
            $request->validate([
                'first_name' => 'required|string|max:255',
                'last_name' => 'required|string|max:255',
                'first_name_father' => 'required|string|max:255',
                'last_name_father' => 'required|string|max:255',
                'first_name_mother' => 'required|string|max:255',
                'last_name_mother' => 'required|string|max:255',
                'father_job' =>
                'required|string|max:255',
                'mother_job' => 'required|string|max:255',
                'address' =>
                'required|string|max:255',
                'date_born' => 'required|string|max:255',
                'commune' => 'required|string|max:255',
                'user_id' => 'required|int',
            ], $messages);
            $acte = new ActeNaissance();
            $acte->commune = $request->commune;
            $acte->user_id = $request->user_id;
            $acte->first_name = $request->first_name;
            $acte->last_name = $request->last_name;
            $acte->first_name_father = $request->first_name_father;
            $acte->last_name_father = $request->last_name_father;
            $acte->first_name_mother = $request->first_name_mother;
            $acte->last_name_mother = $request->last_name_mother;
            $acte->father_job = $request->father_job;
            $acte->mother_job = $request->mother_job;
            $acte->date_born = $request->date_born;
            $acte->address = $request->address;
            $acte->state = 1;
            $acte= $this->repository->UpdateActe($id,$acte);
            return $this->success($acte,"Acte de naissance mise à jour : $acte->name");
        } catch (\Illuminate\Validation\ValidationException $ex) {
            return $this->error($ex->getMessage(), 500, $ex->validator->errors()->toArray(),);
        } catch (\Exception $ex) {
            return $this->error($ex->getMessage(), 500);
        }
    }

    public function GetActeNaissanceById($id)
    {
        try {
            $acte = $this->repository->ActeNaissanceById($id);
            if (!$acte) {
                throw new \Exception("Aucun Acte de Naissance");
            }
            return $this->success($acte, "Acte : $acte->name");
        } catch (\Exception $ex) {
            return $this->error($ex->getMessage(), 500);
        }
    }

    public function GetListesActeNaissanceEncoursUser(int $user_id,$page = 0, $pageSize = 10)
    {
        try {
            $acte = $this->repository->ListesActeNaissancesEncoursUser($user_id,$page, $pageSize);
            if (!$acte) {
                throw new \Exception("Aucun Acte de Naissance");
            }
            return $this->success($acte, "Liste des actes En cours  ");
        } catch (\Exception $ex) {
            return $this->error($ex->getMessage(), 500);
        }
    }

    public function GetListesActeNaissanceTraitesUser(int $user_id,$page = 0, $pageSize = 10)
    {
        try {
            $acte = $this->repository->ListesActeNaissancesTraitesUser($user_id,$page, $pageSize);
            if (!$acte) {
                throw new \Exception("Aucun Acte de Naissance");
            }
            return $this->success($acte, "Liste des actes");
        } catch (\Exception $ex) {
            return $this->error($ex->getMessage(), 500);
        }
    }

    public function GetListeActeNaissanceEncours()
    {
        try {
            $acte = $this->repository->ListesActeNaissancesEncours();
            if (!$acte) {
                throw new \Exception("Aucun Acte de Naissance");
            }
            return $this->success($acte, "Liste des actes en cours ");
        } catch (\Exception $ex) {
            return $this->error($ex->getMessage(), 500);
        }
    }

    public function GetListeActeNaissanceTraites()
    {
        try {
            $acte = $this->repository->ListesActeNaissancesTraites();
            if (!$acte) {
                throw new \Exception("Aucun Acte de Naissance");
            }
            return $this->success($acte, "Liste des actes traités :");
        } catch (\Exception $ex) {
            return $this->error($ex->getMessage(), 500);
        }
    }
}
