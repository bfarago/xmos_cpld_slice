#ifndef _xcpldapp_xcpldapp_h
#define _xcpldapp_xcpldapp_h

#include <CtrlLib/CtrlLib.h>

using namespace Upp;

#define LAYOUTFILE <xcpldapp/xcpldapp.lay>
#include <CtrlCore/lay.h>

#define IMAGEFILE <xcpldapp/xcpldapp.iml>
#include <Draw/iml_header.h>

typedef enum{
	XP_SKC_L2,
	XA_SK_E100,
	XA_SK_AUDIO,
	XA_SK_SCR480,
	XA_SK_GPIO,
	XA_SK_SDRAM
}board_te;

typedef enum{
	Star, Triangle, Square, Circle
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
