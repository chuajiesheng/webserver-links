{shared{
  open Eliom_lib
  open Eliom_content
}}

module Basic-link_app =
  Eliom_registration.App (
    struct
      let application_name = "basic-link"
    end)

let main_service =
  Eliom_service.service ~path:[] ~get_params:Eliom_parameter.unit ()

let () =
  Basic-link_app.register
    ~service:main_service
    (fun () () ->
      Lwt.return
        (Eliom_tools.F.html
           ~title:"basic-link"
           ~css:[["css";"basic-link.css"]]
           Html5.F.(body [
             h2 [pcdata "Welcome from Eliom's destillery!"];
           ])))
