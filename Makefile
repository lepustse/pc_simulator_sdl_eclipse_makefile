#####################################################################
# Makefile
# date: 2019.1.27
#####################################################################
BIN := demo

RMDIR  := rm -rf
MKDIR  := mkdir
VFLAG := 0
#--------------------------------------------------------------------
# path
#--------------------------------------------------------------------
LVGL_DIR := $(shell pwd)
OUT_DIR := $(LVGL_DIR)/out

#--------------------------------------------------------------------
# config
#--------------------------------------------------------------------
CC = gcc
CFLAGS := -Wall -Wshadow -Wundef -Wmaybe-uninitialized -fbounds-check

#CFLAGS += -O3 -g3 -I./
CFLAGS += -O3 -g3
LDFLAGS += -lSDL2 -lm

ifeq ($(VFLAG), 0)
	V := @
else
	V :=
endif

#--------------------------------------------------------------------
# others
#--------------------------------------------------------------------
SRC_DIR := $(LVGL_DIR)
SOBJ := main.o mouse_cursor_icon.o
PSOBJ := $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH := $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

#--------------------------------------------------------------------
# libraries
#--------------------------------------------------------------------
# core
SRC_DIR := $(LVGL_DIR)/lvgl/lv_core
SOBJ := lv_group.o lv_indev.o lv_obj.o lv_refr.o lv_style.o lv_vdb.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# hal
SRC_DIR := $(LVGL_DIR)/lvgl/lv_hal
SOBJ := lv_hal_disp.o lv_hal_indev.o lv_hal_tick.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# objx
SRC_DIR := $(LVGL_DIR)/lvgl/lv_objx
SOBJ := lv_arc.o lv_bar.o lv_cb.o lv_ddlist.o lv_kb.o lv_line.o lv_mbox.o
SOBJ += lv_preload.o lv_roller.o lv_tabview.o lv_btn.o lv_calendar.o lv_chart.o
SOBJ += lv_gauge.o lv_label.o lv_list.o lv_slider.o lv_ta.o lv_btnm.o lv_cont.o
SOBJ += lv_img.o lv_led.o lv_lmeter.o lv_page.o lv_sw.o lv_win.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)
 
# fonts
SRC_DIR := $(LVGL_DIR)/lvgl/lv_fonts
SOBJ := lv_font_builtin.o lv_font_dejavu_10.o lv_font_dejavu_20.o
SOBJ += lv_font_dejavu_30.o lv_font_dejavu_40.o lv_font_dejavu_10_cyrillic.o
SOBJ += lv_font_dejavu_20_cyrillic.o lv_font_dejavu_30_cyrillic.o
SOBJ += lv_font_dejavu_10_latin_sup.o lv_font_dejavu_40_cyrillic.o
SOBJ += lv_font_dejavu_20_latin_sup.o lv_font_dejavu_30_latin_sup.o
SOBJ += lv_font_dejavu_40_latin_sup.o lv_font_symbol_10.o lv_font_symbol_20.o
SOBJ += lv_font_symbol_30.o lv_font_symbol_40.o lv_font_monospace_8.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# misc
SRC_DIR := $(LVGL_DIR)/lvgl/lv_misc
SOBJ := lv_font.o lv_circ.o lv_area.o lv_task.o lv_fs.o lv_anim.o
SOBJ += lv_mem.o lv_ll.o lv_color.o lv_txt.o lv_ufs.o lv_math.o lv_log.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# themes
SRC_DIR := $(LVGL_DIR)/lvgl/lv_themes
SOBJ := lv_theme_alien.o lv_theme.o lv_theme_default.o lv_theme_night.o
SOBJ += lv_theme_templ.o lv_theme_zen.o lv_theme_material.o lv_theme_nemo.o lv_theme_mono.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# draw
SRC_DIR := $(LVGL_DIR)/lvgl/lv_draw
SOBJ := lv_draw_vbasic.o lv_draw_rbasic.o lv_draw.o lv_draw_rect.o
SOBJ += lv_draw_label.o lv_draw_line.o lv_draw_img.o lv_draw_arc.o lv_draw_triangle.o 
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

#--------------------------------------------------------------------
# drivers
#--------------------------------------------------------------------

# display
SRC_DIR := $(LVGL_DIR)/lv_drivers/display
SOBJ := fbdev.o monitor.o R61581.o SSD1963.o ST7565.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# indev
SRC_DIR := $(LVGL_DIR)/lv_drivers/indev
SOBJ := FT5406EE8.o keyboard.o mouse.o encoder.o evdev.o XPT2046.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

#--------------------------------------------------------------------
# examples
#--------------------------------------------------------------------

