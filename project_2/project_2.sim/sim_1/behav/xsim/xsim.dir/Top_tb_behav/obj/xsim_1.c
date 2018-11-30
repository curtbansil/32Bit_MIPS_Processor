/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2013 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/


#include "iki.h"
#include <string.h>
#include <math.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
typedef void (*funcp)(char *, char *);
extern int main(int, char**);
extern void execute_3038(char*, char *);
extern void execute_3039(char*, char *);
extern void execute_6074(char*, char *);
extern void execute_6075(char*, char *);
extern void execute_3044(char*, char *);
extern void execute_3057(char*, char *);
extern void execute_3443(char*, char *);
extern void execute_3444(char*, char *);
extern void execute_3445(char*, char *);
extern void execute_3446(char*, char *);
extern void execute_3447(char*, char *);
extern void execute_3448(char*, char *);
extern void execute_4267(char*, char *);
extern void execute_4268(char*, char *);
extern void execute_4269(char*, char *);
extern void execute_4270(char*, char *);
extern void execute_4271(char*, char *);
extern void execute_4272(char*, char *);
extern void execute_4273(char*, char *);
extern void execute_4582(char*, char *);
extern void execute_5271(char*, char *);
extern void execute_5272(char*, char *);
extern void vlog_const_rhs_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
extern void execute_5954(char*, char *);
extern void execute_5955(char*, char *);
extern void execute_6020(char*, char *);
extern void execute_6021(char*, char *);
extern void execute_6022(char*, char *);
extern void execute_6038(char*, char *);
extern void execute_6039(char*, char *);
extern void execute_6040(char*, char *);
extern void execute_6041(char*, char *);
extern void execute_6042(char*, char *);
extern void execute_6043(char*, char *);
extern void execute_6044(char*, char *);
extern void execute_6045(char*, char *);
extern void execute_6046(char*, char *);
extern void execute_6047(char*, char *);
extern void execute_6048(char*, char *);
extern void execute_6049(char*, char *);
extern void execute_6050(char*, char *);
extern void execute_6051(char*, char *);
extern void execute_6052(char*, char *);
extern void execute_6053(char*, char *);
extern void execute_6054(char*, char *);
extern void execute_6055(char*, char *);
extern void execute_6056(char*, char *);
extern void execute_6057(char*, char *);
extern void execute_6058(char*, char *);
extern void execute_6059(char*, char *);
extern void execute_6060(char*, char *);
extern void execute_6061(char*, char *);
extern void execute_6062(char*, char *);
extern void execute_6063(char*, char *);
extern void execute_6064(char*, char *);
extern void execute_6065(char*, char *);
extern void execute_6066(char*, char *);
extern void execute_6067(char*, char *);
extern void execute_6068(char*, char *);
extern void execute_6069(char*, char *);
extern void execute_6070(char*, char *);
extern void execute_6071(char*, char *);
extern void execute_6072(char*, char *);
extern void execute_6073(char*, char *);
extern void execute_4(char*, char *);
extern void execute_5(char*, char *);
extern void execute_3045(char*, char *);
extern void vlog_simple_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
extern void execute_7(char*, char *);
extern void execute_8(char*, char *);
extern void execute_3058(char*, char *);
extern void execute_3059(char*, char *);
extern void execute_3060(char*, char *);
extern void execute_3061(char*, char *);
extern void execute_3062(char*, char *);
extern void execute_3063(char*, char *);
extern void execute_3064(char*, char *);
extern void execute_3065(char*, char *);
extern void execute_3066(char*, char *);
extern void execute_3067(char*, char *);
extern void execute_3068(char*, char *);
extern void execute_3069(char*, char *);
extern void execute_3070(char*, char *);
extern void execute_3071(char*, char *);
extern void execute_3072(char*, char *);
extern void execute_3073(char*, char *);
extern void execute_3074(char*, char *);
extern void execute_3075(char*, char *);
extern void execute_3076(char*, char *);
extern void execute_3077(char*, char *);
extern void execute_3078(char*, char *);
extern void execute_3079(char*, char *);
extern void execute_3080(char*, char *);
extern void execute_3081(char*, char *);
extern void execute_3082(char*, char *);
extern void execute_3083(char*, char *);
extern void execute_3084(char*, char *);
extern void execute_3085(char*, char *);
extern void execute_3086(char*, char *);
extern void execute_3087(char*, char *);
extern void execute_3088(char*, char *);
extern void execute_3089(char*, char *);
extern void execute_11(char*, char *);
extern void execute_271(char*, char *);
extern void execute_272(char*, char *);
extern void execute_274(char*, char *);
extern void execute_275(char*, char *);
extern void execute_277(char*, char *);
extern void execute_278(char*, char *);
extern void execute_3186(char*, char *);
extern void execute_3187(char*, char *);
extern void execute_3188(char*, char *);
extern void execute_3189(char*, char *);
extern void execute_3190(char*, char *);
extern void execute_282(char*, char *);
extern void execute_474(char*, char *);
extern void execute_475(char*, char *);
extern void execute_477(char*, char *);
extern void execute_478(char*, char *);
extern void execute_480(char*, char *);
extern void execute_481(char*, char *);
extern void execute_3449(char*, char *);
extern void execute_483(char*, char *);
extern void execute_484(char*, char *);
extern void execute_485(char*, char *);
extern void execute_617(char*, char *);
extern void execute_618(char*, char *);
extern void execute_3514(char*, char *);
extern void execute_3515(char*, char *);
extern void execute_621(char*, char *);
extern void execute_622(char*, char *);
extern void execute_3516(char*, char *);
extern void execute_3517(char*, char *);
extern void execute_3518(char*, char *);
extern void execute_691(char*, char *);
extern void execute_692(char*, char *);
extern void execute_694(char*, char *);
extern void execute_695(char*, char *);
extern void execute_4274(char*, char *);
extern void execute_4275(char*, char *);
extern void execute_4276(char*, char *);
extern void execute_4277(char*, char *);
extern void execute_4278(char*, char *);
extern void execute_1264(char*, char *);
extern void execute_1265(char*, char *);
extern void execute_4284(char*, char *);
extern void execute_1267(char*, char *);
extern void execute_1268(char*, char *);
extern void execute_4285(char*, char *);
extern void execute_4286(char*, char *);
extern void execute_1792(char*, char *);
extern void execute_1793(char*, char *);
extern void execute_1795(char*, char *);
extern void execute_1796(char*, char *);
extern void execute_4543(char*, char *);
extern void execute_4544(char*, char *);
extern void execute_4547(char*, char *);
extern void execute_4548(char*, char *);
extern void execute_4549(char*, char *);
extern void execute_2384(char*, char *);
extern void execute_2385(char*, char *);
extern void execute_2387(char*, char *);
extern void execute_2388(char*, char *);
extern void execute_2389(char*, char *);
extern void execute_3041(char*, char *);
extern void execute_3042(char*, char *);
extern void execute_3043(char*, char *);
extern void execute_6076(char*, char *);
extern void execute_6077(char*, char *);
extern void execute_6078(char*, char *);
extern void execute_6079(char*, char *);
extern void execute_6080(char*, char *);
extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[173] = {(funcp)execute_3038, (funcp)execute_3039, (funcp)execute_6074, (funcp)execute_6075, (funcp)execute_3044, (funcp)execute_3057, (funcp)execute_3443, (funcp)execute_3444, (funcp)execute_3445, (funcp)execute_3446, (funcp)execute_3447, (funcp)execute_3448, (funcp)execute_4267, (funcp)execute_4268, (funcp)execute_4269, (funcp)execute_4270, (funcp)execute_4271, (funcp)execute_4272, (funcp)execute_4273, (funcp)execute_4582, (funcp)execute_5271, (funcp)execute_5272, (funcp)vlog_const_rhs_process_execute_0_fast_no_reg_no_agg, (funcp)execute_5954, (funcp)execute_5955, (funcp)execute_6020, (funcp)execute_6021, (funcp)execute_6022, (funcp)execute_6038, (funcp)execute_6039, (funcp)execute_6040, (funcp)execute_6041, (funcp)execute_6042, (funcp)execute_6043, (funcp)execute_6044, (funcp)execute_6045, (funcp)execute_6046, (funcp)execute_6047, (funcp)execute_6048, (funcp)execute_6049, (funcp)execute_6050, (funcp)execute_6051, (funcp)execute_6052, (funcp)execute_6053, (funcp)execute_6054, (funcp)execute_6055, (funcp)execute_6056, (funcp)execute_6057, (funcp)execute_6058, (funcp)execute_6059, (funcp)execute_6060, (funcp)execute_6061, (funcp)execute_6062, (funcp)execute_6063, (funcp)execute_6064, (funcp)execute_6065, (funcp)execute_6066, (funcp)execute_6067, (funcp)execute_6068, (funcp)execute_6069, (funcp)execute_6070, (funcp)execute_6071, (funcp)execute_6072, (funcp)execute_6073, (funcp)execute_4, (funcp)execute_5, (funcp)execute_3045, (funcp)vlog_simple_process_execute_0_fast_no_reg_no_agg, (funcp)execute_7, (funcp)execute_8, (funcp)execute_3058, (funcp)execute_3059, (funcp)execute_3060, (funcp)execute_3061, (funcp)execute_3062, (funcp)execute_3063, (funcp)execute_3064, (funcp)execute_3065, (funcp)execute_3066, (funcp)execute_3067, (funcp)execute_3068, (funcp)execute_3069, (funcp)execute_3070, (funcp)execute_3071, (funcp)execute_3072, (funcp)execute_3073, (funcp)execute_3074, (funcp)execute_3075, (funcp)execute_3076, (funcp)execute_3077, (funcp)execute_3078, (funcp)execute_3079, (funcp)execute_3080, (funcp)execute_3081, (funcp)execute_3082, (funcp)execute_3083, (funcp)execute_3084, (funcp)execute_3085, (funcp)execute_3086, (funcp)execute_3087, (funcp)execute_3088, (funcp)execute_3089, (funcp)execute_11, (funcp)execute_271, (funcp)execute_272, (funcp)execute_274, (funcp)execute_275, (funcp)execute_277, (funcp)execute_278, (funcp)execute_3186, (funcp)execute_3187, (funcp)execute_3188, (funcp)execute_3189, (funcp)execute_3190, (funcp)execute_282, (funcp)execute_474, (funcp)execute_475, (funcp)execute_477, (funcp)execute_478, (funcp)execute_480, (funcp)execute_481, (funcp)execute_3449, (funcp)execute_483, (funcp)execute_484, (funcp)execute_485, (funcp)execute_617, (funcp)execute_618, (funcp)execute_3514, (funcp)execute_3515, (funcp)execute_621, (funcp)execute_622, (funcp)execute_3516, (funcp)execute_3517, (funcp)execute_3518, (funcp)execute_691, (funcp)execute_692, (funcp)execute_694, (funcp)execute_695, (funcp)execute_4274, (funcp)execute_4275, (funcp)execute_4276, (funcp)execute_4277, (funcp)execute_4278, (funcp)execute_1264, (funcp)execute_1265, (funcp)execute_4284, (funcp)execute_1267, (funcp)execute_1268, (funcp)execute_4285, (funcp)execute_4286, (funcp)execute_1792, (funcp)execute_1793, (funcp)execute_1795, (funcp)execute_1796, (funcp)execute_4543, (funcp)execute_4544, (funcp)execute_4547, (funcp)execute_4548, (funcp)execute_4549, (funcp)execute_2384, (funcp)execute_2385, (funcp)execute_2387, (funcp)execute_2388, (funcp)execute_2389, (funcp)execute_3041, (funcp)execute_3042, (funcp)execute_3043, (funcp)execute_6076, (funcp)execute_6077, (funcp)execute_6078, (funcp)execute_6079, (funcp)execute_6080, (funcp)vlog_transfunc_eventcallback};
const int NumRelocateId= 173;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/Top_tb_behav/xsim.reloc",  (void **)funcTab, 173);

	/*Populate the transaction function pointer field in the whole net structure */
}

