defmodule UserApiWeb.UserController do

    use UserApiWeb, :controller
    #siempre recibe la conexion
    def index(conn, _params) do
        conn
        |> put_status(401)
        |> text("unauth")
    end
    def show(conn, _params) do
        case UserApi.User.search(1) do
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
    def create(conn, _params) do
        conn
        |> put_status(200)
        |> text("create")
    end


end