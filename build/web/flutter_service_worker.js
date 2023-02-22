'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "6f16f865c93dc4601fe49b18fddcd9ff",
"index.html": "9ce7fba6bcb454d995c48ba71b0c0b33",
"/": "9ce7fba6bcb454d995c48ba71b0c0b33",
"main.dart.js": "704ef798b79749e7e0d4d47ef593b454",
"flutter.js": "1cfe996e845b3a8a33f57607e8b09ee4",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "351b6db66dcf921d02dfedffe3e2bc5a",
"assets/AssetManifest.json": "ecb3191190e005db7332447babab7c28",
"assets/NOTICES": "b3b18de57291664439e62a2dd02a3517",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/assets/images/DBZTournament.png": "b3261b245f42474a6564638bfb988a1e",
"assets/assets/images/Goku_knocked_100x12.png": "ef9e3fb912982699b4da5858ab98748c",
"assets/assets/images/arab-street.jpg": "0da37741c5079e95118fdd098c0963b6",
"assets/assets/images/Goku_knocked_100x10.png": "3a804d4285de26a10c6aa0e0ca914da6",
"assets/assets/images/Goku_knocked_debut1.png": "45f7d0a4034a0b9ec1e7a0a78292ca67",
"assets/assets/images/letters/8.png": "378976ca08e3016260db38b8b7dd160a",
"assets/assets/images/letters/9.png": "c3c4fe9ac36844c644eb7825d0da5cf8",
"assets/assets/images/letters/14.png": "42304df86d37a09da20b5148f50760d8",
"assets/assets/images/letters/28.png": "e04377801ab97f794da0f59952c3abb1",
"assets/assets/images/letters/15.png": "ec25b25bf911ae717e010a3905ffcecd",
"assets/assets/images/letters/17.png": "c6b817848e77cabf1e53ac1434947f45",
"assets/assets/images/letters/16.png": "0380f5cfa7d8a22e544625a0667f09e5",
"assets/assets/images/letters/12.png": "7f722ba439e702d42377332a6d78f470",
"assets/assets/images/letters/13.png": "e7bbe10c3c088a9154927df696e8fad7",
"assets/assets/images/letters/11.png": "a1eb3980c2ba2cf240fe6c6cdfdfb603",
"assets/assets/images/letters/10.png": "16f8277a708706177e2629d2a1cc8f16",
"assets/assets/images/letters/21.png": "4757ac764fd64f1a58637a93f912752f",
"assets/assets/images/letters/20.png": "9992e8f2f7205e7f43d2721de36910f3",
"assets/assets/images/letters/22.png": "117044ed8aff16e301af7922446748b7",
"assets/assets/images/letters/23.png": "aa13848972019407c13e49726d9e633f",
"assets/assets/images/letters/27.png": "c66ec277df68c3575518bf00c30c9e54",
"assets/assets/images/letters/26.png": "50a4d0a4fdb514663a5d71c33b2682ae",
"assets/assets/images/letters/18.png": "515087c4d30d2951640466ed809bc57f",
"assets/assets/images/letters/24.png": "9f604a3ec2a30c83bb5e9adc66b4a5a6",
"assets/assets/images/letters/25.png": "a4980566934a5fc1adaa2f7fba33d8f9",
"assets/assets/images/letters/19.png": "39e219a428681638416889e277081659",
"assets/assets/images/letters/4.png": "254772e59be6e1cb571e3d8e013e0173",
"assets/assets/images/letters/5.png": "05bb74c8602da5eee61b58d998ecafb6",
"assets/assets/images/letters/7.png": "fc639df5fabd97610154719fb1883732",
"assets/assets/images/letters/6.png": "666943b52fb06e3ce3f01cd5dcbfb731",
"assets/assets/images/letters/2.png": "a0f55d653db9f0c46cf0db295ba57288",
"assets/assets/images/letters/3.png": "ce1aeb70ee2142c7786a502f6b3b7f11",
"assets/assets/images/letters/1.png": "173228004e9e0f0b07efe89b3143daf3",
"assets/assets/images/Goku_knocked_debut2.png": "a4550528c484fe2961210d46fcc35fbb",
"assets/assets/images/Goten_knocked_100x9.png": "af8893f92ad2b9580ddc2c7006e96eef",
"assets/assets/images/DBZTournamentSunset.png": "0a941adc093f01029ea92a0dad7124cc",
"assets/assets/images/sprite_x4_Goku.png": "d8fb306b3aea1a423abb205dd2e3524f",
"assets/assets/images/Goku_knocked_100x8.png": "33e8319313b72d157c0954ea0eeae766",
"assets/assets/images/stars_original.png": "839baa9b3605e008cb4008d3be7f048a",
"assets/assets/images/explosion2_100.png": "d37fe83ad71c1f95902b64de4ec312cb",
"assets/assets/images/Goten_knocked_100.png": "4e4fe18d73e2bc49d5de79aafc576d20",
"assets/assets/images/sprite_letters.png": "945e6b704f21dd56f67750fb23090035",
"assets/assets/images/bullet0.png": "8eca41372586b4d2446c22bee1fe77f2",
"assets/assets/images/Goku_attack.png": "edcc8c9d2d53cb0544ef216703677151",
"assets/assets/images/Goten_idle_62.png": "59c89694774cd3e67be655a0a6f2ce98",
"assets/assets/images/bullet1.png": "ada182399d1daedf3309de0ddc6429a4",
"assets/assets/images/Goku_attack_100.png": "bbdea9dcfeb950f9c5c2abb76f884cf9",
"assets/assets/images/goten_attack.png": "a051bfc7ca79f816874dcffe4ba9d71f",
"assets/assets/images/Goku_idle.png": "69d2f64ae747a6b0e1fb1b3ce3a4f77c",
"assets/assets/images/Goten_idle_100.png": "0639dfe10f506613e56ff718e151e6f5",
"assets/assets/images/new_sprite_Goku.png": "3045715e224890b362d1ca4e6e641245",
"assets/assets/images/sfz2-vega-animated.gif": "874c8111100da5553be2af01510d557c",
"assets/assets/images/Goten_attack_62.png": "b6899e9fcf0693c13c357140f0baf6df",
"assets/assets/images/Goku_idle_100.png": "929f8080533973951093b8afbc144ef8",
"assets/assets/images/4.png": "844a7850354ce5361eacab7fc9e48908",
"assets/assets/images/enemy0.png": "8dfb2f04967b1156a257c05f282ff8c6",
"assets/assets/images/enemy1.png": "c21615bdf159bb87c7f3479a78b9a3f0",
"assets/assets/images/5.png": "372e23c2e6ee1182743cca11e82a8c31",
"assets/assets/images/DBZ_Goku.png": "b1d3e656763802d4385f83379997fc3b",
"assets/assets/images/fireball.png": "74e43b3947183df080095167d5e85c3f",
"assets/assets/images/DBZ_Goku2.png": "592f4fa358a1683964334b887217e071",
"assets/assets/images/DBZPlains.png": "b100f85a6148f742719a5fac4ad8fd6d",
"assets/assets/images/stars.png": "90ec597499b0a7d09940f7771ba100d9",
"assets/assets/images/2.png": "0c1e4cf4c83dc77da955cf8d76a0a67c",
"assets/assets/images/explosion.png": "81a3691935a18a30572870b759ad1683",
"assets/assets/images/3.png": "fa866b5afee122ae26213d182a903565",
"assets/assets/images/Dragon_Ball.png": "99fc1ba6071e5a5293b4292e699611b5",
"assets/assets/images/Goten_idle.png": "e5957d8c1c393881a686ba363a869358",
"assets/assets/images/feedthemonster.webp": "6916900bedb2eff4c8fb5cfbc1fe22a4",
"assets/assets/images/start.png": "2f567f890b9d6daeebcfd600dcc6b1f8",
"assets/assets/images/1.png": "d46aa50008c78045bb0e6137cd866ccc",
"assets/assets/images/player.png": "b2feeca37713e6e35e8915d1e2028ac3",
"assets/assets/images/0.png": "22e20904e150c27de1e306a480481f45",
"assets/assets/images/Goten_attack_100.png": "dd27759805c311ccb22c085aef0ba76a",
"assets/assets/audio/7.mp3": "dfaa33ecca85df28bccbd5946a9eaea3",
"assets/assets/audio/6.mp3": "02cb0236559bce8d0485613b95056202",
"assets/assets/audio/dars1.mp3": "10842b06f0e49fdc4ac338b7ef59fa00",
"assets/assets/audio/4.mp3": "0b46783cb97cc4c36c67e2bf4fc69710",
"assets/assets/audio/5.mp3": "fb995ceb5493a6f90f5f3be5e26521a7",
"assets/assets/audio/1.mp3": "806b5c0a9f873dbb11347ee61b06f79c",
"assets/assets/audio/0.mp3": "18fdd6d7d5d6c2b2f0435800faa362d8",
"assets/assets/audio/explosion.mp3": "b8c7fe4348cb5cbdccb679c145e842b1",
"assets/assets/audio/2.mp3": "fb544d39423d3226a320d9acd09e883a",
"assets/assets/audio/3.mp3": "e87cd4cfe892d03d0cad0fcb48d606f7",
"assets/assets/audio/22.mp3": "4ce62791aa09b92a2f181b50985479f1",
"assets/assets/audio/23.mp3": "ae21529216be0d8ef2f89dd8f589ce56",
"assets/assets/audio/21.mp3": "a2ca90197822262cc0092021b56d2036",
"assets/assets/audio/20.mp3": "ce0724053549cbdcab7d09f97c342174",
"assets/assets/audio/24.mp3": "5d154c953445cfa201195f6b89863569",
"assets/assets/audio/18.mp3": "181252c4536ab0bb263e8db4a607ab4e",
"assets/assets/audio/19.mp3": "f2eb64914dc845aecbf42c9951e687d0",
"assets/assets/audio/25.mp3": "b487cd59bc0fac2794ee7b4076ff1510",
"assets/assets/audio/27.mp3": "f1c38e14a42bf7c7483fe2ed3cd92fe2",
"assets/assets/audio/26.mp3": "6817f12224e2173138c44db66fb7d62d",
"assets/assets/audio/17.mp3": "e531d1d80327add12b86db5a9ddd765f",
"assets/assets/audio/16.mp3": "7d5f6b1b6415e642ee0ac954ee5b852c",
"assets/assets/audio/kamehameha.mp3": "06cf86292c22722a950e8917a9d84e80",
"assets/assets/audio/14.mp3": "3b55d7496c4303a61fa18adfdcf26ada",
"assets/assets/audio/15.mp3": "cc445be2d10bcc90b2f58ad90aaaa9b0",
"assets/assets/audio/11.mp3": "2e4c66982f9170b7f2433f4cabbc4ffa",
"assets/assets/audio/10.mp3": "b2af5ea1c1c0fce73e647a58a5732a0f",
"assets/assets/audio/basmallah.mp3": "6d257c26546330d6f7c35fe021b7ad4c",
"assets/assets/audio/12.mp3": "a9a227242423af576174842a7983fd11",
"assets/assets/audio/13.mp3": "e02bec7d9b9a0f4f063243bb5ce82642",
"assets/assets/audio/DragonBallArabicOpeningShort.mp3": "362d5898d1660d02a4c8f59cd6b260d4",
"assets/assets/audio/DragonBallArabicOpening.mp3": "543ca39928200374ee0b04c4a74dc91a",
"assets/assets/audio/8.mp3": "d6386beae901d275d61308fc1e8077ba",
"assets/assets/audio/9.mp3": "349c0c6f14ef979258ac3842979e2beb",
"assets/assets/fonts/KFGQPC%2520Uthmanic%2520Script%2520HAFS%2520Regular.otf": "43269f118299246de0cf264e04ae2680",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