void sensitize(char *dp)
{
	iki_sensitize(dp, "xsim.dir/Top_tb_behav/xsim.reloc");
}

void simulate(char *dp)
{
	iki_schedule_processes_at_time_zero(dp, "xsim.dir/Top_tb_behav/xsim.reloc");
	// Initialize Verilog nets in mixed simulation, for the cases when the value at time 0 should be propagated from the mixed language Vhdl net
	iki_execute_processes();

	// Schedule resolution functions for the multiply driven Verilog nets that have strength
	// Schedule transaction functions for the singly driven Verilog nets that have strength

}
#include "iki_bridge.h"
void relocate(char *);

void sensitize(char *);

void simulate(char *);

extern SYSTEMCLIB_IMP_DLLSPEC void local_register_implicit_channel(int, char*);
extern void implicit_HDL_SCinstatiate();

extern SYSTEMCLIB_IMP_DLLSPEC int xsim_argc_copy ;
extern SYSTEMCLIB_IMP_DLLSPEC char** xsim_argv_copy ;

int main(int argc, char **argv)
{
    iki_heap_initialize("ms", "isimmm", 0, 2147483648) ;
    iki_set_sv_type_file_path_name("xsim.dir/Top_tb_behav/xsim.svtype");
    iki_set_crvs_dump_file_path_name("xsim.dir/Top_tb_behav/xsim.crvsdump");
    void* design_handle = iki_create_design("xsim.dir/Top_tb_behav/xsim.mem", (void *)relocate, (void *)sensitize, (void *)simulate, 0, isimBridge_getWdbWriter(), 0, argc, argv);
     iki_set_rc_trial_count(100);
    (void) design_handle;
    return iki_simulate_design();
}
