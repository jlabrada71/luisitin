module.exports = {
    apps : [
        {
          name: "<domain>",
          script: "apps/<domain>/server/main.js",
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