# test_obj
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_tests/lv_test_obj
SOBJ := lv_test_obj.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# test_img
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_tests/lv_test_obj/lv_test_img
SOBJ := img_flower_icon.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# test_stress
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_tests/lv_test_stress
SOBJ := lv_test_stress.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# test_theme
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_tests/lv_test_theme
SOBJ := lv_test_theme.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# test_group
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_tests/lv_test_group
SOBJ := lv_test_group.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# test_bar
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_tests/lv_test_objx/lv_test_bar
SOBJ := lv_test_bar.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# test_btn
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_tests/lv_test_objx/lv_test_btn
SOBJ := lv_test_btn.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# test_btnm
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_tests/lv_test_objx/lv_test_btnm
SOBJ := lv_test_btnm.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# test_cb
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_tests/lv_test_objx/lv_test_cb
SOBJ := lv_test_cb.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# test_chart
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_tests/lv_test_objx/lv_test_chart
SOBJ := lv_test_chart.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# test_cont
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_tests/lv_test_objx/lv_test_cont
SOBJ := lv_test_cont.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# test_ddlist
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_tests/lv_test_objx/lv_test_ddlist
SOBJ := lv_test_ddlist.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# test_gauge
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_tests/lv_test_objx/lv_test_gauge
SOBJ := lv_test_gauge.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# test_img
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_tests/lv_test_objx/lv_test_img
SOBJ := lv_test_img.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# test_kb
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_tests/lv_test_objx/lv_test_kb
SOBJ := lv_test_kb.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# test_label
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_tests/lv_test_objx/lv_test_label
SOBJ := lv_test_label.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# test_led
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_tests/lv_test_objx/lv_test_led
SOBJ := lv_test_led.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# test_line
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_tests/lv_test_objx/lv_test_line
SOBJ := lv_test_line.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# test_list
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_tests/lv_test_objx/lv_test_list
SOBJ := lv_test_list.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# test_lmeter
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_tests/lv_test_objx/lv_test_lmeter
SOBJ := lv_test_lmeter.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# test_mbox
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_tests/lv_test_objx/lv_test_mbox
SOBJ := lv_test_mbox.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# test_page
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_tests/lv_test_objx/lv_test_page
SOBJ := lv_test_page.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# test_roller
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_tests/lv_test_objx/lv_test_roller
SOBJ := lv_test_roller.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# test_slider
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_tests/lv_test_objx/lv_test_slider
SOBJ := lv_test_slider.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# test_sw
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_tests/lv_test_objx/lv_test_sw
SOBJ := lv_test_sw.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# test_ta
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_tests/lv_test_objx/lv_test_ta
SOBJ := lv_test_ta.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# test_tabview
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_tests/lv_test_objx/lv_test_tabview
SOBJ := lv_test_tabview.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# test_win
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_tests/lv_test_objx/lv_test_win
SOBJ := lv_test_win.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# apps_benchmark
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_apps/benchmark
SOBJ := benchmark.o benchmark_bg.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# apps_demo
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_apps/demo
SOBJ := demo.o img_bubble_pattern.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# apps_sysmon
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_apps/sysmon
SOBJ := sysmon.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# apps_terminal
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_apps/terminal
SOBJ := terminal.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# apps_tpcal
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_apps/tpcal
SOBJ := tpcal.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# tutorial_hello_world
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_tutorial/1_hello_world
SOBJ := lv_tutorial_hello_world.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# tutorial_objects
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_tutorial/2_objects
SOBJ := lv_tutorial_objects.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# tutorial_styles
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_tutorial/3_styles
SOBJ := lv_tutorial_styles.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# tutorial_themes
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_tutorial/4_themes
SOBJ := lv_tutorial_themes.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# tutorial_antialiasing
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_tutorial/5_antialiasing
SOBJ := lv_tutorial_antialiasing.o apple_icon_chroma.o apple_icon_alpha.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# tutorial_images
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_tutorial/6_images
SOBJ := lv_tutorial_images.o red_flower.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# tutorial_fonts
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_tutorial/7_fonts
SOBJ := lv_tutorial_fonts.o arial_ascii_20.o
SOBJ += arial_cyrillic_20.o arial_math_20.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# tutorial_animations
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_tutorial/8_animations
SOBJ := lv_tutorial_animations.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)

# tutorial_resonsive
SRC_DIR := $(LVGL_DIR)/lv_examples/lv_tutorial/9_responsive
SOBJ := lv_tutorial_responsive.o
PSOBJ += $(addprefix $(OUT_DIR)/, $(SOBJ))
VPATH += $(SRC_DIR)
CFLAGS += -I$(SRC_DIR)


.PHONY: all
all: $(OUT_DIR) $(PSOBJ)
	@echo	Compiled successfully!
	$(V)$(CC) -o $(BIN) $(PSOBJ) $(LDFLAGS)

$(OUT_DIR)/%.o:%.c
	$(if $(V), @echo " (cc)    $(subst $(OUT_DIR)/,,$@)")
	$(V)$(CC) $(CFLAGS) -c $< -o $@

$(OUT_DIR):
	$(if $(V), $(V)echo "$(MKDIR) $@")
	-$(V)$(MKDIR) $@

clean:
	- $(RMDIR) $(OUT_DIR)
	- $(RMDIR) $(BIN)
