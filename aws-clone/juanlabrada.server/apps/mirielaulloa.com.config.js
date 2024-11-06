module.exports = {
  apps : [
      {
        name: "mirielaulloa.com",
        script: "apps/mirielaulloa.com/server/mirielaulloa.com.mjs",
        watch: true,
        env: {
            "PORT": 3000,
            "NODE_ENV": "development"
        },
        env_production: {
            "PORT": 3000,
            "NODE_ENV": "production",
        }
      },
  ]
}
