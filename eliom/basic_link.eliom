{shared{
  open Eliom_lib
  open Eliom_content
}}

module Basic_link_app =
  Eliom_registration.App (
    struct
      let application_name = "basic_link"
    end)

let hello_service =
  Eliom_service.service
    ~path:["hello"]
    ~get_params:Eliom_parameter.unit ()

let world_service =
  Eliom_service.service
    ~path:["world"]
    ~get_params:Eliom_parameter.unit ()

let parameter_service =
  Eliom_service.service
    ~path:["para"]
    ~get_params:Eliom_parameter.(string "input") ()

let () =
  Basic_link_app.register
    ~service:hello_service
    (fun () () ->
      Lwt.return
        (Eliom_tools.F.html
           ~title:"basic-link-hello"
           ~css:[["css";"basic_link.css"]]
           Html5.F.(body [
             p [pcdata "hello"];
             p [a ~service:world_service [pcdata "world"] ()];
             p [a ~service:parameter_service [pcdata "parameter"] ("custom")];
           ])))

let () =
  Basic_link_app.register
    ~service:world_service
    (fun () () ->
      Lwt.return
        (Eliom_tools.F.html
           ~title:"basic-link-world"
           ~css:[["css";"basic_link.css"]]
           Html5.F.(body [
             p [a ~service:hello_service [pcdata "hello"] ()];
             p [pcdata "world"];
             p [a ~service:parameter_service [pcdata "parameter"] ("custom2")];
           ])))

let () =
  Basic_link_app.register
    ~service:parameter_service
    (fun str () ->
      Lwt.return
        (Eliom_tools.F.html
           ~title:"basic-link-parameter"
           ~css:[["css";"basic_link.css"]]
           Html5.F.(body [
             p [a ~service:hello_service [pcdata "hello"] ()];
             p [a ~service:world_service [pcdata "world"] ()];
             p [strong [pcdata str]];
           ])))
