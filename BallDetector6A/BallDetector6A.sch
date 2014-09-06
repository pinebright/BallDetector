<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="6.5.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="yes" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="1" fill="3" visible="no" active="no"/>
<layer number="3" name="Route3" color="4" fill="3" visible="no" active="no"/>
<layer number="14" name="Route14" color="1" fill="6" visible="no" active="no"/>
<layer number="15" name="Route15" color="4" fill="6" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="50" name="dxf" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="56" name="wert" color="7" fill="1" visible="no" active="no"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="101" name="Hidden" color="15" fill="1" visible="yes" active="yes"/>
<layer number="102" name="Changes" color="12" fill="1" visible="yes" active="yes"/>
<layer number="105" name="Beschreib" color="9" fill="1" visible="no" active="no"/>
<layer number="106" name="BGA-Top" color="4" fill="1" visible="no" active="no"/>
<layer number="107" name="BD-Top" color="5" fill="1" visible="no" active="no"/>
<layer number="151" name="HeatSink" color="14" fill="1" visible="no" active="no"/>
<layer number="200" name="200bmp" color="1" fill="10" visible="no" active="no"/>
<layer number="201" name="201bmp" color="2" fill="1" visible="no" active="no"/>
<layer number="250" name="Descript" color="3" fill="1" visible="no" active="no"/>
<layer number="251" name="SMDround" color="12" fill="11" visible="no" active="no"/>
<layer number="254" name="OrgLBR" color="13" fill="1" visible="no" active="no"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="supply1">
<description>Supply Symbols</description>
<packages>
</packages>
<symbols>
<symbol name="GND">
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<text x="0" y="-0.762" size="1.778" layer="96" font="vector" align="top-center">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
<symbol name="+5V">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" font="vector" rot="R90">&gt;VALUE</text>
<pin name="+5V" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="+3V3">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" font="vector" rot="R90">&gt;VALUE</text>
<pin name="+3V3" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="+3V3/2">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-5.08" size="1.778" layer="96" font="vector" rot="R90">&gt;VALUE</text>
<pin name="+3V3/2" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="GND/2">
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<text x="0" y="-0.762" size="1.778" layer="96" font="vector" align="top-center">&gt;VALUE</text>
<pin name="GND/2" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="GND" prefix="GND">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="+5V" prefix="+P">
<gates>
<gate name="1" symbol="+5V" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="+3V3" prefix="+P">
<gates>
<gate name="1" symbol="+3V3" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="+3V3/2" prefix="+P">
<gates>
<gate name="1" symbol="+3V3/2" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="GND/2" prefix="GND">
<gates>
<gate name="G$1" symbol="GND/2" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="con-Molex">
<packages>
<package name="53398-04">
<text x="-3" y="2" size="1" layer="25" font="vector" ratio="15">&gt;NAME</text>
<text x="-3" y="0.5" size="1" layer="27" font="vector" ratio="15">&gt;VALUE</text>
<wire x1="3.375" y1="-0.5" x2="2.35" y2="-0.5" width="0.127" layer="21"/>
<wire x1="2.35" y1="-0.5" x2="1.4" y2="-0.5" width="0.127" layer="51"/>
<wire x1="1.4" y1="-0.5" x2="1.1" y2="-0.5" width="0.127" layer="21"/>
<wire x1="1.1" y1="-0.5" x2="0.15" y2="-0.5" width="0.127" layer="51"/>
<wire x1="0.15" y1="-0.5" x2="-0.15" y2="-0.5" width="0.127" layer="21"/>
<wire x1="-0.15" y1="-0.5" x2="-1.1" y2="-0.5" width="0.127" layer="51"/>
<wire x1="-1.1" y1="-0.5" x2="-1.4" y2="-0.5" width="0.127" layer="21"/>
<wire x1="-1.4" y1="-0.5" x2="-2.35" y2="-0.5" width="0.127" layer="51"/>
<wire x1="-2.35" y1="-0.5" x2="-3.375" y2="-0.5" width="0.127" layer="21"/>
<wire x1="3.375" y1="3.2" x2="-3.375" y2="3.2" width="0.127" layer="21"/>
<wire x1="3.375" y1="3.2" x2="3.375" y2="-0.5" width="0.127" layer="21"/>
<wire x1="-3.375" y1="-0.5" x2="-3.375" y2="3.2" width="0.127" layer="21"/>
<wire x1="-3.375" y1="3.2" x2="-4.875" y2="3.2" width="0.127" layer="51"/>
<wire x1="-4.875" y1="3.2" x2="-4.875" y2="0.4" width="0.127" layer="51"/>
<wire x1="-4.875" y1="0.4" x2="-3.375" y2="0.4" width="0.127" layer="51"/>
<wire x1="3.375" y1="0.4" x2="4.875" y2="0.4" width="0.127" layer="51"/>
<wire x1="4.875" y1="0.4" x2="4.875" y2="3.2" width="0.127" layer="51"/>
<wire x1="4.875" y1="3.2" x2="3.375" y2="3.2" width="0.127" layer="51"/>
<rectangle x1="-5.075" y1="1" x2="-4.875" y2="3.2" layer="51" rot="R180"/>
<rectangle x1="4.875" y1="1" x2="5.075" y2="3.2" layer="51" rot="R180"/>
<smd name="S1" x="4.6" y="2.1" dx="2" dy="3" layer="1" rot="R180"/>
<smd name="S2" x="-4.6" y="2.1" dx="2" dy="3" layer="1" rot="R180"/>
<smd name="1" x="1.875" y="-0.9" dx="0.6" dy="1.2" layer="1" rot="R180"/>
<smd name="2" x="0.625" y="-0.9" dx="0.6" dy="1.2" layer="1" rot="R180"/>
<smd name="3" x="-0.625" y="-0.9" dx="0.6" dy="1.2" layer="1" rot="R180"/>
<smd name="4" x="-1.875" y="-0.9" dx="0.6" dy="1.2" layer="1" rot="R180"/>
<rectangle x1="-2.035" y1="-1" x2="-1.715" y2="-0.5" layer="51"/>
<rectangle x1="-0.785" y1="-1" x2="-0.465" y2="-0.5" layer="51"/>
<rectangle x1="0.465" y1="-1" x2="0.785" y2="-0.5" layer="51"/>
<rectangle x1="1.715" y1="-1" x2="2.035" y2="-0.5" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="PIN1X4-S2">
<wire x1="-1.27" y1="-7.62" x2="3.81" y2="-7.62" width="0.4064" layer="94"/>
<wire x1="3.81" y1="-7.62" x2="3.81" y2="5.08" width="0.4064" layer="94"/>
<wire x1="3.81" y1="5.08" x2="-1.27" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-1.27" y1="5.08" x2="-1.27" y2="-7.62" width="0.4064" layer="94"/>
<text x="-1.27" y="8.128" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-1.27" y="5.588" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="1" x="-2.54" y="2.54" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="0" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="3" x="-2.54" y="-2.54" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="4" x="-2.54" y="-5.08" visible="pad" length="middle" direction="pas" function="dot"/>
<pin name="S1" x="0" y="-10.16" visible="off" length="short" direction="pas" rot="R90"/>
<pin name="S2" x="2.54" y="-10.16" visible="off" length="short" direction="pas" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="53398-0471" prefix="CN" uservalue="yes">
<gates>
<gate name="G$1" symbol="PIN1X4-S2" x="0" y="0"/>
</gates>
<devices>
<device name="" package="53398-04">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="S1" pad="S1"/>
<connect gate="G$1" pin="S2" pad="S2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ic-ams">
<description>austriamicrosystems</description>
<packages>
<package name="TSL1401CL">
<smd name="1" x="-3.45" y="-1.1" dx="1.4" dy="1.4" layer="1"/>
<text x="-6" y="-2" size="1" layer="25" font="vector" ratio="15" rot="R90">&gt;NAME</text>
<text x="-5" y="-2" size="1" layer="27" font="vector" ratio="15" rot="R90">&gt;VALUE</text>
<rectangle x1="-4.15" y1="-1.4" x2="-3.35" y2="-0.4" layer="51"/>
<wire x1="-4.7" y1="1.5" x2="-4.7" y2="-1.5" width="0.127" layer="21"/>
<wire x1="4.7" y1="1.5" x2="4.7" y2="-1.5" width="0.127" layer="21"/>
<wire x1="-4.7" y1="-1.5" x2="-4.35" y2="-1.5" width="0.127" layer="21"/>
<wire x1="-4.35" y1="-1.5" x2="-2.55" y2="-1.5" width="0.127" layer="51"/>
<wire x1="-2.55" y1="-1.5" x2="-1.85" y2="-1.5" width="0.127" layer="21"/>
<wire x1="-1.85" y1="-1.5" x2="-0.65" y2="-1.5" width="0.127" layer="51"/>
<wire x1="-0.65" y1="-1.5" x2="0.65" y2="-1.5" width="0.127" layer="21"/>
<wire x1="0.65" y1="-1.5" x2="1.85" y2="-1.5" width="0.127" layer="51"/>
<wire x1="1.85" y1="-1.5" x2="3.15" y2="-1.5" width="0.127" layer="21"/>
<wire x1="3.15" y1="-1.5" x2="4.35" y2="-1.5" width="0.127" layer="51"/>
<wire x1="4.35" y1="-1.5" x2="4.7" y2="-1.5" width="0.127" layer="21"/>
<wire x1="4.7" y1="1.5" x2="4.35" y2="1.5" width="0.127" layer="21"/>
<wire x1="4.35" y1="1.5" x2="3.15" y2="1.5" width="0.127" layer="51"/>
<wire x1="3.15" y1="1.5" x2="1.85" y2="1.5" width="0.127" layer="21"/>
<wire x1="1.85" y1="1.5" x2="0.65" y2="1.5" width="0.127" layer="51"/>
<wire x1="0.65" y1="1.5" x2="-0.65" y2="1.5" width="0.127" layer="21"/>
<wire x1="-0.65" y1="1.5" x2="-1.85" y2="1.5" width="0.127" layer="51"/>
<wire x1="-1.85" y1="1.5" x2="-3.15" y2="1.5" width="0.127" layer="21"/>
<wire x1="-3.15" y1="1.5" x2="-4.35" y2="1.5" width="0.127" layer="51"/>
<wire x1="-4.35" y1="1.5" x2="-4.7" y2="1.5" width="0.127" layer="21"/>
<smd name="2" x="-1.25" y="-1.1" dx="0.8" dy="1.4" layer="1"/>
<smd name="3" x="1.25" y="-1.1" dx="0.8" dy="1.4" layer="1"/>
<smd name="4" x="3.75" y="-1.1" dx="0.8" dy="1.4" layer="1"/>
<rectangle x1="-1.65" y1="-1.4" x2="-0.85" y2="-0.4" layer="51"/>
<rectangle x1="0.85" y1="-1.4" x2="1.65" y2="-0.4" layer="51"/>
<rectangle x1="3.35" y1="-1.4" x2="4.15" y2="-0.4" layer="51"/>
<smd name="5" x="3.75" y="1.1" dx="0.8" dy="1.4" layer="1" rot="R180"/>
<smd name="6" x="1.25" y="1.1" dx="0.8" dy="1.4" layer="1" rot="R180"/>
<smd name="7" x="-1.25" y="1.1" dx="0.8" dy="1.4" layer="1" rot="R180"/>
<smd name="8" x="-3.75" y="1.1" dx="0.8" dy="1.4" layer="1" rot="R180"/>
<rectangle x1="3.35" y1="0.4" x2="4.15" y2="1.4" layer="51" rot="R180"/>
<rectangle x1="0.85" y1="0.4" x2="1.65" y2="1.4" layer="51" rot="R180"/>
<rectangle x1="-1.65" y1="0.4" x2="-0.85" y2="1.4" layer="51" rot="R180"/>
<rectangle x1="-4.15" y1="0.4" x2="-3.35" y2="1.4" layer="51" rot="R180"/>
<wire x1="-4.032" y1="0.305" x2="4.032" y2="0.305" width="0.127" layer="51"/>
</package>
<package name="TSL1401CL-RIGHT5">
<smd name="1" x="-3.75" y="-2" dx="0.8" dy="0.8" layer="1"/>
<text x="-4" y="2.5" size="1" layer="25" font="vector" ratio="15">&gt;NAME</text>
<text x="-4" y="1.5" size="1" layer="27" font="vector" ratio="15">&gt;VALUE</text>
<wire x1="-4.7" y1="1.2" x2="-4.7" y2="0" width="0.127" layer="21"/>
<wire x1="4.7" y1="1.2" x2="4.7" y2="0" width="0.127" layer="21"/>
<wire x1="-4.7" y1="0" x2="-4.35" y2="0" width="0.127" layer="21"/>
<wire x1="-4.35" y1="0" x2="-3.15" y2="0" width="0.127" layer="51"/>
<wire x1="-3.15" y1="0" x2="-1.85" y2="0" width="0.127" layer="21"/>
<wire x1="-1.85" y1="0" x2="-0.65" y2="0" width="0.127" layer="51"/>
<wire x1="-0.65" y1="0" x2="0.65" y2="0" width="0.127" layer="21"/>
<wire x1="0.65" y1="0" x2="1.85" y2="0" width="0.127" layer="51"/>
<wire x1="1.85" y1="0" x2="3.15" y2="0" width="0.127" layer="21"/>
<wire x1="3.15" y1="0" x2="4.35" y2="0" width="0.127" layer="51"/>
<wire x1="4.35" y1="0" x2="4.7" y2="0" width="0.127" layer="21"/>
<wire x1="4.7" y1="1.2" x2="-4.7" y2="1.2" width="0.127" layer="21"/>
<smd name="2" x="-1.25" y="-2" dx="0.8" dy="0.8" layer="1"/>
<smd name="3" x="1.25" y="-2" dx="0.8" dy="0.8" layer="1"/>
<smd name="4" x="3.75" y="-2" dx="0.8" dy="0.8" layer="1"/>
<smd name="6" x="1.25" y="-0.5" dx="0.8" dy="1" layer="1" rot="R180"/>
<smd name="7" x="-1.25" y="-0.5" dx="0.8" dy="1" layer="1" rot="R180"/>
<rectangle x1="-3.8" y1="-2" x2="-3.7" y2="0" layer="51"/>
<rectangle x1="-1.3" y1="-2" x2="-1.2" y2="0" layer="51"/>
<rectangle x1="1.2" y1="-2" x2="1.3" y2="0" layer="51"/>
<rectangle x1="3.7" y1="-2" x2="3.8" y2="0" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="TSL1401CL">
<text x="-7.62" y="10.668" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-7.62" y="-10.16" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<wire x1="-7.62" y1="10.16" x2="-7.62" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-7.62" x2="7.62" y2="-7.62" width="0.254" layer="94"/>
<wire x1="7.62" y1="-7.62" x2="7.62" y2="10.16" width="0.254" layer="94"/>
<wire x1="7.62" y1="10.16" x2="-7.62" y2="10.16" width="0.254" layer="94"/>
<pin name="VDD" x="-10.16" y="7.62" length="short"/>
<pin name="CLK" x="10.16" y="7.62" length="short" rot="R180"/>
<pin name="SI" x="10.16" y="2.54" length="short" rot="R180"/>
<pin name="AO" x="10.16" y="-5.08" length="short" rot="R180"/>
<pin name="GND" x="-10.16" y="-5.08" length="short"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="TSL1401CL" prefix="U">
<gates>
<gate name="G$1" symbol="TSL1401CL" x="0" y="0"/>
</gates>
<devices>
<device name="" package="TSL1401CL">
<connects>
<connect gate="G$1" pin="AO" pad="3"/>
<connect gate="G$1" pin="CLK" pad="2"/>
<connect gate="G$1" pin="GND" pad="6 7"/>
<connect gate="G$1" pin="SI" pad="1"/>
<connect gate="G$1" pin="VDD" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-RIGHT5" package="TSL1401CL-RIGHT5">
<connects>
<connect gate="G$1" pin="AO" pad="3"/>
<connect gate="G$1" pin="CLK" pad="2"/>
<connect gate="G$1" pin="GND" pad="6 7"/>
<connect gate="G$1" pin="SI" pad="1"/>
<connect gate="G$1" pin="VDD" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="Passive">
<description>Register, Capacitor, Inductor</description>
<packages>
<package name="1608">
<wire x1="1.35" y1="0.6" x2="1.35" y2="-0.6" width="0.127" layer="21"/>
<wire x1="-1.35" y1="-0.6" x2="-1.35" y2="0.6" width="0.127" layer="21"/>
<wire x1="-1.35" y1="0.6" x2="1.35" y2="0.6" width="0.127" layer="21"/>
<wire x1="1.35" y1="-0.6" x2="-1.35" y2="-0.6" width="0.127" layer="21"/>
<smd name="1" x="-0.75" y="0" dx="0.7" dy="0.8" layer="1"/>
<smd name="2" x="0.75" y="0" dx="0.7" dy="0.8" layer="1"/>
<text x="-1.4" y="0.8" size="0.8" layer="25" font="vector" ratio="18">&gt;NAME</text>
<text x="-1.4" y="-1.6" size="0.8" layer="27" font="vector" ratio="18">&gt;VALUE</text>
<rectangle x1="-0.8" y1="-0.4" x2="-0.4" y2="0.4" layer="51"/>
<rectangle x1="0.4" y1="-0.4" x2="0.8" y2="0.4" layer="51"/>
<rectangle x1="-0.4" y1="0.25" x2="0.4" y2="0.4" layer="51"/>
<rectangle x1="-0.4" y1="-0.4" x2="0.4" y2="-0.25" layer="51"/>
</package>
<package name="2012">
<wire x1="-1.7" y1="0.85" x2="1.7" y2="0.85" width="0.127" layer="21"/>
<wire x1="1.7" y1="0.85" x2="1.7" y2="-0.85" width="0.127" layer="21"/>
<wire x1="1.7" y1="-0.85" x2="-1.7" y2="-0.85" width="0.127" layer="21"/>
<wire x1="-1.7" y1="-0.85" x2="-1.7" y2="0.85" width="0.127" layer="21"/>
<smd name="1" x="-1.125" y="0" dx="0.75" dy="1.25" layer="1"/>
<smd name="2" x="1.125" y="0" dx="0.75" dy="1.25" layer="1"/>
<text x="-1.7" y="1" size="0.8" layer="25" font="vector" ratio="18">&gt;NAME</text>
<text x="-1.7" y="-1.8" size="0.8" layer="27" font="vector" ratio="18">&gt;VALUE</text>
<rectangle x1="-1" y1="-0.625" x2="-0.75" y2="0.625" layer="51"/>
<rectangle x1="0.75" y1="-0.625" x2="1" y2="0.625" layer="51"/>
<rectangle x1="-0.75" y1="0.475" x2="0.75" y2="0.625" layer="51"/>
<rectangle x1="-0.75" y1="-0.625" x2="0.75" y2="-0.475" layer="51"/>
</package>
<package name="3216">
<wire x1="2.35" y1="1" x2="2.35" y2="-1" width="0.127" layer="21"/>
<wire x1="2.35" y1="-1" x2="-2.35" y2="-1" width="0.127" layer="21"/>
<wire x1="-2.35" y1="-1" x2="-2.35" y2="1" width="0.127" layer="21"/>
<wire x1="-2.35" y1="1" x2="2.35" y2="1" width="0.127" layer="21"/>
<smd name="1" x="-1.625" y="0" dx="1.05" dy="1.6" layer="1"/>
<smd name="2" x="1.625" y="0" dx="1.05" dy="1.6" layer="1"/>
<text x="-2.4" y="1.2" size="0.8" layer="25" font="vector" ratio="18">&gt;NAME</text>
<text x="-2.4" y="-2" size="0.8" layer="27" font="vector" ratio="18">&gt;VALUE</text>
<rectangle x1="-1.7" y1="-0.8" x2="-1.1" y2="0.8" layer="51"/>
<rectangle x1="1.1" y1="-0.8" x2="1.7" y2="0.8" layer="51"/>
<rectangle x1="-1.1" y1="0.6" x2="1.1" y2="0.8" layer="51"/>
<rectangle x1="-1.1" y1="-0.8" x2="1.1" y2="-0.6" layer="51"/>
</package>
<package name="6432">
<smd name="1" x="-3.2" y="0" dx="1.2" dy="3.2" layer="1"/>
<smd name="2" x="3.2" y="0" dx="1.2" dy="3.2" layer="1"/>
<text x="-3.4" y="1.9" size="0.8" layer="25" font="vector" ratio="18">&gt;NAME</text>
<text x="-3.4" y="-2.6" size="0.8" layer="27" font="vector" ratio="18">&gt;VALUE</text>
<rectangle x1="-3.4" y1="-1.6" x2="-2.6" y2="1.6" layer="51"/>
<rectangle x1="2.6" y1="-1.6" x2="3.4" y2="1.6" layer="51"/>
<rectangle x1="-2.6" y1="1.4" x2="2.6" y2="1.6" layer="51"/>
<rectangle x1="-2.6" y1="-1.6" x2="2.6" y2="-1.4" layer="51"/>
</package>
<package name="1005">
<wire x1="-1.05" y1="0.45" x2="1.05" y2="0.45" width="0.127" layer="21"/>
<wire x1="1.05" y1="0.45" x2="1.05" y2="-0.45" width="0.127" layer="21"/>
<wire x1="1.05" y1="-0.45" x2="-1.05" y2="-0.45" width="0.127" layer="21"/>
<wire x1="-1.05" y1="-0.45" x2="-1.05" y2="0.45" width="0.127" layer="21"/>
<smd name="1" x="-0.55" y="0" dx="0.5" dy="0.5" layer="1"/>
<smd name="2" x="0.55" y="0" dx="0.5" dy="0.5" layer="1"/>
<text x="-1.1" y="0.65" size="0.8" layer="25" font="vector" ratio="18">&gt;NAME</text>
<text x="-1.1" y="-1.4" size="0.8" layer="27" font="vector" ratio="18">&gt;VALUE</text>
<rectangle x1="-0.5" y1="-0.25" x2="-0.25" y2="0.25" layer="51"/>
<rectangle x1="0.25" y1="-0.25" x2="0.5" y2="0.25" layer="51"/>
<rectangle x1="-0.25" y1="0.15" x2="0.25" y2="0.25" layer="51"/>
<rectangle x1="-0.25" y1="-0.25" x2="0.25" y2="-0.15" layer="51"/>
</package>
<package name="0603">
<wire x1="-0.7" y1="0.35" x2="0.7" y2="0.35" width="0.127" layer="21"/>
<wire x1="0.7" y1="0.35" x2="0.7" y2="-0.35" width="0.127" layer="21"/>
<wire x1="0.7" y1="-0.35" x2="-0.7" y2="-0.35" width="0.127" layer="21"/>
<wire x1="-0.7" y1="-0.35" x2="-0.7" y2="0.35" width="0.127" layer="21"/>
<smd name="1" x="-0.3" y="0" dx="0.4" dy="0.3" layer="1"/>
<smd name="2" x="0.3" y="0" dx="0.4" dy="0.3" layer="1"/>
<text x="-1.1" y="0.65" size="0.8" layer="25" font="vector" ratio="18">&gt;NAME</text>
<text x="-1.1" y="-1.4" size="0.8" layer="27" font="vector" ratio="18">&gt;VALUE</text>
<rectangle x1="-0.3" y1="-0.15" x2="-0.1" y2="0.15" layer="51"/>
<rectangle x1="0.1" y1="-0.15" x2="0.3" y2="0.15" layer="51"/>
<rectangle x1="-0.25" y1="0.1" x2="0.25" y2="0.15" layer="51"/>
<rectangle x1="-0.25" y1="-0.15" x2="0.25" y2="-0.1" layer="51"/>
</package>
<package name="3225">
<wire x1="2.35" y1="1.45" x2="2.35" y2="-1.45" width="0.127" layer="21"/>
<wire x1="2.35" y1="-1.45" x2="-2.35" y2="-1.45" width="0.127" layer="21"/>
<wire x1="-2.35" y1="-1.45" x2="-2.35" y2="1.45" width="0.127" layer="21"/>
<wire x1="-2.35" y1="1.45" x2="2.35" y2="1.45" width="0.127" layer="21"/>
<smd name="1" x="-1.625" y="0" dx="1.05" dy="2.5" layer="1"/>
<smd name="2" x="1.625" y="0" dx="1.05" dy="2.5" layer="1"/>
<text x="-2.4" y="1.6" size="0.8" layer="25" font="vector" ratio="18">&gt;NAME</text>
<text x="-2.4" y="-2.4" size="0.8" layer="27" font="vector" ratio="18">&gt;VALUE</text>
<rectangle x1="-1.7" y1="-1.25" x2="-1.1" y2="1.25" layer="51"/>
<rectangle x1="1.1" y1="-1.25" x2="1.7" y2="1.25" layer="51"/>
<rectangle x1="-1.1" y1="1.05" x2="1.1" y2="1.25" layer="51"/>
<rectangle x1="-1.1" y1="-1.25" x2="1.1" y2="-1.05" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="RESISTOR">
<wire x1="-2.54" y1="0" x2="-2.159" y2="1.016" width="0.2032" layer="94"/>
<wire x1="-2.159" y1="1.016" x2="-1.524" y2="-1.016" width="0.2032" layer="94"/>
<wire x1="-1.524" y1="-1.016" x2="-0.889" y2="1.016" width="0.2032" layer="94"/>
<wire x1="-0.889" y1="1.016" x2="-0.254" y2="-1.016" width="0.2032" layer="94"/>
<wire x1="-0.254" y1="-1.016" x2="0" y2="0" width="0.2032" layer="94"/>
<text x="-5.08" y="1.4986" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-5.08" y="-3.302" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="2" x="2.54" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
<pin name="1" x="-5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
</symbol>
<symbol name="CAPACITOR">
<wire x1="0" y1="2.54" x2="0" y2="2.032" width="0.1524" layer="94"/>
<wire x1="0" y1="0" x2="0" y2="0.508" width="0.1524" layer="94"/>
<text x="1.524" y="2.921" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="1.524" y="-2.159" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<rectangle x1="-2.032" y1="0.508" x2="2.032" y2="1.016" layer="94"/>
<rectangle x1="-2.032" y1="1.524" x2="2.032" y2="2.032" layer="94"/>
<pin name="1" x="0" y="5.08" visible="off" length="short" direction="pas" swaplevel="1" rot="R270"/>
<pin name="2" x="0" y="-2.54" visible="off" length="short" direction="pas" swaplevel="1" rot="R90"/>
</symbol>
<symbol name="FERRITE-BEADS">
<wire x1="-2.54" y1="0" x2="-1.27" y2="1.27" width="0.254" layer="94" curve="-90"/>
<wire x1="0" y1="0" x2="-1.27" y2="1.27" width="0.254" layer="94" curve="90"/>
<wire x1="0" y1="0" x2="1.27" y2="1.27" width="0.254" layer="94" curve="-90"/>
<wire x1="2.54" y1="0" x2="1.27" y2="1.27" width="0.254" layer="94" curve="90"/>
<text x="-2.54" y="2.794" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-2.54" y="-2.54" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="2" x="5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
<pin name="1" x="-5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
<wire x1="-2.54" y1="1.778" x2="2.54" y2="1.778" width="0.2032" layer="94"/>
<wire x1="-2.54" y1="2.286" x2="2.54" y2="2.286" width="0.2032" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="R" prefix="R" uservalue="yes">
<gates>
<gate name="G$1" symbol="RESISTOR" x="0" y="0"/>
</gates>
<devices>
<device name="1608" package="1608">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="2012" package="2012">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3216" package="3216">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="6432" package="6432">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="1005" package="1005">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0603" package="0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="C" prefix="C" uservalue="yes">
<gates>
<gate name="G$1" symbol="CAPACITOR" x="0" y="0"/>
</gates>
<devices>
<device name="1608" package="1608">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="2012" package="2012">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3216" package="3216">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="1005" package="1005">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3225" package="3225">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0603" package="0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="FB" prefix="FB" uservalue="yes">
<gates>
<gate name="G$1" symbol="FERRITE-BEADS" x="0" y="0"/>
</gates>
<devices>
<device name="1608" package="1608">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="1005" package="1005">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="2012" package="2012">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0603" package="0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="con-Hirose">
<packages>
<package name="ZX62-B-5PA">
<wire x1="-2.15" y1="-3.75" x2="-2.15" y2="3.75" width="0.127" layer="21"/>
<smd name="S2" x="0" y="3.8" dx="1.9" dy="1.4" layer="1"/>
<smd name="S1" x="0" y="-3.8" dx="1.9" dy="1.4" layer="1"/>
<smd name="1" x="2.7" y="1.3" dx="1.4" dy="0.4" layer="1"/>
<text x="-0.5" y="-2" size="1" layer="25" font="vector" ratio="15" rot="R90">&gt;NAME</text>
<text x="1" y="-2" size="1" layer="27" font="vector" ratio="15" rot="R90">&gt;VALUE</text>
<rectangle x1="2.2" y1="1.15" x2="2.85" y2="1.45" layer="51"/>
<wire x1="-1.2513" y1="4.7993" x2="-1.25" y2="4.8" width="0.127" layer="51" curve="-0.034064"/>
<wire x1="2.85" y1="3.75" x2="2.85" y2="1.85" width="0.127" layer="51"/>
<wire x1="2.85" y1="-1.85" x2="2.85" y2="-3.75" width="0.127" layer="51"/>
<smd name="3" x="2.7" y="0" dx="1.4" dy="0.4" layer="1"/>
<smd name="2" x="2.7" y="0.65" dx="1.4" dy="0.4" layer="1"/>
<smd name="4" x="2.7" y="-0.65" dx="1.4" dy="0.4" layer="1"/>
<smd name="5" x="2.7" y="-1.3" dx="1.4" dy="0.4" layer="1"/>
<wire x1="2.85" y1="1.7" x2="2.85" y2="-1.7" width="0.127" layer="51"/>
<wire x1="-2.15" y1="3.75" x2="-1.15" y2="3.75" width="0.127" layer="21"/>
<wire x1="2.85" y1="3.75" x2="1.55" y2="3.75" width="0.127" layer="51"/>
<wire x1="-2.15" y1="-3.75" x2="-1.15" y2="-3.75" width="0.127" layer="21"/>
<wire x1="2.85" y1="-3.75" x2="1.55" y2="-3.75" width="0.127" layer="51"/>
<wire x1="-1.15" y1="-3.75" x2="1.15" y2="-3.75" width="0.127" layer="51"/>
<wire x1="-1.15" y1="3.75" x2="-0.3" y2="3.75" width="0.127" layer="51"/>
<rectangle x1="2.2" y1="0.5" x2="2.85" y2="0.8" layer="51"/>
<rectangle x1="2.2" y1="-0.15" x2="2.85" y2="0.15" layer="51"/>
<rectangle x1="2.2" y1="-0.8" x2="2.85" y2="-0.5" layer="51"/>
<rectangle x1="2.2" y1="-1.45" x2="2.85" y2="-1.15" layer="51"/>
<smd name="S3" x="2.55" y="3.1" dx="1.6" dy="2.1" layer="1"/>
<smd name="S4" x="2.55" y="-3.1" dx="1.6" dy="2.1" layer="1"/>
<wire x1="-0.3" y1="3.75" x2="0.3" y2="3.75" width="0.127" layer="51"/>
<wire x1="0.3" y1="3.75" x2="1.15" y2="3.75" width="0.127" layer="51"/>
<wire x1="2.85" y1="-1.7" x2="2.85" y2="-1.85" width="0.127" layer="21"/>
<wire x1="2.85" y1="1.85" x2="2.85" y2="1.7" width="0.127" layer="21"/>
<wire x1="1.15" y1="3.75" x2="1.55" y2="3.75" width="0.127" layer="21"/>
<wire x1="1.15" y1="-3.75" x2="1.55" y2="-3.75" width="0.127" layer="21"/>
<wire x1="-0.3" y1="3.75" x2="-0.3" y2="3.85" width="0.127" layer="51"/>
<wire x1="0.3" y1="3.75" x2="0.3" y2="3.85" width="0.127" layer="51"/>
<wire x1="0.3" y1="3.85" x2="0.2" y2="3.95" width="0.127" layer="51" curve="90"/>
<wire x1="-0.3" y1="3.85" x2="-0.2" y2="3.95" width="0.127" layer="51" curve="-90"/>
<wire x1="-0.2" y1="3.95" x2="0.2" y2="3.95" width="0.127" layer="51"/>
<wire x1="0.3" y1="-3.75" x2="0.3" y2="-3.85" width="0.127" layer="51"/>
<wire x1="-0.3" y1="-3.75" x2="-0.3" y2="-3.85" width="0.127" layer="51"/>
<wire x1="-0.3" y1="-3.85" x2="-0.2" y2="-3.95" width="0.127" layer="51" curve="90"/>
<wire x1="0.3" y1="-3.85" x2="0.2" y2="-3.95" width="0.127" layer="51" curve="-90"/>
<wire x1="0.2" y1="-3.95" x2="-0.2" y2="-3.95" width="0.127" layer="51"/>
<wire x1="-2.15" y1="3.75" x2="-2.75" y2="3.9" width="0.127" layer="51"/>
<wire x1="-2.15" y1="-3.75" x2="-2.75" y2="-3.9" width="0.127" layer="51"/>
<wire x1="-2.75" y1="3.9" x2="-2.75" y2="3.65" width="0.127" layer="51"/>
<wire x1="-2.75" y1="3.65" x2="-2.15" y2="3.5" width="0.127" layer="51"/>
<wire x1="-2.75" y1="-3.9" x2="-2.75" y2="-3.65" width="0.127" layer="51"/>
<wire x1="-2.75" y1="-3.65" x2="-2.15" y2="-3.5" width="0.127" layer="51"/>
<wire x1="-2.15" y1="-3" x2="-2.75" y2="-3" width="0.127" layer="51"/>
<wire x1="-2.75" y1="-3" x2="-2.75" y2="3" width="0.127" layer="51"/>
<wire x1="-2.75" y1="3" x2="-2.15" y2="3" width="0.127" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="USB-MINIB-4S">
<wire x1="2.54" y1="6.35" x2="2.54" y2="-6.35" width="0.254" layer="94"/>
<wire x1="2.54" y1="-6.35" x2="1.27" y2="-7.62" width="0.254" layer="94" curve="-90"/>
<wire x1="1.27" y1="-7.62" x2="0" y2="-7.62" width="0.254" layer="94"/>
<wire x1="0" y1="-7.62" x2="-1.016" y2="-8.128" width="0.254" layer="94" curve="53.130102"/>
<wire x1="-1.016" y1="-8.128" x2="-2.54" y2="-8.89" width="0.254" layer="94" curve="-53.130102"/>
<wire x1="-2.54" y1="-8.89" x2="-5.08" y2="-8.89" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-8.89" x2="-6.35" y2="-7.62" width="0.254" layer="94" curve="-90"/>
<wire x1="-6.35" y1="-7.62" x2="-6.35" y2="7.62" width="0.254" layer="94"/>
<wire x1="2.54" y1="6.35" x2="1.27" y2="7.62" width="0.254" layer="94" curve="90"/>
<wire x1="1.27" y1="7.62" x2="0" y2="7.62" width="0.254" layer="94"/>
<wire x1="0" y1="7.62" x2="-1.016" y2="8.128" width="0.254" layer="94" curve="-53.130102"/>
<wire x1="-1.016" y1="8.128" x2="-2.54" y2="8.89" width="0.254" layer="94" curve="53.130102"/>
<wire x1="-2.54" y1="8.89" x2="-5.08" y2="8.89" width="0.254" layer="94"/>
<wire x1="-5.08" y1="8.89" x2="-6.35" y2="7.62" width="0.254" layer="94" curve="90"/>
<wire x1="0" y1="5.08" x2="0" y2="-5.08" width="0.254" layer="94"/>
<wire x1="0" y1="-5.08" x2="-1.27" y2="-6.35" width="0.254" layer="94"/>
<wire x1="-1.27" y1="-6.35" x2="-3.81" y2="-6.35" width="0.254" layer="94"/>
<wire x1="-3.81" y1="-6.35" x2="-3.81" y2="6.35" width="0.254" layer="94"/>
<wire x1="-3.81" y1="6.35" x2="-1.27" y2="6.35" width="0.254" layer="94"/>
<wire x1="-1.27" y1="6.35" x2="0" y2="5.08" width="0.254" layer="94"/>
<wire x1="2.54" y1="-10.16" x2="-6.35" y2="-10.16" width="0.254" layer="94" style="shortdash"/>
<wire x1="-6.35" y1="-10.16" x2="-7.62" y2="-8.89" width="0.254" layer="94" style="shortdash" curve="-90"/>
<wire x1="-7.62" y1="-8.89" x2="-7.62" y2="8.89" width="0.254" layer="94" style="shortdash"/>
<wire x1="2.54" y1="10.16" x2="-6.35" y2="10.16" width="0.254" layer="94" style="shortdash"/>
<wire x1="-6.35" y1="10.16" x2="-7.62" y2="8.89" width="0.254" layer="94" style="shortdash" curve="90"/>
<text x="-7.62" y="13.208" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-7.62" y="10.668" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="VBUS" x="5.08" y="5.08" visible="pin" direction="pas" rot="R180"/>
<pin name="D-" x="5.08" y="2.54" visible="pin" direction="pas" rot="R180"/>
<pin name="D+" x="5.08" y="0" visible="pin" direction="pas" rot="R180"/>
<pin name="ID" x="5.08" y="-2.54" visible="pin" direction="pas" rot="R180"/>
<pin name="GND" x="5.08" y="-5.08" visible="pin" direction="pas" rot="R180"/>
<pin name="S1" x="-5.08" y="-12.7" visible="off" length="short" direction="pas" rot="R90"/>
<pin name="S2" x="-2.54" y="-12.7" visible="off" length="short" direction="pas" rot="R90"/>
<pin name="S3" x="0" y="-12.7" visible="off" length="short" direction="pas" rot="R90"/>
<pin name="S4" x="2.54" y="-12.7" visible="off" length="short" direction="pas" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="ZX62-B-5PA" prefix="CN" uservalue="yes">
<gates>
<gate name="G$1" symbol="USB-MINIB-4S" x="0" y="0"/>
</gates>
<devices>
<device name="" package="ZX62-B-5PA">
<connects>
<connect gate="G$1" pin="D+" pad="3"/>
<connect gate="G$1" pin="D-" pad="2"/>
<connect gate="G$1" pin="GND" pad="5"/>
<connect gate="G$1" pin="ID" pad="4"/>
<connect gate="G$1" pin="S1" pad="S1"/>
<connect gate="G$1" pin="S2" pad="S2"/>
<connect gate="G$1" pin="S3" pad="S3"/>
<connect gate="G$1" pin="S4" pad="S4"/>
<connect gate="G$1" pin="VBUS" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="Diode">
<packages>
<package name="1608">
<wire x1="1.35" y1="0.6" x2="1.35" y2="-0.6" width="0.127" layer="21"/>
<wire x1="-1.35" y1="-0.6" x2="-1.35" y2="0.6" width="0.127" layer="21"/>
<wire x1="-1.35" y1="0.6" x2="1.35" y2="0.6" width="0.127" layer="21"/>
<wire x1="1.35" y1="-0.6" x2="-1.35" y2="-0.6" width="0.127" layer="21"/>
<smd name="K" x="-0.75" y="0" dx="0.7" dy="0.8" layer="1"/>
<smd name="A" x="0.75" y="0" dx="0.7" dy="0.8" layer="1"/>
<rectangle x1="-0.8" y1="-0.4" x2="-0.4" y2="0.4" layer="51"/>
<rectangle x1="0.4" y1="-0.4" x2="0.8" y2="0.4" layer="51"/>
<rectangle x1="-0.4" y1="0.25" x2="0.4" y2="0.4" layer="51"/>
<rectangle x1="-0.4" y1="-0.4" x2="0.4" y2="-0.25" layer="51"/>
<wire x1="0.2" y1="0" x2="-0.2" y2="0" width="0.127" layer="21"/>
<wire x1="-0.2" y1="0" x2="0" y2="0.2" width="0.127" layer="21"/>
<wire x1="-0.2" y1="0" x2="0" y2="-0.2" width="0.127" layer="21"/>
<text x="-1.4" y="0.8" size="0.8" layer="25" font="vector" ratio="18">&gt;NAME</text>
<text x="-1.4" y="-1.6" size="0.8" layer="27" font="vector" ratio="18">&gt;VALUE</text>
</package>
<package name="SOD128">
<wire x1="-1.9" y1="1.2" x2="1.9" y2="1.2" width="0.127" layer="21"/>
<wire x1="1.9" y1="1.2" x2="1.9" y2="-1.2" width="0.127" layer="51"/>
<wire x1="-1.9" y1="-1.2" x2="1.9" y2="-1.2" width="0.127" layer="21"/>
<wire x1="-1.9" y1="1.2" x2="-1.9" y2="-1.2" width="0.127" layer="51"/>
<smd name="K" x="-2.25" y="0" dx="1.2" dy="2" layer="1"/>
<smd name="A" x="2.25" y="0" dx="1.2" dy="2" layer="1"/>
<text x="-0.9" y="-0.4" size="0.762" layer="25" font="vector" ratio="17">&gt;NAME</text>
<text x="-2" y="-2.5" size="0.762" layer="27" font="vector" ratio="17">&gt;VALUE</text>
<rectangle x1="-1.4" y1="-1.2" x2="-1.0952" y2="1.2" layer="21"/>
<rectangle x1="-2.35" y1="-0.875" x2="-1.9" y2="0.875" layer="51"/>
<rectangle x1="1.9" y1="-0.875" x2="2.35" y2="0.875" layer="51" rot="R180"/>
</package>
<package name="SOD123">
<wire x1="-1.3" y1="0.8" x2="1.3" y2="0.8" width="0.127" layer="21"/>
<wire x1="-1.3" y1="-0.8" x2="1.3" y2="-0.8" width="0.127" layer="21"/>
<wire x1="-1.3" y1="0.8" x2="-1.3" y2="0.7" width="0.127" layer="21"/>
<wire x1="-1.3" y1="-0.8" x2="-1.3" y2="-0.7" width="0.127" layer="21"/>
<wire x1="1.3" y1="-0.8" x2="1.3" y2="-0.7" width="0.127" layer="21"/>
<wire x1="1.3" y1="0.8" x2="1.3" y2="0.7" width="0.127" layer="21"/>
<wire x1="-1.3" y1="0.7" x2="-1.3" y2="-0.7" width="0.127" layer="51"/>
<wire x1="1.3" y1="-0.7" x2="1.3" y2="0.7" width="0.127" layer="51"/>
<smd name="K" x="-1.65" y="0" dx="1.2" dy="1" layer="1"/>
<smd name="A" x="1.65" y="0" dx="1.2" dy="1" layer="1"/>
<text x="-0.4" y="-0.4" size="0.8" layer="25" font="vector" ratio="18">&gt;NAME</text>
<text x="-2" y="-2" size="0.8" layer="27" font="vector" ratio="18">&gt;VALUE</text>
<rectangle x1="-0.9" y1="-0.8" x2="-0.5952" y2="0.8" layer="21"/>
<rectangle x1="-1.75" y1="-0.45" x2="-1.3" y2="0.45" layer="51"/>
<rectangle x1="1.3" y1="-0.45" x2="1.75" y2="0.45" layer="51" rot="R180"/>
</package>
<package name="SOD323">
<wire x1="-0.85" y1="0.625" x2="0.85" y2="0.625" width="0.127" layer="21"/>
<wire x1="-0.85" y1="-0.625" x2="0.85" y2="-0.625" width="0.127" layer="21"/>
<wire x1="-0.85" y1="0.625" x2="-0.85" y2="0.5" width="0.127" layer="21"/>
<wire x1="-0.85" y1="-0.625" x2="-0.85" y2="-0.5" width="0.127" layer="21"/>
<wire x1="0.85" y1="-0.625" x2="0.85" y2="-0.5" width="0.127" layer="21"/>
<wire x1="0.85" y1="0.625" x2="0.85" y2="0.5" width="0.127" layer="21"/>
<wire x1="-0.85" y1="0.5" x2="-0.85" y2="-0.5" width="0.127" layer="51"/>
<wire x1="0.85" y1="-0.5" x2="0.85" y2="0.5" width="0.127" layer="51"/>
<smd name="K" x="-1.25" y="0" dx="0.8" dy="0.6" layer="1"/>
<smd name="A" x="1.25" y="0" dx="0.8" dy="0.6" layer="1"/>
<text x="-1.6" y="-1.6" size="0.8" layer="25" font="vector" ratio="18">&gt;NAME</text>
<text x="-0.2" y="-0.4" size="0.8" layer="27" font="vector" ratio="18">&gt;VALUE</text>
<rectangle x1="-0.65" y1="-0.625" x2="-0.35" y2="0.625" layer="21"/>
<rectangle x1="-1.25" y1="-0.15" x2="-0.85" y2="0.15" layer="51"/>
<rectangle x1="0.85" y1="-0.15" x2="1.25" y2="0.15" layer="51" rot="R180"/>
</package>
<package name="SOD123W">
<wire x1="-1.3" y1="0.85" x2="1.3" y2="0.85" width="0.127" layer="21"/>
<wire x1="-1.3" y1="-0.85" x2="1.3" y2="-0.85" width="0.127" layer="21"/>
<wire x1="-1.3" y1="0.85" x2="-1.3" y2="0.7" width="0.127" layer="21"/>
<wire x1="-1.3" y1="-0.85" x2="-1.3" y2="-0.7" width="0.127" layer="21"/>
<wire x1="1.3" y1="-0.85" x2="1.3" y2="-0.7" width="0.127" layer="21"/>
<wire x1="1.3" y1="0.85" x2="1.3" y2="0.7" width="0.127" layer="21"/>
<wire x1="-1.3" y1="0.7" x2="-1.3" y2="-0.7" width="0.127" layer="51"/>
<wire x1="1.3" y1="-0.7" x2="1.3" y2="0.7" width="0.127" layer="51"/>
<smd name="K" x="-1.65" y="0" dx="1.2" dy="1" layer="1"/>
<smd name="A" x="1.65" y="0" dx="1.2" dy="1" layer="1"/>
<text x="-0.4" y="-0.4" size="0.8" layer="25" font="vector" ratio="18">&gt;NAME</text>
<text x="-2" y="-2" size="0.8" layer="27" font="vector" ratio="18">&gt;VALUE</text>
<rectangle x1="-0.9" y1="-0.85" x2="-0.5952" y2="0.85" layer="21"/>
<rectangle x1="-1.75" y1="-0.45" x2="-1.3" y2="0.45" layer="51"/>
<rectangle x1="1.3" y1="-0.45" x2="1.75" y2="0.45" layer="51" rot="R180"/>
</package>
<package name="DO-214AC">
<wire x1="-2.1209" y1="1.3335" x2="2.1209" y2="1.3335" width="0.127" layer="21"/>
<wire x1="-2.1209" y1="-1.3335" x2="2.1209" y2="-1.3335" width="0.127" layer="21"/>
<wire x1="-2.1209" y1="1.3335" x2="-2.1209" y2="1.0025" width="0.127" layer="21"/>
<wire x1="-2.1209" y1="-1.3335" x2="-2.1209" y2="-1.0025" width="0.127" layer="21"/>
<wire x1="-2.12" y1="1.0025" x2="-2.12" y2="-1.0025" width="0.127" layer="51"/>
<smd name="K" x="-2.3" y="0" dx="1.6" dy="1.6" layer="1"/>
<text x="-0.5" y="0" size="1" layer="25" font="vector" ratio="15">&gt;NAME</text>
<text x="-0.5" y="-1" size="1" layer="27" font="vector" ratio="15">&gt;VALUE</text>
<rectangle x1="-2.54" y1="-0.7239" x2="-2.12" y2="0.7239" layer="51"/>
<wire x1="2.1209" y1="-1.3335" x2="2.1209" y2="-1.0025" width="0.127" layer="21"/>
<wire x1="2.1209" y1="1.3335" x2="2.1209" y2="1.0025" width="0.127" layer="21"/>
<wire x1="2.12" y1="-1.0025" x2="2.12" y2="1.0025" width="0.127" layer="51"/>
<smd name="A" x="2.3" y="0" dx="1.6" dy="1.6" layer="1" rot="R180"/>
<rectangle x1="-1.143" y1="-1.3335" x2="-0.762" y2="1.3335" layer="21"/>
<rectangle x1="2.12" y1="-0.7239" x2="2.54" y2="0.7239" layer="51" rot="R180"/>
</package>
<package name="SOD523">
<wire x1="-0.6" y1="0.375" x2="0.6" y2="0.375" width="0.127" layer="51"/>
<wire x1="-0.6" y1="-0.375" x2="0.6" y2="-0.375" width="0.127" layer="51"/>
<wire x1="-0.6" y1="0.375" x2="-0.6" y2="-0.375" width="0.127" layer="51"/>
<wire x1="0.6" y1="0.375" x2="0.6" y2="-0.375" width="0.127" layer="51"/>
<rectangle x1="-0.8" y1="-0.15" x2="-0.6" y2="0.15" layer="51"/>
<rectangle x1="0.6" y1="-0.15" x2="0.8" y2="0.15" layer="51"/>
<wire x1="1.35" y1="0.6" x2="1.35" y2="-0.6" width="0.127" layer="21"/>
<wire x1="-1.35" y1="-0.6" x2="-1.35" y2="0.6" width="0.127" layer="21"/>
<wire x1="-1.35" y1="0.6" x2="1.35" y2="0.6" width="0.127" layer="21"/>
<wire x1="1.35" y1="-0.6" x2="-1.35" y2="-0.6" width="0.127" layer="21"/>
<smd name="K" x="-0.75" y="0" dx="0.7" dy="0.6" layer="1"/>
<smd name="A" x="0.75" y="0" dx="0.7" dy="0.6" layer="1"/>
<wire x1="0.2" y1="0" x2="-0.2" y2="0" width="0.127" layer="21"/>
<wire x1="-0.2" y1="0" x2="0" y2="0.2" width="0.127" layer="21"/>
<wire x1="-0.2" y1="0" x2="0" y2="-0.2" width="0.127" layer="21"/>
<text x="-1.4" y="0.8" size="0.8" layer="25" font="vector" ratio="18">&gt;NAME</text>
<text x="-1.4" y="-1.6" size="0.8" layer="27" font="vector" ratio="18">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="SCHOTTKY-DIODE">
<wire x1="-1.27" y1="-1.27" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="-1.27" y2="1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="1.27" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="-1.27" y1="1.27" x2="-1.27" y2="-1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="1.27" y2="-1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="-1.27" x2="0.635" y2="-1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="1.27" x2="1.905" y2="1.27" width="0.254" layer="94"/>
<wire x1="1.905" y1="1.27" x2="1.905" y2="0.889" width="0.254" layer="94"/>
<wire x1="0.635" y1="-0.889" x2="0.635" y2="-1.27" width="0.254" layer="94"/>
<text x="-2.54" y="1.905" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-2.54" y="-3.429" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="A" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
<pin name="K" x="2.54" y="0" visible="off" length="short" direction="pas" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="SBD-*" prefix="D" uservalue="yes">
<gates>
<gate name="G$1" symbol="SCHOTTKY-DIODE" x="0" y="0"/>
</gates>
<devices>
<device name="1608" package="1608">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="K" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SOD128" package="SOD128">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="K" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SOD123" package="SOD123">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="K" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SOD323" package="SOD323">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="K" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SDO123W" package="SOD123W">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="K" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="DO-214AC" package="DO-214AC">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="K" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SOD523" package="SOD523">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="K" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ic-Vishay">
<description>Vishay</description>
<packages>
<package name="3010">
<wire x1="2.3" y1="1" x2="2.3" y2="-1" width="0.127" layer="21"/>
<wire x1="-2.3" y1="-1" x2="-2.3" y2="1" width="0.127" layer="21"/>
<wire x1="-2.3" y1="1" x2="2.3" y2="1" width="0.127" layer="21"/>
<smd name="K" x="-1.5" y="0" dx="1.1" dy="1.5" layer="1"/>
<smd name="A" x="1.5" y="0" dx="1.1" dy="1.5" layer="1"/>
<rectangle x1="-1.5" y1="-0.5" x2="-1.1" y2="0.5" layer="51"/>
<rectangle x1="1.1" y1="-0.5" x2="1.5" y2="0.5" layer="51"/>
<rectangle x1="-1.1" y1="-0.5" x2="1.1" y2="-0.35" layer="51"/>
<wire x1="0.3" y1="0.3" x2="-0.3" y2="0.3" width="0.127" layer="21"/>
<wire x1="-0.3" y1="0.3" x2="0" y2="0.6" width="0.127" layer="21"/>
<wire x1="-0.3" y1="0.3" x2="0" y2="0" width="0.127" layer="21"/>
<rectangle x1="-1.1" y1="0.35" x2="1.1" y2="0.5" layer="51"/>
<text x="-2" y="3" size="0.8" layer="25" font="vector" ratio="18">&gt;NAME</text>
<text x="-2" y="2" size="0.8" layer="27" font="vector" ratio="18">&gt;VALUE</text>
<smd name="R" x="0" y="-0.65" dx="0.9" dy="0.9" layer="1"/>
<rectangle x1="-0.6" y1="-0.35" x2="0.6" y2="-0.2" layer="51"/>
<wire x1="1" y1="0.5" x2="-1" y2="0.5" width="0.127" layer="51" curve="180"/>
<wire x1="-2.3" y1="-1" x2="-0.65" y2="-1" width="0.127" layer="21"/>
<wire x1="2.3" y1="-1" x2="0.65" y2="-1" width="0.127" layer="21"/>
<wire x1="-0.65" y1="-1" x2="0.65" y2="-1" width="0.127" layer="51"/>
</package>
<package name="3010-REV">
<wire x1="2.3" y1="1" x2="2.3" y2="-1" width="0.127" layer="21"/>
<wire x1="-2.3" y1="-1" x2="-2.3" y2="1" width="0.127" layer="21"/>
<wire x1="-2.3" y1="1" x2="2.3" y2="1" width="0.127" layer="21"/>
<smd name="A" x="-1.5" y="0" dx="1.1" dy="1.5" layer="1"/>
<smd name="K" x="1.5" y="0" dx="1.1" dy="1.5" layer="1"/>
<rectangle x1="-1.5" y1="-0.5" x2="-1.1" y2="0.5" layer="51"/>
<rectangle x1="1.1" y1="-0.5" x2="1.5" y2="0.5" layer="51"/>
<rectangle x1="-1.1" y1="-0.5" x2="1.1" y2="-0.35" layer="51"/>
<wire x1="-0.3" y1="0.3" x2="0.3" y2="0.3" width="0.127" layer="22"/>
<wire x1="0.3" y1="0.3" x2="0" y2="0.6" width="0.127" layer="22"/>
<wire x1="0.3" y1="0.3" x2="0" y2="0" width="0.127" layer="22"/>
<rectangle x1="-1.1" y1="0.35" x2="1.1" y2="0.5" layer="51"/>
<text x="-2" y="3" size="0.8" layer="25" font="vector" ratio="18">&gt;NAME</text>
<text x="-2" y="2" size="0.8" layer="27" font="vector" ratio="18">&gt;VALUE</text>
<smd name="R" x="0" y="-0.65" dx="0.9" dy="0.9" layer="1"/>
<rectangle x1="-0.6" y1="-0.35" x2="0.6" y2="-0.2" layer="51"/>
<wire x1="1" y1="0.5" x2="-1" y2="0.5" width="0.127" layer="51" curve="180"/>
<wire x1="-2.3" y1="-1" x2="-0.65" y2="-1" width="0.127" layer="21"/>
<wire x1="2.3" y1="-1" x2="0.65" y2="-1" width="0.127" layer="21"/>
<wire x1="-0.65" y1="-1" x2="0.65" y2="-1" width="0.127" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="LED">
<wire x1="-2.032" y1="0.762" x2="-3.429" y2="-0.635" width="0.1524" layer="94"/>
<wire x1="-1.905" y1="-0.381" x2="-3.302" y2="-1.778" width="0.1524" layer="94"/>
<wire x1="0" y1="-0.508" x2="1.27" y2="0.762" width="0.254" layer="94"/>
<wire x1="-1.27" y1="0.762" x2="0" y2="-0.508" width="0.254" layer="94"/>
<wire x1="0" y1="-0.508" x2="1.27" y2="-0.508" width="0.254" layer="94"/>
<wire x1="0" y1="-0.508" x2="-1.27" y2="-0.508" width="0.254" layer="94"/>
<wire x1="0" y1="-0.508" x2="0" y2="0.762" width="0.1524" layer="94"/>
<wire x1="0" y1="0.762" x2="0" y2="2.54" width="0.1524" layer="94"/>
<wire x1="0" y1="-0.508" x2="0" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="-1.27" y1="0.762" x2="0" y2="0.762" width="0.254" layer="94"/>
<wire x1="1.27" y1="0.762" x2="0" y2="0.762" width="0.254" layer="94"/>
<text x="2.54" y="0.508" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="2.54" y="-2.032" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="K" x="0" y="-2.54" visible="off" length="point" direction="pas" rot="R90"/>
<pin name="A" x="0" y="2.54" visible="off" length="point" direction="pas" rot="R270"/>
<polygon width="0.1524" layer="94">
<vertex x="-3.429" y="-0.635"/>
<vertex x="-3.048" y="0.254"/>
<vertex x="-2.54" y="-0.254"/>
</polygon>
<polygon width="0.1524" layer="94">
<vertex x="-3.302" y="-1.778"/>
<vertex x="-2.921" y="-0.889"/>
<vertex x="-2.413" y="-1.397"/>
</polygon>
</symbol>
</symbols>
<devicesets>
<deviceset name="VSMG10850" prefix="LED">
<gates>
<gate name="G$1" symbol="LED" x="0" y="0"/>
</gates>
<devices>
<device name="" package="3010">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="K" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-REV" package="3010-REV">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="K" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ProjectOnly">
<description>Gen.6 プロジェクト限定のライブラリ</description>
<packages>
<package name="SPRING-72MIL">
<circle x="0" y="0" radius="0.9144" width="0.127" layer="51"/>
<smd name="1" x="0" y="0" dx="2.5" dy="2.5" layer="1" roundness="100"/>
</package>
<package name="NUT-M2-MA">
<hole x="0" y="0" drill="2.3"/>
<wire x1="-2" y1="1.1547" x2="-2" y2="-1.1547" width="0.127" layer="51"/>
<wire x1="2" y1="1.1547" x2="2" y2="-1.1547" width="0.127" layer="51"/>
<wire x1="-2" y1="1.1547" x2="0" y2="2.3094" width="0.127" layer="51"/>
<wire x1="0" y1="2.3094" x2="2" y2="1.1547" width="0.127" layer="51"/>
<wire x1="-2" y1="-1.1547" x2="0" y2="-2.3094" width="0.127" layer="51"/>
<wire x1="0" y1="-2.3094" x2="2" y2="-1.1547" width="0.127" layer="51"/>
<smd name="1" x="-2" y="1.2" dx="1.6" dy="1" layer="1" rot="R60"/>
<smd name="2" x="0" y="-2.2" dx="1.6" dy="1.1" layer="1"/>
</package>
<package name="NUT-M2-P">
<hole x="0" y="0" drill="2.3"/>
<wire x1="-2" y1="1.1547" x2="-2" y2="-1.1547" width="0.127" layer="51"/>
<wire x1="2" y1="1.1547" x2="2" y2="-1.1547" width="0.127" layer="51"/>
<wire x1="-2" y1="1.1547" x2="0" y2="2.3094" width="0.127" layer="51"/>
<wire x1="0" y1="2.3094" x2="2" y2="1.1547" width="0.127" layer="51"/>
<wire x1="-2" y1="-1.1547" x2="0" y2="-2.3094" width="0.127" layer="51"/>
<wire x1="0" y1="-2.3094" x2="2" y2="-1.1547" width="0.127" layer="51"/>
<smd name="1" x="0" y="2.2" dx="1.6" dy="1" layer="1"/>
<smd name="2" x="0" y="-2.2" dx="1.6" dy="1.1" layer="1"/>
</package>
<package name="NUT-M2-MB">
<hole x="0" y="0" drill="2.3"/>
<wire x1="-2" y1="1.1547" x2="-2" y2="-1.1547" width="0.127" layer="51"/>
<wire x1="2" y1="1.1547" x2="2" y2="-1.1547" width="0.127" layer="51"/>
<wire x1="-2" y1="1.1547" x2="0" y2="2.3094" width="0.127" layer="51"/>
<wire x1="0" y1="2.3094" x2="2" y2="1.1547" width="0.127" layer="51"/>
<wire x1="-2" y1="-1.1547" x2="0" y2="-2.3094" width="0.127" layer="51"/>
<wire x1="0" y1="-2.3094" x2="2" y2="-1.1547" width="0.127" layer="51"/>
<smd name="1" x="2" y="1.2" dx="1.6" dy="1" layer="1" rot="R300"/>
<smd name="2" x="0" y="-2.2" dx="1.6" dy="1.1" layer="1"/>
</package>
</packages>
<symbols>
<symbol name="CONTACT">
<text x="-2.54" y="5.08" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-2.54" y="2.54" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<circle x="0" y="0" radius="1.778" width="0.254" layer="94"/>
<pin name="1" x="0" y="-2.54" visible="off" length="point" direction="pas" rot="R90"/>
<wire x1="0" y1="-2.54" x2="0" y2="-1.778" width="0.1524" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="SPRING-*" prefix="P" uservalue="yes">
<gates>
<gate name="G$1" symbol="CONTACT" x="0" y="0"/>
</gates>
<devices>
<device name="72MIL" package="SPRING-72MIL">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="NUT-*" prefix="H">
<gates>
<gate name="G$1" symbol="CONTACT" x="0" y="0"/>
</gates>
<devices>
<device name="M2-P" package="NUT-M2-P">
<connects>
<connect gate="G$1" pin="1" pad="1 2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="M2-MA" package="NUT-M2-MA">
<connects>
<connect gate="G$1" pin="1" pad="1 2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="M2-MB" package="NUT-M2-MB">
<connects>
<connect gate="G$1" pin="1" pad="1 2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ic-ATMEL">
<description>ATMEL</description>
<packages>
<package name="QFP100-0.5">
<wire x1="6.6" y1="7" x2="7" y2="6.6" width="0.127" layer="21"/>
<wire x1="7" y1="6.6" x2="7" y2="-6.6" width="0.127" layer="21"/>
<wire x1="7" y1="-6.6" x2="6.6" y2="-7" width="0.127" layer="21"/>
<wire x1="6.6" y1="-7" x2="-6.6" y2="-7" width="0.127" layer="21"/>
<wire x1="-6.6" y1="-7" x2="-7" y2="-6.6" width="0.127" layer="21"/>
<wire x1="-7" y1="-6.6" x2="-7" y2="6.6" width="0.127" layer="21"/>
<wire x1="-7" y1="6.6" x2="-6.6" y2="7" width="0.127" layer="21"/>
<wire x1="-6.6" y1="7" x2="6.6" y2="7" width="0.127" layer="21"/>
<circle x="-6.25" y="6.25" radius="0.25" width="0.127" layer="21"/>
<smd name="1" x="-8" y="6" dx="1" dy="0.25" layer="1"/>
<text x="-3" y="0" size="1" layer="25" font="vector" ratio="15">&gt;NAME</text>
<text x="-3" y="-2" size="1" layer="27" font="vector" ratio="15">&gt;VALUE</text>
<rectangle x1="-8" y1="5.875" x2="-7" y2="6.125" layer="51"/>
<smd name="2" x="-8" y="5.5" dx="1" dy="0.25" layer="1"/>
<rectangle x1="-8" y1="5.375" x2="-7" y2="5.625" layer="51"/>
<smd name="3" x="-8" y="5" dx="1" dy="0.25" layer="1"/>
<rectangle x1="-8" y1="4.875" x2="-7" y2="5.125" layer="51"/>
<smd name="4" x="-8" y="4.5" dx="1" dy="0.25" layer="1"/>
<rectangle x1="-8" y1="4.375" x2="-7" y2="4.625" layer="51"/>
<smd name="5" x="-8" y="4" dx="1" dy="0.25" layer="1"/>
<rectangle x1="-8" y1="3.875" x2="-7" y2="4.125" layer="51"/>
<smd name="6" x="-8" y="3.5" dx="1" dy="0.25" layer="1"/>
<rectangle x1="-8" y1="3.375" x2="-7" y2="3.625" layer="51"/>
<smd name="7" x="-8" y="3" dx="1" dy="0.25" layer="1"/>
<rectangle x1="-8" y1="2.875" x2="-7" y2="3.125" layer="51"/>
<smd name="8" x="-8" y="2.5" dx="1" dy="0.25" layer="1"/>
<rectangle x1="-8" y1="2.375" x2="-7" y2="2.625" layer="51"/>
<smd name="9" x="-8" y="2" dx="1" dy="0.25" layer="1"/>
<rectangle x1="-8" y1="1.875" x2="-7" y2="2.125" layer="51"/>
<smd name="10" x="-8" y="1.5" dx="1" dy="0.25" layer="1"/>
<rectangle x1="-8" y1="1.375" x2="-7" y2="1.625" layer="51"/>
<smd name="11" x="-8" y="1" dx="1" dy="0.25" layer="1"/>
<rectangle x1="-8" y1="0.875" x2="-7" y2="1.125" layer="51"/>
<smd name="12" x="-8" y="0.5" dx="1" dy="0.25" layer="1"/>
<rectangle x1="-8" y1="0.375" x2="-7" y2="0.625" layer="51"/>
<smd name="13" x="-8" y="0" dx="1" dy="0.25" layer="1"/>
<rectangle x1="-8" y1="-0.125" x2="-7" y2="0.125" layer="51"/>
<smd name="14" x="-8" y="-0.5" dx="1" dy="0.25" layer="1"/>
<rectangle x1="-8" y1="-0.625" x2="-7" y2="-0.375" layer="51"/>
<smd name="15" x="-8" y="-1" dx="1" dy="0.25" layer="1"/>
<rectangle x1="-8" y1="-1.125" x2="-7" y2="-0.875" layer="51"/>
<smd name="16" x="-8" y="-1.5" dx="1" dy="0.25" layer="1"/>
<rectangle x1="-8" y1="-1.625" x2="-7" y2="-1.375" layer="51"/>
<smd name="17" x="-8" y="-2" dx="1" dy="0.25" layer="1"/>
<rectangle x1="-8" y1="-2.125" x2="-7" y2="-1.875" layer="51"/>
<smd name="18" x="-8" y="-2.5" dx="1" dy="0.25" layer="1"/>
<rectangle x1="-8" y1="-2.625" x2="-7" y2="-2.375" layer="51"/>
<smd name="19" x="-8" y="-3" dx="1" dy="0.25" layer="1"/>
<rectangle x1="-8" y1="-3.125" x2="-7" y2="-2.875" layer="51"/>
<smd name="20" x="-8" y="-3.5" dx="1" dy="0.25" layer="1"/>
<rectangle x1="-8" y1="-3.625" x2="-7" y2="-3.375" layer="51"/>
<smd name="21" x="-8" y="-4" dx="1" dy="0.25" layer="1"/>
<rectangle x1="-8" y1="-4.125" x2="-7" y2="-3.875" layer="51"/>
<smd name="22" x="-8" y="-4.5" dx="1" dy="0.25" layer="1"/>
<rectangle x1="-8" y1="-4.625" x2="-7" y2="-4.375" layer="51"/>
<smd name="23" x="-8" y="-5" dx="1" dy="0.25" layer="1"/>
<rectangle x1="-8" y1="-5.125" x2="-7" y2="-4.875" layer="51"/>
<smd name="24" x="-8" y="-5.5" dx="1" dy="0.25" layer="1"/>
<rectangle x1="-8" y1="-5.625" x2="-7" y2="-5.375" layer="51"/>
<smd name="25" x="-8" y="-6" dx="1" dy="0.25" layer="1"/>
<rectangle x1="-8" y1="-6.125" x2="-7" y2="-5.875" layer="51"/>
<smd name="26" x="-6" y="-8" dx="1" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="-6.5" y1="-7.625" x2="-5.5" y2="-7.375" layer="51" rot="R90"/>
<smd name="27" x="-5.5" y="-8" dx="1" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="-6" y1="-7.625" x2="-5" y2="-7.375" layer="51" rot="R90"/>
<smd name="28" x="-5" y="-8" dx="1" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="-5.5" y1="-7.625" x2="-4.5" y2="-7.375" layer="51" rot="R90"/>
<smd name="29" x="-4.5" y="-8" dx="1" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="-5" y1="-7.625" x2="-4" y2="-7.375" layer="51" rot="R90"/>
<smd name="30" x="-4" y="-8" dx="1" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="-4.5" y1="-7.625" x2="-3.5" y2="-7.375" layer="51" rot="R90"/>
<smd name="31" x="-3.5" y="-8" dx="1" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="-4" y1="-7.625" x2="-3" y2="-7.375" layer="51" rot="R90"/>
<smd name="32" x="-3" y="-8" dx="1" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="-3.5" y1="-7.625" x2="-2.5" y2="-7.375" layer="51" rot="R90"/>
<smd name="33" x="-2.5" y="-8" dx="1" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="-3" y1="-7.625" x2="-2" y2="-7.375" layer="51" rot="R90"/>
<smd name="34" x="-2" y="-8" dx="1" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="-2.5" y1="-7.625" x2="-1.5" y2="-7.375" layer="51" rot="R90"/>
<smd name="35" x="-1.5" y="-8" dx="1" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="-2" y1="-7.625" x2="-1" y2="-7.375" layer="51" rot="R90"/>
<smd name="36" x="-1" y="-8" dx="1" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="-1.5" y1="-7.625" x2="-0.5" y2="-7.375" layer="51" rot="R90"/>
<smd name="37" x="-0.5" y="-8" dx="1" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="-1" y1="-7.625" x2="0" y2="-7.375" layer="51" rot="R90"/>
<smd name="38" x="0" y="-8" dx="1" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="-0.5" y1="-7.625" x2="0.5" y2="-7.375" layer="51" rot="R90"/>
<smd name="39" x="0.5" y="-8" dx="1" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="0" y1="-7.625" x2="1" y2="-7.375" layer="51" rot="R90"/>
<smd name="40" x="1" y="-8" dx="1" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="0.5" y1="-7.625" x2="1.5" y2="-7.375" layer="51" rot="R90"/>
<smd name="41" x="1.5" y="-8" dx="1" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="1" y1="-7.625" x2="2" y2="-7.375" layer="51" rot="R90"/>
<smd name="42" x="2" y="-8" dx="1" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="1.5" y1="-7.625" x2="2.5" y2="-7.375" layer="51" rot="R90"/>
<smd name="43" x="2.5" y="-8" dx="1" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="2" y1="-7.625" x2="3" y2="-7.375" layer="51" rot="R90"/>
<smd name="44" x="3" y="-8" dx="1" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="2.5" y1="-7.625" x2="3.5" y2="-7.375" layer="51" rot="R90"/>
<smd name="45" x="3.5" y="-8" dx="1" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="3" y1="-7.625" x2="4" y2="-7.375" layer="51" rot="R90"/>
<smd name="46" x="4" y="-8" dx="1" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="3.5" y1="-7.625" x2="4.5" y2="-7.375" layer="51" rot="R90"/>
<smd name="47" x="4.5" y="-8" dx="1" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="4" y1="-7.625" x2="5" y2="-7.375" layer="51" rot="R90"/>
<smd name="48" x="5" y="-8" dx="1" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="4.5" y1="-7.625" x2="5.5" y2="-7.375" layer="51" rot="R90"/>
<smd name="49" x="5.5" y="-8" dx="1" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="5" y1="-7.625" x2="6" y2="-7.375" layer="51" rot="R90"/>
<smd name="50" x="6" y="-8" dx="1" dy="0.25" layer="1" rot="R90"/>
<rectangle x1="5.5" y1="-7.625" x2="6.5" y2="-7.375" layer="51" rot="R90"/>
<smd name="51" x="8" y="-6" dx="1" dy="0.25" layer="1" rot="R180"/>
<rectangle x1="7" y1="-6.125" x2="8" y2="-5.875" layer="51" rot="R180"/>
<smd name="52" x="8" y="-5.5" dx="1" dy="0.25" layer="1" rot="R180"/>
<rectangle x1="7" y1="-5.625" x2="8" y2="-5.375" layer="51" rot="R180"/>
<smd name="53" x="8" y="-5" dx="1" dy="0.25" layer="1" rot="R180"/>
<rectangle x1="7" y1="-5.125" x2="8" y2="-4.875" layer="51" rot="R180"/>
<smd name="54" x="8" y="-4.5" dx="1" dy="0.25" layer="1" rot="R180"/>
<rectangle x1="7" y1="-4.625" x2="8" y2="-4.375" layer="51" rot="R180"/>
<smd name="55" x="8" y="-4" dx="1" dy="0.25" layer="1" rot="R180"/>
<rectangle x1="7" y1="-4.125" x2="8" y2="-3.875" layer="51" rot="R180"/>
<smd name="56" x="8" y="-3.5" dx="1" dy="0.25" layer="1" rot="R180"/>
<rectangle x1="7" y1="-3.625" x2="8" y2="-3.375" layer="51" rot="R180"/>
<smd name="57" x="8" y="-3" dx="1" dy="0.25" layer="1" rot="R180"/>
<rectangle x1="7" y1="-3.125" x2="8" y2="-2.875" layer="51" rot="R180"/>
<smd name="58" x="8" y="-2.5" dx="1" dy="0.25" layer="1" rot="R180"/>
<rectangle x1="7" y1="-2.625" x2="8" y2="-2.375" layer="51" rot="R180"/>
<smd name="59" x="8" y="-2" dx="1" dy="0.25" layer="1" rot="R180"/>
<rectangle x1="7" y1="-2.125" x2="8" y2="-1.875" layer="51" rot="R180"/>
<smd name="60" x="8" y="-1.5" dx="1" dy="0.25" layer="1" rot="R180"/>
<rectangle x1="7" y1="-1.625" x2="8" y2="-1.375" layer="51" rot="R180"/>
<smd name="61" x="8" y="-1" dx="1" dy="0.25" layer="1" rot="R180"/>
<rectangle x1="7" y1="-1.125" x2="8" y2="-0.875" layer="51" rot="R180"/>
<smd name="62" x="8" y="-0.5" dx="1" dy="0.25" layer="1" rot="R180"/>
<rectangle x1="7" y1="-0.625" x2="8" y2="-0.375" layer="51" rot="R180"/>
<smd name="63" x="8" y="0" dx="1" dy="0.25" layer="1" rot="R180"/>
<rectangle x1="7" y1="-0.125" x2="8" y2="0.125" layer="51" rot="R180"/>
<smd name="64" x="8" y="0.5" dx="1" dy="0.25" layer="1" rot="R180"/>
<rectangle x1="7" y1="0.375" x2="8" y2="0.625" layer="51" rot="R180"/>
<smd name="65" x="8" y="1" dx="1" dy="0.25" layer="1" rot="R180"/>
<rectangle x1="7" y1="0.875" x2="8" y2="1.125" layer="51" rot="R180"/>
<smd name="66" x="8" y="1.5" dx="1" dy="0.25" layer="1" rot="R180"/>
<rectangle x1="7" y1="1.375" x2="8" y2="1.625" layer="51" rot="R180"/>
<smd name="67" x="8" y="2" dx="1" dy="0.25" layer="1" rot="R180"/>
<rectangle x1="7" y1="1.875" x2="8" y2="2.125" layer="51" rot="R180"/>
<smd name="68" x="8" y="2.5" dx="1" dy="0.25" layer="1" rot="R180"/>
<rectangle x1="7" y1="2.375" x2="8" y2="2.625" layer="51" rot="R180"/>
<smd name="69" x="8" y="3" dx="1" dy="0.25" layer="1" rot="R180"/>
<rectangle x1="7" y1="2.875" x2="8" y2="3.125" layer="51" rot="R180"/>
<smd name="70" x="8" y="3.5" dx="1" dy="0.25" layer="1" rot="R180"/>
<rectangle x1="7" y1="3.375" x2="8" y2="3.625" layer="51" rot="R180"/>
<smd name="71" x="8" y="4" dx="1" dy="0.25" layer="1" rot="R180"/>
<rectangle x1="7" y1="3.875" x2="8" y2="4.125" layer="51" rot="R180"/>
<smd name="72" x="8" y="4.5" dx="1" dy="0.25" layer="1" rot="R180"/>
<rectangle x1="7" y1="4.375" x2="8" y2="4.625" layer="51" rot="R180"/>
<smd name="73" x="8" y="5" dx="1" dy="0.25" layer="1" rot="R180"/>
<rectangle x1="7" y1="4.875" x2="8" y2="5.125" layer="51" rot="R180"/>
<smd name="74" x="8" y="5.5" dx="1" dy="0.25" layer="1" rot="R180"/>
<rectangle x1="7" y1="5.375" x2="8" y2="5.625" layer="51" rot="R180"/>
<smd name="75" x="8" y="6" dx="1" dy="0.25" layer="1" rot="R180"/>
<rectangle x1="7" y1="5.875" x2="8" y2="6.125" layer="51" rot="R180"/>
<smd name="76" x="6" y="8" dx="1" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="5.5" y1="7.375" x2="6.5" y2="7.625" layer="51" rot="R270"/>
<smd name="77" x="5.5" y="8" dx="1" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="5" y1="7.375" x2="6" y2="7.625" layer="51" rot="R270"/>
<smd name="78" x="5" y="8" dx="1" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="4.5" y1="7.375" x2="5.5" y2="7.625" layer="51" rot="R270"/>
<smd name="79" x="4.5" y="8" dx="1" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="4" y1="7.375" x2="5" y2="7.625" layer="51" rot="R270"/>
<smd name="80" x="4" y="8" dx="1" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="3.5" y1="7.375" x2="4.5" y2="7.625" layer="51" rot="R270"/>
<smd name="81" x="3.5" y="8" dx="1" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="3" y1="7.375" x2="4" y2="7.625" layer="51" rot="R270"/>
<smd name="82" x="3" y="8" dx="1" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="2.5" y1="7.375" x2="3.5" y2="7.625" layer="51" rot="R270"/>
<smd name="83" x="2.5" y="8" dx="1" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="2" y1="7.375" x2="3" y2="7.625" layer="51" rot="R270"/>
<smd name="84" x="2" y="8" dx="1" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="1.5" y1="7.375" x2="2.5" y2="7.625" layer="51" rot="R270"/>
<smd name="85" x="1.5" y="8" dx="1" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="1" y1="7.375" x2="2" y2="7.625" layer="51" rot="R270"/>
<smd name="86" x="1" y="8" dx="1" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="0.5" y1="7.375" x2="1.5" y2="7.625" layer="51" rot="R270"/>
<smd name="87" x="0.5" y="8" dx="1" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="0" y1="7.375" x2="1" y2="7.625" layer="51" rot="R270"/>
<smd name="88" x="0" y="8" dx="1" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="-0.5" y1="7.375" x2="0.5" y2="7.625" layer="51" rot="R270"/>
<smd name="89" x="-0.5" y="8" dx="1" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="-1" y1="7.375" x2="0" y2="7.625" layer="51" rot="R270"/>
<smd name="90" x="-1" y="8" dx="1" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="-1.5" y1="7.375" x2="-0.5" y2="7.625" layer="51" rot="R270"/>
<smd name="91" x="-1.5" y="8" dx="1" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="-2" y1="7.375" x2="-1" y2="7.625" layer="51" rot="R270"/>
<smd name="92" x="-2" y="8" dx="1" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="-2.5" y1="7.375" x2="-1.5" y2="7.625" layer="51" rot="R270"/>
<smd name="93" x="-2.5" y="8" dx="1" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="-3" y1="7.375" x2="-2" y2="7.625" layer="51" rot="R270"/>
<smd name="94" x="-3" y="8" dx="1" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="-3.5" y1="7.375" x2="-2.5" y2="7.625" layer="51" rot="R270"/>
<smd name="95" x="-3.5" y="8" dx="1" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="-4" y1="7.375" x2="-3" y2="7.625" layer="51" rot="R270"/>
<smd name="96" x="-4" y="8" dx="1" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="-4.5" y1="7.375" x2="-3.5" y2="7.625" layer="51" rot="R270"/>
<smd name="97" x="-4.5" y="8" dx="1" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="-5" y1="7.375" x2="-4" y2="7.625" layer="51" rot="R270"/>
<smd name="98" x="-5" y="8" dx="1" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="-5.5" y1="7.375" x2="-4.5" y2="7.625" layer="51" rot="R270"/>
<smd name="99" x="-5.5" y="8" dx="1" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="-6" y1="7.375" x2="-5" y2="7.625" layer="51" rot="R270"/>
<smd name="100" x="-6" y="8" dx="1" dy="0.25" layer="1" rot="R270"/>
<rectangle x1="-6.5" y1="7.375" x2="-5.5" y2="7.625" layer="51" rot="R270"/>
</package>
</packages>
<symbols>
<symbol name="ATSAM4E_C">
<wire x1="-35.56" y1="83.82" x2="35.56" y2="83.82" width="0.254" layer="94"/>
<wire x1="35.56" y1="83.82" x2="35.56" y2="-83.82" width="0.254" layer="94"/>
<wire x1="35.56" y1="-83.82" x2="-35.56" y2="-83.82" width="0.254" layer="94"/>
<wire x1="-35.56" y1="-83.82" x2="-35.56" y2="83.82" width="0.254" layer="94"/>
<text x="-35.56" y="84.328" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-35.56" y="-86.36" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="JTAGSEL" x="-38.1" y="76.2" length="short"/>
<pin name="!RST" x="-38.1" y="81.28" length="short" function="dot"/>
<pin name="VDDIN" x="-38.1" y="68.58" length="short"/>
<pin name="VDDOUT" x="-38.1" y="50.8" length="short"/>
<pin name="VDDCORE" x="-38.1" y="33.02" length="short"/>
<pin name="TST" x="-38.1" y="78.74" length="short"/>
<pin name="VDDPLL" x="-38.1" y="15.24" length="short"/>
<pin name="VDDIO" x="-38.1" y="-2.54" length="short"/>
<pin name="GND" x="-38.1" y="-38.1" length="short"/>
<pin name="ADVREF" x="-38.1" y="-20.32" length="short"/>
<pin name="PD0/GTXCK_GREFCK" x="38.1" y="-2.54" length="short" rot="R180"/>
<pin name="PD31" x="38.1" y="-81.28" length="short" rot="R180"/>
<pin name="PB1/PWMH1/TXD0/AFE0_AD5/RTCOUT1" x="-38.1" y="-48.26" length="short"/>
<pin name="PB0/PWMH0/RXD0/AFE0_AD4/RTCOUT0" x="-38.1" y="-45.72" length="short"/>
<pin name="PA20/PWML1/AFE0_AD3" x="38.1" y="30.48" length="short" rot="R180"/>
<pin name="PA19/PWML0/AFE0_AD2" x="38.1" y="33.02" length="short" rot="R180"/>
<pin name="PA18/PCK2/AFE0_AD1" x="38.1" y="35.56" length="short" rot="R180"/>
<pin name="PA17/PCK1/PWMH3/AFE0_AD0" x="38.1" y="38.1" length="short" rot="R180"/>
<pin name="PB2/CANTX0/NPCS2/CTS0/AFE1_AD0" x="-38.1" y="-50.8" length="short"/>
<pin name="PB3/CANRX0/PCK2/RTS0/AFE1_AD1" x="-38.1" y="-53.34" length="short"/>
<pin name="PA21/RXD1/PCK1/AFE1_AD2" x="38.1" y="27.94" length="short" rot="R180"/>
<pin name="PD30" x="38.1" y="-78.74" length="short" rot="R180"/>
<pin name="PA7/PWMH3/XIN32" x="38.1" y="63.5" length="short" rot="R180"/>
<pin name="PA8/AFE0_ADTRG/XOUT32" x="38.1" y="60.96" length="short" rot="R180"/>
<pin name="PA22/TXD1/NPCS3/AFE1_AD3" x="38.1" y="25.4" length="short" rot="R180"/>
<pin name="PA13/MOSI/PWMH2" x="38.1" y="48.26" length="short" rot="R180"/>
<pin name="PA16/TIOB1/PWML2/PIODCEN2" x="38.1" y="40.64" length="short" rot="R180"/>
<pin name="PA23/SCK1/PWMH0/PIODCCLK" x="38.1" y="22.86" length="short" rot="R180"/>
<pin name="PD27/PWML3" x="38.1" y="-71.12" length="short" rot="R180"/>
<pin name="PA15/TIOA1/PWML3/PIODCEN1" x="38.1" y="43.18" length="short" rot="R180"/>
<pin name="PA14/SPCK/PWMH3" x="38.1" y="45.72" length="short" rot="R180"/>
<pin name="PD25/PWML1" x="38.1" y="-66.04" length="short" rot="R180"/>
<pin name="PD26/PWML2" x="38.1" y="-68.58" length="short" rot="R180"/>
<pin name="PD24/PWML0" x="38.1" y="-63.5" length="short" rot="R180"/>
<pin name="PD23/PWMH3" x="38.1" y="-60.96" length="short" rot="R180"/>
<pin name="PA25/CTS1/PWMH2/PIODC1" x="38.1" y="17.78" length="short" rot="R180"/>
<pin name="PD22/PWMH2" x="38.1" y="-58.42" length="short" rot="R180"/>
<pin name="PA26/DCD1/TIOA2/MCDA2/PIODC2" x="38.1" y="15.24" length="short" rot="R180"/>
<pin name="PD21/PWMH1" x="38.1" y="-55.88" length="short" rot="R180"/>
<pin name="PA11/NPCS0/PWMH0" x="38.1" y="53.34" length="short" rot="R180"/>
<pin name="PD20/PWMH0" x="38.1" y="-53.34" length="short" rot="R180"/>
<pin name="PA10/UTXD0/NPCS2" x="38.1" y="55.88" length="short" rot="R180"/>
<pin name="PD19" x="38.1" y="-50.8" length="short" rot="R180"/>
<pin name="PA12/MISO/PWMH1" x="38.1" y="50.8" length="short" rot="R180"/>
<pin name="PD18" x="38.1" y="-48.26" length="short" rot="R180"/>
<pin name="PA27/DTR1/TIOB2/MCDA3/PIODC3" x="38.1" y="12.7" length="short" rot="R180"/>
<pin name="PD28" x="38.1" y="-73.66" length="short" rot="R180"/>
<pin name="PA5/NPCS3/URXD1" x="38.1" y="68.58" length="short" rot="R180"/>
<pin name="PD17/GTXER" x="38.1" y="-45.72" length="short" rot="R180"/>
<pin name="PA9/URXD0/NPCS1/PWMFI0" x="38.1" y="58.42" length="short" rot="R180"/>
<pin name="PA4/TWCK0/TCLK0" x="38.1" y="71.12" length="short" rot="R180"/>
<pin name="PD16/GTX3" x="38.1" y="-43.18" length="short" rot="R180"/>
<pin name="PB6/TMS/SWDIO" x="-38.1" y="-60.96" length="short"/>
<pin name="PD14/GRXCK" x="38.1" y="-38.1" length="short" rot="R180"/>
<pin name="PB12/PWML1/ERASE" x="-38.1" y="-76.2" length="short"/>
<pin name="PD13/GCOL" x="38.1" y="-35.56" length="short" rot="R180"/>
<pin name="PB7/TCK/SWCLK" x="-38.1" y="-63.5" length="short"/>
<pin name="PA3/TWD0/NPCS3" x="38.1" y="73.66" length="short" rot="R180"/>
<pin name="PD12/GRX3" x="38.1" y="-33.02" length="short" rot="R180"/>
<pin name="PA2/PWMH2/DATRG" x="38.1" y="76.2" length="short" rot="R180"/>
<pin name="PD11/GRX2" x="38.1" y="-30.48" length="short" rot="R180"/>
<pin name="PA1/PWMH1/TIOB0" x="38.1" y="78.74" length="short" rot="R180"/>
<pin name="PD10/GCRS" x="38.1" y="-27.94" length="short" rot="R180"/>
<pin name="PA0/PWMH0/TIOA0" x="38.1" y="81.28" length="short" rot="R180"/>
<pin name="PB4/TWD1/PWMH2/TDI" x="-38.1" y="-55.88" length="short"/>
<pin name="PD15/GTX2" x="38.1" y="-40.64" length="short" rot="R180"/>
<pin name="PD29" x="38.1" y="-76.2" length="short" rot="R180"/>
<pin name="PB5/TWCK1/PWML0/TDO/SWO" x="-38.1" y="-58.42" length="short"/>
<pin name="PD9/GMDIO" x="38.1" y="-25.4" length="short" rot="R180"/>
<pin name="PA28/DSR1/TCLK1/MCCDA/PIODC4" x="38.1" y="10.16" length="short" rot="R180"/>
<pin name="PD8/GMDC" x="38.1" y="-22.86" length="short" rot="R180"/>
<pin name="PA6/PCK0/UTXD1" x="38.1" y="66.04" length="short" rot="R180"/>
<pin name="PA30/PWML2/NPCS2/MCDA0/PIODC6" x="38.1" y="5.08" length="short" rot="R180"/>
<pin name="PA31/NPCS1/PCK2/MCDA1/PIODC7" x="38.1" y="2.54" length="short" rot="R180"/>
<pin name="PD7/GRXER" x="38.1" y="-20.32" length="short" rot="R180"/>
<pin name="PD6/GRX1" x="38.1" y="-17.78" length="short" rot="R180"/>
<pin name="PD5/GRX0" x="38.1" y="-15.24" length="short" rot="R180"/>
<pin name="PD4/GCRSDV_GRXDV" x="38.1" y="-12.7" length="short" rot="R180"/>
<pin name="PD3/GTX1" x="38.1" y="-10.16" length="short" rot="R180"/>
<pin name="PA29/RI1/TCLK2/MCCK/PIODC5" x="38.1" y="7.62" length="short" rot="R180"/>
<pin name="PD2/GTX0" x="38.1" y="-7.62" length="short" rot="R180"/>
<pin name="PD1/GTXEN" x="38.1" y="-5.08" length="short" rot="R180"/>
<pin name="PB10/DDM" x="-38.1" y="-71.12" length="short"/>
<pin name="PB11/DDP" x="-38.1" y="-73.66" length="short"/>
<pin name="PB14/NPCS1/PWMH3/DAC1" x="-38.1" y="-81.28" length="short"/>
<pin name="PB8/XOUT" x="-38.1" y="-66.04" length="short"/>
<pin name="PB9/XIN" x="-38.1" y="-68.58" length="short"/>
<pin name="PB13/PWML2/PCK0/SCK0/DAC0" x="-38.1" y="-78.74" length="short"/>
<pin name="PA24/RTS1/PWMH1/PIODC0" x="38.1" y="20.32" length="short" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="ATSAM4E*CA-?" prefix="U">
<gates>
<gate name="G$1" symbol="ATSAM4E_C" x="0" y="0"/>
</gates>
<devices>
<device name="A" package="QFP100-0.5">
<connects>
<connect gate="G$1" pin="!RST" pad="58"/>
<connect gate="G$1" pin="ADVREF" pad="9"/>
<connect gate="G$1" pin="GND" pad="3 6 7 8 10 29 67"/>
<connect gate="G$1" pin="JTAGSEL" pad="73"/>
<connect gate="G$1" pin="PA0/PWMH0/TIOA0" pad="72"/>
<connect gate="G$1" pin="PA1/PWMH1/TIOB0" pad="70"/>
<connect gate="G$1" pin="PA10/UTXD0/NPCS2" pad="46"/>
<connect gate="G$1" pin="PA11/NPCS0/PWMH0" pad="44"/>
<connect gate="G$1" pin="PA12/MISO/PWMH1" pad="48"/>
<connect gate="G$1" pin="PA13/MOSI/PWMH2" pad="27"/>
<connect gate="G$1" pin="PA14/SPCK/PWMH3" pad="34"/>
<connect gate="G$1" pin="PA15/TIOA1/PWML3/PIODCEN1" pad="33"/>
<connect gate="G$1" pin="PA16/TIOB1/PWML2/PIODCEN2" pad="30"/>
<connect gate="G$1" pin="PA17/PCK1/PWMH3/AFE0_AD0" pad="16"/>
<connect gate="G$1" pin="PA18/PCK2/AFE0_AD1" pad="15"/>
<connect gate="G$1" pin="PA19/PWML0/AFE0_AD2" pad="14"/>
<connect gate="G$1" pin="PA2/PWMH2/DATRG" pad="66"/>
<connect gate="G$1" pin="PA20/PWML1/AFE0_AD3" pad="13"/>
<connect gate="G$1" pin="PA21/RXD1/PCK1/AFE1_AD2" pad="21"/>
<connect gate="G$1" pin="PA22/TXD1/NPCS3/AFE1_AD3" pad="26"/>
<connect gate="G$1" pin="PA23/SCK1/PWMH0/PIODCCLK" pad="31"/>
<connect gate="G$1" pin="PA24/RTS1/PWMH1/PIODC0" pad="38"/>
<connect gate="G$1" pin="PA25/CTS1/PWMH2/PIODC1" pad="40"/>
<connect gate="G$1" pin="PA26/DCD1/TIOA2/MCDA2/PIODC2" pad="42"/>
<connect gate="G$1" pin="PA27/DTR1/TIOB2/MCDA3/PIODC3" pad="50"/>
<connect gate="G$1" pin="PA28/DSR1/TCLK1/MCCDA/PIODC4" pad="79"/>
<connect gate="G$1" pin="PA29/RI1/TCLK2/MCCK/PIODC5" pad="90"/>
<connect gate="G$1" pin="PA3/TWD0/NPCS3" pad="64"/>
<connect gate="G$1" pin="PA30/PWML2/NPCS2/MCDA0/PIODC6" pad="82"/>
<connect gate="G$1" pin="PA31/NPCS1/PCK2/MCDA1/PIODC7" pad="83"/>
<connect gate="G$1" pin="PA4/TWCK0/TCLK0" pad="55"/>
<connect gate="G$1" pin="PA5/NPCS3/URXD1" pad="52"/>
<connect gate="G$1" pin="PA6/PCK0/UTXD1" pad="81"/>
<connect gate="G$1" pin="PA7/PWMH3/XIN32" pad="24"/>
<connect gate="G$1" pin="PA8/AFE0_ADTRG/XOUT32" pad="25"/>
<connect gate="G$1" pin="PA9/URXD0/NPCS1/PWMFI0" pad="54"/>
<connect gate="G$1" pin="PB0/PWMH0/RXD0/AFE0_AD4/RTCOUT0" pad="12"/>
<connect gate="G$1" pin="PB1/PWMH1/TXD0/AFE0_AD5/RTCOUT1" pad="11"/>
<connect gate="G$1" pin="PB10/DDM" pad="94"/>
<connect gate="G$1" pin="PB11/DDP" pad="95"/>
<connect gate="G$1" pin="PB12/PWML1/ERASE" pad="61"/>
<connect gate="G$1" pin="PB13/PWML2/PCK0/SCK0/DAC0" pad="100"/>
<connect gate="G$1" pin="PB14/NPCS1/PWMH3/DAC1" pad="97"/>
<connect gate="G$1" pin="PB2/CANTX0/NPCS2/CTS0/AFE1_AD0" pad="17"/>
<connect gate="G$1" pin="PB3/CANRX0/PCK2/RTS0/AFE1_AD1" pad="20"/>
<connect gate="G$1" pin="PB4/TWD1/PWMH2/TDI" pad="74"/>
<connect gate="G$1" pin="PB5/TWCK1/PWML0/TDO/SWO" pad="77"/>
<connect gate="G$1" pin="PB6/TMS/SWDIO" pad="57"/>
<connect gate="G$1" pin="PB7/TCK/SWCLK" pad="63"/>
<connect gate="G$1" pin="PB8/XOUT" pad="98"/>
<connect gate="G$1" pin="PB9/XIN" pad="99"/>
<connect gate="G$1" pin="PD0/GTXCK_GREFCK" pad="1"/>
<connect gate="G$1" pin="PD1/GTXEN" pad="92"/>
<connect gate="G$1" pin="PD10/GCRS" pad="71"/>
<connect gate="G$1" pin="PD11/GRX2" pad="69"/>
<connect gate="G$1" pin="PD12/GRX3" pad="65"/>
<connect gate="G$1" pin="PD13/GCOL" pad="62"/>
<connect gate="G$1" pin="PD14/GRXCK" pad="59"/>
<connect gate="G$1" pin="PD15/GTX2" pad="75"/>
<connect gate="G$1" pin="PD16/GTX3" pad="56"/>
<connect gate="G$1" pin="PD17/GTXER" pad="53"/>
<connect gate="G$1" pin="PD18" pad="49"/>
<connect gate="G$1" pin="PD19" pad="47"/>
<connect gate="G$1" pin="PD2/GTX0" pad="91"/>
<connect gate="G$1" pin="PD20/PWMH0" pad="45"/>
<connect gate="G$1" pin="PD21/PWMH1" pad="43"/>
<connect gate="G$1" pin="PD22/PWMH2" pad="41"/>
<connect gate="G$1" pin="PD23/PWMH3" pad="39"/>
<connect gate="G$1" pin="PD24/PWML0" pad="37"/>
<connect gate="G$1" pin="PD25/PWML1" pad="35"/>
<connect gate="G$1" pin="PD26/PWML2" pad="36"/>
<connect gate="G$1" pin="PD27/PWML3" pad="32"/>
<connect gate="G$1" pin="PD28" pad="51"/>
<connect gate="G$1" pin="PD29" pad="76"/>
<connect gate="G$1" pin="PD3/GTX1" pad="89"/>
<connect gate="G$1" pin="PD30" pad="23"/>
<connect gate="G$1" pin="PD31" pad="2"/>
<connect gate="G$1" pin="PD4/GCRSDV_GRXDV" pad="88"/>
<connect gate="G$1" pin="PD5/GRX0" pad="87"/>
<connect gate="G$1" pin="PD6/GRX1" pad="85"/>
<connect gate="G$1" pin="PD7/GRXER" pad="84"/>
<connect gate="G$1" pin="PD8/GMDC" pad="80"/>
<connect gate="G$1" pin="PD9/GMDIO" pad="78"/>
<connect gate="G$1" pin="TST" pad="60"/>
<connect gate="G$1" pin="VDDCORE" pad="18 22 86"/>
<connect gate="G$1" pin="VDDIN" pad="5"/>
<connect gate="G$1" pin="VDDIO" pad="19 28 68 93"/>
<connect gate="G$1" pin="VDDOUT" pad="4"/>
<connect gate="G$1" pin="VDDPLL" pad="96"/>
</connects>
<technologies>
<technology name="16"/>
<technology name="8"/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ic-Microchip">
<packages>
<package name="SOT23-3">
<wire x1="-1.45" y1="0.65" x2="1.45" y2="0.65" width="0.127" layer="21"/>
<wire x1="1.45" y1="0.65" x2="1.45" y2="-0.65" width="0.127" layer="21"/>
<wire x1="1.45" y1="-0.65" x2="-1.45" y2="-0.65" width="0.127" layer="21"/>
<wire x1="-1.45" y1="-0.65" x2="-1.45" y2="0.65" width="0.127" layer="21"/>
<smd name="1" x="-0.95" y="-1.25" dx="0.6" dy="0.85" layer="1"/>
<smd name="2" x="0.95" y="-1.25" dx="0.6" dy="0.85" layer="1"/>
<smd name="3" x="0" y="1.25" dx="0.6" dy="0.85" layer="1"/>
<rectangle x1="-0.2" y1="0.65" x2="0.2" y2="1.2" layer="51"/>
<text x="-1.7" y="-2" size="0.8" layer="25" font="vector" ratio="18" rot="R90">&gt;NAME</text>
<text x="2.5" y="-2" size="0.8" layer="27" font="vector" ratio="18" rot="R90">&gt;VALUE</text>
<rectangle x1="-1.15" y1="-1.2" x2="-0.75" y2="-0.65" layer="51"/>
<rectangle x1="0.75" y1="-1.2" x2="1.15" y2="-0.65" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="REGULATOR">
<wire x1="-7.62" y1="5.08" x2="-7.62" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-5.08" x2="7.62" y2="-5.08" width="0.254" layer="94"/>
<wire x1="7.62" y1="-5.08" x2="7.62" y2="5.08" width="0.254" layer="94"/>
<wire x1="7.62" y1="5.08" x2="-7.62" y2="5.08" width="0.254" layer="94"/>
<text x="-7.62" y="8.128" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-7.62" y="5.588" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="GND" x="0" y="-7.62" length="short" rot="R90"/>
<pin name="VI" x="-10.16" y="2.54" length="short"/>
<pin name="VO" x="10.16" y="2.54" length="short" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="MCP1754ST-*" prefix="U">
<gates>
<gate name="G$1" symbol="REGULATOR" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SOT23-3">
<connects>
<connect gate="G$1" pin="GND" pad="1"/>
<connect gate="G$1" pin="VI" pad="3"/>
<connect gate="G$1" pin="VO" pad="2"/>
</connects>
<technologies>
<technology name="18"/>
<technology name="25"/>
<technology name="33"/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ic-AD">
<description>Analog Devices</description>
<packages>
<package name="SC70-3">
<wire x1="-1" y1="0.625" x2="1" y2="0.625" width="0.127" layer="21"/>
<wire x1="1" y1="0.625" x2="1" y2="-0.625" width="0.127" layer="21"/>
<wire x1="1" y1="-0.625" x2="-1" y2="-0.625" width="0.127" layer="21"/>
<wire x1="-1" y1="-0.625" x2="-1" y2="0.625" width="0.127" layer="21"/>
<smd name="3" x="0" y="1.15" dx="0.3" dy="0.7" layer="1"/>
<smd name="1" x="-0.65" y="-1.15" dx="0.3" dy="0.7" layer="1" rot="R180"/>
<smd name="2" x="0.65" y="-1.15" dx="0.3" dy="0.7" layer="1" rot="R180"/>
<rectangle x1="-0.1125" y1="0.625" x2="0.1125" y2="1.05" layer="51"/>
<rectangle x1="-0.7625" y1="-1.05" x2="-0.5375" y2="-0.625" layer="51" rot="R180"/>
<rectangle x1="0.5375" y1="-1.05" x2="0.7625" y2="-0.625" layer="51" rot="R180"/>
<text x="-1.5" y="-1" size="0.8" layer="25" font="vector" ratio="18" rot="R90">&gt;NAME</text>
<text x="2" y="-2" size="0.8" layer="27" font="vector" ratio="18" rot="R90">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="SHUNT-REGULATOR-2">
<wire x1="1.27" y1="-1.27" x2="0" y2="1.27" width="0.254" layer="94"/>
<wire x1="0" y1="1.27" x2="-0.635" y2="0" width="0.254" layer="94"/>
<wire x1="-0.635" y1="0" x2="-1.27" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-1.27" y1="1.27" x2="0" y2="1.27" width="0.254" layer="94"/>
<wire x1="-1.27" y1="-1.27" x2="1.27" y2="-1.27" width="0.254" layer="94"/>
<wire x1="0" y1="1.27" x2="1.27" y2="1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="1.27" x2="1.651" y2="1.651" width="0.254" layer="94"/>
<wire x1="-1.27" y1="1.27" x2="-1.651" y2="0.889" width="0.254" layer="94"/>
<text x="2.54" y="0" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="2.54" y="-2.54" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="A" x="0" y="-2.54" visible="pad" length="point" direction="pas" rot="R90"/>
<pin name="K" x="0" y="2.54" visible="pad" length="point" direction="pas" rot="R270"/>
<wire x1="0" y1="-2.54" x2="0" y2="2.54" width="0.1524" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="ADR504*" prefix="U">
<gates>
<gate name="G$1" symbol="SHUNT-REGULATOR-2" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SC70-3">
<connects>
<connect gate="G$1" pin="A" pad="2"/>
<connect gate="G$1" pin="K" pad="1"/>
</connects>
<technologies>
<technology name="0"/>
<technology name="1"/>
<technology name="3"/>
<technology name="4"/>
<technology name="5"/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="Oscillator">
<description>Oscillator</description>
<packages>
<package name="OSC2520">
<wire x1="-1.25" y1="1" x2="-0.25" y2="1" width="0.127" layer="51"/>
<wire x1="-0.25" y1="1" x2="0.25" y2="1" width="0.127" layer="21"/>
<wire x1="0.25" y1="1" x2="1.25" y2="1" width="0.127" layer="51"/>
<wire x1="1.25" y1="-1" x2="0.25" y2="-1" width="0.127" layer="51"/>
<wire x1="0.25" y1="-1" x2="-0.25" y2="-1" width="0.127" layer="21"/>
<wire x1="-0.25" y1="-1" x2="-1.25" y2="-1" width="0.127" layer="51"/>
<wire x1="-1.25" y1="1" x2="-1.25" y2="0.15" width="0.127" layer="51"/>
<wire x1="-1.25" y1="-1" x2="-1.25" y2="-0.15" width="0.127" layer="51"/>
<wire x1="1.25" y1="-1" x2="1.25" y2="-0.15" width="0.127" layer="51"/>
<wire x1="1.25" y1="1" x2="1.25" y2="0.15" width="0.127" layer="51"/>
<wire x1="1.25" y1="0.15" x2="1.25" y2="-0.15" width="0.127" layer="21"/>
<wire x1="-1.25" y1="0.15" x2="-1.25" y2="-0.15" width="0.127" layer="21"/>
<circle x="-0.15" y="-0.7" radius="0.1" width="0.127" layer="21"/>
<smd name="1" x="-0.825" y="-0.85" dx="0.8" dy="1" layer="1"/>
<smd name="2" x="0.825" y="-0.85" dx="0.8" dy="1" layer="1"/>
<smd name="3" x="0.825" y="0.85" dx="0.8" dy="1" layer="1"/>
<smd name="4" x="-0.825" y="0.85" dx="0.8" dy="1" layer="1"/>
<text x="-1.5" y="-1" size="0.8" layer="25" font="vector" ratio="18" rot="R90">&gt;NAME</text>
<text x="2.5" y="-2" size="0.8" layer="27" font="vector" ratio="18" rot="R90">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="OSCILLATOR-EN">
<wire x1="-5.08" y1="5.08" x2="-5.08" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-7.62" x2="5.08" y2="-7.62" width="0.254" layer="94"/>
<wire x1="5.08" y1="-7.62" x2="5.08" y2="5.08" width="0.254" layer="94"/>
<wire x1="5.08" y1="5.08" x2="-5.08" y2="5.08" width="0.254" layer="94"/>
<text x="-5.08" y="5.588" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-5.08" y="-10.16" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="VDD" x="-7.62" y="2.54" length="short"/>
<pin name="GND" x="-7.62" y="-5.08" length="short"/>
<pin name="OUT" x="7.62" y="-2.54" length="short" rot="R180"/>
<pin name="EN" x="-7.62" y="0" length="short"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="ASDM" prefix="X" uservalue="yes">
<gates>
<gate name="G$1" symbol="OSCILLATOR-EN" x="0" y="0"/>
</gates>
<devices>
<device name="" package="OSC2520">
<connects>
<connect gate="G$1" pin="EN" pad="1"/>
<connect gate="G$1" pin="GND" pad="2"/>
<connect gate="G$1" pin="OUT" pad="3"/>
<connect gate="G$1" pin="VDD" pad="4"/>
</connects>
<technologies>
<technology name=""/>
<technology name="B"/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="Connector">
<packages>
<package name="PIN2X5-SMT1.27">
<text x="-5" y="-2" size="1" layer="25" font="vector" ratio="15" rot="R90">&gt;NAME</text>
<text x="-4" y="-2" size="1" layer="27" font="vector" ratio="15" rot="R90">&gt;VALUE</text>
<wire x1="-3.175" y1="1.715" x2="-3.1" y2="1.715" width="0.127" layer="21"/>
<wire x1="3.1" y1="1.715" x2="3.175" y2="1.715" width="0.127" layer="21"/>
<wire x1="3.175" y1="1.715" x2="3.175" y2="-1.715" width="0.127" layer="21"/>
<wire x1="-3.175" y1="-1.715" x2="-3.175" y2="1.715" width="0.127" layer="21"/>
<rectangle x1="-0.2" y1="0.435" x2="0.2" y2="2.75" layer="51"/>
<rectangle x1="-1.47" y1="0.435" x2="-1.07" y2="2.75" layer="51"/>
<rectangle x1="-2.74" y1="0.435" x2="-2.34" y2="2.75" layer="51"/>
<rectangle x1="1.07" y1="0.435" x2="1.47" y2="2.75" layer="51"/>
<rectangle x1="2.34" y1="0.435" x2="2.74" y2="2.75" layer="51"/>
<rectangle x1="-0.2" y1="-2.75" x2="0.2" y2="-0.435" layer="51" rot="R180"/>
<rectangle x1="1.07" y1="-2.75" x2="1.47" y2="-0.435" layer="51" rot="R180"/>
<rectangle x1="2.34" y1="-2.75" x2="2.74" y2="-0.435" layer="51" rot="R180"/>
<rectangle x1="-1.47" y1="-2.75" x2="-1.07" y2="-0.435" layer="51" rot="R180"/>
<rectangle x1="-2.74" y1="-2.75" x2="-2.34" y2="-0.435" layer="51" rot="R180"/>
<smd name="1" x="-2.54" y="-2.1" dx="0.7" dy="2.4" layer="1"/>
<smd name="2" x="-2.54" y="2.1" dx="0.7" dy="2.4" layer="1"/>
<smd name="3" x="-1.27" y="-2.1" dx="0.7" dy="2.4" layer="1"/>
<smd name="4" x="-1.27" y="2.1" dx="0.7" dy="2.4" layer="1"/>
<smd name="5" x="0" y="-2.1" dx="0.7" dy="2.4" layer="1"/>
<smd name="6" x="0" y="2.1" dx="0.7" dy="2.4" layer="1"/>
<smd name="7" x="1.27" y="-2.1" dx="0.7" dy="2.4" layer="1"/>
<smd name="8" x="1.27" y="2.1" dx="0.7" dy="2.4" layer="1"/>
<smd name="9" x="2.54" y="-2.1" dx="0.7" dy="2.4" layer="1"/>
<smd name="10" x="2.54" y="2.1" dx="0.7" dy="2.4" layer="1"/>
<wire x1="-3.175" y1="-1.715" x2="-3.1" y2="-1.715" width="0.127" layer="21"/>
<wire x1="3.175" y1="-1.715" x2="3.1" y2="-1.715" width="0.127" layer="21"/>
<wire x1="-3.1" y1="1.715" x2="3.1" y2="1.715" width="0.127" layer="51"/>
<wire x1="-3.1" y1="-1.715" x2="3.1" y2="-1.715" width="0.127" layer="51"/>
<polygon width="0.127" layer="21">
<vertex x="-3.5" y="-2.2"/>
<vertex x="-3.5" y="-2.8"/>
<vertex x="-3.2" y="-2.5"/>
</polygon>
</package>
</packages>
<symbols>
<symbol name="CN-NXP-JTAG">
<wire x1="-12.7" y1="7.62" x2="-12.7" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-12.7" y1="-7.62" x2="12.7" y2="-7.62" width="0.254" layer="94"/>
<wire x1="12.7" y1="-7.62" x2="12.7" y2="7.62" width="0.254" layer="94"/>
<wire x1="12.7" y1="7.62" x2="-12.7" y2="7.62" width="0.254" layer="94"/>
<text x="-12.7" y="8.128" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="-12.7" y="-10.16" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="TCK/SWCLK" x="-15.24" y="5.08" length="short" direction="pas"/>
<pin name="GND@0" x="15.24" y="0" length="short" direction="pas" rot="R180"/>
<pin name="TDO/SWO" x="-15.24" y="0" length="short" direction="pas"/>
<pin name="VREF" x="15.24" y="5.08" length="short" direction="pas" rot="R180"/>
<pin name="TMS/SDCIO" x="-15.24" y="2.54" length="short" direction="pas"/>
<pin name="TDI" x="-15.24" y="-2.54" length="short" direction="pas"/>
<pin name="GND@1" x="15.24" y="-2.54" length="short" direction="pas" rot="R180"/>
<pin name="!RESET" x="-15.24" y="-5.08" length="short" direction="pas"/>
<pin name="GND@2" x="15.24" y="-5.08" length="short" direction="pas" rot="R180"/>
<pin name="RTCK" x="15.24" y="2.54" length="short" direction="pas" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="CN-NXP-JTAG" prefix="CN">
<gates>
<gate name="G$1" symbol="CN-NXP-JTAG" x="0" y="0"/>
</gates>
<devices>
<device name="" package="PIN2X5-SMT1.27">
<connects>
<connect gate="G$1" pin="!RESET" pad="10"/>
<connect gate="G$1" pin="GND@0" pad="3"/>
<connect gate="G$1" pin="GND@1" pad="5"/>
<connect gate="G$1" pin="GND@2" pad="9"/>
<connect gate="G$1" pin="RTCK" pad="7"/>
<connect gate="G$1" pin="TCK/SWCLK" pad="4"/>
<connect gate="G$1" pin="TDI" pad="8"/>
<connect gate="G$1" pin="TDO/SWO" pad="6"/>
<connect gate="G$1" pin="TMS/SDCIO" pad="2"/>
<connect gate="G$1" pin="VREF" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="Transistor">
<packages>
<package name="SOT23-3">
<wire x1="-1.45" y1="0.6" x2="1.45" y2="0.6" width="0.127" layer="21"/>
<wire x1="1.45" y1="0.6" x2="1.45" y2="-0.6" width="0.127" layer="21"/>
<wire x1="1.45" y1="-0.6" x2="-1.45" y2="-0.6" width="0.127" layer="21"/>
<wire x1="-1.45" y1="-0.6" x2="-1.45" y2="0.6" width="0.127" layer="21"/>
<smd name="1" x="-0.95" y="-1.2" dx="0.6" dy="0.8" layer="1"/>
<smd name="2" x="0.95" y="-1.2" dx="0.6" dy="0.8" layer="1"/>
<smd name="3" x="0" y="1.2" dx="0.6" dy="0.8" layer="1"/>
<rectangle x1="-1.15" y1="-1.25" x2="-0.75" y2="-0.65" layer="51" rot="R180"/>
<rectangle x1="0.75" y1="-1.25" x2="1.15" y2="-0.65" layer="51" rot="R180"/>
<rectangle x1="-0.2" y1="0.65" x2="0.2" y2="1.25" layer="51"/>
<text x="-1.7" y="-2" size="0.8" layer="25" font="vector" ratio="18" rot="R90">&gt;NAME</text>
<text x="2.5" y="-2" size="0.8" layer="27" font="vector" ratio="18" rot="R90">&gt;VALUE</text>
</package>
<package name="SOT323-3">
<wire x1="-1" y1="0.625" x2="1" y2="0.625" width="0.127" layer="21"/>
<wire x1="1" y1="0.625" x2="1" y2="-0.625" width="0.127" layer="21"/>
<wire x1="1" y1="-0.625" x2="-1" y2="-0.625" width="0.127" layer="21"/>
<wire x1="-1" y1="-0.625" x2="-1" y2="0.625" width="0.127" layer="21"/>
<smd name="1" x="-0.65" y="-1.1" dx="0.4" dy="0.6" layer="1"/>
<smd name="2" x="0.65" y="-1.1" dx="0.4" dy="0.6" layer="1"/>
<smd name="3" x="0" y="1.1" dx="0.4" dy="0.6" layer="1" rot="R180"/>
<rectangle x1="-0.8" y1="-1.05" x2="-0.5" y2="-0.625" layer="51"/>
<rectangle x1="0.5" y1="-1.05" x2="0.8" y2="-0.625" layer="51"/>
<rectangle x1="-0.15" y1="0.625" x2="0.15" y2="1.05" layer="51" rot="R180"/>
<text x="-1.2" y="-1" size="0.8" layer="25" font="vector" ratio="18" rot="R90">&gt;NAME</text>
<text x="2" y="-2" size="0.8" layer="27" font="vector" ratio="18" rot="R90">&gt;VALUE</text>
</package>
<package name="SOT89-3">
<wire x1="2.25" y1="1.25" x2="2.25" y2="-1.25" width="0.127" layer="21"/>
<wire x1="-2.25" y1="-1.25" x2="-2.25" y2="1.25" width="0.127" layer="21"/>
<smd name="1" x="-1.5" y="-2.05" dx="0.6" dy="1.2" layer="1"/>
<smd name="2" x="0" y="-0.25" dx="1.8" dy="4.8" layer="1"/>
<smd name="3" x="1.5" y="-2.05" dx="0.6" dy="1.2" layer="1"/>
<rectangle x1="-1.71" y1="-2.25" x2="-1.29" y2="-1.25" layer="51"/>
<rectangle x1="1.29" y1="-2.25" x2="1.71" y2="-1.25" layer="51"/>
<rectangle x1="-0.235" y1="-2.25" x2="0.235" y2="-1.25" layer="51"/>
<rectangle x1="-0.8" y1="1.25" x2="0.8" y2="1.75" layer="51"/>
<wire x1="-2.25" y1="-1.25" x2="-1.05" y2="-1.25" width="0.127" layer="21"/>
<wire x1="2.25" y1="-1.25" x2="1.05" y2="-1.25" width="0.127" layer="21"/>
<wire x1="2.25" y1="1.25" x2="1.05" y2="1.25" width="0.127" layer="21"/>
<wire x1="-2.25" y1="1.25" x2="-1.05" y2="1.25" width="0.127" layer="21"/>
<wire x1="-1.05" y1="1.25" x2="1.05" y2="1.25" width="0.127" layer="51"/>
<wire x1="-1.05" y1="-1.25" x2="1.05" y2="-1.25" width="0.127" layer="51"/>
<text x="-3" y="-1" size="1" layer="25" font="vector" ratio="15" rot="R90">&gt;NAME</text>
<text x="4" y="-3" size="1" layer="27" font="vector" ratio="15" rot="R90">&gt;VALUE</text>
</package>
<package name="SON8_1.27">
<wire x1="-2.45" y1="2.875" x2="2.45" y2="2.875" width="0.127" layer="21"/>
<wire x1="2.45" y1="2.875" x2="2.45" y2="-2.875" width="0.127" layer="21"/>
<wire x1="-2.45" y1="2.875" x2="-2.45" y2="-2.875" width="0.127" layer="21"/>
<wire x1="-2.45" y1="-2.875" x2="2.45" y2="-2.875" width="0.127" layer="21"/>
<circle x="-1.9" y="-1.8" radius="0.2" width="0.127" layer="21"/>
<smd name="1" x="-1.905" y="-3" dx="0.48" dy="1.2" layer="1"/>
<rectangle x1="-2.11" y1="-3" x2="-1.7" y2="-2.4" layer="51"/>
<smd name="2" x="-0.635" y="-3" dx="0.48" dy="1.2" layer="1"/>
<rectangle x1="-0.84" y1="-3" x2="-0.43" y2="-2.4" layer="51"/>
<smd name="3" x="0.635" y="-3" dx="0.48" dy="1.2" layer="1"/>
<rectangle x1="0.43" y1="-3" x2="0.84" y2="-2.4" layer="51"/>
<smd name="4" x="1.905" y="-3" dx="0.48" dy="1.2" layer="1"/>
<rectangle x1="1.7" y1="-3" x2="2.11" y2="-2.4" layer="51"/>
<smd name="5" x="1.905" y="3" dx="0.48" dy="1.2" layer="1" rot="R180"/>
<rectangle x1="1.7" y1="2.4" x2="2.11" y2="3" layer="51" rot="R180"/>
<smd name="6" x="0.635" y="3" dx="0.48" dy="1.2" layer="1" rot="R180"/>
<rectangle x1="0.43" y1="2.4" x2="0.84" y2="3" layer="51" rot="R180"/>
<smd name="7" x="-0.635" y="3" dx="0.48" dy="1.2" layer="1" rot="R180"/>
<rectangle x1="-0.84" y1="2.4" x2="-0.43" y2="3" layer="51" rot="R180"/>
<smd name="8" x="-1.905" y="3" dx="0.48" dy="1.2" layer="1" rot="R180"/>
<rectangle x1="-2.11" y1="2.4" x2="-1.7" y2="3" layer="51" rot="R180"/>
<wire x1="-2.45" y1="-1.18" x2="2.45" y2="-1.18" width="0.127" layer="51"/>
<text x="-3" y="-3" size="1" layer="25" font="vector" ratio="15" rot="R90">&gt;NAME</text>
<text x="4" y="-3" size="1" layer="27" font="vector" ratio="15" rot="R90">&gt;VALUE</text>
</package>
<package name="SOP8">
<wire x1="-2.45" y1="1.95" x2="2.45" y2="1.95" width="0.127" layer="21"/>
<wire x1="2.45" y1="1.95" x2="2.45" y2="-1.95" width="0.127" layer="21"/>
<wire x1="-2.45" y1="1.95" x2="-2.45" y2="-1.95" width="0.127" layer="21"/>
<wire x1="-2.45" y1="-1.95" x2="2.45" y2="-1.95" width="0.127" layer="21"/>
<circle x="-2" y="-1.5" radius="0.2" width="0.127" layer="21"/>
<smd name="2" x="-0.635" y="-2.9" dx="0.48" dy="1.4" layer="1"/>
<smd name="7" x="-0.635" y="2.9" dx="0.48" dy="1.4" layer="1"/>
<smd name="1" x="-1.905" y="-2.9" dx="0.48" dy="1.4" layer="1"/>
<smd name="3" x="0.635" y="-2.9" dx="0.48" dy="1.4" layer="1"/>
<smd name="4" x="1.905" y="-2.9" dx="0.48" dy="1.4" layer="1"/>
<smd name="8" x="-1.905" y="2.9" dx="0.48" dy="1.4" layer="1"/>
<smd name="6" x="0.635" y="2.9" dx="0.48" dy="1.4" layer="1"/>
<smd name="5" x="1.905" y="2.9" dx="0.48" dy="1.4" layer="1"/>
<text x="-2" y="0.5" size="1" layer="25" font="vector" ratio="15">&gt;NAME</text>
<text x="-2" y="-1" size="1" layer="27" font="vector" ratio="15">&gt;VALUE</text>
<rectangle x1="1.7" y1="1.95" x2="2.11" y2="2.95" layer="51"/>
<rectangle x1="0.43" y1="1.95" x2="0.84" y2="2.95" layer="51"/>
<rectangle x1="-0.84" y1="1.95" x2="-0.43" y2="2.95" layer="51"/>
<rectangle x1="-2.11" y1="1.95" x2="-1.7" y2="2.95" layer="51"/>
<rectangle x1="1.7" y1="-2.95" x2="2.11" y2="-1.95" layer="51"/>
<rectangle x1="0.43" y1="-2.95" x2="0.84" y2="-1.95" layer="51"/>
<rectangle x1="-0.84" y1="-2.95" x2="-0.43" y2="-1.95" layer="51"/>
<rectangle x1="-2.11" y1="-2.95" x2="-1.7" y2="-1.95" layer="51"/>
</package>
<package name="TO-220F">
<pad name="1" x="-2.54" y="0" drill="1.3" diameter="1.9"/>
<pad name="2" x="0" y="0" drill="1.3" diameter="1.9"/>
<pad name="3" x="2.54" y="0" drill="1.3" diameter="1.9"/>
<wire x1="-4.7" y1="-1.7" x2="4.7" y2="-1.7" width="0.127" layer="21"/>
<wire x1="-5.08" y1="3.01" x2="5.08" y2="3.01" width="0.127" layer="21"/>
<wire x1="5.08" y1="3.01" x2="5.08" y2="2.31" width="0.127" layer="21"/>
<wire x1="-5.08" y1="2.31" x2="-5.08" y2="3.01" width="0.127" layer="21"/>
<wire x1="-4.7" y1="-1.7" x2="-5.08" y2="2.31" width="0.127" layer="21"/>
<wire x1="4.7" y1="-1.7" x2="5.08" y2="2.31" width="0.127" layer="21"/>
<wire x1="-4.9" y1="0.47" x2="4.9" y2="0.47" width="0.127" layer="51"/>
<wire x1="-5.08" y1="2.31" x2="5.08" y2="2.31" width="0.127" layer="51"/>
<text x="-5" y="5.5" size="1" layer="25" font="vector" ratio="15">&gt;NAME</text>
<text x="-5" y="4" size="1" layer="27" font="vector" ratio="15">&gt;VALUE</text>
</package>
<package name="D2PAK-3">
<wire x1="-5.08" y1="9.017" x2="-5.08" y2="3" width="0.127" layer="51"/>
<wire x1="-5.08" y1="3" x2="-5.08" y2="0" width="0.127" layer="21"/>
<wire x1="5.08" y1="0" x2="5.08" y2="3" width="0.127" layer="21"/>
<wire x1="5.08" y1="3" x2="5.08" y2="9.017" width="0.127" layer="51"/>
<wire x1="5.08" y1="9.017" x2="-5.08" y2="9.017" width="0.127" layer="51"/>
<wire x1="5.08" y1="0" x2="-5.08" y2="0" width="0.127" layer="21"/>
<smd name="1" x="-2.54" y="-3.175" dx="2" dy="4" layer="1"/>
<smd name="3" x="2.54" y="-3.175" dx="2" dy="4" layer="1"/>
<rectangle x1="1.905" y1="-4.572" x2="3.175" y2="0" layer="51"/>
<rectangle x1="-3.175" y1="-4.572" x2="-1.905" y2="0" layer="51"/>
<polygon width="0.127" layer="51">
<vertex x="-5.08" y="9.017"/>
<vertex x="-5.08" y="10.795"/>
<vertex x="-3.81" y="11.43"/>
<vertex x="3.81" y="11.43"/>
<vertex x="5.08" y="10.795"/>
<vertex x="5.08" y="9.017"/>
</polygon>
<rectangle x1="-0.635" y1="-1.778" x2="0.635" y2="0" layer="51"/>
<smd name="4" x="0" y="7.7" dx="11" dy="9" layer="1"/>
<text x="-4" y="2" size="1" layer="25" font="vector" ratio="15">&gt;NAME</text>
<text x="-4" y="0.5" size="1" layer="27" font="vector" ratio="15">&gt;VALUE</text>
</package>
<package name="DPAK-3">
<wire x1="-3.3" y1="6.1" x2="-3.3" y2="0" width="0.127" layer="21"/>
<wire x1="3.3" y1="0" x2="3.3" y2="6.1" width="0.127" layer="21"/>
<wire x1="3.3" y1="0" x2="-3.3" y2="0" width="0.127" layer="21"/>
<smd name="1" x="-2.3" y="-2" dx="1.4" dy="3" layer="1"/>
<smd name="3" x="2.3" y="-2" dx="1.4" dy="3" layer="1"/>
<rectangle x1="1.9" y1="-2.8" x2="2.7" y2="0" layer="51"/>
<rectangle x1="-2.7" y1="-2.8" x2="-1.9" y2="0" layer="51"/>
<rectangle x1="-0.4" y1="-1" x2="0.4" y2="0" layer="51"/>
<smd name="4" x="0" y="5" dx="5.8" dy="6" layer="1"/>
<polygon width="0.127" layer="51">
<vertex x="-2.65" y="6.1"/>
<vertex x="2.65" y="6.1"/>
<vertex x="2.65" y="6.85"/>
<vertex x="2" y="7.18"/>
<vertex x="-2" y="7.18"/>
<vertex x="-2.65" y="6.85"/>
</polygon>
<wire x1="-3.3" y1="6.1" x2="3.3" y2="6.1" width="0.127" layer="51"/>
<text x="-4" y="0" size="1" layer="25" font="vector" ratio="15" rot="R90">&gt;NAME</text>
<text x="5" y="0" size="1" layer="27" font="vector" ratio="15" rot="R90">&gt;VALUE</text>
</package>
<package name="SOT223">
<wire x1="-3.25" y1="1.75" x2="3.25" y2="1.75" width="0.127" layer="21"/>
<wire x1="3.25" y1="1.75" x2="3.25" y2="-1.75" width="0.127" layer="21"/>
<wire x1="3.25" y1="-1.75" x2="-3.25" y2="-1.75" width="0.127" layer="21"/>
<wire x1="-3.25" y1="-1.75" x2="-3.25" y2="1.75" width="0.127" layer="21"/>
<smd name="1" x="-2.3" y="-3.2" dx="1.1" dy="1.8" layer="1"/>
<smd name="2" x="0" y="-3.2" dx="1.1" dy="1.8" layer="1"/>
<smd name="3" x="2.3" y="-3.2" dx="1.1" dy="1.8" layer="1"/>
<rectangle x1="-2.67" y1="-3.55" x2="-1.93" y2="-1.75" layer="51"/>
<text x="-3.7" y="-2" size="1" layer="25" font="vector" ratio="15" rot="R90">&gt;NAME</text>
<text x="4.5" y="-2" size="1" layer="27" font="vector" ratio="15" rot="R90">&gt;VALUE</text>
<rectangle x1="-0.37" y1="-3.55" x2="0.37" y2="-1.75" layer="51"/>
<rectangle x1="1.93" y1="-3.55" x2="2.67" y2="-1.75" layer="51"/>
<rectangle x1="-1.5" y1="1.75" x2="1.5" y2="3.55" layer="51"/>
<smd name="4" x="0" y="3.2" dx="4" dy="1.8" layer="1"/>
</package>
</packages>
<symbols>
<symbol name="N-MOSFET">
<wire x1="-5.08" y1="-2.54" x2="-3.7592" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="0.762" x2="-2.54" y2="0" width="0.254" layer="94"/>
<wire x1="-2.54" y1="0" x2="-2.54" y2="-0.762" width="0.254" layer="94"/>
<wire x1="-2.54" y1="3.683" x2="-2.54" y2="2.54" width="0.254" layer="94"/>
<wire x1="-2.54" y1="2.54" x2="-2.54" y2="1.397" width="0.254" layer="94"/>
<wire x1="-2.54" y1="0" x2="0" y2="0" width="0.1524" layer="94"/>
<wire x1="0" y1="0" x2="0" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="-1.397" x2="-2.54" y2="-2.54" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-2.54" x2="-2.54" y2="-3.683" width="0.254" layer="94"/>
<wire x1="-3.683" y1="2.54" x2="-3.683" y2="-2.54" width="0.254" layer="94"/>
<wire x1="0" y1="-2.54" x2="-2.54" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="1.27" y1="2.54" x2="1.27" y2="0.254" width="0.1524" layer="94"/>
<wire x1="1.27" y1="0.254" x2="1.27" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="0" y1="-2.54" x2="1.27" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="2.54" x2="1.27" y2="2.54" width="0.1524" layer="94"/>
<wire x1="2.032" y1="0.508" x2="1.778" y2="0.254" width="0.1524" layer="94"/>
<wire x1="1.778" y1="0.254" x2="1.27" y2="0.254" width="0.1524" layer="94"/>
<wire x1="1.27" y1="0.254" x2="0.762" y2="0.254" width="0.1524" layer="94"/>
<wire x1="0.762" y1="0.254" x2="0.508" y2="0" width="0.1524" layer="94"/>
<circle x="0" y="-2.54" radius="0.3592" width="0" layer="94"/>
<circle x="0" y="2.54" radius="0.3592" width="0" layer="94"/>
<text x="2.54" y="-2.54" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<text x="2.54" y="0" size="1.778" layer="95" font="vector">&gt;NAME</text>
<pin name="S" x="0" y="-5.08" visible="pad" length="short" direction="pas" rot="R90"/>
<pin name="G" x="-5.08" y="-2.54" visible="pad" length="point" direction="pas"/>
<pin name="D" x="0" y="5.08" visible="pad" length="short" direction="pas" rot="R270"/>
<polygon width="0.1524" layer="94">
<vertex x="1.27" y="0.254"/>
<vertex x="0.762" y="-0.508"/>
<vertex x="1.778" y="-0.508"/>
</polygon>
<polygon width="0.1524" layer="94">
<vertex x="-2.286" y="0"/>
<vertex x="-1.27" y="0.762"/>
<vertex x="-1.27" y="-0.762"/>
</polygon>
</symbol>
</symbols>
<devicesets>
<deviceset name="MOS-N-*" prefix="Q" uservalue="yes">
<gates>
<gate name="G$1" symbol="N-MOSFET" x="0" y="0"/>
</gates>
<devices>
<device name="SOT23" package="SOT23-3">
<connects>
<connect gate="G$1" pin="D" pad="3"/>
<connect gate="G$1" pin="G" pad="1"/>
<connect gate="G$1" pin="S" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SOT323" package="SOT323-3">
<connects>
<connect gate="G$1" pin="D" pad="3"/>
<connect gate="G$1" pin="G" pad="1"/>
<connect gate="G$1" pin="S" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SOT89" package="SOT89-3">
<connects>
<connect gate="G$1" pin="D" pad="2"/>
<connect gate="G$1" pin="G" pad="1"/>
<connect gate="G$1" pin="S" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SON8" package="SON8_1.27">
<connects>
<connect gate="G$1" pin="D" pad="5 6 7 8"/>
<connect gate="G$1" pin="G" pad="4"/>
<connect gate="G$1" pin="S" pad="1 2 3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SOP8" package="SOP8">
<connects>
<connect gate="G$1" pin="D" pad="5 6 7 8"/>
<connect gate="G$1" pin="G" pad="4"/>
<connect gate="G$1" pin="S" pad="1 2 3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TO-220F" package="TO-220F">
<connects>
<connect gate="G$1" pin="D" pad="2"/>
<connect gate="G$1" pin="G" pad="1"/>
<connect gate="G$1" pin="S" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="D2PAK" package="D2PAK-3">
<connects>
<connect gate="G$1" pin="D" pad="4"/>
<connect gate="G$1" pin="G" pad="1"/>
<connect gate="G$1" pin="S" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="DPAK" package="DPAK-3">
<connects>
<connect gate="G$1" pin="D" pad="4"/>
<connect gate="G$1" pin="G" pad="1"/>
<connect gate="G$1" pin="S" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SOT223" package="SOT223">
<connects>
<connect gate="G$1" pin="D" pad="2 4"/>
<connect gate="G$1" pin="G" pad="1"/>
<connect gate="G$1" pin="S" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="Opto">
<packages>
<package name="1608">
<wire x1="1.35" y1="0.6" x2="1.35" y2="-0.6" width="0.127" layer="21"/>
<wire x1="-1.35" y1="-0.6" x2="-1.35" y2="0.6" width="0.127" layer="21"/>
<wire x1="-1.35" y1="0.6" x2="1.35" y2="0.6" width="0.127" layer="21"/>
<wire x1="1.35" y1="-0.6" x2="-1.35" y2="-0.6" width="0.127" layer="21"/>
<smd name="K" x="-0.75" y="0" dx="0.7" dy="0.8" layer="1"/>
<smd name="A" x="0.75" y="0" dx="0.7" dy="0.8" layer="1"/>
<rectangle x1="-0.8" y1="-0.4" x2="-0.4" y2="0.4" layer="51"/>
<rectangle x1="0.4" y1="-0.4" x2="0.8" y2="0.4" layer="51"/>
<rectangle x1="-0.4" y1="0.25" x2="0.4" y2="0.4" layer="51"/>
<rectangle x1="-0.4" y1="-0.4" x2="0.4" y2="-0.25" layer="51"/>
<wire x1="0.2" y1="0" x2="-0.2" y2="0" width="0.127" layer="21"/>
<wire x1="-0.2" y1="0" x2="0" y2="0.2" width="0.127" layer="21"/>
<wire x1="-0.2" y1="0" x2="0" y2="-0.2" width="0.127" layer="21"/>
<text x="-1.4" y="0.8" size="0.8" layer="25" font="vector" ratio="18">&gt;NAME</text>
<text x="-1.4" y="-1.6" size="0.8" layer="27" font="vector" ratio="18">&gt;VALUE</text>
</package>
<package name="1611">
<wire x1="1.35" y1="0.6" x2="1.35" y2="-0.6" width="0.127" layer="21"/>
<wire x1="-1.35" y1="-0.6" x2="-1.35" y2="0.6" width="0.127" layer="21"/>
<wire x1="-1.35" y1="0.6" x2="1.35" y2="0.6" width="0.127" layer="21"/>
<wire x1="1.35" y1="-0.6" x2="-1.35" y2="-0.6" width="0.127" layer="21"/>
<smd name="K" x="-0.8" y="0" dx="0.7" dy="0.8" layer="1"/>
<smd name="A" x="0.8" y="0" dx="0.7" dy="0.8" layer="1"/>
<rectangle x1="-0.8" y1="-0.3" x2="-0.45" y2="0.3" layer="51"/>
<rectangle x1="0.45" y1="-0.3" x2="0.8" y2="0.3" layer="51"/>
<rectangle x1="-0.45" y1="-0.3" x2="0.45" y2="-0.15" layer="51"/>
<wire x1="0.2" y1="0" x2="-0.2" y2="0" width="0.127" layer="21"/>
<wire x1="-0.2" y1="0" x2="0" y2="0.2" width="0.127" layer="21"/>
<wire x1="-0.2" y1="0" x2="0" y2="-0.2" width="0.127" layer="21"/>
<polygon width="0" layer="51">
<vertex x="-0.6" y="0.3"/>
<vertex x="-0.55" y="0.9"/>
<vertex x="0.55" y="0.9"/>
<vertex x="0.6" y="0.3"/>
</polygon>
<rectangle x1="-0.45" y1="0.15" x2="0.45" y2="0.3" layer="51"/>
<text x="-1.4" y="0.8" size="0.8" layer="25" font="vector" ratio="18">&gt;NAME</text>
<text x="-1.4" y="-1.6" size="0.8" layer="27" font="vector" ratio="18">&gt;VALUE</text>
</package>
<package name="2012">
<wire x1="1.7" y1="0.85" x2="1.7" y2="-0.85" width="0.127" layer="21"/>
<smd name="K" x="-1.125" y="0" dx="0.75" dy="1.25" layer="1"/>
<smd name="A" x="1.125" y="0" dx="0.75" dy="1.25" layer="1"/>
<rectangle x1="-1" y1="-0.625" x2="-0.75" y2="0.625" layer="51"/>
<rectangle x1="0.75" y1="-0.625" x2="1" y2="0.625" layer="51"/>
<rectangle x1="-0.75" y1="0.475" x2="0.75" y2="0.625" layer="51"/>
<rectangle x1="-0.75" y1="-0.625" x2="0.75" y2="-0.475" layer="51"/>
<wire x1="0.3" y1="0" x2="-0.3" y2="0" width="0.127" layer="21"/>
<wire x1="-0.3" y1="0" x2="0" y2="0.3" width="0.127" layer="21"/>
<wire x1="-0.3" y1="0" x2="0" y2="-0.3" width="0.127" layer="21"/>
<wire x1="-1.7" y1="0.85" x2="1.7" y2="0.85" width="0.127" layer="21"/>
<wire x1="1.7" y1="-0.85" x2="-1.7" y2="-0.85" width="0.127" layer="21"/>
<wire x1="-1.7" y1="-0.85" x2="-1.7" y2="0.85" width="0.127" layer="21"/>
<text x="-1.7" y="1" size="0.8" layer="25" font="vector" ratio="18">&gt;NAME</text>
<text x="-1.7" y="-1.8" size="0.8" layer="27" font="vector" ratio="18">&gt;VALUE</text>
</package>
<package name="T-1">
<text x="-1.5" y="2.5" size="1" layer="25" font="vector" ratio="15">&gt;NAME</text>
<text x="-1.5" y="-3.5" size="1" layer="27" font="vector" ratio="15">&gt;VALUE</text>
<wire x1="0.3" y1="0" x2="-0.3" y2="0" width="0.127" layer="21"/>
<wire x1="-0.3" y1="0" x2="0" y2="0.3" width="0.127" layer="21"/>
<wire x1="-0.3" y1="0" x2="0" y2="-0.3" width="0.127" layer="21"/>
<pad name="K" x="-1.27" y="0" drill="0.9"/>
<pad name="A" x="1.27" y="0" drill="0.9"/>
<circle x="0" y="0" radius="1.5" width="0.127" layer="51"/>
<wire x1="-1.5" y1="1.3" x2="1.9" y2="0.65" width="0.127" layer="21" curve="-120"/>
<wire x1="-1.5" y1="-1.3" x2="1.9" y2="-0.65" width="0.127" layer="21" curve="120"/>
<wire x1="-1.5" y1="1.3" x2="-1.5" y2="0.9" width="0.127" layer="21"/>
<wire x1="-1.5" y1="-1.3" x2="-1.5" y2="-0.9" width="0.127" layer="21"/>
<wire x1="-1.5" y1="0.9" x2="-1.5" y2="-0.9" width="0.127" layer="51"/>
<wire x1="1.9" y1="0.65" x2="1.9" y2="-0.65" width="0.127" layer="51" curve="-35"/>
</package>
<package name="3216">
<wire x1="2.35" y1="1" x2="2.35" y2="-1" width="0.127" layer="21"/>
<wire x1="2.35" y1="-1" x2="-2.35" y2="-1" width="0.127" layer="21"/>
<wire x1="-2.35" y1="-1" x2="-2.35" y2="1" width="0.127" layer="21"/>
<wire x1="-2.35" y1="1" x2="2.35" y2="1" width="0.127" layer="21"/>
<smd name="K" x="-1.625" y="0" dx="1.05" dy="1.6" layer="1"/>
<smd name="A" x="1.625" y="0" dx="1.05" dy="1.6" layer="1"/>
<text x="-2.4" y="1.2" size="0.8" layer="25" font="vector" ratio="18">&gt;NAME</text>
<text x="-2.4" y="-2" size="0.8" layer="27" font="vector" ratio="18">&gt;VALUE</text>
<rectangle x1="-1.7" y1="-0.8" x2="-1.1" y2="0.8" layer="51"/>
<rectangle x1="1.1" y1="-0.8" x2="1.7" y2="0.8" layer="51"/>
<rectangle x1="-1.1" y1="0.6" x2="1.1" y2="0.8" layer="51"/>
<rectangle x1="-1.1" y1="-0.8" x2="1.1" y2="-0.6" layer="51"/>
<wire x1="0.4" y1="0" x2="-0.4" y2="0" width="0.127" layer="21"/>
<wire x1="-0.4" y1="0" x2="0" y2="0.4" width="0.127" layer="21"/>
<wire x1="-0.4" y1="0" x2="0" y2="-0.4" width="0.127" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="LED">
<wire x1="-2.032" y1="0.762" x2="-3.429" y2="-0.635" width="0.1524" layer="94"/>
<wire x1="-1.905" y1="-0.381" x2="-3.302" y2="-1.778" width="0.1524" layer="94"/>
<wire x1="0" y1="-0.508" x2="1.27" y2="0.762" width="0.254" layer="94"/>
<wire x1="-1.27" y1="0.762" x2="0" y2="-0.508" width="0.254" layer="94"/>
<wire x1="0" y1="-0.508" x2="1.27" y2="-0.508" width="0.254" layer="94"/>
<wire x1="0" y1="-0.508" x2="-1.27" y2="-0.508" width="0.254" layer="94"/>
<wire x1="0" y1="-0.508" x2="0" y2="0.762" width="0.1524" layer="94"/>
<wire x1="0" y1="0.762" x2="0" y2="2.54" width="0.1524" layer="94"/>
<wire x1="0" y1="-0.508" x2="0" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="-1.27" y1="0.762" x2="0" y2="0.762" width="0.254" layer="94"/>
<wire x1="1.27" y1="0.762" x2="0" y2="0.762" width="0.254" layer="94"/>
<text x="2.54" y="0.508" size="1.778" layer="95" font="vector">&gt;NAME</text>
<text x="2.54" y="-2.032" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<pin name="K" x="0" y="-2.54" visible="off" length="point" direction="pas" rot="R90"/>
<pin name="A" x="0" y="2.54" visible="off" length="point" direction="pas" rot="R270"/>
<polygon width="0.1524" layer="94">
<vertex x="-3.429" y="-0.635"/>
<vertex x="-3.048" y="0.254"/>
<vertex x="-2.54" y="-0.254"/>
</polygon>
<polygon width="0.1524" layer="94">
<vertex x="-3.302" y="-1.778"/>
<vertex x="-2.921" y="-0.889"/>
<vertex x="-2.413" y="-1.397"/>
</polygon>
</symbol>
</symbols>
<devicesets>
<deviceset name="LED" prefix="LED" uservalue="yes">
<gates>
<gate name="G$1" symbol="LED" x="0" y="0"/>
</gates>
<devices>
<device name="1608" package="1608">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="K" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="1611R" package="1611">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="K" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="2012" package="2012">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="K" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-T-1" package="T-1">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="K" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3216" package="3216">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="K" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="Switch">
<packages>
<package name="SKRP">
<wire x1="-2.1" y1="1.6" x2="2.1" y2="1.6" width="0.127" layer="21"/>
<wire x1="2.1" y1="-1.6" x2="-2.1" y2="-1.6" width="0.127" layer="21"/>
<smd name="A1" x="-2.1" y="-1" dx="1.1" dy="0.7" layer="1"/>
<smd name="A2" x="2.1" y="-1" dx="1.1" dy="0.7" layer="1"/>
<smd name="B1" x="-2.1" y="1" dx="1.1" dy="0.7" layer="1"/>
<smd name="B2" x="2.1" y="1" dx="1.1" dy="0.7" layer="1"/>
<wire x1="-2.1" y1="1.6" x2="-2.1" y2="1.55" width="0.127" layer="21"/>
<wire x1="-2.1" y1="0.45" x2="-2.1" y2="-0.45" width="0.127" layer="21"/>
<wire x1="-2.1" y1="-1.6" x2="-2.1" y2="-1.55" width="0.127" layer="21"/>
<wire x1="2.1" y1="-1.6" x2="2.1" y2="-1.55" width="0.127" layer="21"/>
<wire x1="2.1" y1="-0.45" x2="2.1" y2="0.45" width="0.127" layer="21"/>
<wire x1="2.1" y1="1.6" x2="2.1" y2="1.55" width="0.127" layer="21"/>
<wire x1="2.1" y1="1.55" x2="2.1" y2="0.45" width="0.127" layer="51"/>
<wire x1="2.1" y1="-0.45" x2="2.1" y2="-1.55" width="0.127" layer="51"/>
<wire x1="-2.1" y1="-1.55" x2="-2.1" y2="-0.45" width="0.127" layer="51"/>
<wire x1="-2.1" y1="0.45" x2="-2.1" y2="1.55" width="0.127" layer="51"/>
<text x="-2" y="2" size="1" layer="25" font="vector" ratio="15">&gt;NAME</text>
<text x="-2" y="-3" size="1" layer="27" font="vector" ratio="15">&gt;VALUE</text>
<wire x1="0.5" y1="1.05" x2="-0.5" y2="1.05" width="0.127" layer="51"/>
<wire x1="-0.5" y1="1.05" x2="-0.5" y2="-1.05" width="0.127" layer="51" curve="180"/>
<wire x1="-0.5" y1="-1.05" x2="0.5" y2="-1.05" width="0.127" layer="51"/>
<wire x1="0.5" y1="-1.05" x2="0.5" y2="1.05" width="0.127" layer="51" curve="180"/>
</package>
</packages>
<symbols>
<symbol name="TACT4P">
<wire x1="-2.54" y1="2.54" x2="-2.54" y2="1.27" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="1.27" x2="-2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="2.54" y1="2.54" x2="2.54" y2="1.27" width="0.1524" layer="94"/>
<wire x1="2.54" y1="1.27" x2="2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="1.27" x2="-0.762" y2="1.27" width="0.1524" layer="94"/>
<wire x1="0.762" y1="1.27" x2="2.54" y2="1.27" width="0.1524" layer="94"/>
<wire x1="-1.016" y1="2.032" x2="0" y2="2.032" width="0.254" layer="94"/>
<wire x1="0" y1="2.032" x2="1.016" y2="2.032" width="0.254" layer="94"/>
<wire x1="0" y1="2.032" x2="0" y2="2.54" width="0.254" layer="94"/>
<circle x="-0.762" y="1.27" radius="0.127" width="0.254" layer="94"/>
<circle x="0.762" y="1.27" radius="0.127" width="0.254" layer="94"/>
<text x="0" y="3.048" size="1.778" layer="95" font="vector" align="bottom-center">&gt;NAME</text>
<text x="0" y="-2.54" size="1.778" layer="96" font="vector" align="bottom-center">&gt;VALUE</text>
<pin name="A1" x="-2.54" y="2.54" visible="off" length="point" direction="pas"/>
<pin name="A2" x="-2.54" y="0" visible="off" length="point" direction="pas"/>
<pin name="B1" x="2.54" y="2.54" visible="off" length="point" direction="pas" rot="R180"/>
<pin name="B2" x="2.54" y="0" visible="off" length="point" direction="pas" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="SKRP" prefix="SW" uservalue="yes">
<gates>
<gate name="G$1" symbol="TACT4P" x="0" y="0"/>
</gates>
<devices>
<device name="" package="SKRP">
<connects>
<connect gate="G$1" pin="A1" pad="A1"/>
<connect gate="G$1" pin="A2" pad="A2"/>
<connect gate="G$1" pin="B1" pad="B1"/>
<connect gate="G$1" pin="B2" pad="B2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="CN1" library="con-Molex" deviceset="53398-0471" device="" value="Ball"/>
<part name="GND2" library="supply1" deviceset="GND" device=""/>
<part name="U1" library="ic-ams" deviceset="TSL1401CL" device="-RIGHT5" value="TSL1401CL-RIGHT5"/>
<part name="U2" library="ic-ams" deviceset="TSL1401CL" device="-RIGHT5" value="TSL1401CL-RIGHT5"/>
<part name="LED1" library="ic-Vishay" deviceset="VSMG10850" device=""/>
<part name="LED2" library="ic-Vishay" deviceset="VSMG10850" device=""/>
<part name="LED3" library="ic-Vishay" deviceset="VSMG10850" device=""/>
<part name="LED4" library="ic-Vishay" deviceset="VSMG10850" device=""/>
<part name="LED5" library="ic-Vishay" deviceset="VSMG10850" device=""/>
<part name="LED6" library="ic-Vishay" deviceset="VSMG10850" device=""/>
<part name="+P2" library="supply1" deviceset="+5V" device=""/>
<part name="GND6" library="supply1" deviceset="GND" device=""/>
<part name="GND9" library="supply1" deviceset="GND" device=""/>
<part name="CN2" library="con-Hirose" deviceset="ZX62-B-5PA" device="" value="USB micro"/>
<part name="GND22" library="supply1" deviceset="GND" device=""/>
<part name="GND23" library="supply1" deviceset="GND" device=""/>
<part name="C16" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="D1" library="Diode" deviceset="SBD-*" device="SOD523"/>
<part name="+P9" library="supply1" deviceset="+5V" device=""/>
<part name="D2" library="Diode" deviceset="SBD-*" device="SOD523"/>
<part name="C17" library="Passive" deviceset="C" device="2012" value="22u"/>
<part name="GND24" library="supply1" deviceset="GND" device=""/>
<part name="R5" library="Passive" deviceset="R" device="1005" value="51"/>
<part name="R6" library="Passive" deviceset="R" device="1005" value="51"/>
<part name="P1" library="ProjectOnly" deviceset="SPRING-*" device="72MIL" value="LED+"/>
<part name="P2" library="ProjectOnly" deviceset="SPRING-*" device="72MIL" value="LED-"/>
<part name="GND11" library="supply1" deviceset="GND" device=""/>
<part name="P3" library="ProjectOnly" deviceset="SPRING-*" device="72MIL" value="LED+"/>
<part name="P4" library="ProjectOnly" deviceset="SPRING-*" device="72MIL" value="LED-"/>
<part name="GND29" library="supply1" deviceset="GND" device=""/>
<part name="U3" library="ic-ATMEL" deviceset="ATSAM4E*CA-?" device="A" technology="8"/>
<part name="H1" library="ProjectOnly" deviceset="NUT-*" device="M2-MA"/>
<part name="H2" library="ProjectOnly" deviceset="NUT-*" device="M2-MB" value="NUT-M2-MB"/>
<part name="H3" library="ProjectOnly" deviceset="NUT-*" device="M2-MB" value="NUT-M2-MB"/>
<part name="H4" library="ProjectOnly" deviceset="NUT-*" device="M2-MA"/>
<part name="C5" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C8" library="Passive" deviceset="C" device="1608" value="4.7u"/>
<part name="GND13" library="supply1" deviceset="GND" device=""/>
<part name="C11" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C12" library="Passive" deviceset="C" device="1005" value="10u"/>
<part name="GND17" library="supply1" deviceset="GND" device=""/>
<part name="GND18" library="supply1" deviceset="GND" device=""/>
<part name="FB1" library="Passive" deviceset="FB" device="1608"/>
<part name="C13" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="GND19" library="supply1" deviceset="GND" device=""/>
<part name="C14" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="GND20" library="supply1" deviceset="GND" device=""/>
<part name="C15" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="GND21" library="supply1" deviceset="GND" device=""/>
<part name="R2" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="R3" library="Passive" deviceset="R" device="1005" value="22"/>
<part name="R4" library="Passive" deviceset="R" device="1005" value="22"/>
<part name="GND25" library="supply1" deviceset="GND" device=""/>
<part name="C18" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C10" library="Passive" deviceset="C" device="1608" value="4.7u"/>
<part name="U5" library="ic-Microchip" deviceset="MCP1754ST-*" device="" technology="33"/>
<part name="+P3" library="supply1" deviceset="+5V" device=""/>
<part name="C9" library="Passive" deviceset="C" device="1005" value="1u"/>
<part name="C19" library="Passive" deviceset="C" device="1005" value="1u"/>
<part name="+P8" library="supply1" deviceset="+3V3" device=""/>
<part name="GND28" library="supply1" deviceset="GND" device=""/>
<part name="GND33" library="supply1" deviceset="GND" device=""/>
<part name="GND34" library="supply1" deviceset="GND" device=""/>
<part name="U6" library="ic-Microchip" deviceset="MCP1754ST-*" device="" technology="33"/>
<part name="+P12" library="supply1" deviceset="+5V" device=""/>
<part name="C21" library="Passive" deviceset="C" device="1005" value="1u"/>
<part name="C22" library="Passive" deviceset="C" device="1005" value="1u"/>
<part name="GND35" library="supply1" deviceset="GND" device=""/>
<part name="GND36" library="supply1" deviceset="GND" device=""/>
<part name="GND37" library="supply1" deviceset="GND" device=""/>
<part name="+P13" library="supply1" deviceset="+3V3/2" device=""/>
<part name="+P5" library="supply1" deviceset="+3V3" device=""/>
<part name="GND10" library="supply1" deviceset="GND" device=""/>
<part name="C7" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C23" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C24" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="GND12" library="supply1" deviceset="GND" device=""/>
<part name="GND14" library="supply1" deviceset="GND" device=""/>
<part name="GND16" library="supply1" deviceset="GND" device=""/>
<part name="C25" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="GND38" library="supply1" deviceset="GND" device=""/>
<part name="C26" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="GND39" library="supply1" deviceset="GND" device=""/>
<part name="+P4" library="supply1" deviceset="+3V3" device=""/>
<part name="+P14" library="supply1" deviceset="+3V3" device=""/>
<part name="U7" library="ic-AD" deviceset="ADR504*" device="" technology="1"/>
<part name="GND40" library="supply1" deviceset="GND" device=""/>
<part name="R10" library="Passive" deviceset="R" device="1005" value="330"/>
<part name="GND41" library="supply1" deviceset="GND" device=""/>
<part name="X1" library="Oscillator" deviceset="ASDM" device="" technology="B" value="12MHz"/>
<part name="+P16" library="supply1" deviceset="+3V3" device=""/>
<part name="C20" library="Passive" deviceset="C" device="1005" value="10n"/>
<part name="GND42" library="supply1" deviceset="GND" device=""/>
<part name="CN3" library="Connector" deviceset="CN-NXP-JTAG" device=""/>
<part name="+P6" library="supply1" deviceset="+3V3" device=""/>
<part name="R1" library="Passive" deviceset="R" device="1608" value="10"/>
<part name="R7" library="Passive" deviceset="R" device="1608" value="10"/>
<part name="+P1" library="supply1" deviceset="+5V" device=""/>
<part name="Q1" library="Transistor" deviceset="MOS-N-*" device="SOT23" value="BSS138"/>
<part name="R11" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="+P10" library="supply1" deviceset="+3V3" device=""/>
<part name="R12" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="R13" library="Passive" deviceset="R" device="1005" value="10k"/>
<part name="GND1" library="supply1" deviceset="GND" device=""/>
<part name="R14" library="Passive" deviceset="R" device="1005"/>
<part name="C3" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C4" library="Passive" deviceset="C" device="1005" value="100n"/>
<part name="C6" library="Passive" deviceset="C" device="1608" value="4.7u"/>
<part name="+P11" library="supply1" deviceset="+3V3/2" device=""/>
<part name="R17" library="Passive" deviceset="R" device="1005" value="51"/>
<part name="GND4" library="supply1" deviceset="GND" device=""/>
<part name="GND5" library="supply1" deviceset="GND" device=""/>
<part name="GND8" library="supply1" deviceset="GND" device=""/>
<part name="GND3" library="supply1" deviceset="GND/2" device=""/>
<part name="LED7" library="Opto" deviceset="LED" device="1608"/>
<part name="R8" library="Passive" deviceset="R" device="1005"/>
<part name="GND7" library="supply1" deviceset="GND" device=""/>
<part name="SW1" library="Switch" deviceset="SKRP" device=""/>
<part name="GND15" library="supply1" deviceset="GND" device=""/>
</parts>
<sheets>
<sheet>
<plain>
<wire x1="0" y1="0" x2="33.02" y2="0" width="0.1524" layer="97"/>
<wire x1="33.02" y1="0" x2="53.34" y2="0" width="0.1524" layer="97"/>
<wire x1="53.34" y1="0" x2="78.74" y2="0" width="0.1524" layer="97"/>
<wire x1="0" y1="0" x2="0" y2="7.62" width="0.1524" layer="97"/>
<text x="2.54" y="5.08" size="1.778" layer="97" font="vector" align="center-left">KIKS2014</text>
<text x="2.54" y="2.54" size="1.778" layer="97" font="vector" align="center-left">Gen.6 Ball Detector</text>
<wire x1="0" y1="7.62" x2="33.02" y2="7.62" width="0.1524" layer="97"/>
<wire x1="33.02" y1="7.62" x2="53.34" y2="7.62" width="0.1524" layer="97"/>
<wire x1="53.34" y1="7.62" x2="78.74" y2="7.62" width="0.1524" layer="97"/>
<wire x1="78.74" y1="7.62" x2="78.74" y2="0" width="0.1524" layer="97"/>
<text x="55.88" y="2.54" size="1.778" layer="97" font="vector" align="center-left">FUJII NAOMICHI</text>
<text x="55.88" y="5.08" size="1.778" layer="97" font="vector" align="center-left">Designed by</text>
<text x="35.56" y="5.08" size="1.778" layer="97" font="vector" align="center-left">Date</text>
<text x="35.56" y="2.54" size="1.778" layer="97" font="vector" align="center-left">2013/12/18</text>
<wire x1="53.34" y1="0" x2="53.34" y2="7.62" width="0.1524" layer="97"/>
<wire x1="78.74" y1="0" x2="490.22" y2="0" width="0.1524" layer="97"/>
<wire x1="33.02" y1="7.62" x2="33.02" y2="0" width="0.1524" layer="97"/>
<wire x1="0" y1="7.62" x2="0" y2="236.22" width="0.1524" layer="97"/>
<wire x1="0" y1="236.22" x2="490.22" y2="236.22" width="0.1524" layer="97"/>
<wire x1="490.22" y1="0" x2="490.22" y2="236.22" width="0.1524" layer="97"/>
<text x="345.44" y="132.08" size="2.54" layer="97">ラインセンサー</text>
<text x="345.44" y="218.44" size="2.54" layer="97">LEDs</text>
<text x="345.44" y="205.74" size="2.54" layer="97">赤外線LED Vishay VSMG10850
LED基板のスプリング Mill-Max 0900-1-15-20-75-14-11-0</text>
</plain>
<instances>
<instance part="CN1" gate="G$1" x="22.86" y="78.74" rot="MR0"/>
<instance part="GND2" gate="1" x="22.86" y="63.5"/>
<instance part="U1" gate="G$1" x="375.92" y="114.3"/>
<instance part="U2" gate="G$1" x="375.92" y="78.74"/>
<instance part="LED1" gate="G$1" x="398.78" y="165.1"/>
<instance part="LED2" gate="G$1" x="398.78" y="160.02"/>
<instance part="LED3" gate="G$1" x="398.78" y="154.94"/>
<instance part="LED4" gate="G$1" x="421.64" y="165.1"/>
<instance part="LED5" gate="G$1" x="421.64" y="160.02"/>
<instance part="LED6" gate="G$1" x="421.64" y="154.94"/>
<instance part="+P2" gate="1" x="55.88" y="68.58" rot="R270"/>
<instance part="GND6" gate="1" x="30.48" y="63.5"/>
<instance part="GND9" gate="1" x="175.26" y="53.34"/>
<instance part="CN2" gate="G$1" x="25.4" y="124.46"/>
<instance part="GND22" gate="1" x="25.4" y="106.68"/>
<instance part="GND23" gate="1" x="33.02" y="106.68"/>
<instance part="C16" gate="G$1" x="38.1" y="114.3"/>
<instance part="D1" gate="G$1" x="50.8" y="147.32"/>
<instance part="+P9" gate="1" x="66.04" y="147.32" rot="R270"/>
<instance part="D2" gate="G$1" x="40.64" y="68.58"/>
<instance part="C17" gate="G$1" x="48.26" y="60.96"/>
<instance part="GND24" gate="1" x="48.26" y="55.88"/>
<instance part="R5" gate="G$1" x="45.72" y="91.44"/>
<instance part="R6" gate="G$1" x="45.72" y="83.82"/>
<instance part="P1" gate="G$1" x="373.38" y="187.96"/>
<instance part="P2" gate="G$1" x="365.76" y="187.96"/>
<instance part="GND11" gate="1" x="365.76" y="165.1"/>
<instance part="P3" gate="G$1" x="398.78" y="187.96"/>
<instance part="P4" gate="G$1" x="391.16" y="187.96"/>
<instance part="GND29" gate="1" x="233.68" y="193.04"/>
<instance part="U3" gate="G$1" x="215.9" y="93.98"/>
<instance part="H1" gate="G$1" x="10.16" y="25.4"/>
<instance part="H2" gate="G$1" x="22.86" y="25.4"/>
<instance part="H3" gate="G$1" x="35.56" y="25.4"/>
<instance part="H4" gate="G$1" x="48.26" y="25.4"/>
<instance part="C5" gate="G$1" x="170.18" y="154.94"/>
<instance part="C8" gate="G$1" x="162.56" y="137.16"/>
<instance part="GND13" gate="1" x="162.56" y="132.08"/>
<instance part="C11" gate="G$1" x="170.18" y="137.16"/>
<instance part="C12" gate="G$1" x="162.56" y="101.6"/>
<instance part="GND17" gate="1" x="170.18" y="132.08"/>
<instance part="GND18" gate="1" x="162.56" y="96.52"/>
<instance part="FB1" gate="G$1" x="144.78" y="109.22"/>
<instance part="C13" gate="G$1" x="170.18" y="101.6"/>
<instance part="GND19" gate="1" x="170.18" y="96.52"/>
<instance part="C14" gate="G$1" x="147.32" y="83.82"/>
<instance part="GND20" gate="1" x="147.32" y="78.74"/>
<instance part="C15" gate="G$1" x="154.94" y="83.82"/>
<instance part="GND21" gate="1" x="154.94" y="78.74"/>
<instance part="R2" gate="G$1" x="187.96" y="213.36" rot="R90"/>
<instance part="R3" gate="G$1" x="55.88" y="114.3"/>
<instance part="R4" gate="G$1" x="55.88" y="121.92"/>
<instance part="GND25" gate="1" x="170.18" y="149.86"/>
<instance part="C18" gate="G$1" x="170.18" y="66.04"/>
<instance part="C10" gate="G$1" x="162.56" y="154.94"/>
<instance part="U5" gate="G$1" x="99.06" y="93.98"/>
<instance part="+P3" gate="1" x="76.2" y="96.52" rot="MR270"/>
<instance part="C9" gate="G$1" x="83.82" y="88.9"/>
<instance part="C19" gate="G$1" x="114.3" y="88.9"/>
<instance part="+P8" gate="1" x="121.92" y="96.52" rot="R270"/>
<instance part="GND28" gate="1" x="99.06" y="83.82"/>
<instance part="GND33" gate="1" x="83.82" y="83.82"/>
<instance part="GND34" gate="1" x="114.3" y="83.82"/>
<instance part="U6" gate="G$1" x="99.06" y="66.04"/>
<instance part="+P12" gate="1" x="76.2" y="68.58" rot="MR270"/>
<instance part="C21" gate="G$1" x="83.82" y="60.96"/>
<instance part="C22" gate="G$1" x="114.3" y="60.96"/>
<instance part="GND35" gate="1" x="99.06" y="55.88"/>
<instance part="GND36" gate="1" x="83.82" y="55.88"/>
<instance part="GND37" gate="1" x="114.3" y="55.88"/>
<instance part="+P13" gate="1" x="121.92" y="68.58" rot="R270"/>
<instance part="+P5" gate="1" x="154.94" y="162.56" rot="MR270"/>
<instance part="GND10" gate="1" x="162.56" y="149.86"/>
<instance part="C7" gate="G$1" x="170.18" y="119.38"/>
<instance part="C23" gate="G$1" x="162.56" y="119.38"/>
<instance part="C24" gate="G$1" x="154.94" y="119.38"/>
<instance part="GND12" gate="1" x="170.18" y="114.3"/>
<instance part="GND14" gate="1" x="162.56" y="114.3"/>
<instance part="GND16" gate="1" x="154.94" y="114.3"/>
<instance part="C25" gate="G$1" x="162.56" y="83.82"/>
<instance part="GND38" gate="1" x="162.56" y="78.74"/>
<instance part="C26" gate="G$1" x="170.18" y="83.82"/>
<instance part="GND39" gate="1" x="170.18" y="78.74"/>
<instance part="+P4" gate="1" x="139.7" y="91.44" rot="MR270"/>
<instance part="+P14" gate="1" x="193.04" y="223.52"/>
<instance part="U7" gate="G$1" x="99.06" y="116.84"/>
<instance part="GND40" gate="1" x="99.06" y="111.76"/>
<instance part="R10" gate="G$1" x="99.06" y="132.08" rot="R90"/>
<instance part="GND41" gate="1" x="170.18" y="60.96"/>
<instance part="X1" gate="G$1" x="99.06" y="160.02"/>
<instance part="+P16" gate="1" x="81.28" y="167.64"/>
<instance part="C20" gate="G$1" x="81.28" y="157.48"/>
<instance part="GND42" gate="1" x="81.28" y="152.4"/>
<instance part="CN3" gate="G$1" x="215.9" y="200.66"/>
<instance part="+P6" gate="1" x="233.68" y="210.82" rot="MR0"/>
<instance part="R1" gate="G$1" x="398.78" y="177.8" rot="R90"/>
<instance part="R7" gate="G$1" x="421.64" y="177.8" rot="R90"/>
<instance part="+P1" gate="1" x="378.46" y="195.58" rot="MR0"/>
<instance part="Q1" gate="G$1" x="365.76" y="175.26"/>
<instance part="R11" gate="G$1" x="358.14" y="167.64"/>
<instance part="+P10" gate="1" x="99.06" y="139.7"/>
<instance part="R12" gate="G$1" x="50.8" y="139.7"/>
<instance part="R13" gate="G$1" x="58.42" y="134.62" rot="R90"/>
<instance part="GND1" gate="1" x="58.42" y="127"/>
<instance part="R14" gate="G$1" x="198.12" y="213.36" rot="R90"/>
<instance part="C3" gate="G$1" x="358.14" y="114.3"/>
<instance part="C4" gate="G$1" x="358.14" y="78.74"/>
<instance part="C6" gate="G$1" x="345.44" y="114.3"/>
<instance part="+P11" gate="1" x="337.82" y="121.92" rot="MR270"/>
<instance part="R17" gate="G$1" x="114.3" y="157.48"/>
<instance part="GND4" gate="1" x="345.44" y="109.22"/>
<instance part="GND5" gate="1" x="358.14" y="106.68"/>
<instance part="GND8" gate="1" x="358.14" y="71.12"/>
<instance part="GND3" gate="G$1" x="398.78" y="147.32"/>
<instance part="LED7" gate="G$1" x="83.82" y="198.12"/>
<instance part="R8" gate="G$1" x="83.82" y="190.5" rot="R90"/>
<instance part="GND7" gate="1" x="83.82" y="182.88"/>
<instance part="SW1" gate="G$1" x="104.14" y="195.58"/>
<instance part="GND15" gate="1" x="111.76" y="190.5"/>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="0">
<segment>
<pinref part="CN1" gate="G$1" pin="S1"/>
<pinref part="GND2" gate="1" pin="GND"/>
<wire x1="22.86" y1="66.04" x2="22.86" y2="68.58" width="0.1524" layer="91"/>
<pinref part="CN1" gate="G$1" pin="S2"/>
<wire x1="20.32" y1="68.58" x2="20.32" y2="66.04" width="0.1524" layer="91"/>
<wire x1="20.32" y1="66.04" x2="22.86" y2="66.04" width="0.1524" layer="91"/>
<junction x="22.86" y="66.04"/>
</segment>
<segment>
<pinref part="CN1" gate="G$1" pin="2"/>
<wire x1="25.4" y1="78.74" x2="30.48" y2="78.74" width="0.1524" layer="91"/>
<wire x1="30.48" y1="78.74" x2="30.48" y2="66.04" width="0.1524" layer="91"/>
<pinref part="GND6" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="CN2" gate="G$1" pin="S1"/>
<wire x1="20.32" y1="111.76" x2="20.32" y2="109.22" width="0.1524" layer="91"/>
<pinref part="GND22" gate="1" pin="GND"/>
<wire x1="20.32" y1="109.22" x2="22.86" y2="109.22" width="0.1524" layer="91"/>
<pinref part="CN2" gate="G$1" pin="S3"/>
<wire x1="22.86" y1="109.22" x2="25.4" y2="109.22" width="0.1524" layer="91"/>
<wire x1="25.4" y1="109.22" x2="25.4" y2="111.76" width="0.1524" layer="91"/>
<pinref part="CN2" gate="G$1" pin="S2"/>
<wire x1="22.86" y1="111.76" x2="22.86" y2="109.22" width="0.1524" layer="91"/>
<wire x1="25.4" y1="109.22" x2="27.94" y2="109.22" width="0.1524" layer="91"/>
<pinref part="CN2" gate="G$1" pin="S4"/>
<wire x1="27.94" y1="109.22" x2="27.94" y2="111.76" width="0.1524" layer="91"/>
<junction x="22.86" y="109.22"/>
<junction x="25.4" y="109.22"/>
</segment>
<segment>
<pinref part="CN2" gate="G$1" pin="GND"/>
<wire x1="30.48" y1="119.38" x2="33.02" y2="119.38" width="0.1524" layer="91"/>
<pinref part="GND23" gate="1" pin="GND"/>
<wire x1="33.02" y1="119.38" x2="33.02" y2="109.22" width="0.1524" layer="91"/>
<wire x1="33.02" y1="109.22" x2="38.1" y2="109.22" width="0.1524" layer="91"/>
<pinref part="C16" gate="G$1" pin="2"/>
<wire x1="38.1" y1="109.22" x2="38.1" y2="111.76" width="0.1524" layer="91"/>
<junction x="33.02" y="109.22"/>
</segment>
<segment>
<pinref part="C17" gate="G$1" pin="2"/>
<pinref part="GND24" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="GND9" gate="1" pin="GND"/>
<pinref part="U3" gate="G$1" pin="GND"/>
<wire x1="175.26" y1="55.88" x2="177.8" y2="55.88" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="C8" gate="G$1" pin="2"/>
<pinref part="GND13" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C11" gate="G$1" pin="2"/>
<pinref part="GND17" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C12" gate="G$1" pin="2"/>
<pinref part="GND18" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C13" gate="G$1" pin="2"/>
<pinref part="GND19" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C14" gate="G$1" pin="2"/>
<pinref part="GND20" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C15" gate="G$1" pin="2"/>
<pinref part="GND21" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U5" gate="G$1" pin="GND"/>
<pinref part="GND28" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C9" gate="G$1" pin="2"/>
<pinref part="GND33" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C19" gate="G$1" pin="2"/>
<pinref part="GND34" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U6" gate="G$1" pin="GND"/>
<pinref part="GND35" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C21" gate="G$1" pin="2"/>
<pinref part="GND36" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C22" gate="G$1" pin="2"/>
<pinref part="GND37" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="GND25" gate="1" pin="GND"/>
<pinref part="C5" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="C10" gate="G$1" pin="2"/>
<pinref part="GND10" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C7" gate="G$1" pin="2"/>
<pinref part="GND12" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C23" gate="G$1" pin="2"/>
<pinref part="GND14" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C24" gate="G$1" pin="2"/>
<pinref part="GND16" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C25" gate="G$1" pin="2"/>
<pinref part="GND38" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C26" gate="G$1" pin="2"/>
<pinref part="GND39" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U7" gate="G$1" pin="A"/>
<pinref part="GND40" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C18" gate="G$1" pin="2"/>
<pinref part="GND41" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="GND"/>
<pinref part="C20" gate="G$1" pin="2"/>
<wire x1="91.44" y1="154.94" x2="81.28" y2="154.94" width="0.1524" layer="91"/>
<pinref part="GND42" gate="1" pin="GND"/>
<junction x="81.28" y="154.94"/>
</segment>
<segment>
<pinref part="CN3" gate="G$1" pin="GND@0"/>
<wire x1="231.14" y1="200.66" x2="233.68" y2="200.66" width="0.1524" layer="91"/>
<pinref part="GND29" gate="1" pin="GND"/>
<wire x1="233.68" y1="200.66" x2="233.68" y2="198.12" width="0.1524" layer="91"/>
<pinref part="CN3" gate="G$1" pin="GND@1"/>
<wire x1="233.68" y1="198.12" x2="233.68" y2="195.58" width="0.1524" layer="91"/>
<wire x1="231.14" y1="198.12" x2="233.68" y2="198.12" width="0.1524" layer="91"/>
<pinref part="CN3" gate="G$1" pin="GND@2"/>
<wire x1="231.14" y1="195.58" x2="233.68" y2="195.58" width="0.1524" layer="91"/>
<junction x="233.68" y="198.12"/>
<junction x="233.68" y="195.58"/>
</segment>
<segment>
<pinref part="Q1" gate="G$1" pin="S"/>
<pinref part="GND11" gate="1" pin="GND"/>
<pinref part="R11" gate="G$1" pin="2"/>
<wire x1="365.76" y1="167.64" x2="365.76" y2="170.18" width="0.1524" layer="91"/>
<wire x1="360.68" y1="167.64" x2="365.76" y2="167.64" width="0.1524" layer="91"/>
<junction x="365.76" y="167.64"/>
</segment>
<segment>
<pinref part="R13" gate="G$1" pin="1"/>
<pinref part="GND1" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C6" gate="G$1" pin="2"/>
<pinref part="GND4" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C3" gate="G$1" pin="2"/>
<wire x1="358.14" y1="111.76" x2="358.14" y2="109.22" width="0.1524" layer="91"/>
<wire x1="358.14" y1="109.22" x2="365.76" y2="109.22" width="0.1524" layer="91"/>
<pinref part="U1" gate="G$1" pin="GND"/>
<pinref part="GND5" gate="1" pin="GND"/>
<junction x="358.14" y="109.22"/>
</segment>
<segment>
<pinref part="C4" gate="G$1" pin="2"/>
<wire x1="358.14" y1="76.2" x2="358.14" y2="73.66" width="0.1524" layer="91"/>
<wire x1="358.14" y1="73.66" x2="365.76" y2="73.66" width="0.1524" layer="91"/>
<pinref part="U2" gate="G$1" pin="GND"/>
<pinref part="GND8" gate="1" pin="GND"/>
<junction x="358.14" y="73.66"/>
</segment>
<segment>
<pinref part="R8" gate="G$1" pin="1"/>
<pinref part="GND7" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="SW1" gate="G$1" pin="B1"/>
<wire x1="106.68" y1="198.12" x2="106.68" y2="200.66" width="0.1524" layer="91"/>
<wire x1="106.68" y1="200.66" x2="111.76" y2="200.66" width="0.1524" layer="91"/>
<pinref part="GND15" gate="1" pin="GND"/>
<wire x1="111.76" y1="200.66" x2="111.76" y2="193.04" width="0.1524" layer="91"/>
<pinref part="SW1" gate="G$1" pin="B2"/>
<wire x1="106.68" y1="195.58" x2="106.68" y2="193.04" width="0.1524" layer="91"/>
<wire x1="106.68" y1="193.04" x2="111.76" y2="193.04" width="0.1524" layer="91"/>
<junction x="111.76" y="193.04"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="LED1" gate="G$1" pin="K"/>
<pinref part="LED2" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="LED2" gate="G$1" pin="K"/>
<pinref part="LED3" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="LED4" gate="G$1" pin="K"/>
<pinref part="LED5" gate="G$1" pin="A"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="LED5" gate="G$1" pin="K"/>
<pinref part="LED6" gate="G$1" pin="A"/>
</segment>
</net>
<net name="LED_ENABLE" class="0">
<segment>
<label x="345.44" y="172.72" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="Q1" gate="G$1" pin="G"/>
<wire x1="345.44" y1="172.72" x2="350.52" y2="172.72" width="0.1524" layer="91"/>
<wire x1="350.52" y1="172.72" x2="360.68" y2="172.72" width="0.1524" layer="91"/>
<wire x1="350.52" y1="172.72" x2="350.52" y2="167.64" width="0.1524" layer="91"/>
<pinref part="R11" gate="G$1" pin="1"/>
<wire x1="350.52" y1="167.64" x2="353.06" y2="167.64" width="0.1524" layer="91"/>
<junction x="350.52" y="172.72"/>
</segment>
<segment>
<wire x1="254" y1="109.22" x2="266.7" y2="109.22" width="0.1524" layer="91"/>
<label x="266.7" y="109.22" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U3" gate="G$1" pin="PA26/DCD1/TIOA2/MCDA2/PIODC2"/>
</segment>
</net>
<net name="+5V" class="0">
<segment>
<pinref part="D1" gate="G$1" pin="K"/>
<wire x1="53.34" y1="147.32" x2="63.5" y2="147.32" width="0.1524" layer="91"/>
<pinref part="+P9" gate="1" pin="+5V"/>
</segment>
<segment>
<pinref part="D2" gate="G$1" pin="K"/>
<wire x1="43.18" y1="68.58" x2="48.26" y2="68.58" width="0.1524" layer="91"/>
<wire x1="48.26" y1="68.58" x2="53.34" y2="68.58" width="0.1524" layer="91"/>
<pinref part="C17" gate="G$1" pin="1"/>
<wire x1="48.26" y1="66.04" x2="48.26" y2="68.58" width="0.1524" layer="91"/>
<junction x="48.26" y="68.58"/>
<pinref part="+P2" gate="1" pin="+5V"/>
</segment>
<segment>
<pinref part="+P3" gate="1" pin="+5V"/>
<pinref part="U5" gate="G$1" pin="VI"/>
<wire x1="78.74" y1="96.52" x2="83.82" y2="96.52" width="0.1524" layer="91"/>
<pinref part="C9" gate="G$1" pin="1"/>
<wire x1="83.82" y1="96.52" x2="88.9" y2="96.52" width="0.1524" layer="91"/>
<wire x1="83.82" y1="93.98" x2="83.82" y2="96.52" width="0.1524" layer="91"/>
<junction x="83.82" y="96.52"/>
</segment>
<segment>
<pinref part="+P12" gate="1" pin="+5V"/>
<pinref part="U6" gate="G$1" pin="VI"/>
<wire x1="78.74" y1="68.58" x2="83.82" y2="68.58" width="0.1524" layer="91"/>
<pinref part="C21" gate="G$1" pin="1"/>
<wire x1="83.82" y1="68.58" x2="88.9" y2="68.58" width="0.1524" layer="91"/>
<wire x1="83.82" y1="66.04" x2="83.82" y2="68.58" width="0.1524" layer="91"/>
<junction x="83.82" y="68.58"/>
</segment>
<segment>
<pinref part="+P1" gate="1" pin="+5V"/>
<wire x1="378.46" y1="193.04" x2="378.46" y2="182.88" width="0.1524" layer="91"/>
<wire x1="378.46" y1="182.88" x2="373.38" y2="182.88" width="0.1524" layer="91"/>
<pinref part="P1" gate="G$1" pin="1"/>
<wire x1="373.38" y1="182.88" x2="373.38" y2="185.42" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<pinref part="CN1" gate="G$1" pin="1"/>
<wire x1="25.4" y1="81.28" x2="33.02" y2="81.28" width="0.1524" layer="91"/>
<wire x1="33.02" y1="81.28" x2="33.02" y2="91.44" width="0.1524" layer="91"/>
<pinref part="R5" gate="G$1" pin="1"/>
<wire x1="33.02" y1="91.44" x2="40.64" y2="91.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<pinref part="CN1" gate="G$1" pin="3"/>
<wire x1="25.4" y1="76.2" x2="35.56" y2="76.2" width="0.1524" layer="91"/>
<wire x1="35.56" y1="76.2" x2="35.56" y2="83.82" width="0.1524" layer="91"/>
<pinref part="R6" gate="G$1" pin="1"/>
<wire x1="40.64" y1="83.82" x2="35.56" y2="83.82" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CAM1_SI" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="SI"/>
<wire x1="386.08" y1="116.84" x2="398.78" y2="116.84" width="0.1524" layer="91"/>
<label x="398.78" y="116.84" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
<segment>
<label x="266.7" y="91.44" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U3" gate="G$1" pin="PD0/GTXCK_GREFCK"/>
<wire x1="254" y1="91.44" x2="266.7" y2="91.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="!RESET" class="0">
<segment>
<label x="182.88" y="195.58" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<wire x1="182.88" y1="195.58" x2="198.12" y2="195.58" width="0.1524" layer="91"/>
<pinref part="CN3" gate="G$1" pin="!RESET"/>
<pinref part="R14" gate="G$1" pin="1"/>
<wire x1="198.12" y1="195.58" x2="200.66" y2="195.58" width="0.1524" layer="91"/>
<wire x1="198.12" y1="208.28" x2="198.12" y2="195.58" width="0.1524" layer="91"/>
<junction x="198.12" y="195.58"/>
</segment>
<segment>
<wire x1="177.8" y1="175.26" x2="165.1" y2="175.26" width="0.1524" layer="91"/>
<label x="165.1" y="175.26" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="U3" gate="G$1" pin="!RST"/>
</segment>
</net>
<net name="USB_D+" class="0">
<segment>
<wire x1="58.42" y1="114.3" x2="63.5" y2="114.3" width="0.1524" layer="91"/>
<label x="63.5" y="114.3" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="R3" gate="G$1" pin="2"/>
</segment>
<segment>
<wire x1="177.8" y1="20.32" x2="165.1" y2="20.32" width="0.1524" layer="91"/>
<label x="165.1" y="20.32" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="U3" gate="G$1" pin="PB11/DDP"/>
</segment>
</net>
<net name="USB_D-" class="0">
<segment>
<wire x1="58.42" y1="121.92" x2="63.5" y2="121.92" width="0.1524" layer="91"/>
<label x="63.5" y="121.92" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="R4" gate="G$1" pin="2"/>
</segment>
<segment>
<wire x1="177.8" y1="22.86" x2="165.1" y2="22.86" width="0.1524" layer="91"/>
<label x="165.1" y="22.86" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="U3" gate="G$1" pin="PB10/DDM"/>
</segment>
</net>
<net name="N$16" class="0">
<segment>
<pinref part="CN1" gate="G$1" pin="4"/>
<wire x1="25.4" y1="73.66" x2="35.56" y2="73.66" width="0.1524" layer="91"/>
<wire x1="35.56" y1="73.66" x2="35.56" y2="68.58" width="0.1524" layer="91"/>
<pinref part="D2" gate="G$1" pin="A"/>
<wire x1="35.56" y1="68.58" x2="38.1" y2="68.58" width="0.1524" layer="91"/>
</segment>
</net>
<net name="HOST_TX" class="0">
<segment>
<pinref part="R6" gate="G$1" pin="2"/>
<wire x1="48.26" y1="83.82" x2="53.34" y2="83.82" width="0.1524" layer="91"/>
<label x="53.34" y="83.82" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
<segment>
<wire x1="254" y1="152.4" x2="266.7" y2="152.4" width="0.1524" layer="91"/>
<label x="266.7" y="152.4" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U3" gate="G$1" pin="PA9/URXD0/NPCS1/PWMFI0"/>
</segment>
</net>
<net name="HOST_RX" class="0">
<segment>
<pinref part="R5" gate="G$1" pin="2"/>
<wire x1="48.26" y1="91.44" x2="53.34" y2="91.44" width="0.1524" layer="91"/>
<label x="53.34" y="91.44" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
<segment>
<wire x1="254" y1="149.86" x2="266.7" y2="149.86" width="0.1524" layer="91"/>
<label x="266.7" y="149.86" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U3" gate="G$1" pin="PA10/UTXD0/NPCS2"/>
</segment>
</net>
<net name="CAM1_AOP" class="0">
<segment>
<label x="266.7" y="127" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U3" gate="G$1" pin="PA19/PWML0/AFE0_AD2"/>
<wire x1="254" y1="127" x2="266.7" y2="127" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="AO"/>
<wire x1="386.08" y1="109.22" x2="398.78" y2="109.22" width="0.1524" layer="91"/>
<label x="398.78" y="109.22" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
</net>
<net name="CAM2_AOP" class="0">
<segment>
<pinref part="U2" gate="G$1" pin="AO"/>
<wire x1="386.08" y1="73.66" x2="398.78" y2="73.66" width="0.1524" layer="91"/>
<label x="398.78" y="73.66" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
<segment>
<wire x1="254" y1="121.92" x2="266.7" y2="121.92" width="0.1524" layer="91"/>
<label x="266.7" y="121.92" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U3" gate="G$1" pin="PA21/RXD1/PCK1/AFE1_AD2"/>
</segment>
</net>
<net name="TCK" class="0">
<segment>
<label x="182.88" y="205.74" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<wire x1="200.66" y1="205.74" x2="187.96" y2="205.74" width="0.1524" layer="91"/>
<pinref part="CN3" gate="G$1" pin="TCK/SWCLK"/>
<pinref part="R2" gate="G$1" pin="1"/>
<wire x1="187.96" y1="205.74" x2="182.88" y2="205.74" width="0.1524" layer="91"/>
<wire x1="187.96" y1="208.28" x2="187.96" y2="205.74" width="0.1524" layer="91"/>
<junction x="187.96" y="205.74"/>
</segment>
<segment>
<label x="165.1" y="30.48" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<wire x1="177.8" y1="30.48" x2="165.1" y2="30.48" width="0.1524" layer="91"/>
<pinref part="U3" gate="G$1" pin="PB7/TCK/SWCLK"/>
</segment>
</net>
<net name="TDI" class="0">
<segment>
<wire x1="200.66" y1="198.12" x2="182.88" y2="198.12" width="0.1524" layer="91"/>
<label x="182.88" y="198.12" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="CN3" gate="G$1" pin="TDI"/>
</segment>
<segment>
<wire x1="177.8" y1="38.1" x2="165.1" y2="38.1" width="0.1524" layer="91"/>
<label x="165.1" y="38.1" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="U3" gate="G$1" pin="PB4/TWD1/PWMH2/TDI"/>
</segment>
</net>
<net name="TDO" class="0">
<segment>
<wire x1="182.88" y1="200.66" x2="200.66" y2="200.66" width="0.1524" layer="91"/>
<label x="182.88" y="200.66" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="CN3" gate="G$1" pin="TDO/SWO"/>
</segment>
<segment>
<wire x1="165.1" y1="35.56" x2="177.8" y2="35.56" width="0.1524" layer="91"/>
<label x="165.1" y="35.56" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="U3" gate="G$1" pin="PB5/TWCK1/PWML0/TDO/SWO"/>
</segment>
</net>
<net name="TMS" class="0">
<segment>
<wire x1="200.66" y1="203.2" x2="182.88" y2="203.2" width="0.1524" layer="91"/>
<label x="182.88" y="203.2" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="CN3" gate="G$1" pin="TMS/SDCIO"/>
</segment>
<segment>
<wire x1="177.8" y1="33.02" x2="165.1" y2="33.02" width="0.1524" layer="91"/>
<label x="165.1" y="33.02" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="U3" gate="G$1" pin="PB6/TMS/SWDIO"/>
</segment>
</net>
<net name="VDDOUT" class="0">
<segment>
<wire x1="177.8" y1="127" x2="170.18" y2="127" width="0.1524" layer="91"/>
<wire x1="170.18" y1="127" x2="162.56" y2="127" width="0.1524" layer="91"/>
<wire x1="162.56" y1="127" x2="154.94" y2="127" width="0.1524" layer="91"/>
<wire x1="154.94" y1="127" x2="137.16" y2="127" width="0.1524" layer="91"/>
<wire x1="137.16" y1="127" x2="137.16" y2="144.78" width="0.1524" layer="91"/>
<wire x1="137.16" y1="144.78" x2="162.56" y2="144.78" width="0.1524" layer="91"/>
<label x="137.16" y="145.288" size="1.27" layer="95" font="vector"/>
<pinref part="C11" gate="G$1" pin="1"/>
<wire x1="162.56" y1="144.78" x2="170.18" y2="144.78" width="0.1524" layer="91"/>
<wire x1="170.18" y1="144.78" x2="177.8" y2="144.78" width="0.1524" layer="91"/>
<wire x1="170.18" y1="142.24" x2="170.18" y2="144.78" width="0.1524" layer="91"/>
<pinref part="C8" gate="G$1" pin="1"/>
<wire x1="162.56" y1="142.24" x2="162.56" y2="144.78" width="0.1524" layer="91"/>
<junction x="162.56" y="144.78"/>
<junction x="170.18" y="144.78"/>
<pinref part="C7" gate="G$1" pin="1"/>
<wire x1="170.18" y1="124.46" x2="170.18" y2="127" width="0.1524" layer="91"/>
<pinref part="C23" gate="G$1" pin="1"/>
<wire x1="162.56" y1="124.46" x2="162.56" y2="127" width="0.1524" layer="91"/>
<pinref part="C24" gate="G$1" pin="1"/>
<wire x1="154.94" y1="124.46" x2="154.94" y2="127" width="0.1524" layer="91"/>
<junction x="154.94" y="127"/>
<junction x="162.56" y="127"/>
<junction x="170.18" y="127"/>
<wire x1="137.16" y1="127" x2="137.16" y2="109.22" width="0.1524" layer="91"/>
<pinref part="FB1" gate="G$1" pin="1"/>
<wire x1="137.16" y1="109.22" x2="139.7" y2="109.22" width="0.1524" layer="91"/>
<junction x="137.16" y="127"/>
<pinref part="U3" gate="G$1" pin="VDDOUT"/>
<pinref part="U3" gate="G$1" pin="VDDCORE"/>
</segment>
</net>
<net name="CLK12M" class="0">
<segment>
<wire x1="177.8" y1="25.4" x2="165.1" y2="25.4" width="0.1524" layer="91"/>
<label x="165.1" y="25.4" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="U3" gate="G$1" pin="PB9/XIN"/>
</segment>
<segment>
<label x="119.38" y="157.48" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="R17" gate="G$1" pin="2"/>
<wire x1="116.84" y1="157.48" x2="119.38" y2="157.48" width="0.1524" layer="91"/>
</segment>
</net>
<net name="+3V3" class="0">
<segment>
<pinref part="U5" gate="G$1" pin="VO"/>
<pinref part="+P8" gate="1" pin="+3V3"/>
<wire x1="109.22" y1="96.52" x2="114.3" y2="96.52" width="0.1524" layer="91"/>
<pinref part="C19" gate="G$1" pin="1"/>
<wire x1="114.3" y1="96.52" x2="119.38" y2="96.52" width="0.1524" layer="91"/>
<wire x1="114.3" y1="96.52" x2="114.3" y2="93.98" width="0.1524" layer="91"/>
<junction x="114.3" y="96.52"/>
</segment>
<segment>
<wire x1="177.8" y1="162.56" x2="170.18" y2="162.56" width="0.1524" layer="91"/>
<pinref part="C5" gate="G$1" pin="1"/>
<wire x1="170.18" y1="162.56" x2="170.18" y2="160.02" width="0.1524" layer="91"/>
<wire x1="170.18" y1="162.56" x2="162.56" y2="162.56" width="0.1524" layer="91"/>
<pinref part="C10" gate="G$1" pin="1"/>
<wire x1="162.56" y1="162.56" x2="162.56" y2="160.02" width="0.1524" layer="91"/>
<wire x1="162.56" y1="162.56" x2="157.48" y2="162.56" width="0.1524" layer="91"/>
<pinref part="+P5" gate="1" pin="+3V3"/>
<junction x="162.56" y="162.56"/>
<junction x="170.18" y="162.56"/>
<pinref part="U3" gate="G$1" pin="VDDIN"/>
</segment>
<segment>
<pinref part="+P4" gate="1" pin="+3V3"/>
<wire x1="177.8" y1="91.44" x2="170.18" y2="91.44" width="0.1524" layer="91"/>
<pinref part="C14" gate="G$1" pin="1"/>
<wire x1="170.18" y1="91.44" x2="162.56" y2="91.44" width="0.1524" layer="91"/>
<wire x1="162.56" y1="91.44" x2="154.94" y2="91.44" width="0.1524" layer="91"/>
<wire x1="154.94" y1="91.44" x2="147.32" y2="91.44" width="0.1524" layer="91"/>
<wire x1="147.32" y1="91.44" x2="142.24" y2="91.44" width="0.1524" layer="91"/>
<wire x1="147.32" y1="91.44" x2="147.32" y2="88.9" width="0.1524" layer="91"/>
<pinref part="C15" gate="G$1" pin="1"/>
<wire x1="154.94" y1="88.9" x2="154.94" y2="91.44" width="0.1524" layer="91"/>
<pinref part="C25" gate="G$1" pin="1"/>
<wire x1="162.56" y1="88.9" x2="162.56" y2="91.44" width="0.1524" layer="91"/>
<pinref part="C26" gate="G$1" pin="1"/>
<wire x1="170.18" y1="88.9" x2="170.18" y2="91.44" width="0.1524" layer="91"/>
<junction x="147.32" y="91.44"/>
<junction x="154.94" y="91.44"/>
<junction x="162.56" y="91.44"/>
<junction x="170.18" y="91.44"/>
<pinref part="U3" gate="G$1" pin="VDDIO"/>
</segment>
<segment>
<pinref part="X1" gate="G$1" pin="EN"/>
<wire x1="91.44" y1="160.02" x2="88.9" y2="160.02" width="0.1524" layer="91"/>
<wire x1="88.9" y1="160.02" x2="88.9" y2="162.56" width="0.1524" layer="91"/>
<pinref part="X1" gate="G$1" pin="VDD"/>
<wire x1="88.9" y1="162.56" x2="91.44" y2="162.56" width="0.1524" layer="91"/>
<pinref part="C20" gate="G$1" pin="1"/>
<wire x1="88.9" y1="162.56" x2="81.28" y2="162.56" width="0.1524" layer="91"/>
<pinref part="+P16" gate="1" pin="+3V3"/>
<wire x1="81.28" y1="162.56" x2="81.28" y2="165.1" width="0.1524" layer="91"/>
<junction x="88.9" y="162.56"/>
<junction x="81.28" y="162.56"/>
</segment>
<segment>
<pinref part="CN3" gate="G$1" pin="VREF"/>
<wire x1="231.14" y1="205.74" x2="233.68" y2="205.74" width="0.1524" layer="91"/>
<pinref part="+P6" gate="1" pin="+3V3"/>
<wire x1="233.68" y1="205.74" x2="233.68" y2="208.28" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="R10" gate="G$1" pin="2"/>
<wire x1="99.06" y1="134.62" x2="99.06" y2="137.16" width="0.1524" layer="91"/>
<pinref part="+P10" gate="1" pin="+3V3"/>
</segment>
<segment>
<pinref part="R14" gate="G$1" pin="2"/>
<wire x1="198.12" y1="215.9" x2="198.12" y2="218.44" width="0.1524" layer="91"/>
<wire x1="198.12" y1="218.44" x2="193.04" y2="218.44" width="0.1524" layer="91"/>
<pinref part="R2" gate="G$1" pin="2"/>
<wire x1="193.04" y1="218.44" x2="187.96" y2="218.44" width="0.1524" layer="91"/>
<wire x1="187.96" y1="218.44" x2="187.96" y2="215.9" width="0.1524" layer="91"/>
<wire x1="193.04" y1="218.44" x2="193.04" y2="220.98" width="0.1524" layer="91"/>
<pinref part="+P14" gate="1" pin="+3V3"/>
<junction x="193.04" y="218.44"/>
</segment>
</net>
<net name="+3V3/2" class="0">
<segment>
<pinref part="U6" gate="G$1" pin="VO"/>
<wire x1="109.22" y1="68.58" x2="114.3" y2="68.58" width="0.1524" layer="91"/>
<pinref part="C22" gate="G$1" pin="1"/>
<wire x1="114.3" y1="68.58" x2="119.38" y2="68.58" width="0.1524" layer="91"/>
<wire x1="114.3" y1="68.58" x2="114.3" y2="66.04" width="0.1524" layer="91"/>
<junction x="114.3" y="68.58"/>
<pinref part="+P13" gate="1" pin="+3V3/2"/>
</segment>
<segment>
<wire x1="365.76" y1="86.36" x2="358.14" y2="86.36" width="0.1524" layer="91"/>
<pinref part="C4" gate="G$1" pin="1"/>
<wire x1="358.14" y1="86.36" x2="358.14" y2="83.82" width="0.1524" layer="91"/>
<wire x1="358.14" y1="86.36" x2="353.06" y2="86.36" width="0.1524" layer="91"/>
<wire x1="353.06" y1="86.36" x2="353.06" y2="121.92" width="0.1524" layer="91"/>
<wire x1="365.76" y1="121.92" x2="358.14" y2="121.92" width="0.1524" layer="91"/>
<pinref part="C3" gate="G$1" pin="1"/>
<wire x1="358.14" y1="121.92" x2="358.14" y2="119.38" width="0.1524" layer="91"/>
<wire x1="353.06" y1="121.92" x2="358.14" y2="121.92" width="0.1524" layer="91"/>
<wire x1="353.06" y1="121.92" x2="345.44" y2="121.92" width="0.1524" layer="91"/>
<junction x="358.14" y="121.92"/>
<junction x="358.14" y="86.36"/>
<junction x="353.06" y="121.92"/>
<pinref part="C6" gate="G$1" pin="1"/>
<wire x1="345.44" y1="121.92" x2="340.36" y2="121.92" width="0.1524" layer="91"/>
<wire x1="345.44" y1="119.38" x2="345.44" y2="121.92" width="0.1524" layer="91"/>
<junction x="345.44" y="121.92"/>
<pinref part="+P11" gate="1" pin="+3V3/2"/>
<pinref part="U1" gate="G$1" pin="VDD"/>
<pinref part="U2" gate="G$1" pin="VDD"/>
</segment>
</net>
<net name="VDDPLL" class="0">
<segment>
<wire x1="177.8" y1="109.22" x2="170.18" y2="109.22" width="0.1524" layer="91"/>
<pinref part="FB1" gate="G$1" pin="2"/>
<pinref part="C12" gate="G$1" pin="1"/>
<wire x1="170.18" y1="109.22" x2="162.56" y2="109.22" width="0.1524" layer="91"/>
<wire x1="162.56" y1="109.22" x2="149.86" y2="109.22" width="0.1524" layer="91"/>
<wire x1="162.56" y1="106.68" x2="162.56" y2="109.22" width="0.1524" layer="91"/>
<pinref part="C13" gate="G$1" pin="1"/>
<wire x1="170.18" y1="106.68" x2="170.18" y2="109.22" width="0.1524" layer="91"/>
<junction x="162.56" y="109.22"/>
<junction x="170.18" y="109.22"/>
<label x="152.4" y="109.728" size="1.27" layer="95" font="vector"/>
<pinref part="U3" gate="G$1" pin="VDDPLL"/>
</segment>
</net>
<net name="ADVREF" class="0">
<segment>
<pinref part="R10" gate="G$1" pin="1"/>
<pinref part="U7" gate="G$1" pin="K"/>
<wire x1="99.06" y1="127" x2="99.06" y2="124.46" width="0.1524" layer="91"/>
<wire x1="99.06" y1="124.46" x2="99.06" y2="119.38" width="0.1524" layer="91"/>
<wire x1="99.06" y1="124.46" x2="109.22" y2="124.46" width="0.1524" layer="91"/>
<junction x="99.06" y="124.46"/>
<label x="109.22" y="124.968" size="1.27" layer="95" font="vector" rot="MR0"/>
</segment>
<segment>
<wire x1="177.8" y1="73.66" x2="170.18" y2="73.66" width="0.1524" layer="91"/>
<label x="160.02" y="74.168" size="1.27" layer="95" font="vector"/>
<pinref part="C18" gate="G$1" pin="1"/>
<wire x1="170.18" y1="73.66" x2="160.02" y2="73.66" width="0.1524" layer="91"/>
<wire x1="170.18" y1="71.12" x2="170.18" y2="73.66" width="0.1524" layer="91"/>
<junction x="170.18" y="73.66"/>
<pinref part="U3" gate="G$1" pin="ADVREF"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="P3" gate="G$1" pin="1"/>
<pinref part="R1" gate="G$1" pin="2"/>
<wire x1="398.78" y1="185.42" x2="398.78" y2="182.88" width="0.1524" layer="91"/>
<wire x1="398.78" y1="182.88" x2="398.78" y2="180.34" width="0.1524" layer="91"/>
<wire x1="398.78" y1="182.88" x2="421.64" y2="182.88" width="0.1524" layer="91"/>
<pinref part="R7" gate="G$1" pin="2"/>
<wire x1="421.64" y1="182.88" x2="421.64" y2="180.34" width="0.1524" layer="91"/>
<junction x="398.78" y="182.88"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="R7" gate="G$1" pin="1"/>
<pinref part="LED4" gate="G$1" pin="A"/>
<wire x1="421.64" y1="172.72" x2="421.64" y2="167.64" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="R1" gate="G$1" pin="1"/>
<pinref part="LED1" gate="G$1" pin="A"/>
<wire x1="398.78" y1="172.72" x2="398.78" y2="167.64" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="Q1" gate="G$1" pin="D"/>
<pinref part="P2" gate="G$1" pin="1"/>
<wire x1="365.76" y1="180.34" x2="365.76" y2="185.42" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="CN2" gate="G$1" pin="D-"/>
<wire x1="30.48" y1="127" x2="48.26" y2="127" width="0.1524" layer="91"/>
<wire x1="48.26" y1="127" x2="48.26" y2="121.92" width="0.1524" layer="91"/>
<pinref part="R4" gate="G$1" pin="1"/>
<wire x1="48.26" y1="121.92" x2="50.8" y2="121.92" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<pinref part="CN2" gate="G$1" pin="D+"/>
<pinref part="R3" gate="G$1" pin="1"/>
<wire x1="30.48" y1="124.46" x2="45.72" y2="124.46" width="0.1524" layer="91"/>
<wire x1="45.72" y1="124.46" x2="45.72" y2="114.3" width="0.1524" layer="91"/>
<wire x1="45.72" y1="114.3" x2="50.8" y2="114.3" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<pinref part="C16" gate="G$1" pin="1"/>
<wire x1="38.1" y1="119.38" x2="38.1" y2="129.54" width="0.1524" layer="91"/>
<pinref part="CN2" gate="G$1" pin="VBUS"/>
<wire x1="38.1" y1="129.54" x2="30.48" y2="129.54" width="0.1524" layer="91"/>
<pinref part="D1" gate="G$1" pin="A"/>
<wire x1="48.26" y1="147.32" x2="38.1" y2="147.32" width="0.1524" layer="91"/>
<wire x1="38.1" y1="147.32" x2="38.1" y2="139.7" width="0.1524" layer="91"/>
<junction x="38.1" y="129.54"/>
<pinref part="R12" gate="G$1" pin="1"/>
<wire x1="38.1" y1="139.7" x2="38.1" y2="129.54" width="0.1524" layer="91"/>
<wire x1="45.72" y1="139.7" x2="38.1" y2="139.7" width="0.1524" layer="91"/>
<junction x="38.1" y="139.7"/>
</segment>
</net>
<net name="USB_VBUS" class="0">
<segment>
<pinref part="R12" gate="G$1" pin="2"/>
<wire x1="53.34" y1="139.7" x2="58.42" y2="139.7" width="0.1524" layer="91"/>
<pinref part="R13" gate="G$1" pin="2"/>
<wire x1="58.42" y1="139.7" x2="58.42" y2="137.16" width="0.1524" layer="91"/>
<wire x1="58.42" y1="139.7" x2="63.5" y2="139.7" width="0.1524" layer="91"/>
<label x="63.5" y="139.7" size="1.27" layer="95" font="vector" xref="yes"/>
<junction x="58.42" y="139.7"/>
</segment>
<segment>
<wire x1="254" y1="81.28" x2="266.7" y2="81.28" width="0.1524" layer="91"/>
<label x="266.7" y="81.28" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U3" gate="G$1" pin="PD4/GCRSDV_GRXDV"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<pinref part="X1" gate="G$1" pin="OUT"/>
<pinref part="R17" gate="G$1" pin="1"/>
<wire x1="109.22" y1="157.48" x2="106.68" y2="157.48" width="0.1524" layer="91"/>
</segment>
</net>
<net name="CAM1_CLK" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="CLK"/>
<wire x1="386.08" y1="121.92" x2="398.78" y2="121.92" width="0.1524" layer="91"/>
<label x="398.78" y="121.92" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
<segment>
<wire x1="177.8" y1="45.72" x2="165.1" y2="45.72" width="0.1524" layer="91"/>
<label x="165.1" y="45.72" size="1.27" layer="95" font="vector" rot="MR0" xref="yes"/>
<pinref part="U3" gate="G$1" pin="PB1/PWMH1/TXD0/AFE0_AD5/RTCOUT1"/>
</segment>
</net>
<net name="CAM2_CLK" class="0">
<segment>
<pinref part="U2" gate="G$1" pin="CLK"/>
<wire x1="386.08" y1="86.36" x2="398.78" y2="86.36" width="0.1524" layer="91"/>
<label x="398.78" y="86.36" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
<segment>
<wire x1="254" y1="142.24" x2="266.7" y2="142.24" width="0.1524" layer="91"/>
<label x="266.7" y="142.24" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U3" gate="G$1" pin="PA13/MOSI/PWMH2"/>
</segment>
</net>
<net name="CAM2_SI" class="0">
<segment>
<pinref part="U2" gate="G$1" pin="SI"/>
<wire x1="386.08" y1="81.28" x2="398.78" y2="81.28" width="0.1524" layer="91"/>
<label x="398.78" y="81.28" size="1.27" layer="95" font="vector" xref="yes"/>
</segment>
<segment>
<wire x1="254" y1="15.24" x2="266.7" y2="15.24" width="0.1524" layer="91"/>
<label x="266.7" y="15.24" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U3" gate="G$1" pin="PD30"/>
</segment>
</net>
<net name="GND/2" class="0">
<segment>
<wire x1="398.78" y1="149.86" x2="398.78" y2="152.4" width="0.1524" layer="91"/>
<pinref part="P4" gate="G$1" pin="1"/>
<wire x1="391.16" y1="185.42" x2="391.16" y2="149.86" width="0.1524" layer="91"/>
<wire x1="398.78" y1="149.86" x2="391.16" y2="149.86" width="0.1524" layer="91"/>
<junction x="398.78" y="149.86"/>
<pinref part="LED3" gate="G$1" pin="K"/>
<wire x1="398.78" y1="149.86" x2="421.64" y2="149.86" width="0.1524" layer="91"/>
<pinref part="LED6" gate="G$1" pin="K"/>
<wire x1="421.64" y1="149.86" x2="421.64" y2="152.4" width="0.1524" layer="91"/>
<pinref part="GND3" gate="G$1" pin="GND/2"/>
</segment>
</net>
<net name="CASE" class="0">
<segment>
<pinref part="H1" gate="G$1" pin="1"/>
<wire x1="10.16" y1="22.86" x2="10.16" y2="20.32" width="0.1524" layer="91"/>
<wire x1="10.16" y1="20.32" x2="22.86" y2="20.32" width="0.1524" layer="91"/>
<pinref part="H4" gate="G$1" pin="1"/>
<wire x1="22.86" y1="20.32" x2="35.56" y2="20.32" width="0.1524" layer="91"/>
<wire x1="35.56" y1="20.32" x2="48.26" y2="20.32" width="0.1524" layer="91"/>
<wire x1="48.26" y1="20.32" x2="48.26" y2="22.86" width="0.1524" layer="91"/>
<pinref part="H3" gate="G$1" pin="1"/>
<wire x1="35.56" y1="22.86" x2="35.56" y2="20.32" width="0.1524" layer="91"/>
<pinref part="H2" gate="G$1" pin="1"/>
<wire x1="22.86" y1="22.86" x2="22.86" y2="20.32" width="0.1524" layer="91"/>
<junction x="22.86" y="20.32"/>
<junction x="35.56" y="20.32"/>
<label x="50.8" y="21.082" size="1.27" layer="95" font="vector"/>
<wire x1="48.26" y1="20.32" x2="55.88" y2="20.32" width="0.1524" layer="91"/>
<junction x="48.26" y="20.32"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<pinref part="LED7" gate="G$1" pin="K"/>
<pinref part="R8" gate="G$1" pin="2"/>
<wire x1="83.82" y1="193.04" x2="83.82" y2="195.58" width="0.1524" layer="91"/>
</segment>
</net>
<net name="LED1" class="0">
<segment>
<pinref part="LED7" gate="G$1" pin="A"/>
<wire x1="83.82" y1="200.66" x2="83.82" y2="205.74" width="0.1524" layer="91"/>
<label x="83.82" y="205.74" size="1.27" layer="95" font="vector" rot="R90" xref="yes"/>
</segment>
<segment>
<wire x1="254" y1="43.18" x2="266.7" y2="43.18" width="0.1524" layer="91"/>
<label x="266.7" y="43.18" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U3" gate="G$1" pin="PD19"/>
</segment>
</net>
<net name="SW1" class="0">
<segment>
<pinref part="SW1" gate="G$1" pin="A2"/>
<wire x1="101.6" y1="195.58" x2="101.6" y2="190.5" width="0.1524" layer="91"/>
<label x="101.6" y="190.5" size="1.27" layer="95" font="vector" rot="R270" xref="yes"/>
</segment>
<segment>
<label x="266.7" y="119.38" size="1.27" layer="95" font="vector" xref="yes"/>
<pinref part="U3" gate="G$1" pin="PA22/TXD1/NPCS3/AFE1_AD3"/>
<wire x1="254" y1="119.38" x2="266.7" y2="119.38" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
<compatibility>
<note version="6.3" minversion="6.2.2" severity="warning">
Since Version 6.2.2 text objects can contain more than one line,
which will not be processed correctly with this version.
</note>
</compatibility>
</eagle>
