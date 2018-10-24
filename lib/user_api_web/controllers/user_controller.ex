defmodule UserApiWeb.UserController do

    use UserApiWeb, :controller
    #siempre recibe la conexion
    def index(conn, _params) do
        conn
        |> put_status(401)
        |> text("unauth")
    end
    def show(conn, %{"id" => user_id}) do
        IO.inspect(self()) #me devuelve el pid de donde se esta ejecutando todo ese codigo
        
        case UserApi.User.search(user_id) do
            nil -> 
                conn
                |> put_status(404)
                |> text("Error!!")
            user ->
                conn
                |> put_status(200)
                |> text("Exito!!")
        end
    end
    def create(conn, params) do
        changeset = UserApi.User.create_changeset(%UserApi.User{}, params)
        case changeset.valid? do
            true ->
                user = UserApi.Repo.insert!(changeset) #! si falla lanza una exception
                conn
                |> put_status(200)
                |> text("Elemento insertado")
                false ->
                    conn
                    |> put_state(400)
                    |> text("Error en los datos")
        end
        conn
        |> put_status(200)
        |> text("create")
    end


end