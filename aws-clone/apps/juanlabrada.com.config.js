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
	    "NUXT_MONGO_URL": "mongodb+srv://tryyourideas:Cobian98@cluster0.k2rni.gcp.mongodb.net/juanlabrada?retryWrites=true&w=majority",
	    "NUXT_MONGO_DB": "juanlabrada",
	    "NUXT_MAILER_PASS": "8jpMV8QHUZuh",
	    "NUXT_HEART_BEAT": "*/1 * * * *",
	    "NUXT_API_KEY": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6ImNvbS1qdWFubGFicmFkYS1hdXRoZW50aWNhdGlvbi1zZXJ2aWNlIiwiY3JlYXRpb25EYXRlIjoxNjM2ODE3MDg1MTM5LCJyZWZyZXNoS2V5IjoicGpYQ3l5UktiYlFHd0Zmc2FXVXVSUT09IiwianRpIjoiNjRlZTNlODMtNjg3ZS00MTI0LWE5ZmItZDA0ZTg0ZmM4OTIyIiwiaWF0IjoxNjM2ODE3MDg1fQ.jltt3SO2sErna6Xpu-mxBmGHesRr0ZjJSttaGYqr3bU",
	    "NUXT_REFRESH_API_KEY": "cGpYQ3l5UktiYlFHd0Zmc2FXVXVSUT09JFNCZVRpWStOSVpmZmNkY1Eybkt1a1QxWlJEZkhCUWQ0alMvaldpbnQvMU5mTUZTSVZXazJVakFyL3RCTExJQks0elgyMndlc3gwbERnaVU1Sll1elNRPT0="

        }
	  }
  ]
}
