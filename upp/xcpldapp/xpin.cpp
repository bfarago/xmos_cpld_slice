#include "xcpldapp.h"


int g_InstNr;
Wire::Wire()
:iVal(0)
{
}

Wire::Wire(const String& s, WireType wt)
:name(s), bus(NULL), index(0), wtype(wt)
{}

String Wire::VerilogType(){
	String s;
	switch (wtype){
		case tInput: s+="input"; break;
		case tOutput: s+="ouput"; break;
		case tInOut:
		case tDynamic:
		case tTri:	s+="inout"; break;
		case tReg:	s+="reg"; break;
		case tWire: s+="wire"; break;
	}
	return s;
}

String Wire::VerilogDecl()
{
	String s;
	s=VerilogType();
	s<<name;
	s<<";\n";
	return s;
}

String Wire::VerilogID(){
	String s;
	s<<name;
	if(bus){
		s<<Sprintf("[%i]", index);
	}
	return s;
}

void Wire::Memberof(Bus* b, int n, WireType wt)
{
	bus=b; index=n; wtype=wt;
	if (b) name=b->VerilogID();
}

String Wire::GetValue(){
	switch(iVal){
		case 0: return "0";
		case 1: return "1";
		case 3: return "Z"; //tristate
	}
	return "X"; //dont care
}

String Bus::GetValue(){
	String s;
	s<<m.GetCount();
	s<<"'b";
	for(int i=m.GetCount()-1; i; i--){
		s<<m[i].GetValue();
	}
	return s;
}

void Bus::SetCount(int n){
	m.SetCount(n);
	for (int i=0;i<n; i++){
		Wire &w=m[i];
		w.Memberof(this, i, wtype);
	}
}

Wire& Bus::operator[](int index){
	return m[index];
}

String Bus::VerilogBusSize(){
	String s;
	if (bussize.IsEmpty())	s<<m.GetCount();
	else s=bussize;
	return s;
}

String Bus::VerilogDecl()
{
	String s;
	s=VerilogType();
	s<<" ["<<VerilogBusSize()<<"-1:0]";
	s<<" ";
	s<<name;
	s<<";\n";
	return s;
}

String XPin::VerilogInstName()const{
	String s="inst";
	s<<instNr;
	return s;
}

XPin::XPin()
:instNr(0)
{
	wOE=NULL;
	wI=NULL;
	wO=NULL;
	wIO=NULL;
}

String XPin::VerilogDefParam(const String& var, const String& value)
{
	return "defparam "+VerilogInstName()+"."+var+" = \""+value+"\";\n";
}

String XPin::VerilogInstance()
{
	String s;
	String location;
	if (!instNr){
		instNr=g_InstNr++;
	}
	
	//canonical thing
	s="ALT_IOBUF ";
	s+=VerilogInstName();
	if (wI) sI=wI->VerilogID();
	if (wO) sO=wO->VerilogID();
	if (wOE) sOE= wOE->VerilogID();
	if (wIO) sPad=wIO->VerilogID();
	
	s+=" (.i("<< sI <<"), .oe("<<sOE<<"), .o("<<sO<<"),.io("<<sPad<<"));\n";
	
	//params
	s<<VerilogDefParam("weak_pull_up_resistor", "off");
	s<<VerilogDefParam("io_standard", "3.3-V LVTTL"); // "3.3-V PCI" "3.3-V LVTTL" "1.2V" "1.5V"  "1.8V"
	s<<VerilogDefParam("slow_slew_rate", "off");
	s<<VerilogDefParam("current_strength", "maximum current"); //minimum current
	if (!sLocation.IsEmpty()) s<<VerilogDefParam("location", location); //IOBANK_1
	s<<VerilogDefParam("enable_bus_hold", "on"); //off
	s<<VerilogDefParam("termination", "series 50 ohms");
	s<<VerilogDefParam("enable_bus_hold", "on"); //off
	
	//easy
	s<<"wire Direct"+sPad+" = (1'b0 == d"+sPad+")?1'b0:1'bz;\n";
	s<<"\n";
	
	//TODO: check OPNDRN and TRI primitives too.
	//set_instance_assignment -name AUTO_OPEN_DRAIN_PINS ON -to XXXXX
	
	return s;
}
/*
String XPin::Qsf()
{
	return Sprintf("set_location_assignment PIN_%i -to %s", pin, sPad);
}
*/