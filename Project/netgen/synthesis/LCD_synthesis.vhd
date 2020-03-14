--------------------------------------------------------------------------------
-- Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.58f
--  \   \         Application: netgen
--  /   /         Filename: LCD_synthesis.vhd
-- /___/   /\     Timestamp: Wed Mar 11 13:57:34 2020
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
  signal LED_0_mux0000 : STD_LOGIC; 
  signal LED_1_OBUF_35 : STD_LOGIC; 
  signal LED_2_OBUF_36 : STD_LOGIC; 
  signal LED_3_OBUF_37 : STD_LOGIC; 
  signal LED_4_OBUF_38 : STD_LOGIC; 
  signal LED_6_OBUF_39 : STD_LOGIC; 
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
  signal N0 : STD_LOGIC; 
  signal N1 : STD_LOGIC; 
  signal N13 : STD_LOGIC; 
  signal N14 : STD_LOGIC; 
  signal N15 : STD_LOGIC; 
  signal N171 : STD_LOGIC; 
  signal N18 : STD_LOGIC; 
  signal N19 : STD_LOGIC; 
  signal N191 : STD_LOGIC; 
  signal N20 : STD_LOGIC; 
  signal N21 : STD_LOGIC; 
  signal N26 : STD_LOGIC; 
  signal N3 : STD_LOGIC; 
  signal N30 : STD_LOGIC; 
  signal N32 : STD_LOGIC; 
  signal N36 : STD_LOGIC; 
  signal N38 : STD_LOGIC; 
  signal N40 : STD_LOGIC; 
  signal N42 : STD_LOGIC; 
  signal N44 : STD_LOGIC; 
  signal N46 : STD_LOGIC; 
  signal N48 : STD_LOGIC; 
  signal N5 : STD_LOGIC; 
  signal N50 : STD_LOGIC; 
  signal N52 : STD_LOGIC; 
  signal N54 : STD_LOGIC; 
  signal N56 : STD_LOGIC; 
  signal N58 : STD_LOGIC; 
  signal N62 : STD_LOGIC; 
  signal N65 : STD_LOGIC; 
  signal N67 : STD_LOGIC; 
  signal N671 : STD_LOGIC; 
  signal N69 : STD_LOGIC; 
  signal N7 : STD_LOGIC; 
  signal N71 : STD_LOGIC; 
  signal N711 : STD_LOGIC; 
  signal N73 : STD_LOGIC; 
  signal N75 : STD_LOGIC; 
  signal N751 : STD_LOGIC; 
  signal N76 : STD_LOGIC; 
  signal N77 : STD_LOGIC; 
  signal N78 : STD_LOGIC; 
  signal N781 : STD_LOGIC; 
  signal N79 : STD_LOGIC; 
  signal N81 : STD_LOGIC; 
  signal N85 : STD_LOGIC; 
  signal N87 : STD_LOGIC; 
  signal N89 : STD_LOGIC; 
  signal N9 : STD_LOGIC; 
  signal N90 : STD_LOGIC; 
  signal N91 : STD_LOGIC; 
  signal N92 : STD_LOGIC; 
  signal N93 : STD_LOGIC; 
  signal N94 : STD_LOGIC; 
  signal N95 : STD_LOGIC; 
  signal N96 : STD_LOGIC; 
  signal N97 : STD_LOGIC; 
  signal N98 : STD_LOGIC; 
  signal N99 : STD_LOGIC; 
  signal RS_OBUF_141 : STD_LOGIC; 
  signal RS_mux0000 : STD_LOGIC; 
  signal RS_mux000015_143 : STD_LOGIC; 
  signal RS_mux000035_144 : STD_LOGIC; 
  signal RS_mux000048_145 : STD_LOGIC; 
  signal RW_OBUF_147 : STD_LOGIC; 
  signal Reset_IBUF_149 : STD_LOGIC; 
  signal Reset_inv : STD_LOGIC; 
  signal iCharSent_mux0001_2_1_158 : STD_LOGIC; 
  signal iCharSent_mux0001_2_2_159 : STD_LOGIC; 
  signal iCharSent_mux0001_3_1_161 : STD_LOGIC; 
  signal iCharSent_mux0001_3_2_162 : STD_LOGIC; 
  signal iCounter_mux0004_0_111_206 : STD_LOGIC; 
  signal iCounter_mux0004_0_1146 : STD_LOGIC; 
  signal iCounter_mux0004_0_1148_208 : STD_LOGIC; 
  signal iCounter_mux0004_0_1162_209 : STD_LOGIC; 
  signal iCounter_mux0004_0_12_210 : STD_LOGIC; 
  signal iCounter_mux0004_0_129_211 : STD_LOGIC; 
  signal iCounter_mux0004_0_143_212 : STD_LOGIC; 
  signal iCounter_mux0004_0_162_213 : STD_LOGIC; 
  signal iCounter_or0000 : STD_LOGIC; 
  signal iCounter_or000014_235 : STD_LOGIC; 
  signal iCounter_or000022_236 : STD_LOGIC; 
  signal iCounter_or000038_237 : STD_LOGIC; 
  signal iCounter_or00005_238 : STD_LOGIC; 
  signal iCounter_or000051_239 : STD_LOGIC; 
  signal iCounter_or000077_240 : STD_LOGIC; 
  signal iCounter_or0002 : STD_LOGIC; 
  signal iData_mux0002_0_66_251 : STD_LOGIC; 
  signal iData_mux0002_0_91_252 : STD_LOGIC; 
  signal iData_mux0002_1_42_254 : STD_LOGIC; 
  signal iData_mux0002_1_60_255 : STD_LOGIC; 
  signal iData_not0001 : STD_LOGIC; 
  signal iData_not000112_263 : STD_LOGIC; 
  signal iData_not000125_264 : STD_LOGIC; 
  signal iData_not000173_265 : STD_LOGIC; 
  signal iData_not000175_266 : STD_LOGIC; 
  signal iDisplay_267 : STD_LOGIC; 
  signal iDisplayEnable_268 : STD_LOGIC; 
  signal iDisplayEnable_and0000 : STD_LOGIC; 
  signal iDisplayEnable_not0001 : STD_LOGIC; 
  signal iDisplay_or0000 : STD_LOGIC; 
  signal iDisplay_or0000_inv : STD_LOGIC; 
  signal iStage_273 : STD_LOGIC; 
  signal iStage_mux000012_274 : STD_LOGIC; 
  signal iStage_mux000033_275 : STD_LOGIC; 
  signal isAllTransmit_276 : STD_LOGIC; 
  signal isAllTransmit_mux0000_277 : STD_LOGIC; 
  signal isAllTransmit_mux0000115_278 : STD_LOGIC; 
  signal isAllTransmit_mux000012_279 : STD_LOGIC; 
  signal isAllTransmit_mux0000128_280 : STD_LOGIC; 
  signal isClear_281 : STD_LOGIC; 
  signal isClear_not0001 : STD_LOGIC; 
  signal isConfig_283 : STD_LOGIC; 
  signal isDisplay_284 : STD_LOGIC; 
  signal isDisplay_not0001 : STD_LOGIC; 
  signal isEntry_286 : STD_LOGIC; 
  signal isEntry_not0001 : STD_LOGIC; 
  signal isFunc_288 : STD_LOGIC; 
  signal isFunc_not0001 : STD_LOGIC; 
  signal isInit_290 : STD_LOGIC; 
  signal isInitStg1_291 : STD_LOGIC; 
  signal isInitStg1_not0001 : STD_LOGIC; 
  signal isInitStg2_293 : STD_LOGIC; 
  signal isInitStg2_not0001 : STD_LOGIC; 
  signal isResetAddr_295 : STD_LOGIC; 
  signal isResetAddr_mux0000 : STD_LOGIC; 
  signal isTransmit_297 : STD_LOGIC; 
  signal isTransmit_mux0000_298 : STD_LOGIC; 
  signal presState_mux0003_0_1 : STD_LOGIC; 
  signal presState_mux0003_1_1 : STD_LOGIC; 
  signal presState_mux0003_1_11_311 : STD_LOGIC; 
  signal presState_mux0003_1_12_312 : STD_LOGIC; 
  signal presState_mux0003_2_1_313 : STD_LOGIC; 
  signal presState_mux0003_3_11_314 : STD_LOGIC; 
  signal presState_mux0003_4_11 : STD_LOGIC; 
  signal presState_mux0003_6_11 : STD_LOGIC; 
  signal presState_mux0003_7_Q : STD_LOGIC; 
  signal presState_mux0003_7_1_318 : STD_LOGIC; 
  signal presState_mux0003_7_2_319 : STD_LOGIC; 
  signal presState_mux0003_9_Q : STD_LOGIC; 
  signal transmitState_FSM_FFd1_321 : STD_LOGIC; 
  signal transmitState_FSM_FFd1_In_322 : STD_LOGIC; 
  signal transmitState_FSM_FFd2_323 : STD_LOGIC; 
  signal transmitState_FSM_FFd2_In6_324 : STD_LOGIC; 
  signal transmitState_FSM_FFd2_In84_325 : STD_LOGIC; 
  signal transmitState_FSM_FFd2_In91 : STD_LOGIC; 
  signal transmitState_FSM_FFd3_327 : STD_LOGIC; 
  signal transmitState_FSM_FFd3_In11_328 : STD_LOGIC; 
  signal transmitState_FSM_FFd3_In17_329 : STD_LOGIC; 
  signal transmitState_FSM_FFd3_In39_330 : STD_LOGIC; 
  signal transmitState_FSM_FFd3_In54_331 : STD_LOGIC; 
  signal transmitState_FSM_FFd3_In7_332 : STD_LOGIC; 
  signal transmitState_FSM_FFd3_In81 : STD_LOGIC; 
  signal transmitState_cmp_eq0008111_334 : STD_LOGIC; 
  signal transmitState_cmp_eq0008136_335 : STD_LOGIC; 
  signal transmitState_cmp_eq0010_336 : STD_LOGIC; 
  signal transmitState_cmp_eq0010112_337 : STD_LOGIC; 
  signal transmitState_cmp_eq0011_338 : STD_LOGIC; 
  signal transmitState_cmp_eq0013_339 : STD_LOGIC; 
  signal transmitState_cmp_eq0014_340 : STD_LOGIC; 
  signal transmitState_cmp_eq0015 : STD_LOGIC; 
  signal transmitState_cmp_eq0016 : STD_LOGIC; 
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
      G => RW_OBUF_147
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
      R => Reset_IBUF_149,
      Q => iCounter(0)
    );
  iCounter_1 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iCounter_mux0004(1),
      R => Reset_IBUF_149,
      Q => iCounter(1)
    );
  iCounter_2 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iCounter_mux0004(2),
      R => Reset_IBUF_149,
      Q => iCounter(2)
    );
  iCounter_3 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iCounter_mux0004(3),
      R => Reset_IBUF_149,
      Q => iCounter(3)
    );
  iCounter_4 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iCounter_mux0004(4),
      R => Reset_IBUF_149,
      Q => iCounter(4)
    );
  iCounter_5 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iCounter_mux0004(5),
      R => Reset_IBUF_149,
      Q => iCounter(5)
    );
  iCounter_6 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iCounter_mux0004(6),
      R => Reset_IBUF_149,
      Q => iCounter(6)
    );
  iCounter_7 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iCounter_mux0004(7),
      R => Reset_IBUF_149,
      Q => iCounter(7)
    );
  iCounter_8 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iCounter_mux0004(8),
      R => Reset_IBUF_149,
      Q => iCounter(8)
    );
  iCounter_9 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iCounter_mux0004(9),
      R => Reset_IBUF_149,
      Q => iCounter(9)
    );
  iCounter_10 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iCounter_mux0004(10),
      R => Reset_IBUF_149,
      Q => iCounter(10)
    );
  iCounter_11 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iCounter_mux0004(11),
      R => Reset_IBUF_149,
      Q => iCounter(11)
    );
  iCounter_12 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iCounter_mux0004(12),
      R => Reset_IBUF_149,
      Q => iCounter(12)
    );
  iCounter_13 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iCounter_mux0004(13),
      R => Reset_IBUF_149,
      Q => iCounter(13)
    );
  iCounter_14 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iCounter_mux0004(14),
      R => Reset_IBUF_149,
      Q => iCounter(14)
    );
  iCounter_15 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iCounter_mux0004(15),
      R => Reset_IBUF_149,
      Q => iCounter(15)
    );
  iCounter_16 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iCounter_mux0004(16),
      R => Reset_IBUF_149,
      Q => iCounter(16)
    );
  iCounter_17 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iCounter_mux0004(17),
      R => Reset_IBUF_149,
      Q => iCounter(17)
    );
  iCounter_18 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iCounter_mux0004(18),
      R => Reset_IBUF_149,
      Q => iCounter(18)
    );
  iCounter_19 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iCounter_mux0004(19),
      R => Reset_IBUF_149,
      Q => iCounter(19)
    );
  iCounter_20 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iCounter_mux0004(20),
      R => Reset_IBUF_149,
      Q => iCounter(20)
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
  Enable_26 : FDR
    port map (
      C => Clock_BUFGP_2,
      D => Enable_mux0000,
      R => Reset_IBUF_149,
      Q => Enable_OBUF_23
    );
  isTransmit : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      CE => Reset_inv,
      D => isTransmit_mux0000_298,
      Q => isTransmit_297
    );
  isFunc : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      CE => isFunc_not0001,
      D => CharSeq(0, 2),
      Q => isFunc_288
    );
  isInitStg1 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      CE => isInitStg1_not0001,
      D => CharSeq(0, 2),
      Q => isInitStg1_291
    );
  isResetAddr : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      CE => Reset_inv,
      D => isResetAddr_mux0000,
      Q => isResetAddr_295
    );
  RS_31 : FDR
    port map (
      C => Clock_BUFGP_2,
      D => RS_mux0000,
      R => Reset_IBUF_149,
      Q => RS_OBUF_141
    );
  iDisplayEnable : FDSE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      CE => iDisplayEnable_not0001,
      D => RW_OBUF_147,
      S => iDisplayEnable_and0000,
      Q => iDisplayEnable_268
    );
  isInitStg2 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      CE => isInitStg2_not0001,
      D => CharSeq(0, 2),
      Q => isInitStg2_293
    );
  iDisplay : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      CE => iDisplay_or0000_inv,
      D => Display_IBUF_21,
      Q => iDisplay_267
    );
  isAllTransmit : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      CE => Reset_inv,
      D => isAllTransmit_mux0000_277,
      Q => isAllTransmit_276
    );
  isDisplay : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      CE => isDisplay_not0001,
      D => CharSeq(0, 2),
      Q => isDisplay_284
    );
  isClear : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      CE => isClear_not0001,
      D => CharSeq(0, 2),
      Q => isClear_281
    );
  isEntry : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      CE => isEntry_not0001,
      D => CharSeq(0, 2),
      Q => isEntry_286
    );
  isConfig : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => CharSeq(0, 2),
      G => isClear_281,
      GE => presState(4),
      Q => isConfig_283
    );
  isInit : LDE
    generic map(
      INIT => '0'
    )
    port map (
      D => CharSeq(0, 2),
      G => isInitStg2_293,
      GE => presState(1),
      Q => isInit_290
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
      CI => RW_OBUF_147,
      DI => CharSeq(0, 2),
      S => Madd_iCounter_add0000_lut(0),
      O => Madd_iCounter_add0000_cy(0)
    );
  Madd_iCounter_add0000_xor_0_Q : XORCY
    port map (
      CI => RW_OBUF_147,
      LI => Madd_iCounter_add0000_lut(0),
      O => iCounter_add0000(0)
    );
  Madd_iCounter_add0000_cy_1_Q : MUXCY
    port map (
      CI => Madd_iCounter_add0000_cy(0),
      DI => RW_OBUF_147,
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
      DI => RW_OBUF_147,
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
      DI => RW_OBUF_147,
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
      DI => RW_OBUF_147,
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
      DI => RW_OBUF_147,
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
      DI => RW_OBUF_147,
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
      DI => RW_OBUF_147,
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
      DI => RW_OBUF_147,
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
      DI => RW_OBUF_147,
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
      DI => RW_OBUF_147,
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
      DI => RW_OBUF_147,
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
      DI => RW_OBUF_147,
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
      DI => RW_OBUF_147,
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
      DI => RW_OBUF_147,
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
      DI => RW_OBUF_147,
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
      DI => RW_OBUF_147,
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
      DI => RW_OBUF_147,
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
      DI => RW_OBUF_147,
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
      DI => RW_OBUF_147,
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
      D => transmitState_FSM_FFd1_In_322,
      R => Reset_IBUF_149,
      Q => transmitState_FSM_FFd1_321
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
  iCharSent_mux0001_0_11 : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => isAllTransmit_276,
      I1 => isTransmit_297,
      O => N67
    );
  iData_mux0002_1_21 : LUT4
    generic map(
      INIT => X"2F22"
    )
    port map (
      I0 => presState(0),
      I1 => isInitStg1_291,
      I2 => isInitStg2_293,
      I3 => presState(1),
      O => N14
    );
  iData_mux0002_6_1 : LUT4
    generic map(
      INIT => X"0282"
    )
    port map (
      I0 => N19,
      I1 => iCharSent(2),
      I2 => iCharSent(3),
      I3 => iCharSent(1),
      O => iData_mux0002(6)
    );
  iData_mux0002_7_Q : LUT4
    generic map(
      INIT => X"1000"
    )
    port map (
      I0 => iCharSent(1),
      I1 => iCharSent(0),
      I2 => iCharSent(3),
      I3 => N0,
      O => iData_mux0002(7)
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
      O => N5
    );
  iData_mux0002_5_Q : LUT4
    generic map(
      INIT => X"FFEA"
    )
    port map (
      I0 => N14,
      I1 => N19,
      I2 => N5,
      I3 => N76,
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
      O => N7
    );
  iData_mux0002_3_Q : LUT4
    generic map(
      INIT => X"FFAE"
    )
    port map (
      I0 => N76,
      I1 => N19,
      I2 => N7,
      I3 => N75,
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
      O => N9
    );
  iData_mux0002_2_Q : LUT4
    generic map(
      INIT => X"FFAE"
    )
    port map (
      I0 => N78,
      I1 => N19,
      I2 => N9,
      I3 => N75,
      O => iData_mux0002(2)
    );
  iData_mux0002_1_42 : LUT4
    generic map(
      INIT => X"3610"
    )
    port map (
      I0 => iCharSent(0),
      I1 => iCharSent(1),
      I2 => iCharSent(2),
      I3 => iCharSent(3),
      O => iData_mux0002_1_42_254
    );
  iData_mux0002_0_66 : LUT4
    generic map(
      INIT => X"796E"
    )
    port map (
      I0 => iCharSent(1),
      I1 => iCharSent(3),
      I2 => iCharSent(2),
      I3 => iCharSent(0),
      O => iData_mux0002_0_66_251
    );
  iData_mux0002_0_91 : LUT4
    generic map(
      INIT => X"2F22"
    )
    port map (
      I0 => presState(4),
      I1 => isClear_281,
      I2 => isInitStg1_291,
      I3 => presState(0),
      O => iData_mux0002_0_91_252
    );
  iData_mux0002_0_93 : LUT3
    generic map(
      INIT => X"EA"
    )
    port map (
      I0 => iData_mux0002_0_91_252,
      I1 => N19,
      I2 => iData_mux0002_0_66_251,
      O => iData_mux0002(0)
    );
  iData_not000112 : LUT4
    generic map(
      INIT => X"135F"
    )
    port map (
      I0 => presState(5),
      I1 => presState(4),
      I2 => isDisplay_284,
      I3 => isClear_281,
      O => iData_not000112_263
    );
  iData_not000125 : LUT4
    generic map(
      INIT => X"135F"
    )
    port map (
      I0 => presState(2),
      I1 => presState(3),
      I2 => isFunc_288,
      I3 => isEntry_286,
      O => iData_not000125_264
    );
  iData_not000173 : LUT4
    generic map(
      INIT => X"135F"
    )
    port map (
      I0 => presState(1),
      I1 => presState(0),
      I2 => isInitStg2_293,
      I3 => isInitStg1_291,
      O => iData_not000173_265
    );
  iData_not000189 : LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => iData_not000112_263,
      I1 => iData_not000125_264,
      I2 => iData_not000175_266,
      O => iData_not0001
    );
  transmitState_FSM_Out61 : LUT3
    generic map(
      INIT => X"F4"
    )
    port map (
      I0 => transmitState_FSM_FFd3_327,
      I1 => transmitState_FSM_FFd2_323,
      I2 => transmitState_FSM_FFd1_321,
      O => LED_6_OBUF_39
    );
  LED_3_mux00001 : LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      I0 => presState(8),
      I1 => presState(6),
      I2 => presState(9),
      O => LED_3_OBUF_37
    );
  transmitState_FSM_Out81 : LUT3
    generic map(
      INIT => X"F9"
    )
    port map (
      I0 => transmitState_FSM_FFd3_327,
      I1 => transmitState_FSM_FFd2_323,
      I2 => transmitState_FSM_FFd1_321,
      O => LED_4_OBUF_38
    );
  LED_2_mux00001 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => presState(7),
      I1 => presState(4),
      I2 => presState(5),
      I3 => presState(3),
      O => LED_2_OBUF_36
    );
  Enable_mux00001 : LUT3
    generic map(
      INIT => X"98"
    )
    port map (
      I0 => transmitState_FSM_FFd3_327,
      I1 => transmitState_FSM_FFd2_323,
      I2 => Enable_OBUF_23,
      O => Enable_mux0000
    );
  LED_1_mux0000_SW0 : LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      I0 => presState(2),
      I1 => presState(9),
      I2 => presState(7),
      O => N13
    );
  LED_1_mux0000 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => presState(1),
      I1 => presState(8),
      I2 => presState(4),
      I3 => N13,
      O => LED_1_OBUF_35
    );
  isInitStg2_not00011 : LUT3
    generic map(
      INIT => X"20"
    )
    port map (
      I0 => transmitState_FSM_FFd1_321,
      I1 => Reset_IBUF_149,
      I2 => presState(1),
      O => isInitStg2_not0001
    );
  isInitStg1_not00011 : LUT3
    generic map(
      INIT => X"20"
    )
    port map (
      I0 => transmitState_FSM_FFd1_321,
      I1 => Reset_IBUF_149,
      I2 => presState(0),
      O => isInitStg1_not0001
    );
  isFunc_not00011 : LUT3
    generic map(
      INIT => X"20"
    )
    port map (
      I0 => transmitState_FSM_FFd1_321,
      I1 => Reset_IBUF_149,
      I2 => presState(2),
      O => isFunc_not0001
    );
  isEntry_not00011 : LUT3
    generic map(
      INIT => X"20"
    )
    port map (
      I0 => transmitState_FSM_FFd1_321,
      I1 => Reset_IBUF_149,
      I2 => presState(3),
      O => isEntry_not0001
    );
  isDisplay_not00011 : LUT3
    generic map(
      INIT => X"20"
    )
    port map (
      I0 => transmitState_FSM_FFd1_321,
      I1 => Reset_IBUF_149,
      I2 => presState(5),
      O => isDisplay_not0001
    );
  isClear_not00011 : LUT3
    generic map(
      INIT => X"20"
    )
    port map (
      I0 => transmitState_FSM_FFd1_321,
      I1 => Reset_IBUF_149,
      I2 => presState(4),
      O => isClear_not0001
    );
  presState_mux0003_8_SW0 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => presState(0),
      I1 => isInitStg1_291,
      O => N15
    );
  presState_mux0003_5_SW0 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => presState(5),
      I1 => isDisplay_284,
      O => N171
    );
  iDisplayEnable_and00001 : LUT3
    generic map(
      INIT => X"10"
    )
    port map (
      I0 => iDisplayEnable_268,
      I1 => iDisplay_267,
      I2 => Display_IBUF_21,
      O => iDisplayEnable_and0000
    );
  iData_mux0002_2_21 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => isDisplay_284,
      I1 => presState(5),
      O => N75
    );
  iData_mux0002_1_35 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => isEntry_286,
      I1 => presState(3),
      O => N78
    );
  Enable_mux000021 : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => transmitState_FSM_FFd3_327,
      I1 => transmitState_FSM_FFd2_323,
      O => transmitState_cmp_eq0016
    );
  presState_mux0003_9_1 : LUT4
    generic map(
      INIT => X"2722"
    )
    port map (
      I0 => iDisplay_or0000,
      I1 => isInit_290,
      I2 => isInitStg1_291,
      I3 => presState(0),
      O => presState_mux0003_9_Q
    );
  presState_mux0003_3_SW0 : LUT3
    generic map(
      INIT => X"8C"
    )
    port map (
      I0 => isTransmit_297,
      I1 => presState(6),
      I2 => isAllTransmit_276,
      O => N191
    );
  iDisplay_or00001 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => Reset_IBUF_149,
      I1 => presState(9),
      O => iDisplay_or0000
    );
  iData_mux0002_3_21 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => isFunc_288,
      I1 => presState(2),
      O => N76
    );
  presState_mux0003_2_SW0 : LUT4
    generic map(
      INIT => X"8F88"
    )
    port map (
      I0 => isClear_281,
      I1 => presState(4),
      I2 => iDisplayEnable_268,
      I3 => presState(7),
      O => N26
    );
  Data_mux0000_3_22 : LUT4
    generic map(
      INIT => X"882A"
    )
    port map (
      I0 => Data_3_10,
      I1 => transmitState_FSM_FFd2_323,
      I2 => transmitState_FSM_FFd1_321,
      I3 => transmitState_FSM_FFd3_327,
      O => Data_mux0000_3_22_18
    );
  Data_mux0000_3_33 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => transmitState_FSM_FFd2_323,
      I1 => transmitState_FSM_FFd3_327,
      O => Data_mux0000_0_33
    );
  Data_mux0000_3_38 : LUT4
    generic map(
      INIT => X"A280"
    )
    port map (
      I0 => Data_mux0000_0_33,
      I1 => iStage_273,
      I2 => iData(3),
      I3 => iData(7),
      O => Data_mux0000_3_38_19
    );
  Data_mux0000_2_22 : LUT4
    generic map(
      INIT => X"882A"
    )
    port map (
      I0 => Data_2_9,
      I1 => transmitState_FSM_FFd2_323,
      I2 => transmitState_FSM_FFd1_321,
      I3 => transmitState_FSM_FFd3_327,
      O => Data_mux0000_2_22_16
    );
  Data_mux0000_2_38 : LUT4
    generic map(
      INIT => X"A280"
    )
    port map (
      I0 => Data_mux0000_0_33,
      I1 => iStage_273,
      I2 => iData(2),
      I3 => iData(6),
      O => Data_mux0000_2_38_17
    );
  Data_mux0000_1_22 : LUT4
    generic map(
      INIT => X"882A"
    )
    port map (
      I0 => Data_1_8,
      I1 => transmitState_FSM_FFd2_323,
      I2 => transmitState_FSM_FFd1_321,
      I3 => transmitState_FSM_FFd3_327,
      O => Data_mux0000_1_22_14
    );
  Data_mux0000_1_38 : LUT4
    generic map(
      INIT => X"A280"
    )
    port map (
      I0 => Data_mux0000_0_33,
      I1 => iStage_273,
      I2 => iData(1),
      I3 => iData(5),
      O => Data_mux0000_1_38_15
    );
  Data_mux0000_0_22 : LUT4
    generic map(
      INIT => X"882A"
    )
    port map (
      I0 => Data_0_7,
      I1 => transmitState_FSM_FFd2_323,
      I2 => transmitState_FSM_FFd1_321,
      I3 => transmitState_FSM_FFd3_327,
      O => Data_mux0000_0_22_11
    );
  Data_mux0000_0_38 : LUT4
    generic map(
      INIT => X"A280"
    )
    port map (
      I0 => Data_mux0000_0_33,
      I1 => iStage_273,
      I2 => iData(0),
      I3 => iData(4),
      O => Data_mux0000_0_38_13
    );
  RS_mux000015 : LUT3
    generic map(
      INIT => X"A7"
    )
    port map (
      I0 => transmitState_FSM_FFd2_323,
      I1 => transmitState_FSM_FFd1_321,
      I2 => transmitState_FSM_FFd3_327,
      O => RS_mux000015_143
    );
  RS_mux000035 : LUT4
    generic map(
      INIT => X"1000"
    )
    port map (
      I0 => transmitState_FSM_FFd2_323,
      I1 => presState(3),
      I2 => N71,
      I3 => transmitState_FSM_FFd3_327,
      O => RS_mux000035_144
    );
  RS_mux000048 : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => presState(4),
      I1 => presState(5),
      I2 => presState(8),
      I3 => presState(2),
      O => RS_mux000048_145
    );
  RS_mux000062 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => RS_OBUF_141,
      I1 => RS_mux000015_143,
      I2 => RS_mux000035_144,
      I3 => RS_mux000048_145,
      O => RS_mux0000
    );
  isResetAddr_mux00001 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => presState(8),
      I1 => transmitState_FSM_FFd1_321,
      I2 => isResetAddr_295,
      I3 => N3,
      O => isResetAddr_mux0000
    );
  isTransmit_mux0000_SW0 : LUT4
    generic map(
      INIT => X"D555"
    )
    port map (
      I0 => presState(6),
      I1 => iCharSent(1),
      I2 => iCharSent(3),
      I3 => iCharSent(2),
      O => N30
    );
  isTransmit_mux0000 : LUT4
    generic map(
      INIT => X"8F88"
    )
    port map (
      I0 => isTransmit_297,
      I1 => N3,
      I2 => N30,
      I3 => transmitState_FSM_FFd1_321,
      O => isTransmit_mux0000_298
    );
  isAllTransmit_mux0000_SW0 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => iCharSent(1),
      I1 => iCharSent(3),
      I2 => transmitState_FSM_FFd1_321,
      I3 => presState(6),
      O => N32
    );
  isAllTransmit_mux0000 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => N3,
      I1 => isAllTransmit_276,
      I2 => iCharSent(2),
      I3 => N32,
      O => isAllTransmit_mux0000_277
    );
  isAllTransmit_mux000012 : LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      I0 => transmitState_FSM_FFd3_327,
      I1 => transmitState_FSM_FFd1_321,
      I2 => transmitState_FSM_FFd2_323,
      O => isAllTransmit_mux000012_279
    );
  isAllTransmit_mux0000115 : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => presState(2),
      I1 => presState(3),
      I2 => presState(5),
      I3 => presState(4),
      O => isAllTransmit_mux0000115_278
    );
  isAllTransmit_mux0000128 : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => presState(6),
      I1 => presState(8),
      I2 => presState(0),
      I3 => presState(1),
      O => isAllTransmit_mux0000128_280
    );
  isAllTransmit_mux0000141 : LUT3
    generic map(
      INIT => X"EA"
    )
    port map (
      I0 => isAllTransmit_mux000012_279,
      I1 => isAllTransmit_mux0000115_278,
      I2 => isAllTransmit_mux0000128_280,
      O => N3
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
  transmitState_FSM_FFd1_In_SW0 : LUT4
    generic map(
      INIT => X"FBFF"
    )
    port map (
      I0 => transmitState_FSM_FFd3_327,
      I1 => iStage_273,
      I2 => transmitState_FSM_FFd1_321,
      I3 => transmitState_FSM_FFd2_323,
      O => N36
    );
  transmitState_FSM_FFd1_In : LUT4
    generic map(
      INIT => X"5140"
    )
    port map (
      I0 => N36,
      I1 => iCounter_or0002,
      I2 => transmitState_cmp_eq0014_340,
      I3 => transmitState_cmp_eq0011_338,
      O => transmitState_FSM_FFd1_In_322
    );
  transmitState_cmp_eq0013_SW0 : LUT3
    generic map(
      INIT => X"FB"
    )
    port map (
      I0 => iCounter(4),
      I1 => iCounter(3),
      I2 => iCounter(1),
      O => N38
    );
  transmitState_cmp_eq0014_SW0 : LUT4
    generic map(
      INIT => X"FFFB"
    )
    port map (
      I0 => iCounter(7),
      I1 => iCounter(4),
      I2 => iCounter(13),
      I3 => iCounter(3),
      O => N40
    );
  iStage_mux000012 : LUT4
    generic map(
      INIT => X"AA2A"
    )
    port map (
      I0 => iStage_273,
      I1 => transmitState_FSM_FFd2_323,
      I2 => transmitState_FSM_FFd1_321,
      I3 => transmitState_FSM_FFd3_327,
      O => iStage_mux000012_274
    );
  iStage_mux000033 : LUT4
    generic map(
      INIT => X"A280"
    )
    port map (
      I0 => N91,
      I1 => iCounter_or0002,
      I2 => transmitState_cmp_eq0014_340,
      I3 => transmitState_cmp_eq0015,
      O => iStage_mux000033_275
    );
  transmitState_FSM_FFd3_In7 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => presState(5),
      I1 => presState(6),
      I2 => presState(1),
      I3 => presState(2),
      O => transmitState_FSM_FFd3_In7_332
    );
  transmitState_FSM_FFd3_In11 : LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      I0 => transmitState_FSM_FFd3_327,
      I1 => presState(3),
      I2 => presState(4),
      O => transmitState_FSM_FFd3_In11_328
    );
  transmitState_FSM_FFd3_In39 : LUT4
    generic map(
      INIT => X"2F22"
    )
    port map (
      I0 => transmitState_FSM_FFd3_In17_329,
      I1 => transmitState_FSM_FFd2_323,
      I2 => transmitState_cmp_eq0013_339,
      I3 => transmitState_FSM_FFd3_327,
      O => transmitState_FSM_FFd3_In39_330
    );
  transmitState_cmp_eq00091_SW0 : LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      I0 => iCounter(19),
      I1 => iCounter(12),
      I2 => iCounter(5),
      O => N42
    );
  transmitState_cmp_eq0008136 : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => iCounter(15),
      I1 => iCounter(11),
      I2 => iCounter(20),
      I3 => iCounter(0),
      O => transmitState_cmp_eq0008136_335
    );
  iCounter_or00005 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => iCounter(4),
      I1 => iStage_273,
      O => iCounter_or00005_238
    );
  iCounter_or000022 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => iCounter(14),
      I1 => iStage_273,
      O => iCounter_or000022_236
    );
  iCounter_or000079 : LUT3
    generic map(
      INIT => X"A8"
    )
    port map (
      I0 => N92,
      I1 => iCounter_or000014_235,
      I2 => iCounter_or000051_239,
      O => iCounter_or0000
    );
  transmitState_cmp_eq001221 : LUT4
    generic map(
      INIT => X"1000"
    )
    port map (
      I0 => iCounter(3),
      I1 => iCounter(2),
      I2 => iCounter(1),
      I3 => N20,
      O => N62
    );
  iCounter_mux0004_9_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => iCounter(9),
      I1 => transmitState_cmp_eq0016,
      I2 => iCounter_add0000(9),
      I3 => N99,
      O => iCounter_mux0004(9)
    );
  iCounter_mux0004_8_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => iCounter(8),
      I1 => transmitState_cmp_eq0016,
      I2 => iCounter_add0000(8),
      I3 => iCounter_mux0004_0_1162_209,
      O => iCounter_mux0004(8)
    );
  iCounter_mux0004_7_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => iCounter(7),
      I1 => transmitState_cmp_eq0016,
      I2 => iCounter_add0000(7),
      I3 => iCounter_mux0004_0_1162_209,
      O => iCounter_mux0004(7)
    );
  iCounter_mux0004_6_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => iCounter(6),
      I1 => transmitState_cmp_eq0016,
      I2 => iCounter_add0000(6),
      I3 => iCounter_mux0004_0_1162_209,
      O => iCounter_mux0004(6)
    );
  iCounter_mux0004_5_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => iCounter(5),
      I1 => transmitState_cmp_eq0016,
      I2 => iCounter_add0000(5),
      I3 => iCounter_mux0004_0_1162_209,
      O => iCounter_mux0004(5)
    );
  iCounter_mux0004_4_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => iCounter(4),
      I1 => transmitState_cmp_eq0016,
      I2 => iCounter_add0000(4),
      I3 => iCounter_mux0004_0_1162_209,
      O => iCounter_mux0004(4)
    );
  iCounter_mux0004_3_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => iCounter(3),
      I1 => transmitState_cmp_eq0016,
      I2 => iCounter_add0000(3),
      I3 => iCounter_mux0004_0_1162_209,
      O => iCounter_mux0004(3)
    );
  iCounter_mux0004_2_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => iCounter(2),
      I1 => transmitState_cmp_eq0016,
      I2 => iCounter_add0000(2),
      I3 => iCounter_mux0004_0_1162_209,
      O => iCounter_mux0004(2)
    );
  iCounter_mux0004_20_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => iCounter(20),
      I1 => transmitState_cmp_eq0016,
      I2 => iCounter_add0000(20),
      I3 => iCounter_mux0004_0_1162_209,
      O => iCounter_mux0004(20)
    );
  iCounter_mux0004_1_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => iCounter(1),
      I1 => transmitState_cmp_eq0016,
      I2 => iCounter_add0000(1),
      I3 => iCounter_mux0004_0_1162_209,
      O => iCounter_mux0004(1)
    );
  iCounter_mux0004_19_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => iCounter(19),
      I1 => transmitState_cmp_eq0016,
      I2 => iCounter_add0000(19),
      I3 => iCounter_mux0004_0_1162_209,
      O => iCounter_mux0004(19)
    );
  iCounter_mux0004_18_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => iCounter(18),
      I1 => transmitState_cmp_eq0016,
      I2 => iCounter_add0000(18),
      I3 => N94,
      O => iCounter_mux0004(18)
    );
  iCounter_mux0004_17_1 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => iCounter(17),
      I1 => transmitState_cmp_eq0016,
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
      I1 => transmitState_cmp_eq0016,
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
      I1 => transmitState_cmp_eq0016,
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
      I1 => transmitState_cmp_eq0016,
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
      I1 => transmitState_cmp_eq0016,
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
      I1 => transmitState_cmp_eq0016,
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
      I1 => transmitState_cmp_eq0016,
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
      I1 => transmitState_cmp_eq0016,
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
      I1 => transmitState_cmp_eq0016,
      I2 => iCounter_add0000(0),
      I3 => N1,
      O => iCounter_mux0004(0)
    );
  transmitState_cmp_eq0011_SW0 : LUT3
    generic map(
      INIT => X"F7"
    )
    port map (
      I0 => iCounter(10),
      I1 => iCounter(4),
      I2 => iCounter(3),
      O => N44
    );
  transmitState_cmp_eq0011 : LUT4
    generic map(
      INIT => X"0400"
    )
    port map (
      I0 => iCounter(12),
      I1 => iCounter(6),
      I2 => N44,
      I3 => N98,
      O => transmitState_cmp_eq0011_338
    );
  transmitState_cmp_eq0010 : LUT4
    generic map(
      INIT => X"1000"
    )
    port map (
      I0 => iCounter(6),
      I1 => N46,
      I2 => iCounter(12),
      I3 => N21,
      O => transmitState_cmp_eq0010_336
    );
  transmitState_cmp_eq00121_SW0 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => iCounter(10),
      I1 => iCounter(7),
      I2 => iCounter(12),
      I3 => iCounter(6),
      O => N48
    );
  transmitState_cmp_eq00102_SW0 : LUT4
    generic map(
      INIT => X"FFFD"
    )
    port map (
      I0 => iCounter(7),
      I1 => iCounter(1),
      I2 => iCounter(2),
      I3 => iCounter(5),
      O => N50
    );
  iCounter_mux0004_0_12 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => transmitState_FSM_FFd2_323,
      I1 => N90,
      O => iCounter_mux0004_0_12_210
    );
  iCounter_mux0004_0_162 : LUT4
    generic map(
      INIT => X"5554"
    )
    port map (
      I0 => transmitState_FSM_FFd2_323,
      I1 => iCounter_mux0004_0_111_206,
      I2 => iCounter_mux0004_0_143_212,
      I3 => iCounter_mux0004_0_129_211,
      O => iCounter_mux0004_0_162_213
    );
  Reset_IBUF : IBUF
    port map (
      I => Reset,
      O => Reset_IBUF_149
    );
  Display_IBUF : IBUF
    port map (
      I => Display,
      O => Display_IBUF_21
    );
  RS_OBUF : OBUF
    port map (
      I => RS_OBUF_141,
      O => RS
    );
  RW_OBUF : OBUF
    port map (
      I => RW_OBUF_147,
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
      I => isAllTransmit_276,
      O => LED(7)
    );
  LED_6_OBUF : OBUF
    port map (
      I => LED_6_OBUF_39,
      O => LED(6)
    );
  LED_5_OBUF : OBUF
    port map (
      I => transmitState_FSM_FFd3_327,
      O => LED(5)
    );
  LED_4_OBUF : OBUF
    port map (
      I => LED_4_OBUF_38,
      O => LED(4)
    );
  LED_3_OBUF : OBUF
    port map (
      I => LED_3_OBUF_37,
      O => LED(3)
    );
  LED_2_OBUF : OBUF
    port map (
      I => LED_2_OBUF_36,
      O => LED(2)
    );
  LED_1_OBUF : OBUF
    port map (
      I => LED_1_OBUF_35,
      O => LED(1)
    );
  LED_0_OBUF : OBUF
    port map (
      I => LED_0_OBUF_33,
      O => LED(0)
    );
  presState_7 : FDS
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => presState_mux0003_2_1_313,
      S => iDisplayEnable_not0001,
      Q => presState(7)
    );
  presState_8 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => presState_mux0003_1_1,
      R => iDisplay_or0000,
      Q => presState(8)
    );
  presState_9 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => presState_mux0003_0_1,
      R => iDisplay_or0000,
      Q => presState(9)
    );
  presState_mux0003_0_11 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => presState(8),
      I1 => isResetAddr_295,
      O => presState_mux0003_0_1
    );
  Data_0 : FDRS
    port map (
      C => Clock_BUFGP_2,
      D => Data_mux0000_0_38_13,
      R => Reset_IBUF_149,
      S => Data_mux0000_0_22_11,
      Q => Data_0_7
    );
  Data_1 : FDRS
    port map (
      C => Clock_BUFGP_2,
      D => Data_mux0000_1_38_15,
      R => Reset_IBUF_149,
      S => Data_mux0000_1_22_14,
      Q => Data_1_8
    );
  Data_2 : FDRS
    port map (
      C => Clock_BUFGP_2,
      D => Data_mux0000_2_38_17,
      R => Reset_IBUF_149,
      S => Data_mux0000_2_22_16,
      Q => Data_2_9
    );
  Data_3 : FDRS
    port map (
      C => Clock_BUFGP_2,
      D => Data_mux0000_3_38_19,
      R => Reset_IBUF_149,
      S => Data_mux0000_3_22_18,
      Q => Data_3_10
    );
  iStage : FDRS
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => iStage_mux000033_275,
      R => Reset_IBUF_149,
      S => iStage_mux000012_274,
      Q => iStage_273
    );
  transmitState_FSM_FFd3 : FDRS
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => transmitState_FSM_FFd3_In81,
      R => Reset_IBUF_149,
      S => transmitState_FSM_FFd3_In39_330,
      Q => transmitState_FSM_FFd3_327
    );
  transmitState_FSM_FFd2 : FDRS
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => transmitState_FSM_FFd2_In91,
      R => Reset_IBUF_149,
      S => transmitState_FSM_FFd2_In84_325,
      Q => transmitState_FSM_FFd2_323
    );
  presState_3 : FDRS
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => presState_mux0003_6_11,
      R => iDisplay_or0000,
      S => N78,
      Q => presState(3)
    );
  presState_mux0003_6_111 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => isFunc_288,
      I1 => presState(2),
      O => presState_mux0003_6_11
    );
  presState_5 : FDRS
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => presState_mux0003_4_11,
      R => iDisplay_or0000,
      S => N75,
      Q => presState(5)
    );
  presState_mux0003_4_111 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => isEntry_286,
      I1 => presState(3),
      O => presState_mux0003_4_11
    );
  presState_6 : FDRS
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      D => presState_mux0003_3_11_314,
      R => iDisplay_or0000,
      S => N191,
      Q => presState(6)
    );
  presState_mux0003_3_11 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => presState(7),
      I1 => iDisplayEnable_268,
      O => presState_mux0003_3_11_314
    );
  presState_1 : FDRSE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      CE => isInitStg2_293,
      D => RW_OBUF_147,
      R => iDisplay_or0000,
      S => N15,
      Q => presState(1)
    );
  presState_4 : FDRSE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clock_BUFGP_2,
      CE => isClear_281,
      D => RW_OBUF_147,
      R => iDisplay_or0000,
      S => N171,
      Q => presState(4)
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
  transmitState_cmp_eq0008138 : LUT4
    generic map(
      INIT => X"1000"
    )
    port map (
      I0 => iCounter(9),
      I1 => iCounter(18),
      I2 => transmitState_cmp_eq0008111_334,
      I3 => transmitState_cmp_eq0008136_335,
      O => N18
    );
  iCounter_mux0004_0_143 : LUT4
    generic map(
      INIT => X"222A"
    )
    port map (
      I0 => presState(0),
      I1 => iCounter_or000077_240,
      I2 => N95,
      I3 => iCounter_or000051_239,
      O => iCounter_mux0004_0_143_212
    );
  transmitState_cmp_eq00091_SW1 : LUT4
    generic map(
      INIT => X"FBFF"
    )
    port map (
      I0 => iCounter(8),
      I1 => iCounter(6),
      I2 => iCounter(14),
      I3 => iCounter(3),
      O => N52
    );
  iCounter_or000025_SW0 : LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => iCounter(12),
      I1 => iCounter(5),
      I2 => iCounter(4),
      O => N54
    );
  iCounter_or000051 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => iCounter_or000038_237,
      I1 => N54,
      I2 => iCounter_or000022_236,
      I3 => N18,
      O => iCounter_or000051_239
    );
  transmitState_cmp_eq001221_SW0 : LUT3
    generic map(
      INIT => X"F7"
    )
    port map (
      I0 => iCounter(1),
      I1 => iCounter(4),
      I2 => iCounter(3),
      O => N56
    );
  transmitState_cmp_eq0010139_SW0 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => iCounter(9),
      I1 => iCounter(18),
      I2 => iCounter(19),
      I3 => iCounter(8),
      O => N58
    );
  transmitState_cmp_eq00121 : LUT4
    generic map(
      INIT => X"0020"
    )
    port map (
      I0 => N93,
      I1 => N58,
      I2 => transmitState_cmp_eq0008136_335,
      I3 => N48,
      O => N20
    );
  iCounter_mux0004_0_1148 : LUT4
    generic map(
      INIT => X"084C"
    )
    port map (
      I0 => iCounter_or0002,
      I1 => iCounter_mux0004_0_1146,
      I2 => N97,
      I3 => N65,
      O => iCounter_mux0004_0_1148_208
    );
  transmitState_cmp_eq00091_SW2 : LUT4
    generic map(
      INIT => X"FBFF"
    )
    port map (
      I0 => iCounter(17),
      I1 => iCounter(14),
      I2 => iCounter(8),
      I3 => iCounter(6),
      O => N671
    );
  transmitState_cmp_eq0010139_SW1 : LUT4
    generic map(
      INIT => X"FBFF"
    )
    port map (
      I0 => iCounter(18),
      I1 => iCounter(9),
      I2 => iCounter(19),
      I3 => iCounter(8),
      O => N69
    );
  transmitState_cmp_eq001221_SW1 : LUT4
    generic map(
      INIT => X"FFFB"
    )
    port map (
      I0 => iCounter(2),
      I1 => iCounter(1),
      I2 => iCounter(4),
      I3 => iCounter(3),
      O => N711
    );
  iCounter_mux0004_0_111 : LUT4
    generic map(
      INIT => X"E0F0"
    )
    port map (
      I0 => iCounter(5),
      I1 => N711,
      I2 => N89,
      I3 => N20,
      O => iCounter_mux0004_0_111_206
    );
  transmitState_FSM_FFd2_In911 : LUT4
    generic map(
      INIT => X"CC80"
    )
    port map (
      I0 => presState(0),
      I1 => transmitState_FSM_FFd3_327,
      I2 => iCounter_or0000,
      I3 => N73,
      O => transmitState_FSM_FFd2_In91
    );
  transmitState_FSM_FFd2_In31_SW0_SW0 : LUT4
    generic map(
      INIT => X"A820"
    )
    port map (
      I0 => presState(1),
      I1 => iStage_273,
      I2 => transmitState_cmp_eq0010_336,
      I3 => transmitState_cmp_eq0011_338,
      O => N751
    );
  iCounter_mux0004_0_1148_SW0 : MUXF5
    port map (
      I0 => N77,
      I1 => N781,
      S => iStage_273,
      O => N65
    );
  iCounter_mux0004_0_1148_SW0_F : LUT4
    generic map(
      INIT => X"0400"
    )
    port map (
      I0 => iCounter(2),
      I1 => iCounter(5),
      I2 => N56,
      I3 => N20,
      O => N77
    );
  iCounter_mux0004_0_1148_SW0_G : LUT4
    generic map(
      INIT => X"0400"
    )
    port map (
      I0 => iCounter(12),
      I1 => iCounter(6),
      I2 => N44,
      I3 => N21,
      O => N781
    );
  iData_mux0002_4_SW2 : LUT4
    generic map(
      INIT => X"762F"
    )
    port map (
      I0 => iCharSent(2),
      I1 => iCharSent(3),
      I2 => iCharSent(0),
      I3 => iCharSent(1),
      O => N79
    );
  iData_mux0002_4_Q : LUT3
    generic map(
      INIT => X"EA"
    )
    port map (
      I0 => N14,
      I1 => N19,
      I2 => N79,
      O => iData_mux0002(4)
    );
  iData_mux0002_1_60 : LUT4
    generic map(
      INIT => X"8F88"
    )
    port map (
      I0 => N19,
      I1 => iData_mux0002_1_42_254,
      I2 => isResetAddr_295,
      I3 => presState(8),
      O => iData_mux0002_1_60_255
    );
  iData_not000175_SW0 : LUT4
    generic map(
      INIT => X"FFEA"
    )
    port map (
      I0 => presState(7),
      I1 => isResetAddr_295,
      I2 => presState(8),
      I3 => presState(9),
      O => N81
    );
  iData_not000175 : LUT4
    generic map(
      INIT => X"080C"
    )
    port map (
      I0 => N67,
      I1 => iData_not000173_265,
      I2 => N81,
      I3 => presState(6),
      O => iData_not000175_266
    );
  iDisplayEnable_not00011 : LUT4
    generic map(
      INIT => X"C080"
    )
    port map (
      I0 => Reset_IBUF_149,
      I1 => isConfig_283,
      I2 => isInit_290,
      I3 => presState(9),
      O => iDisplayEnable_not0001
    );
  iDisplay_or0000_inv1 : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => Reset_IBUF_149,
      I1 => presState(9),
      O => iDisplay_or0000_inv
    );
  transmitState_FSM_FFd2_In6 : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => iCounter(4),
      I1 => iCounter(5),
      I2 => presState(1),
      I3 => presState(0),
      O => transmitState_FSM_FFd2_In6_324
    );
  transmitState_FSM_FFd3_In54 : LUT4
    generic map(
      INIT => X"1000"
    )
    port map (
      I0 => presState(4),
      I1 => presState(8),
      I2 => transmitState_FSM_FFd2_323,
      I3 => N96,
      O => transmitState_FSM_FFd3_In54_331
    );
  presState_mux0003_2_1 : LUT3
    generic map(
      INIT => X"10"
    )
    port map (
      I0 => Reset_IBUF_149,
      I1 => presState(9),
      I2 => N26,
      O => presState_mux0003_2_1_313
    );
  iCharSent_mux0001_0_1 : LUT3
    generic map(
      INIT => X"46"
    )
    port map (
      I0 => iCharSent(0),
      I1 => isTransmit_297,
      I2 => isAllTransmit_276,
      O => iCharSent_mux0001(0)
    );
  iCharSent_mux0001_1_1 : LUT4
    generic map(
      INIT => X"486A"
    )
    port map (
      I0 => iCharSent(1),
      I1 => isTransmit_297,
      I2 => iCharSent(0),
      I3 => isAllTransmit_276,
      O => iCharSent_mux0001(1)
    );
  iData_mux0002_6_11 : LUT3
    generic map(
      INIT => X"10"
    )
    port map (
      I0 => isAllTransmit_276,
      I1 => isTransmit_297,
      I2 => presState(6),
      O => N19
    );
  iData_mux0002_1_76 : LUT4
    generic map(
      INIT => X"FFAE"
    )
    port map (
      I0 => N14,
      I1 => presState(3),
      I2 => isEntry_286,
      I3 => iData_mux0002_1_60_255,
      O => iData_mux0002(1)
    );
  transmitState_FSM_FFd2_In84 : LUT4
    generic map(
      INIT => X"5040"
    )
    port map (
      I0 => transmitState_FSM_FFd1_321,
      I1 => iStage_273,
      I2 => transmitState_FSM_FFd2_323,
      I3 => N85,
      O => transmitState_FSM_FFd2_In84_325
    );
  iData_mux0002_7_SW0 : LUT4
    generic map(
      INIT => X"1000"
    )
    port map (
      I0 => isAllTransmit_276,
      I1 => isTransmit_297,
      I2 => iCharSent(2),
      I3 => presState(6),
      O => N0
    );
  transmitState_FSM_FFd3_In811 : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => iStage_273,
      I1 => transmitState_FSM_FFd1_321,
      I2 => transmitState_FSM_FFd3_327,
      I3 => N87,
      O => transmitState_FSM_FFd3_In81
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
      I => Reset_IBUF_149,
      O => Reset_inv
    );
  LED_0_mux00001 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => presState(0),
      I1 => presState(5),
      I2 => presState(2),
      I3 => presState(7),
      O => LED_0_mux0000
    );
  LED_0_mux0000_f5 : MUXF5
    port map (
      I0 => LED_0_mux0000,
      I1 => CharSeq(0, 2),
      S => presState(9),
      O => LED_0_OBUF_33
    );
  presState_mux0003_1_11 : LUT4
    generic map(
      INIT => X"7555"
    )
    port map (
      I0 => isResetAddr_295,
      I1 => isTransmit_297,
      I2 => isAllTransmit_276,
      I3 => presState(6),
      O => presState_mux0003_1_11_311
    );
  presState_mux0003_1_12 : LUT3
    generic map(
      INIT => X"20"
    )
    port map (
      I0 => presState(6),
      I1 => isTransmit_297,
      I2 => isAllTransmit_276,
      O => presState_mux0003_1_12_312
    );
  presState_mux0003_1_1_f5 : MUXF5
    port map (
      I0 => presState_mux0003_1_12_312,
      I1 => presState_mux0003_1_11_311,
      S => presState(8),
      O => presState_mux0003_1_1
    );
  presState_mux0003_7_1 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => isConfig_283,
      I1 => isInit_290,
      O => presState_mux0003_7_1_318
    );
  presState_mux0003_7_2 : LUT4
    generic map(
      INIT => X"8F88"
    )
    port map (
      I0 => isInitStg2_293,
      I1 => presState(1),
      I2 => isFunc_288,
      I3 => presState(2),
      O => presState_mux0003_7_2_319
    );
  presState_mux0003_7_f5 : MUXF5
    port map (
      I0 => presState_mux0003_7_2_319,
      I1 => presState_mux0003_7_1_318,
      S => iDisplay_or0000,
      O => presState_mux0003_7_Q
    );
  iCharSent_mux0001_2_1 : LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => iCharSent(2),
      I1 => iCharSent(1),
      I2 => iCharSent(0),
      O => iCharSent_mux0001_2_1_158
    );
  iCharSent_mux0001_2_2 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => isAllTransmit_276,
      I1 => iCharSent(2),
      O => iCharSent_mux0001_2_2_159
    );
  iCharSent_mux0001_2_f5 : MUXF5
    port map (
      I0 => iCharSent_mux0001_2_2_159,
      I1 => iCharSent_mux0001_2_1_158,
      S => isTransmit_297,
      O => iCharSent_mux0001(2)
    );
  iCharSent_mux0001_3_1 : LUT4
    generic map(
      INIT => X"6AAA"
    )
    port map (
      I0 => iCharSent(3),
      I1 => iCharSent(2),
      I2 => iCharSent(1),
      I3 => iCharSent(0),
      O => iCharSent_mux0001_3_1_161
    );
  iCharSent_mux0001_3_2 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => isAllTransmit_276,
      I1 => iCharSent(3),
      O => iCharSent_mux0001_3_2_162
    );
  iCharSent_mux0001_3_f5 : MUXF5
    port map (
      I0 => iCharSent_mux0001_3_2_162,
      I1 => iCharSent_mux0001_3_1_161,
      S => isTransmit_297,
      O => iCharSent_mux0001(3)
    );
  RS_mux0000210 : LUT2_D
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => presState(1),
      I1 => presState(0),
      LO => N89,
      O => N71
    );
  transmitState_cmp_eq0013 : LUT4_D
    generic map(
      INIT => X"1000"
    )
    port map (
      I0 => iCounter(5),
      I1 => N38,
      I2 => iCounter(2),
      I3 => N20,
      LO => N90,
      O => transmitState_cmp_eq0013_339
    );
  iStage_mux000028 : LUT3_D
    generic map(
      INIT => X"10"
    )
    port map (
      I0 => transmitState_FSM_FFd1_321,
      I1 => transmitState_FSM_FFd3_327,
      I2 => transmitState_FSM_FFd2_323,
      LO => N91,
      O => iCounter_mux0004_0_1146
    );
  transmitState_cmp_eq0008111 : LUT4_L
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => iCounter(16),
      I1 => iCounter(10),
      I2 => iCounter(1),
      I3 => iCounter(2),
      LO => transmitState_cmp_eq0008111_334
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
      LO => iCounter_or000038_237
    );
  iCounter_or000077 : LUT3_D
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => iCounter(13),
      I1 => iCounter(17),
      I2 => iCounter(7),
      LO => N92,
      O => iCounter_or000077_240
    );
  transmitState_cmp_eq0010_SW0 : LUT3_L
    generic map(
      INIT => X"FB"
    )
    port map (
      I0 => iCounter(10),
      I1 => iCounter(3),
      I2 => iCounter(4),
      LO => N46
    );
  transmitState_cmp_eq0010112 : LUT4_D
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => iCounter(16),
      I1 => iCounter(17),
      I2 => iCounter(13),
      I3 => iCounter(14),
      LO => N93,
      O => transmitState_cmp_eq0010112_337
    );
  iCounter_mux0004_0_129 : LUT4_L
    generic map(
      INIT => X"028A"
    )
    port map (
      I0 => presState(1),
      I1 => iStage_273,
      I2 => transmitState_cmp_eq0010_336,
      I3 => transmitState_cmp_eq0011_338,
      LO => iCounter_mux0004_0_129_211
    );
  iCounter_mux0004_0_1162 : LUT4_D
    generic map(
      INIT => X"FAF8"
    )
    port map (
      I0 => transmitState_FSM_FFd3_327,
      I1 => iCounter_mux0004_0_12_210,
      I2 => iCounter_mux0004_0_1148_208,
      I3 => iCounter_mux0004_0_162_213,
      LO => N94,
      O => N1
    );
  iCounter_or000014 : LUT4_D
    generic map(
      INIT => X"1000"
    )
    port map (
      I0 => N42,
      I1 => N52,
      I2 => iCounter_or00005_238,
      I3 => N18,
      LO => N95,
      O => iCounter_or000014_235
    );
  transmitState_cmp_eq00151 : LUT4_D
    generic map(
      INIT => X"0400"
    )
    port map (
      I0 => iCounter(2),
      I1 => iCounter(5),
      I2 => N56,
      I3 => N20,
      LO => N96,
      O => transmitState_cmp_eq0015
    );
  transmitState_cmp_eq0014 : LUT4_D
    generic map(
      INIT => X"0100"
    )
    port map (
      I0 => N671,
      I1 => N40,
      I2 => N42,
      I3 => N18,
      LO => N97,
      O => transmitState_cmp_eq0014_340
    );
  transmitState_cmp_eq00102 : LUT4_D
    generic map(
      INIT => X"0040"
    )
    port map (
      I0 => N69,
      I1 => transmitState_cmp_eq0008136_335,
      I2 => transmitState_cmp_eq0010112_337,
      I3 => N50,
      LO => N98,
      O => N21
    );
  transmitState_FSM_FFd2_In31_SW0 : LUT4_L
    generic map(
      INIT => X"FFEA"
    )
    port map (
      I0 => transmitState_FSM_FFd2_323,
      I1 => N62,
      I2 => transmitState_FSM_FFd2_In6_324,
      I3 => N751,
      LO => N73
    );
  transmitState_FSM_FFd3_In17 : LUT4_L
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => transmitState_FSM_FFd3_In7_332,
      I1 => presState(0),
      I2 => presState(8),
      I3 => transmitState_FSM_FFd3_In11_328,
      LO => transmitState_FSM_FFd3_In17_329
    );
  transmitState_FSM_FFd2_In84_SW0 : LUT4_L
    generic map(
      INIT => X"3237"
    )
    port map (
      I0 => presState(4),
      I1 => transmitState_cmp_eq0014_340,
      I2 => presState(8),
      I3 => transmitState_cmp_eq0015,
      LO => N85
    );
  transmitState_FSM_FFd3_In811_SW0 : LUT4_L
    generic map(
      INIT => X"001F"
    )
    port map (
      I0 => presState(4),
      I1 => presState(8),
      I2 => transmitState_cmp_eq0014_340,
      I3 => transmitState_FSM_FFd3_In54_331,
      LO => N87
    );
  iCounter_mux0004_0_1162_1 : LUT4_D
    generic map(
      INIT => X"FAF8"
    )
    port map (
      I0 => transmitState_FSM_FFd3_327,
      I1 => iCounter_mux0004_0_12_210,
      I2 => iCounter_mux0004_0_1148_208,
      I3 => iCounter_mux0004_0_162_213,
      LO => N99,
      O => iCounter_mux0004_0_1162_209
    );

end Structure;

