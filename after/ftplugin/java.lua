local config = {
  cmd = {
    vim.fn.stdpath("data") .. "/mason/bin/jdtls",
    "--jvm-arg=-javaagent:" .. vim.fn.stdpath("data") .. "/mason/packages/jdtls/lombok.jar",
  },
  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = {
      vim.fn.glob(
        vim.fn.stdpath("data")
          .. "/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
        1
      ),
    },
  },
  root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            -- https://github.com/emacs-lsp/lsp-java/issues/254#issuecomment-666334958
            name = "JavaSE-1.8",
            path = vim.fn.expand("$HOME") .. "/.sdkman/candidates/java/8.0.392-zulu",
          },
        },
      },
    },
  },
}

require("jdtls").start_or_attach(config)
