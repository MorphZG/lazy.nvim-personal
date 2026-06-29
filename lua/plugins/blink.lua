return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      -- Enter always falls back to a regular newline
      ["<CR>"] = { "fallback" },

      -- If the menu is open and an item is highlighted, Tab selects it.
      -- If nothing is highlighted yet, Tab highlights the next item.
      -- If the menu is closed, Tab behaves normally.
      ["<Tab>"] = {
        function(cmp)
          if cmp.is_menu_visible() then
            if cmp.get_selected_item_idx() ~= nil then
              return cmp.accept()
            else
              return cmp.select_next()
            end
          end
        end,
        "fallback",
      },

      ["<S-Tab>"] = { "select_prev", "fallback" },
    },
  },
}
