'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "1f41ba712c69f301b274590ab3e7e6bd",
"version.json": "d8d9b4bd68823a19b6ea5c64ceb474ee",
"index.html": "29ae11e6765eb142fe31602cd6fa8e8a",
"/": "29ae11e6765eb142fe31602cd6fa8e8a",
"main.dart.js": "8ead813ed66153b369cbd6908807e2dc",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "d413c6087023584275c6956d8e22b73d",
"assets/AssetManifest.json": "4f1f6878efe5af32fa0ee9d67c463e89",
"assets/NOTICES": "fc74129d84d9caa8144de45774953b6a",
"assets/FontManifest.json": "55a26572f403d7b732970fc84826532b",
"assets/AssetManifest.bin.json": "02c3ba07c58e8c32ad531744c1fcd000",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/flutter_iconly/fonts/IconlyLight.ttf": "a2023f2e6ebf4b9fc99a8371297f0265",
"assets/packages/flutter_iconly/fonts/IconlyBroken.ttf": "29154d8260b60657e92db7e3f9003518",
"assets/packages/flutter_iconly/fonts/iconly_bold.ttf": "d8984bdaada3bfac387c9482c753047c",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "470c411965370609226cf5e32892c062",
"assets/fonts/MaterialIcons-Regular.otf": "58b76e97d2b8af6a2d5857ec1bfd7fc0",
"assets/assets/logos/15.webp": "9bf2a2eba97dac51f8b7d49588926877",
"assets/assets/logos/5.webp": "bbc70c73f8a996d1e6eac877de15b7ad",
"assets/assets/logos/19.webp": "ce94ce4dc3192e855bfb7940948eb343",
"assets/assets/logos/35.webp": "8d98a746e3680347883b7cdfeb00697d",
"assets/assets/logos/9.webp": "13a875a9143bc8c1aa2326f3ae2999a8",
"assets/assets/logos/23.webp": "e6027a1f3eb469bf9c3434b83dafc9f0",
"assets/assets/logos/22.webp": "b92936925583c18faed527d6fd1f5938",
"assets/assets/logos/8.webp": "a0a8c6f23c11e30bedb9ce04f5287619",
"assets/assets/logos/34.webp": "b6354902380b6b49e35fd1416a1dd6a2",
"assets/assets/logos/18.webp": "1eccadc61110e3973fa2edfb554ab86b",
"assets/assets/logos/4.webp": "7f828cfeba83caa51e05da96a7669ee9",
"assets/assets/logos/38.webp": "2bbac6b9631b31e19e740042bdc4ad80",
"assets/assets/logos/14.webp": "fe33abe0d30892d4ba4719df8b6de5c3",
"assets/assets/logos/33.webp": "1e4aaa2f53a2fb220c01d4e196bee14b",
"assets/assets/logos/25.webp": "b43a70ea4f4e03b0eec0d75d3ac2eb82",
"assets/assets/logos/13.webp": "6270844fde6264b8e129f035bbdb521f",
"assets/assets/logos/3.webp": "8c48148687407c878ae3096d6e107a45",
"assets/assets/logos/29.webp": "ecc8372157ab90666d956c8fcc196b87",
"assets/assets/logos/28.webp": "532893847f37853884425c08d6697538",
"assets/assets/logos/2.webp": "65ac12d54a6f96d03b949fea9e0e1953",
"assets/assets/logos/12.webp": "4ba849a6bd0491e50cecb6ea68a821b1",
"assets/assets/logos/24.webp": "69e6cf5ffdc9e407c5b31e0e565b21fe",
"assets/assets/logos/32.webp": "f790b8ca2545baf72edb692c7243d8a8",
"assets/assets/logos/27.webp": "9f76a3260b5ae7c46d76369efc8181b6",
"assets/assets/logos/31.webp": "b3995b8e81429ab22ba6db015790a324",
"assets/assets/logos/1.webp": "b5b23977f6c9f0484ba805910811aa25",
"assets/assets/logos/11.webp": "8e1297413ccdfc319bea322bc517f871",
"assets/assets/logos/10.webp": "e5e9bb1b57fd81da96ab804036a23e52",
"assets/assets/logos/30.webp": "9fa964077f1a39010aaf4d78de2e9d8b",
"assets/assets/logos/26.webp": "adc87c5066bc672011ebf9a5f5dc5818",
"assets/assets/logos/7.webp": "b8b2823844a3019f841339f3544bbfc0",
"assets/assets/logos/17.webp": "8c5880b0372a5cc5f7f092c6dffee8ec",
"assets/assets/logos/21.webp": "1d5acfa463ee553f565ad2d12c3e6936",
"assets/assets/logos/37.webp": "5a593703f9b1d1dfb04a85f349b0b5bc",
"assets/assets/logos/36.webp": "24d2ddb9126851ab09e389b775a92801",
"assets/assets/logos/20.webp": "20bb0d202f8bb3d42dcdd9d0e4478180",
"assets/assets/logos/16.webp": "1df40ce6a885f4497fda5b16c09b32dc",
"assets/assets/logos/6.webp": "3ece12fce384b7bc3b9d5fd5f6522305",
"assets/assets/image/10.jpeg": "c63ff89d046a4b1f17e819606fe5c0fd",
"assets/assets/image/tr.png": "83cc8dc138bb59e0d9bb68a2c4cce332",
"assets/assets/image/11.jpeg": "2745247bc018adec38eb045e9a798f62",
"assets/assets/image/ru.png": "70630989f9296ab43c8c87449a115127",
"assets/assets/image/bg_image_2.jpg": "0fc4b2eb4db622ce2788064d96e428de",
"assets/assets/image/bg_image_3.jpg": "380497beb7dfa861d3f6d53de0e9b3bf",
"assets/assets/image/bg_image_1.jpg": "ff808fea2c456782fbf424cf5e7824f4",
"assets/assets/image/bg_image_4.jpg": "51647fb342681e959a13c27ba1b81d6f",
"assets/assets/image/12.jpeg": "f22fdfa63fb05efe30816fc6b9699cf5",
"assets/assets/image/uk.png": "f6087f8741a50ec2ef7e10977d4f6efc",
"assets/assets/image/tm.png": "691e28afa7dbc51fdff0096f0f4309b7",
"assets/assets/videos/4.mp4": "9d02324d401c82cac57ef5c0bd5cf74a",
"assets/assets/videos/2.mp4": "70a3afd0cbeb82ad526fad6eeee7bce9",
"assets/assets/videos/3.mp4": "af8597826b5a459fa51c25fa8b40e08b",
"assets/assets/videos/video-1.mp4": "9620348fd8545470ef517c59e936017a",
"assets/assets/videos/video-3.mp4": "bf83e12e39ce9afc9a69feedd303324f",
"assets/assets/videos/video-2.mp4": "ea3d6a2b58e8b755d2b284b9d5d8c056",
"assets/assets/icons/service-8.webp": "ede43a8dc91e60e54f4bc671430d54fa",
"assets/assets/icons/preloader.gif": "f7b7153ffcc9b751844056da49404aee",
"assets/assets/icons/share1.png": "1104f1a367e81f599effa0a40fdcb51a",
"assets/assets/icons/service-4.webp": "540fbd23bb281675209ab4a2434cb6c7",
"assets/assets/icons/service-5.webp": "bb55a6541acc6b1be3066cdc7347af2f",
"assets/assets/icons/arrow-right.png": "19b63ae7d18332cc531e506944aa4341",
"assets/assets/icons/service-9.webp": "6cdc09730d0e2257255549e38c1ead32",
"assets/assets/icons/logo-2-small.svg": "10bf68f1986d59476361a0edcce2dc7b",
"assets/assets/icons/menu.png": "f9658fa5cfffca30bf75dcb6e4a7dc87",
"assets/assets/icons/error.png": "8019a013bc304cbc6c9ba6c60c623faa",
"assets/assets/icons/cross-out.png": "c2e505c1484df83cd00a11419074a252",
"assets/assets/icons/service-10.webp": "946c64b9a3364078f595454671967230",
"assets/assets/icons/service-6.webp": "f315dd5d3827465a45e3f965b16e5537",
"assets/assets/icons/globe.svg": "ac4dec595675af506ccc1a0f0b0bbf4b",
"assets/assets/icons/service-bg.png": "4c34bad55c4eb965613eab9d7645e6d5",
"assets/assets/icons/logo.svg": "85e9a883e9f72433cf398c40aa1eb51d",
"assets/assets/icons/service-7.webp": "c0806c7509dabd9db98942622bb0ce0a",
"assets/assets/icons/noconnection.gif": "763d6f02c91f8db7ed29367e0d68fd28",
"assets/assets/icons/logo-2.svg": "553191cf9626a302e69bf767d706ab4c",
"assets/assets/icons/service-11.webp": "3938e4236258027ed0fdf502fc64e20a",
"assets/assets/lottie/loading.json": "65209bd7cd58248c01570618ea3c7851",
"assets/assets/lottie/noData.json": "8108629d02cc41ec2fd7ab335a828220",
"assets/assets/fonts/PlusJakartaSans-Light.ttf": "d6fb190614a9297c6263f85094463592",
"assets/assets/fonts/PlusJakartaSans-Medium.ttf": "9fb6d71fc9edf9db455adeb04da9795c",
"assets/assets/fonts/PlusJakartaSans-SemiBold.ttf": "08d59825aa09f741c9272b85e6a1adbf",
"assets/assets/fonts/PlusJakartaSans-Regular.ttf": "f539ae4a8884822210a4553cc88ca3dc",
"assets/assets/fonts/PlusJakartaSans-Bold.ttf": "7dae244963714ee2b16fcbab46661792",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
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
