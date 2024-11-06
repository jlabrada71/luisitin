module.exports = {
  apps : [
	  {
        name: "juanlabrada.com",
        script: "apps/juanlabrada.com/server/juanlabrada.com.mjs",
        watch: true,
        env : {
            "PORT": 3100,
            "NODE_ENV": "production",
	    "TIMES": "2",
	    "NITRO_API_SERVER": "https://juanlabrada.com",
	    "NUXT_MONGO_URL": "removed for security",
	    "NUXT_MONGO_DB": "juanlabrada",
	    "NUXT_MAILER_PASS": "removed for security",
	    "NUXT_HEART_BEAT": "*/1 * * * *",
	    "NUXT_API_KEY": "removed for security",
	    "NUXT_REFRESH_API_KEY": "removed for security"

        }
	  }
  ]
}
