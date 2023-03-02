importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js");

firebase.initializeApp({
  apiKey: "AIzaSyAcW89NhOcQtJYxukPnHkf2WrvscROttq0",
  projectId: "tercuman-bulmaca",
  storageBucket: "tercuman-bulmaca.appspot.com",
  messagingSenderId: "904450609059",
  appId: "1:904450609059:web:b4dba8b2d75c266ec35416",
});

const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((message) => {
  console.log("onBackgroundMessage", message);
});