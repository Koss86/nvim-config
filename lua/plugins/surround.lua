return {
  "kylechui/nvim-surround",
  version = "^4.0.0",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    surrounds = {
      ["("] = {
        add = { "(", ")" },
      },
      [")"] = {
        add = { "( ", " )" },
      },
      ["{"] = {
        add = { "{", "}" },
      },
      ["}"] = {
        add = { "{ ", " }" },
      },
      ["<"] = {
        add = { "<", ">" },
      },
      [">"] = {
        add = { "< ", " >" },
      },
      ["["] = {
        add = { "[", "]" },
      },
      ["]"] = {
        add = { "[ ", " ]" },
      },
    },
  }
}
