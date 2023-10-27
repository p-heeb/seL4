#
# Copyright 2023, IBM
#
# SPDX-License-Identifier: GPL-2.0-only
#
cmake_minimum_required(VERSION 3.7.2)

declare_platform(starfive KernelPlatformStarfive PLAT_STARFIVE KernelSel4ArchRiscV64)

if(KernelPlatformStarfive)
    declare_seL4_arch(riscv64)
    config_set(KernelRiscVPlatform RISCV_PLAT "starfive")
    config_set(KernelPlatformFirstHartID FIRST_HART_ID 1)
    config_set(KernelOpenSBIPlatform OPENSBI_PLATFORM "generic")
    set(KernelRiscvUseClintMtime OFF)
    list(APPEND KernelDTSList "tools/dts/starfive.dts")
    list(APPEND KernelDTSList "src/plat/starfive/overlay-starfive.dts")
    declare_default_headers(
        TIMER_FREQUENCY 1000000 PLIC_MAX_NUM_INT 53
        INTERRUPT_CONTROLLER drivers/irq/riscv_plic0.h
    )
else()
    unset(KernelPlatformFirstHartID CACHE)
endif()
