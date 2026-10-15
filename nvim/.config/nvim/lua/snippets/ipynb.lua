local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node


return (
    {
        s("cell", {
            t({
                "```python",
            })
        }),
        s("jinit", fmta([[
            {
             "cells": [
              {
               "cell_type": "code",
               "execution_count": null,
               "id": "1ec24bd4-724e-4bf2-b7a0-cf9073fa4ab4",
               "metadata": {},
               "outputs": [],
               "source": []
              }
             ],
             "metadata": {
              "kernelspec": {
               "display_name": "",
               "name": ""
              },
              "language_info": {
               "name": ""
              }
             },
             "nbformat": 4,
             "nbformat_minor": 5
            }

        ]], {}))
    }
)
