document.addEventListener('DOMContentLoaded', function () {
    //pageConsult = new PageConsult(window);
    console.log('Cargo el tablero')
    consultarTableros();
});

function consultarTablero(id) {
    console.log('Consultar el tablero: '+id);
}

function mostrarTableros(boards) {
    let TablaLibros = document.getElementById('menuLateral');
    let texto = '<li class="nav-item nav-category">Inicio</li>';
    TablaLibros.innerHTML = '';

    for (let i = 0; i < boards.length; i++) {
        texto += ` <li class="nav-item">
        <a  class="nav-link" onclick="consultarTablero(${boards[i].idBoar})">
          <i class="link-icon" data-feather="search"></i>
          <span class="link-title">${boards[i].titleBoar}</span>
        </a>
      </li>`;
    }
    TablaLibros.innerHTML = texto;
}
function consultarTableros() {
    window.ipcRender.invoke('getDasboard').then((result) => {
        console.log(result)
        let {idBoar ,idUserBoar ,titleBoar} = result;
        console.log(idBoar);
        console.log(idUserBoar);
        console.log(titleBoar);
        idBoar = idBoar.replace(/(^_)|(_$)/g, '');
        idUserBoar = idUserBoar.replace(/(^_)|(_$)/g, '');
        titleBoar = titleBoar.replace(/(^_)|(_$)/g, '');

        idBoar = idBoar.split('_');
        idUserBoar = idUserBoar.split('_');
        titleBoar = titleBoar.split('_');
        let board = [];;
        for (let i = 0; i < idBoar.length; i++) {
            board.push({
                'idBoar': idBoar[i],
                'idUserBoar': idUserBoar[i],
                'titleBoar': titleBoar[i]
            });
        }
        mostrarTableros(board);
    });

}