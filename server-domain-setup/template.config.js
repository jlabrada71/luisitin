module.exports = {
    apps : [
        {
          name: "<domain>",
          script: "apps/<domain>/server/<domain>.mjs",
          watch: true,
          env: {
              "PORT": <port>,
              "NODE_ENV": "development"
          },
          env_production: {
              "PORT": <port>,
              "NODE_ENV": "production",
          }
        },
    ]
  }