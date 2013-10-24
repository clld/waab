<%inherit file="../${context.get('request').registry.settings.get('clld.app_template', 'app.mako')}"/>
<%namespace name="util" file="../util.mako"/>
<%! active_menu_item = "pairs" %>


<%block name="head">
<style type="text/css">
	@page {  }
	table { border-collapse:collapse; border-spacing:0; empty-cells:show }
	td, th { vertical-align:top; }
	h1, h2, h3, h4, h5, h6 { clear:both }
	ol, ul { margin:0; padding:0;}
	li { list-style: none; margin:0; padding:0;}
	<!-- "li span.odfLiEnd" - IE 7 issue-->
	li span. { clear: both; line-height:0; width:0; height:0; margin:0; padding:0; }
	span.footnodeNumber { padding-right:1em; }
	span.annotation_style_by_filter { font-size:95%;  background-color:#fff000;  margin:0; border:0; padding:0;  }
	* { margin:0;}
	.P1 {   line-height:100%;  vertical-align:middle;  }
	.P10 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   }
	.P11 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   }
	.P113 {    text-align:right ! important; }
	.P12 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   }
	.P123 {    text-decoration:underline; font-weight:bold; }
	.P124 {    text-decoration:underline; }
	.P125 {    text-decoration:underline; }
	.P126 {    text-decoration:underline; }
	.P127 {    text-decoration:underline; }
	.P128 {    text-decoration:underline; }
	.P129 {    text-decoration:underline; }
	.P13_borderStart {  font-weight:bold; margin-top:0in;   background-color:#ffff00; padding-bottom:0in;  border-bottom-style:none; }
	.P13 {  font-weight:bold;   background-color:#ffff00; padding-bottom:0in; padding-top:0in;  border-top-style:none; border-bottom-style:none; }
	.P13_borderEnd {  font-weight:bold; margin-bottom:0in;   background-color:#ffff00; padding-top:0in;  border-top-style:none;}
	.P130 {    text-decoration:underline; }
	.P131 {    text-decoration:underline; }
	.P132 {    text-decoration:underline; }
	.P133 {    text-decoration:underline; }
	.P134 {    font-weight:bold; }
	.P135 {    font-weight:bold; }
	.P136 {    font-weight:bold; }
	.P137 {    font-weight:bold; }
	.P138 {    text-align:right ! important; font-weight:bold; }
	.P139 {    text-decoration:underline; }
	.P14_borderStart {  font-weight:normal; margin-top:0in;   background-color:#ffff00; padding-bottom:0in;  border-bottom-style:none; }
	.P14 {  font-weight:normal;   background-color:#ffff00; padding-bottom:0in; padding-top:0in;  border-top-style:none; border-bottom-style:none; }
	.P14_borderEnd {  font-weight:normal; margin-bottom:0in;   background-color:#ffff00; padding-top:0in;  border-top-style:none;}
	.P144 {    font-style:italic; }
	.P145 {    font-style:italic; }
	.P146 {    font-style:italic; }
	.P147 {    font-style:italic; text-decoration:underline; }
	.P149 {    font-weight:bold; background-color:#ffff00; }
	.P15 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   }
	.P150 {    text-decoration:underline; font-weight:bold; }
	.P151 {    text-decoration:underline; }
	.P152 {    font-weight:bold; }
	.P153 {    font-weight:bold; }
	.P156 {    color:#ff0000; }
	.P157 {    color:#ff0000; }
	.P158 {    color:#ff0000; font-weight:bold; }
	.P159 {    color:#ff0000; font-weight:bold; background-color:#ffff00; }
	.P16 {  font-weight:normal; margin-bottom:0in; margin-top:0in;   }
	.P161 {    text-align:right ! important;  }
	.P162 {    text-align:right ! important;  }
	.P164 {     font-weight:bold; }
	.P165 {     font-weight:bold; }
	.P17 {  font-weight:normal; margin-bottom:0in; margin-top:0in;   }
	.P170 {    text-align:right ! important;  font-weight:bold; }
	.P177 {     text-decoration:underline; }
	.P178 {     text-decoration:underline; }
	.P18 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   }
	.P19 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   }
	.P191 {    font-weight:bold; }
	.P193 {    color:#008000; }
	.P194 {    color:#008000; }
	.P195 {    color:#008000; font-weight:bold; }
	.P196 {    text-align:right ! important; color:#008000; }
	.P197 {    color:#008000; }
	.P198 {    color:#008000; }
	.P199 {    text-align:right ! important; color:#008000; font-weight:bold; }
	.P2 {   line-height:100%;  vertical-align:middle;  text-decoration:underline; }
	.P20 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   }
	.P200 {    color:#008000; font-weight:bold; }
	.P201 {    color:#008000; font-weight:bold; }
	.P202 {    color:#008000; }
	.P203 {    color:#008000; }
	.P204 {    color:#0000ff; }
	.P205 {    color:#0000ff; }
	.P206 {    color:#0000ff; }
	.P207 {    color:#0000ff; }
	.P208 {    color:#0000ff; }
	.P209 {    color:#0000ff; }
	.P21 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   }
	.P210 {    color:#0000ff; font-weight:bold; }
	.P211 {    color:#0000ff; font-weight:bold; }
	.P212 {    color:#0000ff; font-style:italic; }
	.P213 {    color:#0000ff; font-style:italic; }
	.P214 {    color:#0000ff; }
	.P215 {    color:#0000ff; }
	.P216 {    color:#0000ff; }
	.P217 {    color:#0000ff; }
	.P218 {    color:#0000ff; }
	.P219 {    color:#0000ff; }
	.P22 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   }
	.P220 {    color:#0000ff; }
	.P221 {    color:#0000ff; }
	.P222 {    color:#0000ff; font-weight:bold; }
	.P223 {    color:#0000ff; font-weight:bold; }
	.P224 {    color:#0000ff; font-weight:bold; }
	.P225 {    text-align:right ! important; color:#0000ff; font-weight:bold; }
	.P226 {    color:#0000ff; font-style:italic; }
	.P227 {    color:#0000ff; font-weight:bold; }
	.P228 {    color:#0000ff; }
	.P229 {    color:#0000ff; }
	.P23_borderStart {  font-weight:bold; margin-top:0in;   background-color:#ffff00; padding-bottom:0in;  border-bottom-style:none; }
	.P23 {  font-weight:bold;   background-color:#ffff00; padding-bottom:0in; padding-top:0in;  border-top-style:none; border-bottom-style:none; }
	.P23_borderEnd {  font-weight:bold; margin-bottom:0in;   background-color:#ffff00; padding-top:0in;  border-top-style:none;}
	.P230 {    color:#0000ff; font-weight:bold; }
	.P231 {    color:#0000ff; font-weight:bold; }
	.P232 {    color:#141413; }
	.P233 {    color:#141413; }
	.P234 {    color:#141413; }
	.P235 {    color:#141413; }
	.P236 {    color:#141413; text-decoration:underline; }
	.P237 {    color:#141413; text-decoration:underline; }
	.P238 {    color:#141413; text-decoration:underline; }
	.P239 {    color:#141413; }
	.P24_borderStart {  font-weight:bold; margin-top:0in;   background-color:#ffff00; padding-bottom:0in;  border-bottom-style:none; }
	.P24 {  font-weight:bold;   background-color:#ffff00; padding-bottom:0in; padding-top:0in;  border-top-style:none; border-bottom-style:none; }
	.P24_borderEnd {  font-weight:bold; margin-bottom:0in;   background-color:#ffff00; padding-top:0in;  border-top-style:none;}
	.P240 {    margin-left:0in; margin-right:-0.0425in; text-indent:0in; text-decoration:underline; }
	.P241 {    margin-left:0in; margin-right:-0.0425in; text-indent:0in; }
	.P242 {    margin-left:0in; margin-right:-0.0425in; text-indent:0in; }
	.P243 {    margin-left:0in; margin-right:-0.0425in; text-indent:0in; }
	.P244 {    margin-left:0in; margin-right:-0.0425in; text-indent:0in; color:#008000; }
	.P245 {    margin-left:0in; margin-right:-0.0425in; text-indent:0in; color:#008000; }
	.P246 {    margin-left:0in; margin-right:-0.0425in; text-indent:0in; color:#0000ff; }
	.P247 {    margin-left:-0.0398in; margin-right:0in; text-indent:0in; text-decoration:underline; font-weight:bold; }
	.P248 {    margin-left:-0.0398in; margin-right:0in; text-indent:0in; font-weight:bold; }
	.P249 {    margin-left:-0.0398in; margin-right:0in; text-indent:0in; font-weight:bold; }
	.P25 {  font-weight:normal; margin-bottom:0in; margin-top:0in;   }
	.P250 {    margin-left:-0.0398in; margin-right:0in; text-indent:0in; font-weight:bold; }
	.P251 {    margin-left:-0.0398in; margin-right:0in; text-indent:0in; font-weight:bold; }
	.P252 {    margin-left:-0.0398in; margin-right:0in; text-indent:0in; }
	.P253 {    margin-left:-0.0398in; margin-right:0in; text-indent:0in; color:#008000; }
	.P254 {    margin-left:-0.0398in; margin-right:0in; text-indent:0in; color:#008000; font-weight:bold; }
	.P255 {    margin-left:-0.0398in; margin-right:0in; text-indent:0in; color:#008000; }
	.P256 {    margin-left:-0.0398in; margin-right:0in; text-indent:0in; color:#008000; }
	.P257 {    margin-left:-0.0398in; margin-right:0in; text-indent:0in; font-weight:bold; }
	.P258 {    margin-left:-0.0398in; margin-right:0in; text-indent:0in; font-weight:bold; }
	.P259 {    margin-left:-0.0398in; margin-right:0in; text-indent:0in; color:#0000ff; font-weight:bold; }
	.P26 {  font-weight:normal; margin-bottom:0in; margin-top:0in;   }
	.P260 {    margin-left:-0.0398in; margin-right:0in; text-indent:0in; color:#0000ff; font-style:italic; }
	.P261 {    margin-left:-0.0398in; margin-right:0in; text-indent:0in;  font-weight:bold; }
	.P262 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P263 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P264 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P265 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P266 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P267 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P268 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P269 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P27 {  font-weight:normal; margin-bottom:0in; margin-top:0in;   }
	.P270 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P271 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P272 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P273 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P274 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P275 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P276 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P277 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P278 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P279 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P28 {  font-weight:normal; margin-bottom:0in; margin-top:0in;   }
	.P280 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P281 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P282 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P283 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P284 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P285 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; text-decoration:underline; }
	.P286 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; text-decoration:underline; }
	.P287 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; text-decoration:underline; }
	.P288 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; text-decoration:underline; }
	.P289 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; font-style:italic; }
	.P29_borderStart {  font-weight:normal; margin-top:0in;   background-color:#ffff00; padding-bottom:0in;  border-bottom-style:none; }
	.P29 {  font-weight:normal;   background-color:#ffff00; padding-bottom:0in; padding-top:0in;  border-top-style:none; border-bottom-style:none; }
	.P29_borderEnd {  font-weight:normal; margin-bottom:0in;   background-color:#ffff00; padding-top:0in;  border-top-style:none;}
	.P290 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P291 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P292 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P293 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P294 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P295 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in;  }
	.P296 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in;  }
	.P297 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in;  }
	.P298 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in;  }
	.P299 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in;  }
	.P3 {   line-height:100%;  vertical-align:top;  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P30_borderStart {  font-weight:normal; margin-top:0in;   background-color:#ffff00; padding-bottom:0in;  border-bottom-style:none; }
	.P30 {  font-weight:normal;   background-color:#ffff00; padding-bottom:0in; padding-top:0in;  border-top-style:none; border-bottom-style:none; }
	.P30_borderEnd {  font-weight:normal; margin-bottom:0in;   background-color:#ffff00; padding-top:0in;  border-top-style:none;}
	.P300 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in;  }
	.P301 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in;  }
	.P302 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in;  }
	.P303 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; color:#141413; }
	.P304 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; color:#141413; }
	.P305 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; color:#141413; }
	.P306 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; color:#141413; }
	.P307 {    margin-left:1in; margin-right:0in; text-indent:-1in; }
	.P308 {    margin-left:-0.272in; margin-right:0in; text-indent:0.272in; font-weight:bold; }
	.P309 {    margin-left:-0.272in; margin-right:0in; text-indent:0.272in; background-color:#ffff00; }
	.P31_borderStart {  font-weight:normal; margin-top:0in;   text-decoration:underline; background-color:#ffff00; padding-bottom:0in;  border-bottom-style:none; }
	.P31 {  font-weight:normal;   text-decoration:underline; background-color:#ffff00; padding-bottom:0in; padding-top:0in;  border-top-style:none; border-bottom-style:none; }
	.P31_borderEnd {  font-weight:normal; margin-bottom:0in;   text-decoration:underline; background-color:#ffff00; padding-top:0in;  border-top-style:none;}
	.P310 {    margin-left:-0.272in; margin-right:0in; text-indent:0.272in; }
	.P311 { color:#4f81bd;  font-weight:bold; margin-bottom:0in; margin-top:0.139in;   }
	.P312 { color:#4f81bd;  font-weight:normal; margin-bottom:0in; margin-top:0.139in;   }
	.P313 { color:#4f81bd;  font-weight:normal; margin-bottom:0in; margin-top:0.139in;   }
	.P314 { color:#4f81bd;  font-weight:bold; margin-bottom:0in; margin-top:0.139in;   }
	.P315 {  line-height:100%; margin:100%; margin-left:0.1972in; margin-right:0in; text-align:left ! important; text-indent:-0.1972in;   }
	.P316 {  line-height:100%; margin:100%; margin-left:0in; margin-right:0in; text-align:left ! important; text-indent:0in;   }
	.P317 {  line-height:100%; margin:100%; margin-left:0in; margin-right:0in; text-align:left ! important; text-indent:0in;   font-style:italic; }
	.P318 {    text-decoration:underline; }
	.P32 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   }
	.P33 {  font-weight:normal; margin-bottom:0in; margin-top:0in;   }
	.P34 {  font-weight:normal; margin-bottom:0in; margin-top:0in;   }
	.P35 {  font-weight:normal; margin-bottom:0in; margin-top:0in;   }
	.P36 {  font-weight:normal; margin-bottom:0in; margin-top:0in;   }
	.P37 {  font-weight:normal; margin-bottom:0in; margin-top:0in;   }
	.P38 {  font-weight:normal; margin-bottom:0in; margin-top:0in;   text-decoration:underline; }
	.P39 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   }
	.P4 {  text-align:left ! important;   }
	.P40 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   }
	.P41 {  font-weight:normal; margin-bottom:0in; margin-top:0in;   }
	.P42 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   color:#008000; }
	.P43 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   color:#008000; }
	.P44 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   color:#008000; }
	.P45 {  font-weight:normal; margin-bottom:0in; margin-top:0in;   color:#008000; }
	.P46 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   color:#008000; }
	.P47 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   color:#008000; }
	.P48 {  font-weight:normal; margin-bottom:0in; margin-top:0in;   color:#008000; }
	.P49 {  font-weight:normal; margin-bottom:0in; margin-top:0in;   color:#008000; }
	.P5 {  text-align:left ! important;   margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P50 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   color:#008000; }
	.P51 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   color:#008000; }
	.P52 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   color:#0000ff; }
	.P53 {  font-weight:normal; margin-bottom:0in; margin-top:0in;   color:#0000ff; }
	.P54 {  font-weight:bold; margin-bottom:0in; margin-top:0in;    }
	.P55 {  font-weight:normal; margin-bottom:0in; margin-top:0in;   margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P56 {  font-weight:normal; margin-bottom:0in; margin-top:0in;   margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P57 {  margin:100%; margin-left:0.25in; margin-right:0in; text-indent:0in;   }
	.P58 {  margin:100%; margin-left:0.25in; margin-right:0in; text-indent:0in;   }
	.P59 {  margin-bottom:0in; margin-top:0in;   }
	.P6 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   }
	.P60 {  margin-bottom:0in; margin-top:0in;   }
	.P61 {  margin-bottom:0in; margin-top:0in;   text-decoration:underline; }
	.P62 {  margin-bottom:0in; margin-top:0in;   }
	.P63 {  margin-bottom:0in; margin-top:0in;   }
	.P64 {  margin-bottom:0in; margin-top:0in;   }
	.P65 {  margin-bottom:0in; margin-top:0in;   margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P67 {    text-decoration:underline; font-weight:bold; }
	.P68 {    font-weight:bold; }
	.P69 {    font-weight:bold; }
	.P7 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   }
	.P70 {    font-weight:bold; }
	.P75 {    background-color:#ffff00; }
	.P8 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   }
	.P80 {    font-weight:bold; }
	.P81 {    font-weight:bold; }
	.P82 {    font-weight:bold; }
	.P83 {    font-weight:bold; }
	.P84 {    font-weight:bold; }
	.P85 {    font-weight:bold; }
	.P86 {    font-weight:bold; background-color:#ffff00; }
	.P87 {    font-weight:bold; background-color:#ffff00; }
	.P88 {    text-decoration:underline; font-weight:bold; background-color:#ffff00; }
	.P89 {    text-decoration:underline; font-weight:bold; background-color:#ffff00; }
	.P9 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   }
	.P90 {    text-decoration:underline; background-color:#ffff00; }
	.P99 {    font-weight:bold; }
	.Table1 { width:13.2521in; margin-left:-0.0819in;  }
	.Table1_A1 { vertical-align:top; padding-left:0.075in; padding-right:0.075in; padding-top:0in; padding-bottom:0in; border-left-width:0.0176cm; border-left-style:solid; border-left- border-right-style:none; border-top-width:0.0176cm; border-top-style:solid; border-top- border-bottom-width:0.0176cm; border-bottom-style:solid; border-bottom-  }
	.Table1_A102 { vertical-align:top; background-color:#99cc00; padding-left:0.075in; padding-right:0.075in; padding-top:0in; padding-bottom:0in; border-left-width:0.0176cm; border-left-style:solid; border-left- border-right-style:none; border-top-width:0.0176cm; border-top-style:solid; border-top- border-bottom-width:0.0176cm; border-bottom-style:solid; border-bottom-  }
	.Table1_D26 { vertical-align:top; background-color:#ff9900; padding-left:0.075in; padding-right:0.075in; padding-top:0in; padding-bottom:0in; border-left-width:0.0176cm; border-left-style:solid; border-left- border-right-style:none; border-top-width:0.0176cm; border-top-style:solid; border-top- border-bottom-width:0.0176cm; border-bottom-style:solid; border-bottom-  }
	.Table1_E26 { vertical-align:top; background-color:#ff9900; padding-left:0.075in; padding-right:0.075in; padding-top:0in; padding-bottom:0in; border-left-style:none; border-right-style:none; border-top-width:0.0176cm; border-top-style:solid; border-top- border-bottom-width:0.0176cm; border-bottom-style:solid; border-bottom-  }
	.Table1_G1 { vertical-align:top; background-color:#00ffff; padding-left:0.075in; padding-right:0.075in; padding-top:0in; padding-bottom:0in; border-left-width:0.0176cm; border-left-style:solid; border-left- border-right-style:none; border-top-width:0.0176cm; border-top-style:solid; border-top- border-bottom-width:0.0176cm; border-bottom-style:solid; border-bottom-  }
	.Table1_M11 { vertical-align:top; background-color:#ff0000; padding-left:0.075in; padding-right:0.075in; padding-top:0in; padding-bottom:0in; border-left-width:0.0176cm; border-left-style:solid; border-left- border-right-style:none; border-top-width:0.0176cm; border-top-style:solid; border-top- border-bottom-width:0.0176cm; border-bottom-style:solid; border-bottom-  }
	.Table1_V1 { vertical-align:top; background-color:#c0c0c0; padding-left:0.075in; padding-right:0.075in; padding-top:0in; padding-bottom:0in; border-left-width:0.0176cm; border-left-style:solid; border-left- border-right-style:none; border-top-width:0.0176cm; border-top-style:solid; border-top- border-bottom-width:0.0176cm; border-bottom-style:solid; border-bottom-  }
	.Table1_V102 { vertical-align:top; background-color:#808000; padding-left:0.075in; padding-right:0.075in; padding-top:0in; padding-bottom:0in; border-left-width:0.0176cm; border-left-style:solid; border-left- border-right-style:none; border-top-width:0.0176cm; border-top-style:solid; border-top- border-bottom-width:0.0176cm; border-bottom-style:solid; border-bottom-  }
	.Table1_W1 { vertical-align:top; background-color:#ffff00; padding-left:0.075in; padding-right:0.075in; padding-top:0in; padding-bottom:0in; border-left-width:0.0176cm; border-left-style:solid; border-left- border-right-style:none; border-top-width:0.0176cm; border-top-style:solid; border-top- border-bottom-width:0.0176cm; border-bottom-style:solid; border-bottom-  }
	.Table1_d1 { vertical-align:top; background-color:#ffff00; padding-left:0.075in; padding-right:0.075in; padding-top:0in; padding-bottom:0in; border-width:0.0176cm; border-style:solid; border-  }
	.Table1_d33 { vertical-align:top; background-color:#ff0000; padding-left:0.075in; padding-right:0.075in; padding-top:0in; padding-bottom:0in; border-width:0.0176cm; border-style:solid; border-  }
	.Table1_A { width:0.2528in; }
	.Table1_B { width:0.3938in; }
	.Table1_C { width:0.216in; }
	.Table1_D { width:0.2958in; }
	.Table1_E { width:0.2951in; }
	.Table1_F { width:0.1965in; }
	.Table1_G { width:0.1972in; }
	.Table1_K { width:0.5903in; }
	.Table1_O { width:4.8694in; }
	.Table1_P { width:0.2882in; }
	.Table1_Q { width:0.4313in; }
	.Table1_T { width:0.416in; }
	.Table1_U { width:0.4743in; }
	.Table1_V { width:0.166in; }
	.Table1_W { width:0.2375in; }
	.Table1_X { width:0.2396in; }
	.Table1_d { width:0.2535in; }
	.HTML_20_Typewriter {   }
	.Internet_20_link { color:#0000ff; text-decoration:underline; }
	.Strong_20_Emphasis { font-weight:bold; }
	.T112 { text-decoration:underline; }
	.T114 { text-decoration:underline; }
	.T116 { text-decoration:underline; }
	.T12 {  font-weight:bold; }
	.T129 { font-weight:bold; }
	.T135 { font-style:italic; }
	.T136 { font-style:italic; }
	.T137 { font-style:italic; }
	.T138 { font-style:italic; }
	.T139 { font-style:italic; }
	.T140 { font-style:italic; }
	.T141 { font-style:italic; }
	.T142 { font-style:italic; }
	.T143 { font-style:italic; }
	.T144 { font-style:italic; }
	.T145 { font-style:italic; }
	.T146 { font-style:italic; font-weight:bold; }
	.T15 {  font-weight:normal; }
	.T156 { font-style:italic; }
	.T159 { color:#141413; }
	.T184 {  font-style:italic; }
	.T185 {  font-style:italic; }
	.T186 {  font-style:italic; }
	.T201 { vertical-align:sub; font-size:58%;font-style:italic; }
	.T203 {   font-weight:bold; background-color:#ffff00; }
	.T204 { vertical-align:super; font-size:58%;font-style:italic; }
	.T205 { vertical-align:super; font-size:58%;font-style:italic; }
	.T206 {  font-style:italic; }
	.T208 {  font-style:italic; }
	.T209 { color:#141413; }
	.T210 { color:#141413; }
	.T211 { color:#141413; font-style:italic; }
	.T212 { color:#141413; }
	.T213 { font-style:italic; }
	.T22 {   text-decoration:underline; background-color:#ffff00; }
	.T23 {   text-decoration:underline; }
	.T25 { font-weight:bold; }
	.T26 { font-weight:bold; }
	.T40 { text-decoration:underline; }
	.T42 { text-decoration:underline; }
	.T43 { text-decoration:underline; }
	.T47 { text-decoration:underline; }
	.T62 {  font-style:italic; }
	.T63 {  font-style:italic; }
	.T64 {  font-style:italic; font-weight:normal; }
	.T71 {   background-color:#ffff00; }
	.T72 {  background-color:#ffff00; }
	.T81 { color:#ff0000; font-weight:bold; background-color:#ffff00; }
	.T88 {  font-style:italic; }
	.T89 {  font-style:italic; }
	.T9 {   font-weight:normal; }
	.T90 {  font-style:italic; }
	.T96 {   font-weight:normal; }
        div.dt-before-table {display: none !important;}
        div.dataTables_info {display: none !important;}
        div.dataTables_paginate {display: none !important;}
	</style>
</%block>

<h2>${ctx.name}</h2>

<div class="row-fluid">
    <div class="span6">
        ${util.dl_table(('Recipient language', h.link(request, ctx.recipient)), ('Source language', h.link(request, ctx.donor)))}
    </div>
</div>

<h3>Description</h3>
<div>${u.description(request, ctx.description)|n}</div>

##${request.get_datatable('values', h.models.Value, pair=ctx).render()}

<%def name="sidebar()">
    <%util:well title="Summary">
        ${request.get_datatable('values', h.models.Value, pair=ctx).render()}
    </%util:well>
    <%util:well title="References">
        ${util.sources_list(sorted(list(ctx.sources), key=lambda s: s.name))}
    </%util:well>
</%def>
