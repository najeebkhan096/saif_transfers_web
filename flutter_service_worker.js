'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "011bf49a299fa5e0e7f269a085df05d5",
"version.json": "44d00040c39e47205393b4fa035870af",
"index.html": "a0ab28358f5069d657e4396c0b4ed54c",
"/": "a0ab28358f5069d657e4396c0b4ed54c",
"main.dart.js": "768b12c214d13da4666b520631dafa7f",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "24c9a0e82025dc21aa7123067df87dcb",
"assets/images/nla.png": "6a1b6a7facd462080194ad915cee409b",
"assets/images/paris.png": "ec6b627875e041183346f0ef3bddc395",
"assets/images/landing/learn_more.png": "e6ac5a5ebcdc07f32e630f8f747eb6f9",
"assets/images/landing/sprinter.png": "dfea46a7809e0285ce02bd313b4d9443",
"assets/images/landing/banner.png": "4827e279af7c0d91d4a8208311b282a7",
"assets/images/landing/showcase.png": "7bcdf960a7ea38694150214a769f55a5",
"assets/images/landing/luggage.png": "cc9a32448a280c7952d9ef5243537274",
"assets/images/landing/like.png": "54e3d20f35ecd91312d759f4d9adf800",
"assets/images/landing/audi.png": "3fff5646325495d2d9a98af8eb28712e",
"assets/images/landing/airport_transfers.png": "d45572ae177e9521b1bc5827affd2d76",
"assets/images/landing/showcaseBanner.png": "87e1b9d4d29c5eb0138852a7fab15631",
"assets/images/landing/route.png": "dc4e204af6a287c6f9ca31d461fc5d87",
"assets/images/landing/luxury_class.png": "2925d4385c6e69e2da38ab4a07e97b50",
"assets/images/landing/passenger.png": "8e79eb6d3c7e38696bd6295139b86e49",
"assets/images/landing/bmw.png": "5ac1b4b765191296936c7ea418281e4a",
"assets/images/landing/background_car.png": "c946831d9277703994ce576b0ec38730",
"assets/images/landing/electric_class.png": "0a6cda386d723b4af94ab79e6c968c01",
"assets/images/landing/vehicle.png": "6a137ca9c5a24d0382e966b999aa185c",
"assets/images/americanCard.png": "5bce7e0ad305ecf9d9e03bcc80a11e0f",
"assets/images/air.png": "d51a34f1882da19ab8d04416092f48bb",
"assets/images/time.png": "665b149c89d7772637160e0c3efe69df",
"assets/images/london.png": "77729929e2cb3c19fc709f04fdb01c81",
"assets/images/auth_banner.png": "9dee6e850b48a8d3235f8157038a27b0",
"assets/images/pickup_location_icon.png": "93b7ebd268b81e90b722d46ac6ff77da",
"assets/images/eba.png": "40cefff46f3a1747ef06c3f373332d93",
"assets/images/img.png": "819dfa0ceb7ca7fbc8925b81de0498bb",
"assets/images/date.png": "665b149c89d7772637160e0c3efe69df",
"assets/images/logo.png": "dee52781c6308e019bc798b87bf84405",
"assets/images/addIcon.png": "4e5d6d41daa85dd296a009fdbe19a099",
"assets/images/cars/business_class.png": "98587c7fa0b80dd9256f34f73c5a51d5",
"assets/images/cars/business_van.png": "619801757d85603d6010ae3168321135",
"assets/images/cars/first_class.png": "912ee8c4f44ef9beea9f8c6b3b36a00d",
"assets/images/cars/electric_class.png": "3ea09e7e4f11a94e7908272cbcd7d665",
"assets/images/download_banner.png": "173d38f38824a6b8910c493b73ead1dc",
"assets/images/delete.png": "14961053cdd924d3409781f2e89c81bd",
"assets/images/edit.png": "c8c68a10c798ff8fdcaea76cea51d3d2",
"assets/images/visacard.png": "b3bdf8a3ed0db3c0e304b3ba863309ca",
"assets/images/nav/dashboard.png": "1f4dec55a874391811db69d6aebc0e36",
"assets/images/nav/settings.png": "74be739989d48a2c696f83d7121c6ea1",
"assets/images/nav/bookings.png": "560a2289020d9602dd44eb7c3bb0c3ac",
"assets/images/nav/drivers.png": "fa379c32c4268f600b027d4283d92b41",
"assets/images/nav/clients.png": "997a01dd611b758517d6f106c0af9c86",
"assets/images/nba.png": "a0897b7f1c1a0116318226b6520828fe",
"assets/images/image_not_found.png": "d0c3423b936ecd44ec2c0d2d698e7269",
"assets/images/drop_location.png": "767908715cfd618ad837a4d0300b8306",
"assets/images/mastercard.png": "d73c79b28ce32a9d484180524d8b00c3",
"assets/images/google.png": "02085cb2d6d39535a4309e7b71f40c2a",
"assets/images/istanbul.png": "9c77b763207dbc8f2f4c6eda952b8eff",
"assets/images/message.png": "8a7adbf646aaee7c660024a58b7c611c",
"assets/images/live.png": "e896a43e4b3828a553f629000fb1f98d",
"assets/AssetManifest.json": "7462dd84185a61c6a8e5c524a0bf3408",
"assets/NOTICES": "7bf1ac204949287479bc18c72b51f516",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "b96815be8ae3cf79a0e53fb42683b316",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "32f064a292479b5cde09d4bfa3c25aaf",
"assets/fonts/MaterialIcons-Regular.otf": "30239543f3a1781e534184714b95ded7",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
