--------------------------------------------------------------------------------
-- Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.58f
--  \   \         Application: netgen
--  /   /         Filename: LCD_synthesis.vhd
-- /___/   /\     Timestamp: Wed Mar 04 14:55:41 2020
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm LCD -w -dir netgen/synthesis -ofmt vhdl -sim LCD.ngc LCD_synthesis.vhd 
-- Device	: xc3s500e-5-fg320
-- Input file	: LCD.ngc
-- Output file	: C:\Users\Jia Ming\Desktop\HDL Project\Project\netgen\synthesis\LCD_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: LCD
-- Xilinx	: E:\Xilinx\14.5\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity LCD is
  port (
    Reset : in STD_LOGIC := 'X'; 
    Clock : in STD_LOGIC := 'X'; 
    RS : out STD_LOGIC; 
    RW : out STD_LOGIC; 
    Display : in STD_LOGIC := 'X'; 
    Enable : out STD_LOGIC; 
    Data : out STD_LOGIC_VECTOR ( 3 downto 0 ); 
    LED : out STD_LOGIC_VECTOR ( 7 downto 0 ) 
  );
end LCD;

architecture Structure of LCD is
  signal Clock_BUFGP_2 : STD_LOGIC; 
  signal Data_0_7 : STD_LOGIC; 
  signal Data_1_8 : STD_LOGIC; 
  signal Data_2_9 : STD_LOGIC; 
  signal Data_3_10 : STD_LOGIC; 
  signal Data_mux0000_0_22_11 : STD_LOGIC; 
  signal Data_mux0000_0_33 : STD_LOGIC; 
  signal Data_mux0000_0_38_13 : STD_LOGIC; 
  signal Data_mux0000_1_22_14 : STD_LOGIC; 
  signal Data_mux0000_1_38_15 : STD_LOGIC; 
  signal Data_mux0000_2_22_16 : STD_LOGIC; 
  signal Data_mux0000_2_38_17 : STD_LOGIC; 
  signal Data_mux0000_3_22_18 : STD_LOGIC; 
  signal Data_mux0000_3_38_19 : STD_LOGIC; 
  signal Display_IBUF_21 : STD_LOGIC; 
  signal Enable_OBUF_23 : STD_LOGIC; 
  signal Enable_mux0000 : STD_LOGIC; 
  signal LED_0_OBUF_33 : STD_LOGIC; 
  signal LED_1_OBUF_34 : STD_LOGIC; 
  signal LED_2_OBUF_35 : STD_LOGIC; 
  signal LED_3_OBUF_36 : STD_LOGIC; 
  signal LED_4_OBUF_37 : STD_LOGIC; 
  signal LED_6_OBUF_38 : STD_LOGIC; 
  signal LED_7_OBUF_39 : STD_LOGIC; 
  signal Madd_iCounter_add0000_cy_10_rt_42 : STD_LOGIC; 
  signal Madd_iCounter_add0000_cy_11_rt_44 : STD_LOGIC; 
  signal Madd_iCounter_add0000_cy_12_rt_46 : STD_LOGIC; 
  signal Madd_iCounter_add0000_cy_13_rt_48 : STD_LOGIC; 
  signal Madd_iCounter_add0000_cy_14_rt_50 : STD_LOGIC; 
  signal Madd_iCounter_add0000_cy_15_rt_52 : STD_LOGIC; 
  signal Madd_iCounter_add0000_cy_16_rt_54 : STD_LOGIC; 
  signal Madd_iCounter_add0000_cy_17_rt_56 : STD_LOGIC; 
  signal Madd_iCounter_add0000_cy_18_rt_58 : STD_LOGIC; 
  signal Madd_iCounter_add0000_cy_19_rt_60 : STD_LOGIC; 
  signal Madd_iCounter_add0000_cy_1_rt_62 : STD_LOGIC; 
  signal Madd_iCounter_add0000_cy_2_rt_64 : STD_LOGIC; 
  signal Madd_iCounter_add0000_cy_3_rt_66 : STD_LOGIC; 
  signal Madd_iCounter_add0000_cy_4_rt_68 : STD_LOGIC; 
  signal Madd_iCounter_add0000_cy_5_rt_70 : STD_LOGIC; 
  signal Madd_iCounter_add0000_cy_6_rt_72 : STD_LOGIC; 
  signal Madd_iCounter_add0000_cy_7_rt_74 : STD_LOGIC; 
  signal Madd_iCounter_add0000_cy_8_rt_76 : STD_LOGIC; 
  signal Madd_iCounter_add0000_cy_9_rt_78 : STD_LOGIC; 
  signal Madd_iCounter_add0000_xor_20_rt_80 : STD_LOGIC; 
  signal N1 : STD_LOGIC; 
  signal N101 : STD_LOGIC; 
  signal N106 : STD_LOGIC; 
  signal N108 : STD_LOGIC; 
  signal N11 : STD_LOGIC; 
  signal N110 : STD_LOGIC; 
  signal N112 : STD_LOGIC; 
  signal N114 : STD_LOGIC; 
  signal N116 : STD_LOGIC; 
  signal N118 : STD_LOGIC; 
  signal N120 : STD_LOGIC; 
  signal N124 : STD_LOGIC; 
  signal N126 : STD_LOGIC; 
  signal N128 : STD_LOGIC; 
  signal N129 : STD_LOGIC; 
  signal N13 : STD_LOGIC; 
  signal N132 : STD_LOGIC; 
  signal N134 : STD_LOGIC; 
  signal N136 : STD_LOGIC; 
  signal N138 : STD_LOGIC; 
  signal N14 : STD_LOGIC; 
  signal N140 : STD_LOGIC; 
  signal N141 : STD_LOGIC; 
  signal N142 : STD_LOGIC; 
  signal N143 : STD_LOGIC; 
  signal N144 : STD_LOGIC; 
  signal N145 : STD_LOGIC; 
  signal N146 : STD_LOGIC; 
  signal N147 : STD_LOGIC; 
  signal N148 : STD_LOGIC; 
  signal N149 : STD_LOGIC; 
  signal N150 : STD_LOGIC; 
  signal N151 : STD_LOGIC; 
  signal N152 : STD_LOGIC; 
  signal N153 : STD_LOGIC; 
  signal N154 : STD_LOGIC; 
  signal N155 : STD_LOGIC; 
  signal N156 : STD_LOGIC; 
  signal N157 : STD_LOGIC; 
  signal N16 : STD_LOGIC; 
  signal N25 : STD_LOGIC; 
  signal N311 : STD_LOGIC; 
  signal N32 : STD_LOGIC; 
  signal N36 : STD_LOGIC; 
  signal N37 : STD_LOGIC; 
  signal N38 : STD_LOGIC; 
  signal N411 : STD_LOGIC; 
  signal N45 : STD_LOGIC; 
  signal N47 : STD_LOGIC; 
  signal N49 : STD_LOGIC; 
  signal N51 : STD_LOGIC; 
  signal N53 : STD_LOGIC; 
  signal N62 : STD_LOGIC; 
  signal N64 : STD_LOGIC; 
  signal N66 : STD_LOGIC; 
  signal N68 : STD_LOGIC; 
  signal N70 : STD_LOGIC; 
  signal N72 : STD_LOGIC; 
  signal N79 : STD_LOGIC; 
  signal N8 : STD_LOGIC; 
  signal N81 : STD_LOGIC; 
  signal N83 : STD_LOGIC; 
  signal N85 : STD_LOGIC; 
  signal N87 : STD_LOGIC; 
  signal N89 : STD_LOGIC; 
  signal N91 : STD_LOGIC; 
  signal N93 : STD_LOGIC; 
  signal N95 : STD_LOGIC; 
  signal N97 : STD_LOGIC; 
  signal N99 : STD_LOGIC; 
  signal RS_OBUF_152 : STD_LOGIC; 
  signal RS_mux0000 : STD_LOGIC; 
  signal RS_mux000015_154 : STD_LOGIC; 
  signal RS_mux000035_155 : STD_LOGIC; 
  signal RS_mux000048_156 : STD_LOGIC; 
  signal RW_OBUF_158 : STD_LOGIC; 
  signal Reset_IBUF_160 : STD_LOGIC; 
  signal Reset_inv : STD_LOGIC; 
  signal iCharSent_mux0001_2_1_169 : STD_LOGIC; 
  signal iCharSent_mux0001_2_2_170 : STD_LOGIC; 
  signal iCounter_mux0004_0_111_215 : STD_LOGIC; 
  signal iCounter_mux0004_0_1146 : STD_LOGIC; 
  signal iCounter_mux0004_0_1148_217 : STD_LOGIC; 
  signal iCounter_mux0004_0_1162_218 : STD_LOGIC; 
  signal iCounter_mux0004_0_12_219 : STD_LOGIC; 
  signal iCounter_mux0004_0_129_220 : STD_LOGIC; 
  signal iCounter_mux0004_0_143_221 : STD_LOGIC; 
  signal iCounter_mux0004_0_162_222 : STD_LOGIC; 
  signal iCounter_or0000 : STD_LOGIC; 
  signal iCounter_or000010_244 : STD_LOGIC; 
  signal iCounter_or000038_245 : STD_LOGIC; 
  signal iCounter_or000041_246 : STD_LOGIC; 
  signal iCounter_or0002 : STD_LOGIC; 
  signal iData_mux0002_1_58_258 : STD_LOGIC; 
  signal iData_mux0002_1_60_259 : STD_LOGIC; 
  signal iData_not0001 : STD_LOGIC; 
  signal iData_not000129 : STD_LOGIC; 
  signal iData_not0001291_268 : STD_LOGIC; 
  signal iData_not0001292_269 : STD_LOGIC; 
  signal iData_not000157_270 : STD_LOGIC; 
  signal iData_not000162_271 : STD_LOGIC; 
  signal iData_not000177_272 : STD_LOGIC; 
  signal iDisplay_273 : STD_LOGIC; 
  signal iDisplayEnable_274 : STD_LOGIC; 
  signal iDisplayEnable_and0000 : STD_LOGIC; 
  signal iDisplayEnable_not0001 : STD_LOGIC; 
  signal iStage_277 : STD_LOGIC; 
  signal iStage_mux000012_278 : STD_LOGIC; 
  signal iStage_mux000032_279 : STD_LOGIC; 
  signal isAllTransmit_280 : STD_LOGIC; 
  signal isAllTransmit_mux0000_281 : STD_LOGIC; 
  signal isClear_282 : STD_LOGIC; 
  signal isClear_not0001 : STD_LOGIC; 
  signal isConfig_284 : STD_LOGIC; 
  signal isDisplay_285 : STD_LOGIC; 
  signal isDisplay_not0001 : STD_LOGIC; 
  signal isEntry_287 : STD_LOGIC; 
  signal isEntry_not0001 : STD_LOGIC; 
  signal isFunc_289 : STD_LOGIC; 
  signal isFunc_not0001 : STD_LOGIC; 
  signal isInit_291 : STD_LOGIC; 
  signal isInitStg1_292 : STD_LOGIC; 
  signal isInitStg1_not0001 : STD_LOGIC; 
  signal isInitStg2_294 : STD_LOGIC; 
  signal isInitStg2_not0001 : STD_LOGIC; 
  signal isResetAddr_296 : STD_LOGIC; 
  signal isResetAddr_mux0000 : STD_LOGIC; 
  signal isResetAddr_mux00001 : STD_LOGIC; 
  signal isResetAddr_mux000011_299 : STD_LOGIC; 
  signal isTransmit_300 : STD_LOGIC; 
  signal isTransmit_mux0000_301 : STD_LOGIC; 
  signal nextState_1_Q : STD_LOGIC; 
  signal nextState_4_Q : STD_LOGIC; 
  signal nextState_5_Q : STD_LOGIC; 
  signal nextState_7_Q_305 : STD_LOGIC; 
  signal nextState_8_Q : STD_LOGIC; 
  signal nextState_9_Q : STD_LOGIC; 
  signal presState_mux0003_2_1 : STD_LOGIC; 
  signal presState_mux0003_3_11 : STD_LOGIC; 
  signal presState_mux0003_6_11 : STD_LOGIC; 
  signal presState_mux0003_7_Q : STD_LOGIC; 
  signal presState_mux0003_7_1_322 : STD_LOGIC; 
  signal presState_mux0003_7_2_323 : STD_LOGIC; 
  signal presState_mux0003_9_Q : STD_LOGIC; 
  signal transmitState_FSM_FFd1_325 : STD_LOGIC; 
  signal transmitState_FSM_FFd1_In_326 : STD_LOGIC; 
  signal transmitState_FSM_FFd2_327 : STD_LOGIC; 
  signal transmitState_FSM_FFd2_In12_328 : STD_LOGIC; 
  signal transmitState_FSM_FFd2_In6_329 : STD_LOGIC; 
  signal transmitState_FSM_FFd2_In84_330 : STD_LOGIC; 
  signal transmitState_FSM_FFd2_In91 : STD_LOGIC; 
  signal transmitState_FSM_FFd3_332 : STD_LOGIC; 
  signal transmitState_FSM_FFd3_In15_333 : STD_LOGIC; 
  signal transmitState_FSM_FFd3_In35_334 : STD_LOGIC; 
  signal transmitState_FSM_FFd3_In39_335 : STD_LOGIC; 
  signal transmitState_cmp_eq0001111_336 : STD_LOGIC; 
  signal transmitState_cmp_eq0001136_337 : STD_LOGIC; 
  signal transmitState_cmp_eq0004_338 : STD_LOGIC; 
  signal transmitState_cmp_eq0004112_339 : STD_LOGIC; 
  signal transmitState_cmp_eq0005_340 : STD_LOGIC; 
  signal transmitState_cmp_eq0007_341 : STD_LOGIC; 
  signal transmitState_cmp_eq0010_342 : STD_LOGIC; 
  signal transmitState_cmp_eq0011 : STD_LOGIC; 
  signal transmitState_cmp_eq0012 : STD_LOGIC; 
  signal CharSeq : STD_LOGIC_VECTOR2 ( 0 downto 0 , 2 downto 2 ); 
  signal Madd_iCounter_add0000_cy : STD_LOGIC_VECTOR ( 19 downto 0 ); 
  signal Madd_iCounter_add0000_lut : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal iCharSent : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal iCharSent_mux0001 : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal iCounter : STD_LOGIC_VECTOR ( 20 downto 0 ); 
  signal iCounter_add0000 : STD_LOGIC_VECTOR ( 20 downto 0 ); 
  signal iCounter_mux0004 : STD_LOGIC_VECTOR ( 20 downto 0 ); 
  signal iData : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal iData_mux0002 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal presState : STD_LOGIC_VECTOR ( 9 downto 0 ); 
