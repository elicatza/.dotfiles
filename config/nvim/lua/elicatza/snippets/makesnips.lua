local ls = require('luasnip')
local fmt = require('luasnip.extras.fmt').fmt

ls.add_snippets("make", {
    ls.s(
      "template_c",
      fmt(
        [[
          PROGRAMNAME := {}
          PREFIX := /usr/local
          INSTALL_PATH := $(PREFIX)/bin

          COMPILER := gcc
          CCFLAGS  := -std=gnu89 -Wall -Wshadow


          SRC_PATH := src
          OBJ_PATH := obj
          BIN_PATH := bin

          PROGRAM=$(addprefix $(BIN_PATH)/, $(PROGRAMNAME))
          CC=$(COMPILER) $(CCFLAGS)


          SRC := $(foreach x, $(SRC_PATH), $(wildcard $(addprefix $(x)/*, .c*)))
          OBJ := $(addprefix $(OBJ_PATH)/, $(addsuffix .o, $(notdir $(basename $(SRC)))))


          default: makedir all

          $(PROGRAM): $(OBJ)
              $(CC) $^ -o $@

          $(OBJ_PATH)/%.o: $(SRC_PATH)/%.c*
              $(CC) -I$(SRC_PATH) -c $< -o $@

          all: $(PROGRAM)

          makedir:
              @mkdir -p $(OBJ_PATH)
              @mkdir -p $(BIN_PATH)

          install:
              chmod 755 $(PROGRAM)
              mkdir -p $(BIN_PATH)
              cp $(PROGRAM) $(INSTALL_PATH)/$(PROGRAMNAME)

          uninstall:
              rm -f $(INSTALL_PATH)/$(PROGRAMNAME)

          clean:
              rm -f $(PROGRAM) 
              rm -f $(OBJ_PATH)/*


          .PHONY: all install uninstall clean makedir default
        ]],
        {
          ls.insert_node(0),
        }
      )
    ),

    ls.s(
      "template_sh",
      fmt(
        [[
          PROGRAMNAME={}
          PREFIX=/usr/local
          INSTALL_PATH=$(PREFIX)/bin


          install:
              chmod 755 $(PROGRAMNAME)
              mkdir -p $(BIN_PATH)
              cp $(PROGRAM) $(INSTALL_PATH)/$(PROGRAMNAME)

          uninstall:
              rm -f $(INSTALL_PATH)/$(PROGRAMNAME)


          .PHONY: install uninstall 
        ]],
        {
          ls.insert_node(0),
        }
      )
    ),

  }, {
    key = "make",
  }
)
