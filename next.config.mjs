/** @type {import('next').NextConfig} */
const nextConfig = {
    experimental: {
        cacheMaxMemorySize: 52428800, // 50 MB dalam byte
    },
    webpack: (
        config,
        { buildId, dev, isServer, defaultLoaders, nextRuntime, webpack }
    ) => {
        if (config.cache && !dev) {
            config.cache = Object.freeze({
                type: 'memory',
            })
            // config.cache.maxMemoryGenerations = 0
        }
        // Important: return the modified config
        return config
    },
}

export default nextConfig