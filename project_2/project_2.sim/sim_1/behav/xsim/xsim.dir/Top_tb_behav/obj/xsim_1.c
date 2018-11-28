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
extern void execute_3028(char*, char *);
extern void execute_3029(char*, char *);
extern void execute_6076(char*, char *);
extern void execute_6077(char*, char *);
extern void execute_3034(char*, char *);
extern void vlog_const_rhs_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
extern void execute_3422(char*, char *);
extern void execute_3423(char*, char *);
extern void execute_3424(char*, char *);
extern void execute_3425(char*, char *);
extern void execute_3426(char*, char *);
extern void execute_3427(char*, char *);
extern void execute_4248(char*, char *);
extern void execute_4249(char*, char *);
extern void execute_4250(char*, char *);
extern void execute_4251(char*, char *);
extern void execute_4252(char*, char *);
extern void execute_4253(char*, char *);
extern void execute_4254(char*, char *);
extern void execute_5252(char*, char *);
extern void execute_5253(char*, char *);
extern void execute_5935(char*, char *);
extern void execute_5936(char*, char *);
extern void execute_6006(char*, char *);
extern void execute_6007(char*, char *);
extern void execute_6008(char*, char *);
extern void execute_6009(char*, char *);
extern void execute_6027(char*, char *);
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
extern void execute_6074(char*, char *);
extern void execute_6075(char*, char *);
extern void execute_3035(char*, char *);
extern void execute_3036(char*, char *);
extern void execute_3037(char*, char *);
extern void execute_3038(char*, char *);
extern void execute_3039(char*, char *);
extern void execute_3040(char*, char *);
extern void execute_3041(char*, char *);
extern void execute_3042(char*, char *);
extern void execute_3043(char*, char *);
extern void execute_3044(char*, char *);
extern void execute_3045(char*, char *);
extern void execute_3046(char*, char *);
extern void execute_3047(char*, char *);
extern void execute_3048(char*, char *);
extern void execute_3049(char*, char *);
extern void execute_3050(char*, char *);
extern void execute_3051(char*, char *);
extern void execute_3052(char*, char *);
extern void execute_3053(char*, char *);
extern void execute_3054(char*, char *);
extern void execute_3055(char*, char *);
extern void execute_3056(char*, char *);
extern void execute_3057(char*, char *);
extern void execute_3058(char*, char *);
extern void execute_3059(char*, char *);
extern void execute_3060(char*, char *);
extern void execute_3061(char*, char *);
extern void execute_3062(char*, char *);
extern void execute_3063(char*, char *);
extern void execute_3064(char*, char *);
extern void execute_3065(char*, char *);
extern void execute_3066(char*, char *);
extern void execute_5(char*, char *);
extern void execute_265(char*, char *);
extern void execute_266(char*, char *);
extern void execute_268(char*, char *);
extern void execute_269(char*, char *);
extern void execute_271(char*, char *);
extern void execute_3163(char*, char *);
extern void execute_3164(char*, char *);
extern void execute_3166(char*, char *);
extern void execute_3167(char*, char *);
extern void execute_3168(char*, char *);
extern void execute_3169(char*, char *);
extern void execute_275(char*, char *);
extern void execute_467(char*, char *);
extern void execute_469(char*, char *);
extern void execute_471(char*, char *);
extern void execute_472(char*, char *);
extern void execute_3428(char*, char *);
extern void execute_474(char*, char *);
extern void execute_475(char*, char *);
extern void execute_476(char*, char *);
extern void execute_608(char*, char *);
extern void execute_609(char*, char *);
extern void execute_3493(char*, char *);
extern void execute_3494(char*, char *);
extern void execute_612(char*, char *);
extern void execute_613(char*, char *);
extern void execute_3495(char*, char *);
extern void execute_3496(char*, char *);
extern void execute_3497(char*, char *);
extern void execute_682(char*, char *);
extern void execute_683(char*, char *);
extern void execute_685(char*, char *);
extern void execute_686(char*, char *);
extern void execute_4255(char*, char *);
extern void execute_4256(char*, char *);
extern void execute_4257(char*, char *);
extern void execute_4258(char*, char *);
extern void execute_4259(char*, char *);
extern void execute_1255(char*, char *);
extern void execute_1256(char*, char *);
extern void execute_4265(char*, char *);
extern void execute_1258(char*, char *);
extern void execute_4266(char*, char *);
extern void execute_4267(char*, char *);
extern void execute_1260(char*, char *);
extern void execute_1261(char*, char *);
extern void execute_4268(char*, char *);
extern void execute_4269(char*, char *);
extern void vlog_simple_process_execute_0_fast_no_reg_no_agg(char*, char*, char*);
extern void execute_4272(char*, char *);
extern void execute_4273(char*, char *);
extern void execute_4274(char*, char *);
extern void execute_1785(char*, char *);
extern void execute_1786(char*, char *);
extern void execute_2374(char*, char *);
extern void execute_2375(char*, char *);
extern void execute_2377(char*, char *);
extern void execute_2378(char*, char *);
extern void execute_2379(char*, char *);
extern void execute_3031(char*, char *);
extern void execute_3032(char*, char *);
extern void execute_3033(char*, char *);
extern void execute_6078(char*, char *);
extern void execute_6079(char*, char *);
extern void execute_6080(char*, char *);
extern void execute_6081(char*, char *);
extern void execute_6082(char*, char *);
extern void vlog_transfunc_eventcallback(char*, char*, unsigned, unsigned, unsigned, char *);
funcp funcTab[162] = {(funcp)execute_3028, (funcp)execute_3029, (funcp)execute_6076, (funcp)execute_6077, (funcp)execute_3034, (funcp)vlog_const_rhs_process_execute_0_fast_no_reg_no_agg, (funcp)execute_3422, (funcp)execute_3423, (funcp)execute_3424, (funcp)execute_3425, (funcp)execute_3426, (funcp)execute_3427, (funcp)execute_4248, (funcp)execute_4249, (funcp)execute_4250, (funcp)execute_4251, (funcp)execute_4252, (funcp)execute_4253, (funcp)execute_4254, (funcp)execute_5252, (funcp)execute_5253, (funcp)execute_5935, (funcp)execute_5936, (funcp)execute_6006, (funcp)execute_6007, (funcp)execute_6008, (funcp)execute_6009, (funcp)execute_6027, (funcp)execute_6043, (funcp)execute_6044, (funcp)execute_6045, (funcp)execute_6046, (funcp)execute_6047, (funcp)execute_6048, (funcp)execute_6049, (funcp)execute_6050, (funcp)execute_6051, (funcp)execute_6052, (funcp)execute_6053, (funcp)execute_6054, (funcp)execute_6055, (funcp)execute_6056, (funcp)execute_6057, (funcp)execute_6058, (funcp)execute_6059, (funcp)execute_6060, (funcp)execute_6061, (funcp)execute_6062, (funcp)execute_6063, (funcp)execute_6064, (funcp)execute_6065, (funcp)execute_6066, (funcp)execute_6067, (funcp)execute_6068, (funcp)execute_6069, (funcp)execute_6070, (funcp)execute_6071, (funcp)execute_6072, (funcp)execute_6073, (funcp)execute_6074, (funcp)execute_6075, (funcp)execute_3035, (funcp)execute_3036, (funcp)execute_3037, (funcp)execute_3038, (funcp)execute_3039, (funcp)execute_3040, (funcp)execute_3041, (funcp)execute_3042, (funcp)execute_3043, (funcp)execute_3044, (funcp)execute_3045, (funcp)execute_3046, (funcp)execute_3047, (funcp)execute_3048, (funcp)execute_3049, (funcp)execute_3050, (funcp)execute_3051, (funcp)execute_3052, (funcp)execute_3053, (funcp)execute_3054, (funcp)execute_3055, (funcp)execute_3056, (funcp)execute_3057, (funcp)execute_3058, (funcp)execute_3059, (funcp)execute_3060, (funcp)execute_3061, (funcp)execute_3062, (funcp)execute_3063, (funcp)execute_3064, (funcp)execute_3065, (funcp)execute_3066, (funcp)execute_5, (funcp)execute_265, (funcp)execute_266, (funcp)execute_268, (funcp)execute_269, (funcp)execute_271, (funcp)execute_3163, (funcp)execute_3164, (funcp)execute_3166, (funcp)execute_3167, (funcp)execute_3168, (funcp)execute_3169, (funcp)execute_275, (funcp)execute_467, (funcp)execute_469, (funcp)execute_471, (funcp)execute_472, (funcp)execute_3428, (funcp)execute_474, (funcp)execute_475, (funcp)execute_476, (funcp)execute_608, (funcp)execute_609, (funcp)execute_3493, (funcp)execute_3494, (funcp)execute_612, (funcp)execute_613, (funcp)execute_3495, (funcp)execute_3496, (funcp)execute_3497, (funcp)execute_682, (funcp)execute_683, (funcp)execute_685, (funcp)execute_686, (funcp)execute_4255, (funcp)execute_4256, (funcp)execute_4257, (funcp)execute_4258, (funcp)execute_4259, (funcp)execute_1255, (funcp)execute_1256, (funcp)execute_4265, (funcp)execute_1258, (funcp)execute_4266, (funcp)execute_4267, (funcp)execute_1260, (funcp)execute_1261, (funcp)execute_4268, (funcp)execute_4269, (funcp)vlog_simple_process_execute_0_fast_no_reg_no_agg, (funcp)execute_4272, (funcp)execute_4273, (funcp)execute_4274, (funcp)execute_1785, (funcp)execute_1786, (funcp)execute_2374, (funcp)execute_2375, (funcp)execute_2377, (funcp)execute_2378, (funcp)execute_2379, (funcp)execute_3031, (funcp)execute_3032, (funcp)execute_3033, (funcp)execute_6078, (funcp)execute_6079, (funcp)execute_6080, (funcp)execute_6081, (funcp)execute_6082, (funcp)vlog_transfunc_eventcallback};
const int NumRelocateId= 162;

void relocate(char *dp)
{
	iki_relocate(dp, "xsim.dir/Top_tb_behav/xsim.reloc",  (void **)funcTab, 162);

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