begin
  XST_GND : GND
    port map (
      G => RW_OBUF_158
    );
  XST_VCC : VCC
    port map (
      P => CharSeq(0, 2)
    );
  iCounter_0 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iCounter_mux0004(0),
      R => Reset_IBUF_160,
      Q => iCounter(0)
    );
  iCounter_1 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iCounter_mux0004(1),
      R => Reset_IBUF_160,
      Q => iCounter(1)
    );
  iCounter_2 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iCounter_mux0004(2),
      R => Reset_IBUF_160,
      Q => iCounter(2)
    );
  iCounter_3 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iCounter_mux0004(3),
      R => Reset_IBUF_160,
      Q => iCounter(3)
    );
  iCounter_4 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iCounter_mux0004(4),
      R => Reset_IBUF_160,
      Q => iCounter(4)
    );
  iCounter_5 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iCounter_mux0004(5),
      R => Reset_IBUF_160,
      Q => iCounter(5)
    );
  iCounter_6 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iCounter_mux0004(6),
      R => Reset_IBUF_160,
      Q => iCounter(6)
    );
  iCounter_7 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iCounter_mux0004(7),
      R => Reset_IBUF_160,
      Q => iCounter(7)
    );
  iCounter_8 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iCounter_mux0004(8),
      R => Reset_IBUF_160,
      Q => iCounter(8)
    );
  iCounter_9 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iCounter_mux0004(9),
      R => Reset_IBUF_160,
      Q => iCounter(9)
    );
  iCounter_10 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iCounter_mux0004(10),
      R => Reset_IBUF_160,
      Q => iCounter(10)
    );
  iCounter_11 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iCounter_mux0004(11),
      R => Reset_IBUF_160,
      Q => iCounter(11)
    );
  iCounter_12 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iCounter_mux0004(12),
      R => Reset_IBUF_160,
      Q => iCounter(12)
    );
  iCounter_13 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iCounter_mux0004(13),
      R => Reset_IBUF_160,
      Q => iCounter(13)
    );
  iCounter_14 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iCounter_mux0004(14),
      R => Reset_IBUF_160,
      Q => iCounter(14)
    );
  iCounter_15 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iCounter_mux0004(15),
      R => Reset_IBUF_160,
      Q => iCounter(15)
    );
  iCounter_16 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iCounter_mux0004(16),
      R => Reset_IBUF_160,
      Q => iCounter(16)
    );
  iCounter_17 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iCounter_mux0004(17),
      R => Reset_IBUF_160,
      Q => iCounter(17)
    );
  iCounter_18 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iCounter_mux0004(18),
      R => Reset_IBUF_160,
      Q => iCounter(18)
    );
  iCounter_19 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iCounter_mux0004(19),
      R => Reset_IBUF_160,
      Q => iCounter(19)
    );
  iCounter_20 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iCounter_mux0004(20),
      R => Reset_IBUF_160,
      Q => iCounter(20)
    );
  Enable_24 : FDR
    port map (
      C => Clock_BUFGP_2,
      D => Enable_mux0000,
      R => Reset_IBUF_160,
      Q => Enable_OBUF_23
    );
  presState_0 : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => Clock_BUFGP_2,
      D => presState_mux0003_9_Q,
      Q => presState(0)
    );
  presState_2 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => presState_mux0003_7_Q,
      Q => presState(2)
    );
  isFunc : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      CE => isFunc_not0001,
      D => CharSeq(0, 2),
      Q => isFunc_289
    );
  isTransmit : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      CE => Reset_inv,
      D => isTransmit_mux0000_301,
      Q => isTransmit_300
    );
  RS_29 : FDR
    port map (
      C => Clock_BUFGP_2,
      D => RS_mux0000,
      R => Reset_IBUF_160,
      Q => RS_OBUF_152
    );
  isResetAddr : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      CE => Reset_inv,
      D => isResetAddr_mux0000,
      Q => isResetAddr_296
    );
  iDisplay : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      CE => Reset_inv,
      D => Display_IBUF_21,
      Q => iDisplay_273
    );
  isInitStg1 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      CE => isInitStg1_not0001,
      D => CharSeq(0, 2),
      Q => isInitStg1_292
    );
  isInitStg2 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      CE => isInitStg2_not0001,
      D => CharSeq(0, 2),
      Q => isInitStg2_294
    );
  isDisplay : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      CE => isDisplay_not0001,
      D => CharSeq(0, 2),
      Q => isDisplay_285
    );
  iDisplayEnable : FDSE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      CE => iDisplayEnable_not0001,
      D => RW_OBUF_158,
      S => iDisplayEnable_and0000,
      Q => iDisplayEnable_274
    );
  isAllTransmit : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      CE => Reset_inv,
      D => isAllTransmit_mux0000_281,
      Q => isAllTransmit_280
    );
  isEntry : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      CE => isEntry_not0001,
      D => CharSeq(0, 2),
      Q => isEntry_287
    );
  isClear : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      CE => isClear_not0001,
      D => CharSeq(0, 2),
      Q => isClear_282
    );
  isConfig : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => CharSeq(0, 2),
      G => isClear_282,
      GE => presState(4),
      Q => isConfig_284
    );
  isInit : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => CharSeq(0, 2),
      G => isInitStg2_294,
      GE => presState(1),
      Q => isInit_291
    );
  iCharSent_0 : LD
    generic map(
      INIT => '0'
    )
    port map (
      D => iCharSent_mux0001(0),
      G => presState(6),
      Q => iCharSent(0)
    );
  iCharSent_1 : LD
    generic map(
      INIT => '0'
    )
    port map (
      D => iCharSent_mux0001(1),
      G => presState(6),
      Q => iCharSent(1)
    );
  iCharSent_2 : LD
    generic map(
      INIT => '0'
    )
    port map (
      D => iCharSent_mux0001(2),
      G => presState(6),
      Q => iCharSent(2)
    );
  iCharSent_3 : LD
    generic map(
      INIT => '0'
    )
    port map (
      D => iCharSent_mux0001(3),
      G => presState(6),
      Q => iCharSent(3)
    );
  Madd_iCounter_add0000_cy_0_Q : MUXCY
    port map (
      CI => RW_OBUF_158,
      DI => CharSeq(0, 2),
      S => Madd_iCounter_add0000_lut(0),
      O => Madd_iCounter_add0000_cy(0)
    );
  Madd_iCounter_add0000_xor_0_Q : XORCY
    port map (
      CI => RW_OBUF_158,
      LI => Madd_iCounter_add0000_lut(0),
      O => iCounter_add0000(0)
    );
  Madd_iCounter_add0000_cy_1_Q : MUXCY
    port map (
      CI => Madd_iCounter_add0000_cy(0),
      DI => RW_OBUF_158,
      S => Madd_iCounter_add0000_cy_1_rt_62,
      O => Madd_iCounter_add0000_cy(1)
    );
  Madd_iCounter_add0000_xor_1_Q : XORCY
    port map (
      CI => Madd_iCounter_add0000_cy(0),
      LI => Madd_iCounter_add0000_cy_1_rt_62,
      O => iCounter_add0000(1)
    );
  Madd_iCounter_add0000_cy_2_Q : MUXCY
    port map (
      CI => Madd_iCounter_add0000_cy(1),
      DI => RW_OBUF_158,
      S => Madd_iCounter_add0000_cy_2_rt_64,
      O => Madd_iCounter_add0000_cy(2)
    );
  Madd_iCounter_add0000_xor_2_Q : XORCY
    port map (
      CI => Madd_iCounter_add0000_cy(1),
      LI => Madd_iCounter_add0000_cy_2_rt_64,
      O => iCounter_add0000(2)
    );
  Madd_iCounter_add0000_cy_3_Q : MUXCY
    port map (
      CI => Madd_iCounter_add0000_cy(2),
      DI => RW_OBUF_158,
      S => Madd_iCounter_add0000_cy_3_rt_66,
      O => Madd_iCounter_add0000_cy(3)
    );
  Madd_iCounter_add0000_xor_3_Q : XORCY
    port map (
      CI => Madd_iCounter_add0000_cy(2),
      LI => Madd_iCounter_add0000_cy_3_rt_66,
      O => iCounter_add0000(3)
    );
  Madd_iCounter_add0000_cy_4_Q : MUXCY
    port map (
      CI => Madd_iCounter_add0000_cy(3),
      DI => RW_OBUF_158,
      S => Madd_iCounter_add0000_cy_4_rt_68,
      O => Madd_iCounter_add0000_cy(4)
    );
  Madd_iCounter_add0000_xor_4_Q : XORCY
    port map (
      CI => Madd_iCounter_add0000_cy(3),
      LI => Madd_iCounter_add0000_cy_4_rt_68,
      O => iCounter_add0000(4)
    );
  Madd_iCounter_add0000_cy_5_Q : MUXCY
    port map (
      CI => Madd_iCounter_add0000_cy(4),
      DI => RW_OBUF_158,
      S => Madd_iCounter_add0000_cy_5_rt_70,
      O => Madd_iCounter_add0000_cy(5)
    );
  Madd_iCounter_add0000_xor_5_Q : XORCY
    port map (
      CI => Madd_iCounter_add0000_cy(4),
      LI => Madd_iCounter_add0000_cy_5_rt_70,
      O => iCounter_add0000(5)
    );
  Madd_iCounter_add0000_cy_6_Q : MUXCY
    port map (
      CI => Madd_iCounter_add0000_cy(5),
      DI => RW_OBUF_158,
      S => Madd_iCounter_add0000_cy_6_rt_72,
      O => Madd_iCounter_add0000_cy(6)
    );
  Madd_iCounter_add0000_xor_6_Q : XORCY
    port map (
      CI => Madd_iCounter_add0000_cy(5),
      LI => Madd_iCounter_add0000_cy_6_rt_72,
      O => iCounter_add0000(6)
    );
  Madd_iCounter_add0000_cy_7_Q : MUXCY
    port map (
      CI => Madd_iCounter_add0000_cy(6),
      DI => RW_OBUF_158,
      S => Madd_iCounter_add0000_cy_7_rt_74,
      O => Madd_iCounter_add0000_cy(7)
    );
  Madd_iCounter_add0000_xor_7_Q : XORCY
    port map (
      CI => Madd_iCounter_add0000_cy(6),
      LI => Madd_iCounter_add0000_cy_7_rt_74,
      O => iCounter_add0000(7)
    );
  Madd_iCounter_add0000_cy_8_Q : MUXCY
    port map (
      CI => Madd_iCounter_add0000_cy(7),
      DI => RW_OBUF_158,
      S => Madd_iCounter_add0000_cy_8_rt_76,
      O => Madd_iCounter_add0000_cy(8)
    );
  Madd_iCounter_add0000_xor_8_Q : XORCY
    port map (
      CI => Madd_iCounter_add0000_cy(7),
      LI => Madd_iCounter_add0000_cy_8_rt_76,
      O => iCounter_add0000(8)
    );
  Madd_iCounter_add0000_cy_9_Q : MUXCY
    port map (
      CI => Madd_iCounter_add0000_cy(8),
      DI => RW_OBUF_158,
      S => Madd_iCounter_add0000_cy_9_rt_78,
      O => Madd_iCounter_add0000_cy(9)
    );
  Madd_iCounter_add0000_xor_9_Q : XORCY
    port map (
      CI => Madd_iCounter_add0000_cy(8),
      LI => Madd_iCounter_add0000_cy_9_rt_78,
      O => iCounter_add0000(9)
    );
  Madd_iCounter_add0000_cy_10_Q : MUXCY
    port map (
      CI => Madd_iCounter_add0000_cy(9),
      DI => RW_OBUF_158,
      S => Madd_iCounter_add0000_cy_10_rt_42,
      O => Madd_iCounter_add0000_cy(10)
    );
  Madd_iCounter_add0000_xor_10_Q : XORCY
    port map (
      CI => Madd_iCounter_add0000_cy(9),
      LI => Madd_iCounter_add0000_cy_10_rt_42,
      O => iCounter_add0000(10)
    );
  Madd_iCounter_add0000_cy_11_Q : MUXCY
    port map (
      CI => Madd_iCounter_add0000_cy(10),
      DI => RW_OBUF_158,
      S => Madd_iCounter_add0000_cy_11_rt_44,
      O => Madd_iCounter_add0000_cy(11)
    );
  Madd_iCounter_add0000_xor_11_Q : XORCY
    port map (
      CI => Madd_iCounter_add0000_cy(10),
      LI => Madd_iCounter_add0000_cy_11_rt_44,
      O => iCounter_add0000(11)
    );
  Madd_iCounter_add0000_cy_12_Q : MUXCY
    port map (
      CI => Madd_iCounter_add0000_cy(11),
      DI => RW_OBUF_158,
      S => Madd_iCounter_add0000_cy_12_rt_46,
      O => Madd_iCounter_add0000_cy(12)
    );
  Madd_iCounter_add0000_xor_12_Q : XORCY
    port map (
      CI => Madd_iCounter_add0000_cy(11),
      LI => Madd_iCounter_add0000_cy_12_rt_46,
      O => iCounter_add0000(12)
    );
  Madd_iCounter_add0000_cy_13_Q : MUXCY
    port map (
      CI => Madd_iCounter_add0000_cy(12),
      DI => RW_OBUF_158,
      S => Madd_iCounter_add0000_cy_13_rt_48,
      O => Madd_iCounter_add0000_cy(13)
    );
  Madd_iCounter_add0000_xor_13_Q : XORCY
    port map (
      CI => Madd_iCounter_add0000_cy(12),
      LI => Madd_iCounter_add0000_cy_13_rt_48,
      O => iCounter_add0000(13)
    );
  Madd_iCounter_add0000_cy_14_Q : MUXCY
    port map (
      CI => Madd_iCounter_add0000_cy(13),
      DI => RW_OBUF_158,
      S => Madd_iCounter_add0000_cy_14_rt_50,
      O => Madd_iCounter_add0000_cy(14)
    );
  Madd_iCounter_add0000_xor_14_Q : XORCY
    port map (
      CI => Madd_iCounter_add0000_cy(13),
      LI => Madd_iCounter_add0000_cy_14_rt_50,
      O => iCounter_add0000(14)
    );
  Madd_iCounter_add0000_cy_15_Q : MUXCY
    port map (
      CI => Madd_iCounter_add0000_cy(14),
      DI => RW_OBUF_158,
      S => Madd_iCounter_add0000_cy_15_rt_52,
      O => Madd_iCounter_add0000_cy(15)
    );
  Madd_iCounter_add0000_xor_15_Q : XORCY
    port map (
      CI => Madd_iCounter_add0000_cy(14),
      LI => Madd_iCounter_add0000_cy_15_rt_52,
      O => iCounter_add0000(15)
    );
  Madd_iCounter_add0000_cy_16_Q : MUXCY
    port map (
      CI => Madd_iCounter_add0000_cy(15),
      DI => RW_OBUF_158,
      S => Madd_iCounter_add0000_cy_16_rt_54,
      O => Madd_iCounter_add0000_cy(16)
    );
  Madd_iCounter_add0000_xor_16_Q : XORCY
    port map (
      CI => Madd_iCounter_add0000_cy(15),
      LI => Madd_iCounter_add0000_cy_16_rt_54,
      O => iCounter_add0000(16)
    );
  Madd_iCounter_add0000_cy_17_Q : MUXCY
    port map (
      CI => Madd_iCounter_add0000_cy(16),
      DI => RW_OBUF_158,
      S => Madd_iCounter_add0000_cy_17_rt_56,
      O => Madd_iCounter_add0000_cy(17)
    );
  Madd_iCounter_add0000_xor_17_Q : XORCY
    port map (
      CI => Madd_iCounter_add0000_cy(16),
      LI => Madd_iCounter_add0000_cy_17_rt_56,
      O => iCounter_add0000(17)
    );
  Madd_iCounter_add0000_cy_18_Q : MUXCY
    port map (
      CI => Madd_iCounter_add0000_cy(17),
      DI => RW_OBUF_158,
      S => Madd_iCounter_add0000_cy_18_rt_58,
      O => Madd_iCounter_add0000_cy(18)
    );
  Madd_iCounter_add0000_xor_18_Q : XORCY
    port map (
      CI => Madd_iCounter_add0000_cy(17),
      LI => Madd_iCounter_add0000_cy_18_rt_58,
      O => iCounter_add0000(18)
    );
  Madd_iCounter_add0000_cy_19_Q : MUXCY
    port map (
      CI => Madd_iCounter_add0000_cy(18),
      DI => RW_OBUF_158,
      S => Madd_iCounter_add0000_cy_19_rt_60,
      O => Madd_iCounter_add0000_cy(19)
    );
  Madd_iCounter_add0000_xor_19_Q : XORCY
    port map (
      CI => Madd_iCounter_add0000_cy(18),
      LI => Madd_iCounter_add0000_cy_19_rt_60,
      O => iCounter_add0000(19)
    );
  Madd_iCounter_add0000_xor_20_Q : XORCY
    port map (
      CI => Madd_iCounter_add0000_cy(19),
      LI => Madd_iCounter_add0000_xor_20_rt_80,
      O => iCounter_add0000(20)
    );
  transmitState_FSM_FFd1 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => transmitState_FSM_FFd1_In_326,
      R => Reset_IBUF_160,
      Q => transmitState_FSM_FFd1_325
    );
  iData_0 : LD
    generic map(
      INIT => '0'
    )
    port map (
      D => iData_mux0002(0),
      G => iData_not0001,
      Q => iData(0)
    );
  iData_1 : LD
    generic map(
      INIT => '0'
    )
    port map (
      D => iData_mux0002(1),
      G => iData_not0001,
      Q => iData(1)
    );
  iData_2 : LD
    generic map(
      INIT => '0'
    )
    port map (
      D => iData_mux0002(2),
      G => iData_not0001,
      Q => iData(2)
    );
  iData_3 : LD
    generic map(
      INIT => '0'
    )
    port map (
      D => iData_mux0002(3),
      G => iData_not0001,
      Q => iData(3)
    );
  iData_4 : LD
    generic map(
      INIT => '0'
    )
    port map (
      D => iData_mux0002(4),
      G => iData_not0001,
      Q => iData(4)
    );
  iData_5 : LD
    generic map(
      INIT => '0'
    )
    port map (
      D => iData_mux0002(5),
      G => iData_not0001,
      Q => iData(5)
    );
  iData_6 : LD
    generic map(
      INIT => '0'
    )
    port map (
      D => iData_mux0002(6),
      G => iData_not0001,
      Q => iData(6)
    );
  iData_7 : LD
    generic map(
      INIT => '0'
    )
    port map (
      D => iData_mux0002(7),
      G => iData_not0001,
      Q => iData(7)
    );
  Mmux_varindex00001021 : LUT3
    generic map(
      INIT => X"08"
    )
    port map (
      I0 => iCharSent(0),
      I1 => iCharSent(3),
      I2 => iCharSent(1),
      O => N25
    );
  iData_mux0002_6_1 : LUT4
    generic map(
      INIT => X"0282"
    )
    port map (
      I0 => N14,
      I1 => iCharSent(2),
      I2 => iCharSent(3),
      I3 => iCharSent(1),
      O => iData_mux0002(6)
    );
  iData_mux0002_4_SW0 : LUT4
    generic map(
      INIT => X"E046"
    )
    port map (
      I0 => iCharSent(1),
      I1 => iCharSent(0),
      I2 => iCharSent(3),
      I3 => iCharSent(2),
      O => N45
    );
  iData_mux0002_4_Q : LUT3
    generic map(
      INIT => X"F2"
    )
    port map (
      I0 => N14,
      I1 => N45,
      I2 => N8,
      O => iData_mux0002(4)
    );
  iData_mux0002_5_SW0 : LUT4
    generic map(
      INIT => X"FF76"
    )
    port map (
      I0 => iCharSent(3),
      I1 => iCharSent(2),
      I2 => iCharSent(0),
      I3 => iCharSent(1),
      O => N47
    );
  iData_mux0002_5_Q : LUT4
    generic map(
      INIT => X"FFEA"
    )
    port map (
      I0 => N8,
      I1 => N14,
      I2 => N47,
      I3 => N37,
      O => iData_mux0002(5)
    );
  iData_mux0002_3_SW0 : LUT4
    generic map(
      INIT => X"FBAD"
    )
    port map (
      I0 => iCharSent(1),
      I1 => iCharSent(3),
      I2 => iCharSent(2),
      I3 => iCharSent(0),
      O => N49
    );
  iData_mux0002_3_Q : LUT4
    generic map(
      INIT => X"FFAE"
    )
    port map (
      I0 => N37,
      I1 => N14,
      I2 => N49,
      I3 => N32,
      O => iData_mux0002(3)
    );
  iData_mux0002_2_SW0 : LUT4
    generic map(
      INIT => X"C9EC"
    )
    port map (
      I0 => iCharSent(1),
      I1 => iCharSent(2),
      I2 => iCharSent(0),
      I3 => iCharSent(3),
      O => N51
    );
  iData_mux0002_2_Q : LUT4
    generic map(
      INIT => X"FFAE"
    )
    port map (
      I0 => iData_mux0002_1_58_258,
      I1 => N14,
      I2 => N51,
      I3 => N32,
      O => iData_mux0002(2)
    );
  iData_mux0002_0_SW0 : LUT4
    generic map(
      INIT => X"8691"
    )
    port map (
      I0 => iCharSent(3),
      I1 => iCharSent(1),
      I2 => iCharSent(2),
      I3 => iCharSent(0),
      O => N53
    );
  iData_mux0002_0_Q : LUT4
    generic map(
      INIT => X"FFAE"
    )
    port map (
      I0 => N311,
      I1 => N14,
      I2 => N53,
      I3 => N38,
      O => iData_mux0002(0)
    );
  iData_mux0002_1_58 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => isEntry_287,
      I1 => presState(3),
      O => iData_mux0002_1_58_258
    );
  iData_not000162 : LUT4
    generic map(
      INIT => X"1030"
    )
    port map (
      I0 => isClear_282,
      I1 => presState(9),
      I2 => iData_not000157_270,
      I3 => presState(4),
      O => iData_not000162_271
    );
  iData_not000177 : LUT4
    generic map(
      INIT => X"135F"
    )
    port map (
      I0 => presState(1),
      I1 => presState(0),
      I2 => isInitStg2_294,
      I3 => isInitStg1_292,
      O => iData_not000177_272
    );
  transmitState_FSM_Out61 : LUT3
    generic map(
      INIT => X"F2"
    )
    port map (
      I0 => transmitState_FSM_FFd2_327,
      I1 => transmitState_FSM_FFd3_332,
      I2 => transmitState_FSM_FFd1_325,
      O => LED_6_OBUF_38
    );
  transmitState_FSM_Out81 : LUT3
    generic map(
      INIT => X"F9"
    )
    port map (
      I0 => transmitState_FSM_FFd3_332,
      I1 => transmitState_FSM_FFd2_327,
      I2 => transmitState_FSM_FFd1_325,
      O => LED_4_OBUF_37
    );
  Enable_mux00001 : LUT3
    generic map(
      INIT => X"98"
    )
    port map (
      I0 => transmitState_FSM_FFd2_327,
      I1 => transmitState_FSM_FFd3_332,
      I2 => Enable_OBUF_23,
      O => Enable_mux0000
    );
  iCharSent_mux0001_0_1 : LUT3
    generic map(
      INIT => X"51"
    )
    port map (
      I0 => iCharSent(0),
      I1 => isAllTransmit_280,
      I2 => isTransmit_300,
      O => iCharSent_mux0001(0)
    );
  iCharSent_mux0001_1_1 : LUT4
    generic map(
      INIT => X"6606"
    )
    port map (
      I0 => iCharSent(0),
      I1 => iCharSent(1),
      I2 => isAllTransmit_280,
      I3 => isTransmit_300,
      O => iCharSent_mux0001(1)
    );
  isInitStg2_not00011 : LUT3
    generic map(
      INIT => X"08"
    )
    port map (
      I0 => presState(1),
      I1 => transmitState_FSM_FFd1_325,
      I2 => Reset_IBUF_160,
      O => isInitStg2_not0001
    );
  isInitStg1_not00011 : LUT3
    generic map(
      INIT => X"08"
    )
    port map (
      I0 => presState(0),
      I1 => transmitState_FSM_FFd1_325,
      I2 => Reset_IBUF_160,
      O => isInitStg1_not0001
    );
  isFunc_not00011 : LUT3
    generic map(
      INIT => X"08"
    )
    port map (
      I0 => presState(2),
      I1 => transmitState_FSM_FFd1_325,
      I2 => Reset_IBUF_160,
      O => isFunc_not0001
    );
  isEntry_not00011 : LUT3
    generic map(
      INIT => X"08"
    )
    port map (
      I0 => presState(3),
      I1 => transmitState_FSM_FFd1_325,
      I2 => Reset_IBUF_160,
      O => isEntry_not0001
    );
  isDisplay_not00011 : LUT3
    generic map(
      INIT => X"08"
    )
    port map (
      I0 => presState(5),
      I1 => transmitState_FSM_FFd1_325,
      I2 => Reset_IBUF_160,
      O => isDisplay_not0001
    );
  isClear_not00011 : LUT3
    generic map(
      INIT => X"08"
    )
    port map (
      I0 => presState(4),
      I1 => transmitState_FSM_FFd1_325,
      I2 => Reset_IBUF_160,
      O => isClear_not0001
    );
  presState_mux0003_2_11 : LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => isConfig_284,
      I1 => isInit_291,
      I2 => Reset_IBUF_160,
      O => iDisplayEnable_not0001
    );
  iDisplayEnable_and00001 : LUT3
    generic map(
      INIT => X"10"
    )
    port map (
      I0 => iDisplayEnable_274,
      I1 => iDisplay_273,
      I2 => Display_IBUF_21,
      O => iDisplayEnable_and0000
    );
  transmitState_FSM_Out01 : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => transmitState_FSM_FFd3_332,
      I1 => transmitState_FSM_FFd2_327,
      O => transmitState_cmp_eq0012
    );
  nextState_9_1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => presState(8),
      I1 => isResetAddr_296,
      O => nextState_9_Q
    );
  nextState_1_1 : LUT4
    generic map(
      INIT => X"8F88"
    )
    port map (
      I0 => isInitStg1_292,
      I1 => presState(0),
      I2 => isInitStg2_294,
      I3 => presState(1),
      O => nextState_1_Q
    );
  LED_3_mux0000_SW0 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => presState(7),
      I1 => iDisplayEnable_274,
      O => presState_mux0003_3_11
    );
  Data_mux0000_3_22 : LUT4
    generic map(
      INIT => X"882A"
    )
    port map (
      I0 => Data_3_10,
      I1 => transmitState_FSM_FFd2_327,
      I2 => transmitState_FSM_FFd1_325,
      I3 => transmitState_FSM_FFd3_332,
      O => Data_mux0000_3_22_18
    );
  Data_mux0000_3_33 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => transmitState_FSM_FFd2_327,
      I1 => transmitState_FSM_FFd3_332,
      O => Data_mux0000_0_33
    );
  Data_mux0000_3_38 : LUT4
    generic map(
      INIT => X"E040"
    )
    port map (
      I0 => iStage_277,
      I1 => iData(7),
      I2 => Data_mux0000_0_33,
      I3 => iData(3),
      O => Data_mux0000_3_38_19
    );
  Data_mux0000_2_22 : LUT4
    generic map(
      INIT => X"882A"
    )
    port map (
      I0 => Data_2_9,
      I1 => transmitState_FSM_FFd2_327,
      I2 => transmitState_FSM_FFd1_325,
      I3 => transmitState_FSM_FFd3_332,
      O => Data_mux0000_2_22_16
    );
  Data_mux0000_2_38 : LUT4
    generic map(
      INIT => X"E040"
    )
    port map (
      I0 => iStage_277,
      I1 => iData(6),
      I2 => Data_mux0000_0_33,
      I3 => iData(2),
      O => Data_mux0000_2_38_17
    );
  Data_mux0000_1_22 : LUT4
    generic map(
      INIT => X"882A"
    )
    port map (
      I0 => Data_1_8,
      I1 => transmitState_FSM_FFd2_327,
      I2 => transmitState_FSM_FFd1_325,
      I3 => transmitState_FSM_FFd3_332,
      O => Data_mux0000_1_22_14
    );
  Data_mux0000_1_38 : LUT4
    generic map(
      INIT => X"E040"
    )
    port map (
      I0 => iStage_277,
      I1 => iData(5),
      I2 => Data_mux0000_0_33,
      I3 => iData(1),
      O => Data_mux0000_1_38_15
    );
  Data_mux0000_0_22 : LUT4
    generic map(
      INIT => X"882A"
    )
    port map (
      I0 => Data_0_7,
      I1 => transmitState_FSM_FFd2_327,
      I2 => transmitState_FSM_FFd1_325,
      I3 => transmitState_FSM_FFd3_332,
      O => Data_mux0000_0_22_11
    );
  Data_mux0000_0_38 : LUT4
    generic map(
      INIT => X"E040"
    )
    port map (
      I0 => iStage_277,
      I1 => iData(4),
      I2 => Data_mux0000_0_33,
      I3 => iData(0),
      O => Data_mux0000_0_38_13
    );
  RS_mux000015 : LUT3
    generic map(
      INIT => X"A7"
    )
    port map (
      I0 => transmitState_FSM_FFd2_327,
      I1 => transmitState_FSM_FFd1_325,
      I2 => transmitState_FSM_FFd3_332,
      O => RS_mux000015_154
    );
  RS_mux000035 : LUT4
    generic map(
      INIT => X"0008"
    )
    port map (
      I0 => N145,
      I1 => transmitState_FSM_FFd3_332,
      I2 => presState(2),
      I3 => transmitState_FSM_FFd2_327,
      O => RS_mux000035_155
    );
  RS_mux000048 : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => presState(8),
      I1 => presState(5),
      I2 => presState(4),
      I3 => presState(3),
      O => RS_mux000048_156
    );
  RS_mux000062 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => RS_OBUF_152,
      I1 => RS_mux000015_154,
      I2 => RS_mux000035_155,
      I3 => RS_mux000048_156,
      O => RS_mux0000
    );
  iCharSent_mux0001_3_SW0 : LUT3
    generic map(
      INIT => X"7F"
    )
    port map (
      I0 => iCharSent(1),
      I1 => iCharSent(0),
      I2 => iCharSent(2),
      O => N62
    );
  iCharSent_mux0001_3_Q : LUT4
    generic map(
      INIT => X"84A5"
    )
    port map (
      I0 => iCharSent(3),
      I1 => isTransmit_300,
      I2 => N62,
      I3 => isAllTransmit_280,
      O => iCharSent_mux0001(3)
    );
  nextState_7_SW0 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => iDisplayEnable_274,
      I1 => presState(7),
      O => N64
    );
  nextState_7_Q : LUT4
    generic map(
      INIT => X"FFEA"
    )
    port map (
      I0 => presState(9),
      I1 => presState(4),
      I2 => isClear_282,
      I3 => N64,
      O => nextState_7_Q_305
    );
  LED_2_mux0000_SW0 : LUT3
    generic map(
      INIT => X"EA"
    )
    port map (
      I0 => nextState_7_Q_305,
      I1 => presState(2),
      I2 => isFunc_289,
      O => N66
    );
  LED_2_mux0000 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => nextState_5_Q,
      I1 => nextState_4_Q,
      I2 => iData_mux0002_1_58_258,
      I3 => N66,
      O => LED_2_OBUF_35
    );
  LED_1_mux0000 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => nextState_4_Q,
      I1 => N37,
      I2 => nextState_9_Q,
      I3 => N68,
      O => LED_1_OBUF_34
    );
  LED_0_mux0000_SW0 : LUT4
    generic map(
      INIT => X"FFEA"
    )
    port map (
      I0 => N37,
      I1 => presState(1),
      I2 => isInitStg2_294,
      I3 => nextState_7_Q_305,
      O => N70
    );
  LED_0_mux0000 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => nextState_8_Q,
      I1 => nextState_5_Q,
      I2 => N311,
      I3 => N70,
      O => LED_0_OBUF_33
    );
  nextState_8_1 : LUT4
    generic map(
      INIT => X"FF20"
    )
    port map (
      I0 => presState(6),
      I1 => isTransmit_300,
      I2 => isAllTransmit_280,
      I3 => N144,
      O => nextState_8_Q
    );
  iCounter_or00021 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => presState(4),
      I1 => presState(8),
      O => iCounter_or0002
    );
  iTransmit61 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => isClear_282,
      I1 => presState(4),
      O => N38
    );
  iTransmit51 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => isFunc_289,
      I1 => presState(2),
      O => N37
    );
  iTransmit41 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => isDisplay_285,
      I1 => presState(5),
      O => N32
    );
  iTransmit31 : LUT3
    generic map(
      INIT => X"8C"
    )
    port map (
      I0 => isTransmit_300,
      I1 => presState(6),
      I2 => isAllTransmit_280,
      O => N14
    );
  transmitState_FSM_FFd1_In_SW0 : LUT4
    generic map(
      INIT => X"FBFF"
    )
    port map (
      I0 => transmitState_FSM_FFd3_332,
      I1 => iStage_277,
      I2 => transmitState_FSM_FFd1_325,
      I3 => transmitState_FSM_FFd2_327,
      O => N72
    );
  transmitState_FSM_FFd1_In : LUT4
    generic map(
      INIT => X"2320"
    )
    port map (
      I0 => transmitState_cmp_eq0010_342,
      I1 => N72,
      I2 => iCounter_or0002,
      I3 => transmitState_cmp_eq0005_340,
      O => transmitState_FSM_FFd1_In_326
    );
  LED_0_mux000011 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => isInitStg1_292,
      I1 => presState(0),
      O => N311
    );
  iTransmit_SW0 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => N38,
      I1 => N37,
      I2 => N32,
      I3 => N14,
      O => N79
    );
  iTransmit : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => N8,
      I1 => N411,
      I2 => iData_mux0002_1_58_258,
      I3 => N79,
      O => LED_7_OBUF_39
    );
  transmitState_cmp_eq0007_SW0 : LUT3
    generic map(
      INIT => X"EF"
    )
    port map (
      I0 => iCounter(1),
      I1 => iCounter(4),
      I2 => iCounter(3),
      O => N81
    );
  transmitState_cmp_eq0010_SW0 : LUT4
    generic map(
      INIT => X"FEFF"
    )
    port map (
      I0 => iCounter(13),
      I1 => iCounter(7),
      I2 => iCounter(3),
      I3 => iCounter(4),
      O => N83
    );
  iStage_mux000012 : LUT4
    generic map(
      INIT => X"C4CC"
    )
    port map (
      I0 => transmitState_FSM_FFd2_327,
      I1 => iStage_277,
      I2 => transmitState_FSM_FFd3_332,
      I3 => transmitState_FSM_FFd1_325,
      O => iStage_mux000012_278
    );
  transmitState_FSM_FFd3_In15 : LUT4
    generic map(
      INIT => X"32BA"
    )
    port map (
      I0 => transmitState_FSM_FFd3_332,
      I1 => transmitState_FSM_FFd2_327,
      I2 => LED_7_OBUF_39,
      I3 => transmitState_cmp_eq0007_341,
      O => transmitState_FSM_FFd3_In15_333
    );
  transmitState_FSM_FFd3_In35 : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => transmitState_FSM_FFd2_327,
      I1 => transmitState_FSM_FFd1_325,
      I2 => iStage_277,
      I3 => transmitState_FSM_FFd3_332,
      O => transmitState_FSM_FFd3_In35_334
    );
  iCounter_mux0004_9_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => iCounter(9),
      I1 => transmitState_cmp_eq0012,
      I2 => iCounter_add0000(9),
      I3 => N157,
      O => iCounter_mux0004(9)
    );
  iCounter_mux0004_8_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => iCounter(8),
      I1 => transmitState_cmp_eq0012,
      I2 => iCounter_add0000(8),
      I3 => iCounter_mux0004_0_1162_218,
      O => iCounter_mux0004(8)
    );
  iCounter_mux0004_7_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => iCounter(7),
      I1 => transmitState_cmp_eq0012,
      I2 => iCounter_add0000(7),
      I3 => iCounter_mux0004_0_1162_218,
      O => iCounter_mux0004(7)
    );
  iCounter_mux0004_6_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => iCounter(6),
      I1 => transmitState_cmp_eq0012,
      I2 => iCounter_add0000(6),
      I3 => iCounter_mux0004_0_1162_218,
      O => iCounter_mux0004(6)
    );
  iCounter_mux0004_5_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => iCounter(5),
      I1 => transmitState_cmp_eq0012,
      I2 => iCounter_add0000(5),
      I3 => iCounter_mux0004_0_1162_218,
      O => iCounter_mux0004(5)
    );
  iCounter_mux0004_4_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => iCounter(4),
      I1 => transmitState_cmp_eq0012,
      I2 => iCounter_add0000(4),
      I3 => iCounter_mux0004_0_1162_218,
      O => iCounter_mux0004(4)
    );
  iCounter_mux0004_3_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => iCounter(3),
      I1 => transmitState_cmp_eq0012,
      I2 => iCounter_add0000(3),
      I3 => iCounter_mux0004_0_1162_218,
      O => iCounter_mux0004(3)
    );
  iCounter_mux0004_2_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => iCounter(2),
      I1 => transmitState_cmp_eq0012,
      I2 => iCounter_add0000(2),
      I3 => iCounter_mux0004_0_1162_218,
      O => iCounter_mux0004(2)
    );
  iCounter_mux0004_20_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => iCounter(20),
      I1 => transmitState_cmp_eq0012,
      I2 => iCounter_add0000(20),
      I3 => iCounter_mux0004_0_1162_218,
      O => iCounter_mux0004(20)
    );
  iCounter_mux0004_1_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => iCounter(1),
      I1 => transmitState_cmp_eq0012,
      I2 => iCounter_add0000(1),
      I3 => iCounter_mux0004_0_1162_218,
      O => iCounter_mux0004(1)
    );
  iCounter_mux0004_19_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => iCounter(19),
      I1 => transmitState_cmp_eq0012,
      I2 => iCounter_add0000(19),
      I3 => iCounter_mux0004_0_1162_218,
      O => iCounter_mux0004(19)
    );
  iCounter_mux0004_18_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => iCounter(18),
      I1 => transmitState_cmp_eq0012,
      I2 => iCounter_add0000(18),
      I3 => N153,
      O => iCounter_mux0004(18)
    );
  iCounter_mux0004_17_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => iCounter(17),
      I1 => transmitState_cmp_eq0012,
      I2 => iCounter_add0000(17),
      I3 => N1,
      O => iCounter_mux0004(17)
    );
  iCounter_mux0004_16_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => iCounter(16),
      I1 => transmitState_cmp_eq0012,
      I2 => iCounter_add0000(16),
      I3 => N1,
      O => iCounter_mux0004(16)
    );
  iCounter_mux0004_15_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => iCounter(15),
      I1 => transmitState_cmp_eq0012,
      I2 => iCounter_add0000(15),
      I3 => N1,
      O => iCounter_mux0004(15)
    );
  iCounter_mux0004_14_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => iCounter(14),
      I1 => transmitState_cmp_eq0012,
      I2 => iCounter_add0000(14),
      I3 => N1,
      O => iCounter_mux0004(14)
    );
  iCounter_mux0004_13_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => iCounter(13),
      I1 => transmitState_cmp_eq0012,
      I2 => iCounter_add0000(13),
      I3 => N1,
      O => iCounter_mux0004(13)
    );
  iCounter_mux0004_12_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => iCounter(12),
      I1 => transmitState_cmp_eq0012,
      I2 => iCounter_add0000(12),
      I3 => N1,
      O => iCounter_mux0004(12)
    );
  iCounter_mux0004_11_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => iCounter(11),
      I1 => transmitState_cmp_eq0012,
      I2 => iCounter_add0000(11),
      I3 => N1,
      O => iCounter_mux0004(11)
    );
  iCounter_mux0004_10_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => iCounter(10),
      I1 => transmitState_cmp_eq0012,
      I2 => iCounter_add0000(10),
      I3 => N1,
      O => iCounter_mux0004(10)
    );
  iCounter_mux0004_0_2 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => iCounter(0),
      I1 => transmitState_cmp_eq0012,
      I2 => iCounter_add0000(0),
      I3 => N1,
      O => iCounter_mux0004(0)
    );
  transmitState_cmp_eq0005_SW0 : LUT3
    generic map(
      INIT => X"DF"
    )
    port map (
      I0 => iCounter(10),
      I1 => iCounter(3),
      I2 => iCounter(4),
      O => N87
    );
  transmitState_cmp_eq0005 : LUT4
    generic map(
      INIT => X"0400"
    )
    port map (
      I0 => iCounter(12),
      I1 => iCounter(6),
      I2 => N87,
      I3 => N156,
      O => transmitState_cmp_eq0005_340
    );
  transmitState_cmp_eq0004 : LUT4
    generic map(
      INIT => X"0200"
    )
    port map (
      I0 => iCounter(12),
      I1 => iCounter(6),
      I2 => N89,
      I3 => N16,
      O => transmitState_cmp_eq0004_338
    );
  transmitState_cmp_eq00061_SW0 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => iCounter(10),
      I1 => iCounter(7),
      I2 => iCounter(12),
      I3 => iCounter(6),
      O => N91
    );
  transmitState_cmp_eq00042_SW0 : LUT4
    generic map(
      INIT => X"FFFD"
    )
    port map (
      I0 => iCounter(7),
      I1 => iCounter(1),
      I2 => iCounter(2),
      I3 => iCounter(5),
      O => N93
    );
  iCounter_mux0004_0_12 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => transmitState_FSM_FFd2_327,
      I1 => N146,
      O => iCounter_mux0004_0_12_219
    );
  iCounter_mux0004_0_162 : LUT4
    generic map(
      INIT => X"5554"
    )
    port map (
      I0 => transmitState_FSM_FFd2_327,
      I1 => iCounter_mux0004_0_111_215,
      I2 => iCounter_mux0004_0_143_221,
      I3 => iCounter_mux0004_0_129_220,
      O => iCounter_mux0004_0_162_222
    );
  Reset_IBUF : IBUF
    port map (
      I => Reset,
      O => Reset_IBUF_160
    );
  Display_IBUF : IBUF
    port map (
      I => Display,
      O => Display_IBUF_21
    );
  RS_OBUF : OBUF
    port map (
      I => RS_OBUF_152,
      O => RS
    );
  RW_OBUF : OBUF
    port map (
      I => RW_OBUF_158,
      O => RW
    );
  Enable_OBUF : OBUF
    port map (
      I => Enable_OBUF_23,
      O => Enable
    );
  Data_3_OBUF : OBUF
    port map (
      I => Data_3_10,
      O => Data(3)
    );
  Data_2_OBUF : OBUF
    port map (
      I => Data_2_9,
      O => Data(2)
    );
  Data_1_OBUF : OBUF
    port map (
      I => Data_1_8,
      O => Data(1)
    );
  Data_0_OBUF : OBUF
    port map (
      I => Data_0_7,
      O => Data(0)
    );
  LED_7_OBUF : OBUF
    port map (
      I => LED_7_OBUF_39,
      O => LED(7)
    );
  LED_6_OBUF : OBUF
    port map (
      I => LED_6_OBUF_38,
      O => LED(6)
    );
  LED_5_OBUF : OBUF
    port map (
      I => transmitState_FSM_FFd3_332,
      O => LED(5)
    );
  LED_4_OBUF : OBUF
    port map (
      I => LED_4_OBUF_37,
      O => LED(4)
    );
  LED_3_OBUF : OBUF
    port map (
      I => LED_3_OBUF_36,
      O => LED(3)
    );
  LED_2_OBUF : OBUF
    port map (
      I => LED_2_OBUF_35,
      O => LED(2)
    );
  LED_1_OBUF : OBUF
    port map (
      I => LED_1_OBUF_34,
      O => LED(1)
    );
  LED_0_OBUF : OBUF
    port map (
      I => LED_0_OBUF_33,
      O => LED(0)
    );
  presState_1 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => nextState_1_Q,
      R => Reset_IBUF_160,
      Q => presState(1)
    );
  presState_4 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => nextState_4_Q,
      R => Reset_IBUF_160,
      Q => presState(4)
    );
  presState_5 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => nextState_5_Q,
      R => Reset_IBUF_160,
      Q => presState(5)
    );
  presState_7 : FDS
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => presState_mux0003_2_1,
      S => iDisplayEnable_not0001,
      Q => presState(7)
    );
  presState_mux0003_2_12 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => Reset_IBUF_160,
      I1 => nextState_7_Q_305,
      O => presState_mux0003_2_1
    );
  presState_8 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => nextState_8_Q,
      R => Reset_IBUF_160,
      Q => presState(8)
    );
  presState_9 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => nextState_9_Q,
      R => Reset_IBUF_160,
      Q => presState(9)
    );
  Data_0 : FDRS
    port map (
      C => Clock_BUFGP_2,
      D => Data_mux0000_0_38_13,
      R => Reset_IBUF_160,
      S => Data_mux0000_0_22_11,
      Q => Data_0_7
    );
  Data_1 : FDRS
    port map (
      C => Clock_BUFGP_2,
      D => Data_mux0000_1_38_15,
      R => Reset_IBUF_160,
      S => Data_mux0000_1_22_14,
      Q => Data_1_8
    );
  Data_2 : FDRS
    port map (
      C => Clock_BUFGP_2,
      D => Data_mux0000_2_38_17,
      R => Reset_IBUF_160,
      S => Data_mux0000_2_22_16,
      Q => Data_2_9
    );
  Data_3 : FDRS
    port map (
      C => Clock_BUFGP_2,
      D => Data_mux0000_3_38_19,
      R => Reset_IBUF_160,
      S => Data_mux0000_3_22_18,
      Q => Data_3_10
    );
  iStage : FDRS
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iStage_mux000032_279,
      R => Reset_IBUF_160,
      S => iStage_mux000012_278,
      Q => iStage_277
    );
  transmitState_FSM_FFd3 : FDRS
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => transmitState_FSM_FFd3_In39_335,
      R => Reset_IBUF_160,
      S => transmitState_FSM_FFd3_In15_333,
      Q => transmitState_FSM_FFd3_332
    );
  transmitState_FSM_FFd2 : FDRS
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => transmitState_FSM_FFd2_In91,
      R => Reset_IBUF_160,
      S => transmitState_FSM_FFd2_In84_330,
      Q => transmitState_FSM_FFd2_327
    );
  presState_3 : FDRS
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => presState_mux0003_6_11,
      R => Reset_IBUF_160,
      S => iData_mux0002_1_58_258,
      Q => presState(3)
    );
  presState_mux0003_6_111 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => isFunc_289,
      I1 => presState(2),
      O => presState_mux0003_6_11
    );
  presState_6 : FDRS
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => presState_mux0003_3_11,
      R => Reset_IBUF_160,
      S => N14,
      Q => presState(6)
    );
  Madd_iCounter_add0000_cy_1_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => iCounter(1),
      O => Madd_iCounter_add0000_cy_1_rt_62
    );
  Madd_iCounter_add0000_cy_2_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => iCounter(2),
      O => Madd_iCounter_add0000_cy_2_rt_64
    );
  Madd_iCounter_add0000_cy_3_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => iCounter(3),
      O => Madd_iCounter_add0000_cy_3_rt_66
    );
  Madd_iCounter_add0000_cy_4_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => iCounter(4),
      O => Madd_iCounter_add0000_cy_4_rt_68
    );
  Madd_iCounter_add0000_cy_5_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => iCounter(5),
      O => Madd_iCounter_add0000_cy_5_rt_70
    );
  Madd_iCounter_add0000_cy_6_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => iCounter(6),
      O => Madd_iCounter_add0000_cy_6_rt_72
    );
  Madd_iCounter_add0000_cy_7_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => iCounter(7),
      O => Madd_iCounter_add0000_cy_7_rt_74
    );
  Madd_iCounter_add0000_cy_8_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => iCounter(8),
      O => Madd_iCounter_add0000_cy_8_rt_76
    );
  Madd_iCounter_add0000_cy_9_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => iCounter(9),
      O => Madd_iCounter_add0000_cy_9_rt_78
    );
  Madd_iCounter_add0000_cy_10_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => iCounter(10),
      O => Madd_iCounter_add0000_cy_10_rt_42
    );
  Madd_iCounter_add0000_cy_11_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => iCounter(11),
      O => Madd_iCounter_add0000_cy_11_rt_44
    );
  Madd_iCounter_add0000_cy_12_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => iCounter(12),
      O => Madd_iCounter_add0000_cy_12_rt_46
    );
  Madd_iCounter_add0000_cy_13_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => iCounter(13),
      O => Madd_iCounter_add0000_cy_13_rt_48
    );
  Madd_iCounter_add0000_cy_14_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => iCounter(14),
      O => Madd_iCounter_add0000_cy_14_rt_50
    );
  Madd_iCounter_add0000_cy_15_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => iCounter(15),
      O => Madd_iCounter_add0000_cy_15_rt_52
    );
  Madd_iCounter_add0000_cy_16_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => iCounter(16),
      O => Madd_iCounter_add0000_cy_16_rt_54
    );
  Madd_iCounter_add0000_cy_17_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => iCounter(17),
      O => Madd_iCounter_add0000_cy_17_rt_56
    );
  Madd_iCounter_add0000_cy_18_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => iCounter(18),
      O => Madd_iCounter_add0000_cy_18_rt_58
    );
  Madd_iCounter_add0000_cy_19_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => iCounter(19),
      O => Madd_iCounter_add0000_cy_19_rt_60
    );
  Madd_iCounter_add0000_xor_20_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => iCounter(20),
      O => Madd_iCounter_add0000_xor_20_rt_80
    );
  transmitState_cmp_eq0001138 : LUT4
    generic map(
      INIT => X"1000"
    )
    port map (
      I0 => iCounter(18),
      I1 => iCounter(9),
      I2 => transmitState_cmp_eq0001111_336,
      I3 => N150,
      O => N11
    );
  iCounter_or000041_SW0 : LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => iCounter(14),
      I1 => iCounter(12),
      I2 => iCounter(4),
      O => N95
    );
  iCounter_or000041 : LUT4
    generic map(
      INIT => X"2000"
    )
    port map (
      I0 => iCounter(5),
      I1 => iStage_277,
      I2 => iCounter_or000038_245,
      I3 => N95,
      O => iCounter_or000041_246
    );
  transmitState_cmp_eq00021_SW1 : LUT3
    generic map(
      INIT => X"DF"
    )
    port map (
      I0 => N151,
      I1 => iCounter(8),
      I2 => iCounter(6),
      O => N97
    );
  transmitState_cmp_eq000621_SW0 : LUT3
    generic map(
      INIT => X"DF"
    )
    port map (
      I0 => iCounter(1),
      I1 => iCounter(2),
      I2 => iCounter(5),
      O => N99
    );
  transmitState_cmp_eq0004139_SW0 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => iCounter(9),
      I1 => iCounter(18),
      I2 => iCounter(19),
      I3 => iCounter(8),
      O => N101
    );
  transmitState_cmp_eq00061 : LUT4
    generic map(
      INIT => X"0008"
    )
    port map (
      I0 => N152,
      I1 => transmitState_cmp_eq0001136_337,
      I2 => N91,
      I3 => N101,
      O => N13
    );
  iCounter_or000078 : LUT4
    generic map(
      INIT => X"0F01"
    )
    port map (
      I0 => N148,
      I1 => N97,
      I2 => N108,
      I3 => iCounter_or000041_246,
      O => iCounter_or0000
    );
  iCounter_mux0004_0_1148 : LUT4
    generic map(
      INIT => X"084C"
    )
    port map (
      I0 => iCounter_or0002,
      I1 => iCounter_mux0004_0_1146,
      I2 => N155,
      I3 => N110,
      O => iCounter_mux0004_0_1148_217
    );
  transmitState_cmp_eq00021_SW2 : LUT4
    generic map(
      INIT => X"FBFF"
    )
    port map (
      I0 => iCounter(17),
      I1 => iCounter(14),
      I2 => iCounter(8),
      I3 => iCounter(6),
      O => N112
    );
  transmitState_cmp_eq0004139_SW1 : LUT4
    generic map(
      INIT => X"FBFF"
    )
    port map (
      I0 => iCounter(18),
      I1 => iCounter(9),
      I2 => iCounter(19),
      I3 => iCounter(8),
      O => N114
    );
  iCounter_mux0004_0_143 : LUT4
    generic map(
      INIT => X"8A88"
    )
    port map (
      I0 => presState(0),
      I1 => N108,
      I2 => iCounter_or000041_246,
      I3 => N116,
      O => iCounter_mux0004_0_143_221
    );
  iCounter_mux0004_0_111 : LUT4
    generic map(
      INIT => X"C8CC"
    )
    port map (
      I0 => N118,
      I1 => N36,
      I2 => iCounter(5),
      I3 => N13,
      O => iCounter_mux0004_0_111_215
    );
  transmitState_cmp_eq0001138_SW0 : LUT4
    generic map(
      INIT => X"FF7F"
    )
    port map (
      I0 => iCounter(13),
      I1 => iCounter(17),
      I2 => iCounter(7),
      I3 => iCounter(18),
      O => N120
    );
  iCounter_or000064_SW0 : LUT4
    generic map(
      INIT => X"FBFF"
    )
    port map (
      I0 => iCounter(9),
      I1 => N149,
      I2 => N120,
      I3 => transmitState_cmp_eq0001136_337,
      O => N108
    );
  iTransmit21 : LUT4
    generic map(
      INIT => X"44F4"
    )
    port map (
      I0 => isInitStg1_292,
      I1 => presState(0),
      I2 => presState(1),
      I3 => isInitStg2_294,
      O => N8
    );
  transmitState_FSM_FFd2_In31_SW0 : LUT3
    generic map(
      INIT => X"EA"
    )
    port map (
      I0 => transmitState_FSM_FFd2_In12_328,
      I1 => iCounter_or0000,
      I2 => presState(0),
      O => N124
    );
  transmitState_FSM_FFd2_In911 : LUT4
    generic map(
      INIT => X"A888"
    )
    port map (
      I0 => transmitState_FSM_FFd3_332,
      I1 => N124,
      I2 => N106,
      I3 => presState(1),
      O => transmitState_FSM_FFd2_In91
    );
  transmitState_cmp_eq000621_SW2 : LUT3
    generic map(
      INIT => X"10"
    )
    port map (
      I0 => iCounter(2),
      I1 => iCounter(3),
      I2 => iCounter(1),
      O => N126
    );
  iCounter_mux0004_0_1148_SW0 : MUXF5
    port map (
      I0 => N128,
      I1 => N129,
      S => iStage_277,
      O => N110
    );
  iCounter_mux0004_0_1148_SW0_F : LUT4
    generic map(
      INIT => X"0400"
    )
    port map (
      I0 => iCounter(3),
      I1 => iCounter(4),
      I2 => N99,
      I3 => N13,
      O => N128
    );
  iCounter_mux0004_0_1148_SW0_G : LUT4
    generic map(
      INIT => X"0400"
    )
    port map (
      I0 => iCounter(12),
      I1 => iCounter(6),
      I2 => N87,
      I3 => N16,
      O => N129
    );
  iData_not000192_SW0 : LUT4
    generic map(
      INIT => X"F777"
    )
    port map (
      I0 => iData_not000162_271,
      I1 => iData_not000177_272,
      I2 => isFunc_289,
      I3 => presState(2),
      O => N132
    );
  iData_not000192 : LUT4
    generic map(
      INIT => X"1030"
    )
    port map (
      I0 => presState(3),
      I1 => N132,
      I2 => iData_not000129,
      I3 => isEntry_287,
      O => iData_not0001
    );
  presState_mux0003_9_1 : LUT4
    generic map(
      INIT => X"2722"
    )
    port map (
      I0 => Reset_IBUF_160,
      I1 => isInit_291,
      I2 => isInitStg1_292,
      I3 => presState(0),
      O => presState_mux0003_9_Q
    );
  iStage_mux000032 : LUT4
    generic map(
      INIT => X"E040"
    )
    port map (
      I0 => iCounter_or0002,
      I1 => transmitState_cmp_eq0011,
      I2 => N147,
      I3 => transmitState_cmp_eq0010_342,
      O => iStage_mux000032_279
    );
  transmitState_FSM_FFd3_In39 : LUT4
    generic map(
      INIT => X"E040"
    )
    port map (
      I0 => iCounter_or0002,
      I1 => transmitState_cmp_eq0011,
      I2 => transmitState_FSM_FFd3_In35_334,
      I3 => transmitState_cmp_eq0010_342,
      O => transmitState_FSM_FFd3_In39_335
    );
  transmitState_FSM_FFd2_In6 : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => iCounter(4),
      I1 => iCounter(5),
      I2 => presState(0),
      I3 => presState(1),
      O => transmitState_FSM_FFd2_In6_329
    );
  nextState_5_1 : LUT4
    generic map(
      INIT => X"8F88"
    )
    port map (
      I0 => isEntry_287,
      I1 => presState(3),
      I2 => isDisplay_285,
      I3 => presState(5),
      O => nextState_5_Q
    );
  nextState_4_1 : LUT4
    generic map(
      INIT => X"8F88"
    )
    port map (
      I0 => isDisplay_285,
      I1 => presState(5),
      I2 => isClear_282,
      I3 => presState(4),
      O => nextState_4_Q
    );
  LED_1_mux0000_SW0 : LUT4
    generic map(
      INIT => X"FFEA"
    )
    port map (
      I0 => nextState_7_Q_305,
      I1 => isInitStg1_292,
      I2 => presState(0),
      I3 => presState(1),
      O => N68
    );
  iData_mux0002_7_SW1 : LUT4
    generic map(
      INIT => X"5DFF"
    )
    port map (
      I0 => iCharSent(2),
      I1 => isAllTransmit_280,
      I2 => isTransmit_300,
      I3 => iCharSent(3),
      O => N134
    );
  iData_mux0002_7_Q : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => presState(6),
      I1 => iCharSent(0),
      I2 => iCharSent(1),
      I3 => N134,
      O => iData_mux0002(7)
    );
  iData_mux0002_1_60_SW0 : LUT4
    generic map(
      INIT => X"3610"
    )
    port map (
      I0 => iCharSent(0),
      I1 => iCharSent(1),
      I2 => iCharSent(2),
      I3 => iCharSent(3),
      O => N136
    );
  iData_mux0002_1_60 : LUT4
    generic map(
      INIT => X"8F88"
    )
    port map (
      I0 => N136,
      I1 => N14,
      I2 => isEntry_287,
      I3 => presState(3),
      O => iData_mux0002_1_60_259
    );
  iData_mux0002_1_76 : LUT4
    generic map(
      INIT => X"FFAE"
    )
    port map (
      I0 => N8,
      I1 => presState(8),
      I2 => isResetAddr_296,
      I3 => iData_mux0002_1_60_259,
      O => iData_mux0002(1)
    );
  iData_not000157 : LUT3
    generic map(
      INIT => X"13"
    )
    port map (
      I0 => presState(8),
      I1 => presState(7),
      I2 => isResetAddr_296,
      O => iData_not000157_270
    );
  transmitState_FSM_FFd2_In84_SW0 : LUT4
    generic map(
      INIT => X"3237"
    )
    port map (
      I0 => presState(4),
      I1 => transmitState_cmp_eq0010_342,
      I2 => presState(8),
      I3 => N154,
      O => N138
    );
  transmitState_FSM_FFd2_In84 : LUT4
    generic map(
      INIT => X"3020"
    )
    port map (
      I0 => iStage_277,
      I1 => transmitState_FSM_FFd1_325,
      I2 => transmitState_FSM_FFd2_327,
      I3 => N138,
      O => transmitState_FSM_FFd2_In84_330
    );
  LED_3_mux0000 : LUT4
    generic map(
      INIT => X"FFEA"
    )
    port map (
      I0 => presState(8),
      I1 => presState(7),
      I2 => iDisplayEnable_274,
      I3 => presState(6),
      O => LED_3_OBUF_36
    );
  isAllTransmit_mux0000 : MUXF5
    port map (
      I0 => N140,
      I1 => N141,
      S => transmitState_FSM_FFd1_325,
      O => isAllTransmit_mux0000_281
    );
  isAllTransmit_mux0000_F : LUT4
    generic map(
      INIT => X"C8CC"
    )
    port map (
      I0 => transmitState_FSM_FFd3_332,
      I1 => isAllTransmit_280,
      I2 => transmitState_FSM_FFd2_327,
      I3 => LED_7_OBUF_39,
      O => N140
    );
  isAllTransmit_mux0000_G : LUT4
    generic map(
      INIT => X"FF80"
    )
    port map (
      I0 => presState(6),
      I1 => N25,
      I2 => iCharSent(2),
      I3 => isAllTransmit_280,
      O => N141
    );
  isTransmit_mux0000 : MUXF5
    port map (
      I0 => N142,
      I1 => N143,
      S => transmitState_FSM_FFd1_325,
      O => isTransmit_mux0000_301
    );
  isTransmit_mux0000_F : LUT4
    generic map(
      INIT => X"C8CC"
    )
    port map (
      I0 => transmitState_FSM_FFd3_332,
      I1 => isTransmit_300,
      I2 => transmitState_FSM_FFd2_327,
      I3 => LED_7_OBUF_39,
      O => N142
    );
  isTransmit_mux0000_G : LUT4
    generic map(
      INIT => X"F2FA"
    )
    port map (
      I0 => presState(6),
      I1 => N25,
      I2 => isTransmit_300,
      I3 => iCharSent(2),
      O => N143
    );
  Clock_BUFGP : BUFGP
    port map (
      I => Clock,
      O => Clock_BUFGP_2
    );
  Madd_iCounter_add0000_lut_0_INV_0 : INV
    port map (
      I => iCounter(0),
      O => Madd_iCounter_add0000_lut(0)
    );
  Reset_inv1_INV_0 : INV
    port map (
      I => Reset_IBUF_160,
      O => Reset_inv
    );
  iData_not0001291 : LUT4
    generic map(
      INIT => X"51F3"
    )
    port map (
      I0 => isDisplay_285,
      I1 => isAllTransmit_280,
      I2 => isTransmit_300,
      I3 => presState(5),
      O => iData_not0001291_268
    );
  iData_not0001292 : LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => isDisplay_285,
      I1 => presState(5),
      O => iData_not0001292_269
    );
  iData_not000129_f5 : MUXF5
    port map (
      I0 => iData_not0001292_269,
      I1 => iData_not0001291_268,
      S => presState(6),
      O => iData_not000129
    );
  iCharSent_mux0001_2_1 : LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => iCharSent(2),
      I1 => iCharSent(1),
      I2 => iCharSent(0),
      O => iCharSent_mux0001_2_1_169
    );
  iCharSent_mux0001_2_2 : LUT4
    generic map(
      INIT => X"1222"
    )
    port map (
      I0 => iCharSent(2),
      I1 => isAllTransmit_280,
      I2 => iCharSent(1),
      I3 => iCharSent(0),
      O => iCharSent_mux0001_2_2_170
    );
  iCharSent_mux0001_2_f5 : MUXF5
    port map (
      I0 => iCharSent_mux0001_2_2_170,
      I1 => iCharSent_mux0001_2_1_169,
      S => isTransmit_300,
      O => iCharSent_mux0001(2)
    );
  isResetAddr_mux000011 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => presState(8),
      I1 => isResetAddr_296,
      O => isResetAddr_mux00001
    );
  isResetAddr_mux000012 : LUT4
    generic map(
      INIT => X"C8CC"
    )
    port map (
      I0 => transmitState_FSM_FFd3_332,
      I1 => isResetAddr_296,
      I2 => transmitState_FSM_FFd2_327,
      I3 => LED_7_OBUF_39,
      O => isResetAddr_mux000011_299
    );
  isResetAddr_mux00001_f5 : MUXF5
    port map (
      I0 => isResetAddr_mux000011_299,
      I1 => isResetAddr_mux00001,
      S => transmitState_FSM_FFd1_325,
      O => isResetAddr_mux0000
    );
  presState_mux0003_7_1 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => isConfig_284,
      I1 => isInit_291,
      O => presState_mux0003_7_1_322
    );
  presState_mux0003_7_2 : LUT4
    generic map(
      INIT => X"8F88"
    )
    port map (
      I0 => isInitStg2_294,
      I1 => presState(1),
      I2 => isFunc_289,
      I3 => presState(2),
      O => presState_mux0003_7_2_323
    );
  presState_mux0003_7_f5 : MUXF5
    port map (
      I0 => presState_mux0003_7_2_323,
      I1 => presState_mux0003_7_1_322,
      S => Reset_IBUF_160,
      O => presState_mux0003_7_Q
    );
  iTransmit81 : LUT2_D
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => isResetAddr_296,
      I1 => presState(8),
      LO => N144,
      O => N411
    );
  RS_mux000021 : LUT2_D
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => presState(0),
      I1 => presState(1),
      LO => N145,
      O => N36
    );
  transmitState_cmp_eq0007 : LUT4_D
    generic map(
      INIT => X"0200"
    )
    port map (
      I0 => iCounter(2),
      I1 => iCounter(5),
      I2 => N81,
      I3 => N13,
      LO => N146,
      O => transmitState_cmp_eq0007_341
    );
  iStage_mux000028 : LUT3_D
    generic map(
      INIT => X"10"
    )
    port map (
      I0 => transmitState_FSM_FFd1_325,
      I1 => transmitState_FSM_FFd3_332,
      I2 => transmitState_FSM_FFd2_327,
      LO => N147,
      O => iCounter_mux0004_0_1146
    );
  transmitState_cmp_eq00021_SW0 : LUT3_D
    generic map(
      INIT => X"FE"
    )
    port map (
      I0 => iCounter(19),
      I1 => iCounter(12),
      I2 => iCounter(5),
      LO => N148,
      O => N85
    );
  transmitState_cmp_eq0001111 : LUT4_D
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => iCounter(16),
      I1 => iCounter(10),
      I2 => iCounter(1),
      I3 => iCounter(2),
      LO => N149,
      O => transmitState_cmp_eq0001111_336
    );
  transmitState_cmp_eq0001136 : LUT4_D
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => iCounter(15),
      I1 => iCounter(11),
      I2 => iCounter(20),
      I3 => iCounter(0),
      LO => N150,
      O => transmitState_cmp_eq0001136_337
    );
  iCounter_or000010 : LUT4_D
    generic map(
      INIT => X"1000"
    )
    port map (
      I0 => iCounter(14),
      I1 => iCounter(4),
      I2 => iCounter(3),
      I3 => iStage_277,
      LO => N151,
      O => iCounter_or000010_244
    );
  iCounter_or000038 : LUT4_L
    generic map(
      INIT => X"0008"
    )
    port map (
      I0 => iCounter(19),
      I1 => iCounter(8),
      I2 => iCounter(6),
      I3 => iCounter(3),
      LO => iCounter_or000038_245
    );
  transmitState_cmp_eq0004_SW0 : LUT3_L
    generic map(
      INIT => X"EF"
    )
    port map (
      I0 => iCounter(10),
      I1 => iCounter(4),
      I2 => iCounter(3),
      LO => N89
    );
  transmitState_cmp_eq0004112 : LUT4_D
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => iCounter(16),
      I1 => iCounter(17),
      I2 => iCounter(13),
      I3 => iCounter(14),
      LO => N152,
      O => transmitState_cmp_eq0004112_339
    );
  iCounter_mux0004_0_129 : LUT4_L
    generic map(
      INIT => X"028A"
    )
    port map (
      I0 => presState(1),
      I1 => iStage_277,
      I2 => transmitState_cmp_eq0004_338,
      I3 => transmitState_cmp_eq0005_340,
      LO => iCounter_mux0004_0_129_220
    );
  iCounter_mux0004_0_1162 : LUT4_D
    generic map(
      INIT => X"FAF8"
    )
    port map (
      I0 => transmitState_FSM_FFd3_332,
      I1 => iCounter_mux0004_0_12_219,
      I2 => iCounter_mux0004_0_1148_217,
      I3 => iCounter_mux0004_0_162_222,
      LO => N153,
      O => N1
    );
  transmitState_cmp_eq00111 : LUT4_D
    generic map(
      INIT => X"0400"
    )
    port map (
      I0 => iCounter(3),
      I1 => iCounter(4),
      I2 => N99,
      I3 => N13,
      LO => N154,
      O => transmitState_cmp_eq0011
    );
  transmitState_FSM_FFd2_In29_SW0 : LUT3_L
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => iStage_277,
      I1 => transmitState_cmp_eq0004_338,
      I2 => transmitState_cmp_eq0005_340,
      LO => N106
    );
  transmitState_cmp_eq0010 : LUT4_D
    generic map(
      INIT => X"0100"
    )
    port map (
      I0 => N112,
      I1 => N85,
      I2 => N83,
      I3 => N11,
      LO => N155,
      O => transmitState_cmp_eq0010_342
    );
  transmitState_cmp_eq00042 : LUT4_D
    generic map(
      INIT => X"0008"
    )
    port map (
      I0 => transmitState_cmp_eq0004112_339,
      I1 => transmitState_cmp_eq0001136_337,
      I2 => N93,
      I3 => N114,
      LO => N156,
      O => N16
    );
  iCounter_or000078_SW0 : LUT4_L
    generic map(
      INIT => X"FBFF"
    )
    port map (
      I0 => iCounter(8),
      I1 => iCounter(6),
      I2 => N85,
      I3 => iCounter_or000010_244,
      LO => N116
    );
  transmitState_cmp_eq000621_SW1 : LUT4_L
    generic map(
      INIT => X"FFFD"
    )
    port map (
      I0 => iCounter(1),
      I1 => iCounter(3),
      I2 => iCounter(2),
      I3 => iCounter(4),
      LO => N118
    );
  transmitState_FSM_FFd2_In12 : LUT4_L
    generic map(
      INIT => X"FF80"
    )
    port map (
      I0 => N13,
      I1 => transmitState_FSM_FFd2_In6_329,
      I2 => N126,
      I3 => transmitState_FSM_FFd2_327,
      LO => transmitState_FSM_FFd2_In12_328
    );
  iCounter_mux0004_0_1162_1 : LUT4_D
    generic map(
      INIT => X"FAF8"
    )
    port map (
      I0 => transmitState_FSM_FFd3_332,
      I1 => iCounter_mux0004_0_12_219,
      I2 => iCounter_mux0004_0_1148_217,
      I3 => iCounter_mux0004_0_162_222,
      LO => N157,
      O => iCounter_mux0004_0_1162_218
    );

end Structure;

