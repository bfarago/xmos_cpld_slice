#include "xcpldapp.h"

#define IMAGEFILE <xcpldapp/xcpldapp.iml>
#include <Draw/iml_source.h>



xcpldapp::xcpldapp()
{
	CtrlLayout(*this, "Window title");
	dlMBoard.Add("XP-SKC-L2");
	dlSBoard.Add("XP-SKC-L2");
	dlSBoard.Add("XA-SK-E100");
	dlSBoard.Add("XA-SK-AUDIO");
	dlSBoard.Add("XA-SK-SCR480");
	dlSBoard.Add("XA-SK-GPIO");
	dlSBoard.Add("XA-SK-SDRAM");
	dlMConn.Add("Star").Add("Triangle").Add("Square").Add("Circle");
	dlMBoard.WhenAction= THISBACK(Dlmboard);
	dlSBoard.WhenAction= THISBACK(Dlsboard);
	dlMConn.WhenAction= THISBACK(Dlmconn);
	aPins.WhenAction=THISBACK(Apins);
}
void xcpldapp::Dlsboard(){
	//do nothing right now
	sboard= (board_te)dlSBoard.GetIndex();
	UpdatePins();
}
void xcpldapp::Dlmconn(){
	mconnector = (connector_te)dlMConn.GetIndex();
	UpdatePins();
}
void xcpldapp::Dlmboard(){
	UpdatePins();
}
void xcpldapp::Apins(){
	//
}
String xcpldapp::GetCpuPort(String pin){
	#define DEF(conid, pins, pinm) if (conid==mconnector) if (pins == pin) return pinm;
	#include "conpins.def"
	#undef DEF
	return "-";
}
void xcpldapp::UpdatePins(){
	aPins.Reset();
	aPins.AddColumn("Nr");
	aPins.AddColumn("Function");
	aPins.AddColumn("Pin");
	aPins.AddColumn("Description");
	aPins.AddColumn("Direction");
	aPins.AddColumn("Port");
	aPins.AllSorting();
	int nr=0;
	#define DEF(bid, fn, pin, desc, dir) if (sboard==bid){ aPins.Add(nr, fn, pin, desc, dir, GetCpuPort(pin)); nr++;};
	#include "board.def"
	#undef DEF
}
GUI_APP_MAIN
{
	xcpldapp().Run();
}
