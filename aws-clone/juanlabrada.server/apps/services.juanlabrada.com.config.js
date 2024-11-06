module.exports = {
  apps : [
      {
        name: "services.juanlabrada.com",
        script: "apps/services.juanlabrada.com/server/main.js",
        watch: true,
        env: {
            "PORT": 3500,
            "NODE_ENV": "development",
            "MONGO_URL": "mongodb+srv://tryyourideas:Cobian98@cluster0.k2rni.gcp.mongodb.net/juanlabrada?retryWrites=true&w=majority",
            "MONGO_DB": "juanlabrada",
            "MAILER_PASS": "8jpMV8QHUZuh",
            "MAILER_ACCOUNT": "agile@juanlabrada.com",
            "HEART_BEAT": "*/1 * * * *",
        },
        env_production: {
            "PORT": 3500,
            "NODE_ENV": "production",
            "MONGO_URL": "mongodb+srv://tryyourideas:Cobian98@cluster0.k2rni.gcp.mongodb.net/juanlabrada?retryWrites=true&w=majority",
            "MONGO_DB": "juanlabrada",
            "MAILER_PASS": "8jpMV8QHUZuh",
            "MAILER_ACCOUNT": "agile@juanlabrada.com",
            "HEART_BEAT": "*/1 * * * *"
        }
      },
  ]
}
