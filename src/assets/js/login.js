let email = document.getElementById('inputEmail');
let password = document.getElementById('inputPassword');
let btnLogin = document.getElementById('btnLogin');
let error = document.getElementById('notificacion');

btnLogin.addEventListener('click', () => {
    Swal.fire({
        position: "top-end",
        icon: "success",
        title: "Your work has been saved",
        showConfirmButton: false,
        timer: 1500
      });
    validarLogin();
});

const errorLogin = () => {
    error.innerHTML = 'Correo electrónico o contraseña equivocada.';
    error.classList.remove('text-muted');
    error.classList.add('text-danger');

    email.value = '';
    password.value = '';
    email.focus();
}

function validarLogin() {
    if(email.value.trim().length == 0){
        error.innerHTML = 'Ingresá tú dirección de correo electrónico.';
        error.classList.remove('text-muted');
        error.classList.add('text-danger');
    }else if(password.value.trim().length == 0){
        error.innerHTML = 'Ingresá tú contraseña.';
        error.classList.remove('text-muted');
        error.classList.add('text-danger');
    }else{
        const data = { email: email.value, password: password.value };

        window.ipcRender.send('login', data);

        setTimeout(errorLogin, 3000);
    }
}