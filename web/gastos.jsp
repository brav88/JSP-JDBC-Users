<%-- 
    Document   : gastos
    Created on : 2 nov. 2022, 18:30:45
    Author     : Samuel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gastos</title>        
    </head>
    <body>
        <div class="container" style="margin-top:5%">
            <div class="card" style="width: 45rem;">
                <div class="card-header">
                    Gastos
                </div>
                <div class="card-body">                    
                    <div class="form-floating mb-3">
                        <input name="txtDesc" type="text" class="form-control" id="txtDesc" placeholder="" required>
                        <label for="txtDesc">Descripcion</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input name="txtMonto" type="number" class="form-control" id="txtMonto" placeholder="" required>
                        <label for="txtMonto">Monto</label>
                    </div>                                       
                    <hr>
                    <button onclick="Guardar()" class="btn btn-primary" style="float: right">Guardar</button>                    
                </div>
                <div class="card-footer">    
                    <ol id="olGastos" class="list-group list-group-numbered">                        
                    </ol>
                </div>
            </div>
        </div>        
    </body>
    <script type="text/javascript">

        function Guardar() {

            debugger;

            const olGastos = document.querySelector("#olGastos");
            const txtDesc = document.querySelector("#txtDesc");
            const txtMonto = document.querySelector("#txtMonto");

            olGastos.innerHTML = olGastos.innerHTML + "<li class='list-group-item'>" + txtDesc.value + " - ₡" + txtMonto.value + "</li>";
        }
    </script>          
</html>
