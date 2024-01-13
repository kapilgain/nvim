local config = {
  cmd = {
    vim.fn.stdpath("data") .. "/mason/bin/jdtls",
    "--jvm-arg=-javaagent:" .. vim.fn.stdpath("data") .. "/mason/packages/jdtls/lombok.jar",
  },
  root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "JavaSE-8",
            path = vim.fn.expand("$HOME") .. "/.sdkman/candidates/java/8.0.392-zulu",
          },
        },
      },
    },
  },
}

require("jdtls").start_or_attach(config)
