importScripts('https://www.gstatic.com/firebasejs/8.4.1/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/8.4.1/firebase-messaging.js');

   /*Update with yours config*/
  const firebaseConfig = {
      apiKey: "AIzaSyA1FevAEUfg7u_tmhjPKGLJfVFBiQaghCY",
      authDomain: "petmonitoringsystem-729da.firebaseapp.com",
      projectId: "petmonitoringsystem-729da",
      storageBucket: "petmonitoringsystem-729da.appspot.com",
      messagingSenderId: "218937674834",
      appId: "1:218937674834:web:2961695e7663494adb638b",
      measurementId: "G-D4TRM99C0G"
 };
  firebase.initializeApp(firebaseConfig);
  const messaging = firebase.messaging();

  /*messaging.onMessage((payload) => {
  console.log('Message received. ', payload);*/
  messaging.onBackgroundMessage(function(payload) {
    console.log('Received background message ', payload);

    const notificationTitle = payload.notification.title;
    const notificationOptions = {
      body: payload.notification.body,
    };

    self.registration.showNotification(notificationTitle,
      notificationOptions);
  });