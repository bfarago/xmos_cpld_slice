#ifndef _xcpldapp_xcpldapp_h
#define _xcpldapp_xcpldapp_h

#include <CtrlLib/CtrlLib.h>

using namespace Upp;
#include "xpin.h"

#define LAYOUTFILE <xcpldapp/xcpldapp.lay>
#include <CtrlCore/lay.h>

#define IMAGEFILE <xcpldapp/xcpldapp.iml>
#include <Draw/iml_header.h>

typedef enum{
	#define DEF(ID) slice ## ID,
	#include "conslice.def"
	#undef DEF
	NumberOfConSlice
}ConSlice_te;



typedef enum{
	XP_SKC_L2,
	XA_SK_ETH100,
	XA_SK_AUDIO,
	XA_SK_SCR480,
	XA_SK_GPIO,
	XA_SK_SDRAM,
	XA_SK_ISBUS,
	XA_SK_WIFI
}board_te;

typedef enum{
	Star, Triangle, Square, Circle, Startkit
}connector_te;

class xcpldapp : public WithxcpldappLayout<TopWindow> {
public:
	typedef xcpldapp CLASSNAME;
	xcpldapp();
	
	void Dlsboard();
	void Dlmconn();
	void Dlmboard();
	void Apins();
	void UpdatePins();
	void Bnverilog();
	
	board_te sboard;
	connector_te mconnector;
	String GetCpuPort(String pin);

};

#endif
