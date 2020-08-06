/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x8ef4fb42 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Documents and Settings/Procesador_RISC_32bits/ARITH_tb.vhd";
extern char *STD_TEXTIO;
extern char *IEEE_P_3564397177;

void ieee_p_3564397177_sub_2321505904_91900896(char *, char *, char *, char *, char *);
void ieee_p_3564397177_sub_2889341154_91900896(char *, char *, char *, char *, char *);


static void work_a_3865536744_2372691052_p_0(char *t0)
{
    char t5[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    char *t7;
    int t8;
    unsigned int t9;
    unsigned char t10;
    unsigned char t11;
    char *t12;
    int64 t13;
    unsigned char t14;
    unsigned char t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned char t19;
    char *t20;
    char *t21;
    unsigned char t22;
    unsigned char t23;
    char *t24;
    int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned char t29;
    char *t30;
    char *t31;
    unsigned char t32;
    unsigned char t33;
    char *t34;
    int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned char t39;
    char *t40;
    char *t41;
    unsigned char t42;
    unsigned char t43;

LAB0:    t1 = (t0 + 2568U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(94, ng0);
    t2 = (t0 + 2096U);
    t3 = (t0 + 5814);
    t6 = (t5 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 1;
    t7 = (t6 + 4U);
    *((int *)t7) = 26;
    t7 = (t6 + 8U);
    *((int *)t7) = 1;
    t8 = (26 - 1);
    t9 = (t8 * 1);
    t9 = (t9 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t9;
    std_textio_file_open1(t2, t3, t5, (unsigned char)0);
    xsi_set_current_line(95, ng0);

LAB4:    t2 = (t0 + 2096U);
    t10 = std_textio_endfile(t2);
    t11 = (!(t10));
    if (t11 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(124, ng0);

LAB32:    *((char **)t1) = &&LAB33;

LAB1:    return;
LAB5:    xsi_set_current_line(96, ng0);
    t3 = (t0 + 2468);
    t4 = (t0 + 2096U);
    t6 = (t0 + 2200U);
    std_textio_readline(STD_TEXTIO, t3, t4, t6);
    xsi_set_current_line(98, ng0);
    t2 = (t0 + 2468);
    t3 = (t0 + 2200U);
    t4 = (t0 + 1636U);
    t6 = *((char **)t4);
    t4 = (t6 + 0);
    t7 = (t0 + 1908U);
    t12 = *((char **)t7);
    t7 = (t12 + 0);
    ieee_p_3564397177_sub_2321505904_91900896(IEEE_P_3564397177, t2, t3, t4, t7);
    xsi_set_current_line(99, ng0);
    t2 = (t0 + 1908U);
    t3 = *((char **)t2);
    t10 = *((unsigned char *)t3);
    t11 = (!(t10));
    if (t11 != 0)
        goto LAB4;

LAB8:    xsi_set_current_line(100, ng0);
    t2 = (t0 + 2468);
    t3 = (t0 + 2200U);
    t4 = (t0 + 1840U);
    t6 = *((char **)t4);
    t4 = (t6 + 0);
    std_textio_read8(STD_TEXTIO, t2, t3, t4);
    xsi_set_current_line(102, ng0);
    t2 = (t0 + 2468);
    t3 = (t0 + 2200U);
    t4 = (t0 + 1500U);
    t6 = *((char **)t4);
    t4 = (t0 + 5480U);
    ieee_p_3564397177_sub_2889341154_91900896(IEEE_P_3564397177, t2, t3, t6, t4);
    xsi_set_current_line(103, ng0);
    t2 = (t0 + 2468);
    t3 = (t0 + 2200U);
    t4 = (t0 + 1840U);
    t6 = *((char **)t4);
    t4 = (t6 + 0);
    std_textio_read8(STD_TEXTIO, t2, t3, t4);
    xsi_set_current_line(105, ng0);
    t2 = (t0 + 2468);
    t3 = (t0 + 2200U);
    t4 = (t0 + 1568U);
    t6 = *((char **)t4);
    t4 = (t0 + 5480U);
    ieee_p_3564397177_sub_2889341154_91900896(IEEE_P_3564397177, t2, t3, t6, t4);
    xsi_set_current_line(106, ng0);
    t2 = (t0 + 2468);
    t3 = (t0 + 2200U);
    t4 = (t0 + 1840U);
    t6 = *((char **)t4);
    t4 = (t6 + 0);
    std_textio_read8(STD_TEXTIO, t2, t3, t4);
    xsi_set_current_line(108, ng0);
    t2 = (t0 + 2468);
    t3 = (t0 + 2200U);
    t4 = (t0 + 1704U);
    t6 = *((char **)t4);
    t4 = (t0 + 5496U);
    ieee_p_3564397177_sub_2889341154_91900896(IEEE_P_3564397177, t2, t3, t6, t4);
    xsi_set_current_line(109, ng0);
    t2 = (t0 + 2468);
    t3 = (t0 + 2200U);
    t4 = (t0 + 1840U);
    t6 = *((char **)t4);
    t4 = (t6 + 0);
    std_textio_read8(STD_TEXTIO, t2, t3, t4);
    xsi_set_current_line(111, ng0);
    t2 = (t0 + 2468);
    t3 = (t0 + 2200U);
    t4 = (t0 + 1772U);
    t6 = *((char **)t4);
    t4 = (t0 + 5512U);
    ieee_p_3564397177_sub_2889341154_91900896(IEEE_P_3564397177, t2, t3, t6, t4);
    xsi_set_current_line(113, ng0);
    t2 = (t0 + 1636U);
    t3 = *((char **)t2);
    t10 = *((unsigned char *)t3);
    t2 = (t0 + 2800);
    t4 = (t2 + 32U);
    t6 = *((char **)t4);
    t7 = (t6 + 40U);
    t12 = *((char **)t7);
    *((unsigned char *)t12) = t10;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(114, ng0);
    t2 = (t0 + 1500U);
    t3 = *((char **)t2);
    t2 = (t0 + 2836);
    t4 = (t2 + 32U);
    t6 = *((char **)t4);
    t7 = (t6 + 40U);
    t12 = *((char **)t7);
    memcpy(t12, t3, 32U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(115, ng0);
    t2 = (t0 + 1568U);
    t3 = *((char **)t2);
    t2 = (t0 + 2872);
    t4 = (t2 + 32U);
    t6 = *((char **)t4);
    t7 = (t6 + 40U);
    t12 = *((char **)t7);
    memcpy(t12, t3, 32U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(116, ng0);
    t2 = (t0 + 1704U);
    t3 = *((char **)t2);
    t2 = (t0 + 2908);
    t4 = (t2 + 32U);
    t6 = *((char **)t4);
    t7 = (t6 + 40U);
    t12 = *((char **)t7);
    memcpy(t12, t3, 32U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(117, ng0);
    t2 = (t0 + 1772U);
    t3 = *((char **)t2);
    t2 = (t0 + 2944);
    t4 = (t2 + 32U);
    t6 = *((char **)t4);
    t7 = (t6 + 40U);
    t12 = *((char **)t7);
    memcpy(t12, t3, 3U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(119, ng0);
    t13 = (20 * 1000LL);
    t2 = (t0 + 2468);
    xsi_process_wait(t2, t13);

LAB11:    *((char **)t1) = &&LAB12;
    goto LAB1;

LAB6:;
LAB9:    xsi_set_current_line(120, ng0);
    t2 = (t0 + 1236U);
    t3 = *((char **)t2);
    t2 = (t0 + 868U);
    t4 = *((char **)t2);
    t15 = 1;
    if (32U == 32U)
        goto LAB24;

LAB25:    t15 = 0;

LAB26:    if (t15 == 1)
        goto LAB21;

LAB22:    t14 = (unsigned char)0;

LAB23:    if (t14 == 1)
        goto LAB18;

LAB19:    t11 = (unsigned char)0;

LAB20:    if (t11 == 1)
        goto LAB15;

LAB16:    t10 = (unsigned char)0;

LAB17:    if (t10 == 0)
        goto LAB13;

LAB14:    goto LAB4;

LAB10:    goto LAB9;

LAB12:    goto LAB10;

LAB13:    t40 = (t0 + 5840);
    xsi_report(t40, 33U, (unsigned char)2);
    goto LAB14;

LAB15:    t30 = (t0 + 1328U);
    t34 = *((char **)t30);
    t35 = (0 - 2);
    t36 = (t35 * -1);
    t37 = (1U * t36);
    t38 = (0 + t37);
    t30 = (t34 + t38);
    t39 = *((unsigned char *)t30);
    t40 = (t0 + 1144U);
    t41 = *((char **)t40);
    t42 = *((unsigned char *)t41);
    t43 = (t39 == t42);
    t10 = t43;
    goto LAB17;

LAB18:    t20 = (t0 + 1328U);
    t24 = *((char **)t20);
    t25 = (1 - 2);
    t26 = (t25 * -1);
    t27 = (1U * t26);
    t28 = (0 + t27);
    t20 = (t24 + t28);
    t29 = *((unsigned char *)t20);
    t30 = (t0 + 1052U);
    t31 = *((char **)t30);
    t32 = *((unsigned char *)t31);
    t33 = (t29 == t32);
    t11 = t33;
    goto LAB20;

LAB21:    t7 = (t0 + 1328U);
    t12 = *((char **)t7);
    t8 = (2 - 2);
    t16 = (t8 * -1);
    t17 = (1U * t16);
    t18 = (0 + t17);
    t7 = (t12 + t18);
    t19 = *((unsigned char *)t7);
    t20 = (t0 + 960U);
    t21 = *((char **)t20);
    t22 = *((unsigned char *)t21);
    t23 = (t19 == t22);
    t14 = t23;
    goto LAB23;

LAB24:    t9 = 0;

LAB27:    if (t9 < 32U)
        goto LAB28;
    else
        goto LAB26;

LAB28:    t2 = (t3 + t9);
    t6 = (t4 + t9);
    if (*((unsigned char *)t2) != *((unsigned char *)t6))
        goto LAB25;

LAB29:    t9 = (t9 + 1);
    goto LAB27;

LAB30:    goto LAB2;

LAB31:    goto LAB30;

LAB33:    goto LAB31;

}


extern void work_a_3865536744_2372691052_init()
{
	static char *pe[] = {(void *)work_a_3865536744_2372691052_p_0};
	xsi_register_didat("work_a_3865536744_2372691052", "isim/ARITH_tb_isim_beh.exe.sim/work/a_3865536744_2372691052.didat");
	xsi_register_executes(pe);
}
