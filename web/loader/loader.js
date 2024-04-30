window.addEventListener('load', function (_) {
    // Download main.dart.js
    _flutter.loader.loadEntrypoint({
        serviceWorker: {
            serviceWorkerVersion: serviceWorkerVersion,
        },
        onEntrypointLoaded: async function (engineInitializer) {
            const appRunner = await engineInitializer.initializeEngine();
            await appRunner.runApp();
        }
    });
});