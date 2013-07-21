{shared{
  open Eliom_lib
  open Eliom_content
}}

module Basic_link_app =
  Eliom_registration.App (
    struct
      let application_name = "basic_link"
    end)

let main_service =
  Eliom_service.service ~path:[] ~get_params:Eliom_parameter.unit ()

let alt_service =
  Eliom_service.service ~path:["alt"] ~get_params:Eliom_parameter.unit ()

let () =
  Basic_link_app.register
    ~service:main_service
    (fun () () ->
      Lwt.return
        (Eliom_tools.F.html
           ~title:"basic-link-main"
           ~css:[["css";"basic_link.css"]]
           Html5.F.(body [
             p [pcdata "main"];
             a ~service:alt_service [pcdata "alt"] ();
           ])))

let () =
  Basic_link_app.register
    ~service:alt_service
    (fun () () ->
      Lwt.return
        (Eliom_tools.F.html
           ~title:"basic-link-alt"
           ~css:[["css";"basic_link.css"]]
           Html5.F.(body [
             a ~service:main_service [pcdata "main"] ();
             p [pcdata "alt"];
           ])))
