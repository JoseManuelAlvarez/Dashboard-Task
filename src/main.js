const electronApp = require('electron').app;
const electronBrowserWindow = require('electron').BrowserWindow;
const electronIpcMain = require('electron').ipcMain;
const Store = require('electron-store');
const store = new Store();
const path = require('path');
const db = require('./db/connection');

// Handle creating/removing shortcuts on Windows when installing/uninstalling.
if (require('electron-squirrel-startup')) {
    // eslint-disable-line global-require
    electronApp.quit();
  }
  
  let window;
  let loginWindow;

  const createWindowDashboard = () => {
    // Create the browser window.
    window = new electronBrowserWindow({
      icon: __dirname + '/assets/img/icono.ico',
      width: 900,
      height: 600,
      autoHideMenuBar: true,
      webPreferences: {
        nodeIntegration: true,
        contextIsolation: true,
        devTools: true,
        preload: path.join(__dirname, 'preload.js')
      }
    });
    // and load the dashboard.html of the app.
    window.loadFile(path.join(__dirname, 'views/dashboard.html'));
    window.webContents.openDevTools();
  };

  const createLogin = () => {
    // Create the browser window.
    loginWindow = new electronBrowserWindow({
      icon: __dirname + '/assets/img/icono.ico',
      width: 500,
      height: 470,
      resizable: false,
      maximizable: false,
      autoHideMenuBar: true,
      webPreferences: {
        nodeIntegration: true,
        contextIsolation: true,
        devTools: true,
        preload: path.join(__dirname, 'preload.js')
      }
    });
    // and load the login.html of the app.
    loginWindow.loadFile(path.join(__dirname, 'views/login.html'));
  };

  // ####################################  ELEMENTOS DE COMUNICACIONES  
  electronIpcMain.on('login', (event, data) => {
    const { email, password } = data;
    const sql = 'SELECT * FROM `users` WHERE `emailUser` =? AND `passwordUser`=?';
    db.query(sql, [email, password], (error, results, fields) => {
      if (error) {
        console.log(error);
      }
      if (results.length > 0) {
        store.set('id', results[0].idUser);
        store.set('user', results[0].nameUser);
        store.set('email', results[0].emailUser);
        store.set('token', results[0].tokenUser);
        store.set('image', '');
        createWindowDashboard();
        window.loadFile(path.join(__dirname, 'views/dashboard.html'));
        window.maximize();
        window.show();
        loginWindow.close();
      }
    });
  });

  electronIpcMain.handle('getDasboard', (event) => {
    const sql = 'SELECT * FROM `board` WHERE `idUserBoar` =?';
//    db.query(sql, [store.get('id')], (error, results, fields) => {
  db.query(sql, 1, (error, results, fields) => {
      if (error) {
        console.log(error);
      }
      console.log('Se encontro informacion')
      console.log(results)
      let 
      idBoar = '', 
      idUserBoar = '', 
      titleBoar = '', 
      descriptionBoar = '', 
      backgroundColoBoar = '', 
      createdAtBoar = '', 
      updatedAtBoar = '';
      if(results.length > 0) {
        for (board of results) {

          idBoar += board.idBoar+'_';
          idUserBoar += board.idUserBoar+'_';
          titleBoar += board.titleBoar+'_';
          /*descriptionBoar += board.descriptionBoar+'_';
          backgroundColoBoar += board.backgroundColoBoar+'_';
          createdAtBoar += board.createdAtBoar+'_';
          updatedAtBoar += board.updatedAtBoar+'_';
          */
        }
      }
      console.log(idBoar)
      console.log(titleBoar)
      store.set('idBoar', idBoar);
      store.set('idUserBoar', idUserBoar);
      store.set('titleBoar', titleBoar);
    });
    const data = { idBoar: store.get('idBoar'), idUserBoar: store.get('idUserBoar'), titleBoar: store.get('titleBoar')};
    return data;
  });


  //electronApp.on('ready', createLogin);
  electronApp.on('ready', createWindowDashboard);

  electronApp.on('window-all-closed', () => {
    if (process.platform !== 'darwin') {
      electronApp.quit();
    }
  });
