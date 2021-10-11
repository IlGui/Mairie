<?php

namespace App\Http\Controllers;


use App\Models\User;
use App\Traits\ApiResponser;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;


class AuthController extends Controller
{
    use ApiResponser;

    public function register(Request $request)
    {
        try {
            $attr = $request->validate([
                'first_name' => 'required|string|max:255',
                'last_name' => 'required|string|max:255',
                'email' => 'required|string|email|unique:users,email',
                'phone' => 'required|numeric|min:8|unique:users,phone',
                'password' => 'required|string|min:4|confirmed',
                'role_id' => 'int'
            ]);
            $user = User::create([
                'first_name' => $attr['first_name'],
                'last_name' => $attr['last_name'],
                'password' => bcrypt($attr['password']),
                'email' => $attr['email'],
                'phone' => $attr['phone'],
                'state' => 1,
                'role_id' => $attr['role_id']
            ]);


            return $this->success($user, "utilisateur crée avec succes");
        } catch (\Illuminate\Validation\ValidationException $ex) {
            return $this->error($ex->getMessage(), 500, $ex->validator->errors()->toArray(),);
        } catch (\Exception $exception) {
            return $this->error($exception->getMessage(), 500, $request->toArray());
        }
    }

    public function login(Request $request)
    {
        try {
            $attr = $request->validate([
                'phone' => 'required|numeric|min:8|',
                'password' => 'required|string|min:4'
            ]);
            //$user = User::where("phone",$attr['phone'])->first();
            //dd($attr);
            if (!Auth::attempt($attr)) {
                return $this->error('Credentials not match', 401);
            }

            return $this->success(
                [
                    'token' => auth()->user()->createToken('API Token')->plainTextToken
                ],
                "Utilisateur connecté avec succès."
            );
        } catch (\Exception $exception) {
            return $this->error($exception->getMessage(), 500, $request->toArray());
        }
    }

    /**
     *
     */
    public function CurrentUser(Request $request)
    {
        try {
            return $this->success(auth()->user(), "Current user.");
        } catch (\Exception $exception) {
            return $this->error($exception->getMessage(), 500, $request->toArray());
        }
    }
    function Users($page = 0, $page_size = 10)
    {
        $users = User::where('state', 1)->skip($page)->take($page_size)->get();
 return $this->success($users, "Liste des utilisateurs");;
    }
    /**
     * @return array
     */
    public function logout()
    {
        auth()->user()->tokens()->delete();

        return [
            'message' => 'Tokens Revoked'
        ];
    }
    /**
     * Update the authenticated user's API token.
     *
     * @param \Illuminate\Http\Request $request
     * @return array
     */
    public function update(Request $request)
    {
        $token = Str::random(60);

        $request->user()->forceFill([
            'api_token' => hash('sha256', $token),
        ])->save();

        return ['token' => $token];
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function refresh(Request $request)
    {
        try {
            $user = $request->user();
            $user->tokens()->delete();
            return response()->json(['token' => $user->createToken($user->first_name)->plainTextToken]);
        } catch (\Exception $exception) {
            return $this->error($exception->getMessage(), 500, $request->toArray());
        }
    }
}
