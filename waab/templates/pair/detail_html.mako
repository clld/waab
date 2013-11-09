<%inherit file="../${context.get('request').registry.settings.get('clld.app_template', 'app.mako')}"/>
<%namespace name="util" file="../util.mako"/>
<%! active_menu_item = "pairs" %>


<%block name="head">
<style type="text/css">
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
	.P1 {  text-align:left ! important;   }
	.P101 {     font-weight:bold; }
	.P102 {     font-weight:bold; }
	.P105 {    text-align:right ! important;  font-weight:bold; }
	.P112 {     text-decoration:underline; }
	.P113 {     text-decoration:underline; }
	.P12 {    background-color:#ffff00; }
	.P126 {    font-weight:bold; }
	.P128 {    color:#008000; }
	.P129 {    color:#008000; }
	.P130 {    color:#008000; font-weight:bold; }
	.P131 {    text-align:right ! important; color:#008000; }
	.P132 {    color:#008000; }
	.P133 {    color:#008000; }
	.P134 {    text-align:right ! important; color:#008000; font-weight:bold; }
	.P135 {    color:#008000; font-weight:bold; }
	.P136 {    color:#008000; font-weight:bold; }
	.P137 {    color:#008000; }
	.P138 {    color:#008000; }
	.P139 {    color:#0000ff; }
	.P140 {    color:#0000ff; }
	.P141 {    color:#0000ff; }
	.P142 {    color:#0000ff; }
	.P143 {    color:#0000ff; }
	.P144 {    color:#0000ff; }
	.P145 {    color:#0000ff; font-weight:bold; }
	.P146 {    color:#0000ff; font-weight:bold; }
	.P147 {    color:#0000ff; font-style:italic; }
	.P148 {    color:#0000ff; font-style:italic; }
	.P149 {    color:#0000ff; }
	.P150 {    color:#0000ff; }
	.P151 {    color:#0000ff; }
	.P152 {    color:#0000ff; }
	.P153 {    color:#0000ff; }
	.P154 {    color:#0000ff; }
	.P155 {    color:#0000ff; }
	.P156 {    color:#0000ff; }
	.P157 {    color:#0000ff; font-weight:bold; }
	.P158 {    color:#0000ff; font-weight:bold; }
	.P159 {    color:#0000ff; font-weight:bold; }
	.P160 {    text-align:right ! important; color:#0000ff; font-weight:bold; }
	.P161 {    color:#0000ff; font-style:italic; }
	.P162 {    color:#0000ff; font-weight:bold; }
	.P163 {    color:#0000ff; }
	.P164 {    color:#0000ff; }
	.P165 {    color:#0000ff; font-weight:bold; }
	.P166 {    color:#0000ff; font-weight:bold; }
	.P167 {    color:#141413; }
	.P168 {    color:#141413; }
	.P169 {    color:#141413; }
	.P17 {    font-weight:bold; }
	.P170 {    color:#141413; }
	.P171 {    color:#141413; }
	.P172 {    color:#141413; text-decoration:underline; }
	.P173 {    color:#141413; text-decoration:underline; }
	.P174 {    color:#141413; text-decoration:underline; }
	.P175 {    color:#141413; }
	.P176 {    margin-left:0in; margin-right:-0.0425in; text-indent:0in; text-decoration:underline; }
	.P177 {    margin-left:0in; margin-right:-0.0425in; text-indent:0in; }
	.P178 {    margin-left:0in; margin-right:-0.0425in; text-indent:0in; }
	.P179 {    margin-left:0in; margin-right:-0.0425in; text-indent:0in; }
	.P18 {    font-weight:bold; }
	.P180 {    margin-left:0in; margin-right:-0.0425in; text-indent:0in; color:#008000; }
	.P181 {    margin-left:0in; margin-right:-0.0425in; text-indent:0in; color:#0000ff; }
	.P182 {    margin-left:-0.0398in; margin-right:0in; text-indent:0in; text-decoration:underline; font-weight:bold; }
	.P183 {    margin-left:-0.0398in; margin-right:0in; text-indent:0in; font-weight:bold; }
	.P184 {    margin-left:-0.0398in; margin-right:0in; text-indent:0in; font-weight:bold; }
	.P185 {    margin-left:-0.0398in; margin-right:0in; text-indent:0in; font-weight:bold; }
	.P186 {    margin-left:-0.0398in; margin-right:0in; text-indent:0in; font-weight:bold; }
	.P187 {    margin-left:-0.0398in; margin-right:0in; text-indent:0in; }
	.P188 {    margin-left:-0.0398in; margin-right:0in; text-indent:0in; color:#008000; }
	.P189 {    margin-left:-0.0398in; margin-right:0in; text-indent:0in; color:#008000; font-weight:bold; }
	.P19 {    font-weight:bold; }
	.P190 {    margin-left:-0.0398in; margin-right:0in; text-indent:0in; color:#008000; }
	.P191 {    margin-left:-0.0398in; margin-right:0in; text-indent:0in; color:#008000; }
	.P192 {    margin-left:-0.0398in; margin-right:0in; text-indent:0in; font-weight:bold; }
	.P193 {    margin-left:-0.0398in; margin-right:0in; text-indent:0in; font-weight:bold; }
	.P194 {    margin-left:-0.0398in; margin-right:0in; text-indent:0in; color:#0000ff; font-weight:bold; }
	.P195 {    margin-left:-0.0398in; margin-right:0in; text-indent:0in; color:#0000ff; font-style:italic; }
	.P196 {    margin-left:-0.0398in; margin-right:0in; text-indent:0in;  font-weight:bold; }
	.P197 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P198 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P199 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P2 {  text-align:left ! important;   margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P20 {    font-weight:bold; }
	.P200 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P201 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P202 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P203 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P204 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P205 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P206 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P207 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P208 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P209 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P21 {    font-weight:bold; }
	.P210 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P211 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P212 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P213 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P214 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P215 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P216 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P217 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P218 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P219 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P22 {    font-weight:bold; }
	.P220 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P221 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; text-decoration:underline; }
	.P222 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; text-decoration:underline; }
	.P223 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; font-style:italic; }
	.P224 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P225 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P226 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P227 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P228 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P229 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in;  }
	.P23 {    font-weight:bold; background-color:#ffff00; }
	.P230 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in;  }
	.P231 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in;  }
	.P232 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in;  }
	.P233 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in;  }
	.P234 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in;  }
	.P235 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in;  }
	.P236 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in;  }
	.P237 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in;  }
	.P238 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P239 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; color:#141413; }
	.P24 {    font-weight:bold; background-color:#ffff00; }
	.P240 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; color:#141413; }
	.P241 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; color:#141413; }
	.P242 {    margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; color:#141413; }
	.P243 {    margin-left:1in; margin-right:0in; text-indent:-1in; }
	.P244 {    margin-left:-0.272in; margin-right:0in; text-indent:0.272in; font-weight:bold; }
	.P245 {    margin-left:-0.272in; margin-right:0in; text-indent:0.272in; background-color:#ffff00; }
	.P246 {    margin-left:-0.272in; margin-right:0in; text-indent:0.272in; }
	.P247 {    margin-left:0.3937in; margin-right:0in; text-indent:-0.3937in; }
	.P248 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   }
	.P249 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   }
	.P25 {    text-decoration:underline; font-weight:bold; background-color:#ffff00; }
	.P250 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   }
	.P251 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   }
	.P252 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   }
	.P253 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   }
	.P254 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   }
	.P255_borderStart {  font-weight:bold; margin-top:0in;   background-color:#ffff00; padding-bottom:0in;  border-bottom-style:none; }
	.P255 {  font-weight:bold;   background-color:#ffff00; padding-bottom:0in; padding-top:0in;  border-top-style:none; border-bottom-style:none; }
	.P255_borderEnd {  font-weight:bold; margin-bottom:0in;   background-color:#ffff00; padding-top:0in;  border-top-style:none;}
	.P256_borderStart {  font-weight:normal; margin-top:0in;   background-color:#ffff00; padding-bottom:0in;  border-bottom-style:none; }
	.P256 {  font-weight:normal;   background-color:#ffff00; padding-bottom:0in; padding-top:0in;  border-top-style:none; border-bottom-style:none; }
	.P256_borderEnd {  font-weight:normal; margin-bottom:0in;   background-color:#ffff00; padding-top:0in;  border-top-style:none;}
	.P257 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   }
	.P258 {  font-weight:normal; margin-bottom:0in; margin-top:0in;   }
	.P259 {  font-weight:normal; margin-bottom:0in; margin-top:0in;   }
	.P26 {    text-decoration:underline; font-weight:bold; background-color:#ffff00; }
	.P260 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   }
	.P261 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   }
	.P262 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   }
	.P263 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   }
	.P264 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   }
	.P265_borderStart {  font-weight:bold; margin-top:0in;   background-color:#ffff00; padding-bottom:0in;  border-bottom-style:none; }
	.P265 {  font-weight:bold;   background-color:#ffff00; padding-bottom:0in; padding-top:0in;  border-top-style:none; border-bottom-style:none; }
	.P265_borderEnd {  font-weight:bold; margin-bottom:0in;   background-color:#ffff00; padding-top:0in;  border-top-style:none;}
	.P266_borderStart {  font-weight:bold; margin-top:0in;   background-color:#ffff00; padding-bottom:0in;  border-bottom-style:none; }
	.P266 {  font-weight:bold;   background-color:#ffff00; padding-bottom:0in; padding-top:0in;  border-top-style:none; border-bottom-style:none; }
	.P266_borderEnd {  font-weight:bold; margin-bottom:0in;   background-color:#ffff00; padding-top:0in;  border-top-style:none;}
	.P267 {  font-weight:normal; margin-bottom:0in; margin-top:0in;   }
	.P268 {  font-weight:normal; margin-bottom:0in; margin-top:0in;   }
	.P269 {  font-weight:normal; margin-bottom:0in; margin-top:0in;   }
	.P27 {    text-decoration:underline; background-color:#ffff00; }
	.P270 {  font-weight:normal; margin-bottom:0in; margin-top:0in;   }
	.P271_borderStart {  font-weight:normal; margin-top:0in;   background-color:#ffff00; padding-bottom:0in;  border-bottom-style:none; }
	.P271 {  font-weight:normal;   background-color:#ffff00; padding-bottom:0in; padding-top:0in;  border-top-style:none; border-bottom-style:none; }
	.P271_borderEnd {  font-weight:normal; margin-bottom:0in;   background-color:#ffff00; padding-top:0in;  border-top-style:none;}
	.P272_borderStart {  font-weight:normal; margin-top:0in;   background-color:#ffff00; padding-bottom:0in;  border-bottom-style:none; }
	.P272 {  font-weight:normal;   background-color:#ffff00; padding-bottom:0in; padding-top:0in;  border-top-style:none; border-bottom-style:none; }
	.P272_borderEnd {  font-weight:normal; margin-bottom:0in;   background-color:#ffff00; padding-top:0in;  border-top-style:none;}
	.P273_borderStart {  font-weight:normal; margin-top:0in;   text-decoration:underline; background-color:#ffff00; padding-bottom:0in;  border-bottom-style:none; }
	.P273 {  font-weight:normal;   text-decoration:underline; background-color:#ffff00; padding-bottom:0in; padding-top:0in;  border-top-style:none; border-bottom-style:none; }
	.P273_borderEnd {  font-weight:normal; margin-bottom:0in;   text-decoration:underline; background-color:#ffff00; padding-top:0in;  border-top-style:none;}
	.P274 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   }
	.P275 {  font-weight:normal; margin-bottom:0in; margin-top:0in;   }
	.P276 {  font-weight:normal; margin-bottom:0in; margin-top:0in;   }
	.P277 {  font-weight:normal; margin-bottom:0in; margin-top:0in;   }
	.P278 {  font-weight:normal; margin-bottom:0in; margin-top:0in;   }
	.P279 {  font-weight:normal; margin-bottom:0in; margin-top:0in;   }
	.P280 {  font-weight:normal; margin-bottom:0in; margin-top:0in;   text-decoration:underline; }
	.P281 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   }
	.P282 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   }
	.P283 {  font-weight:normal; margin-bottom:0in; margin-top:0in;   }
	.P284 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   color:#008000; }
	.P285 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   color:#008000; }
	.P286 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   color:#008000; }
	.P287 {  font-weight:normal; margin-bottom:0in; margin-top:0in;   color:#008000; }
	.P288 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   color:#008000; }
	.P289 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   color:#008000; }
	.P290 {  font-weight:normal; margin-bottom:0in; margin-top:0in;   color:#008000; }
	.P291 {  font-weight:normal; margin-bottom:0in; margin-top:0in;   color:#008000; }
	.P292 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   color:#008000; }
	.P293 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   color:#008000; }
	.P294 {  font-weight:bold; margin-bottom:0in; margin-top:0in;   color:#0000ff; }
	.P295 {  font-weight:normal; margin-bottom:0in; margin-top:0in;   color:#0000ff; }
	.P296 {  font-weight:bold; margin-bottom:0in; margin-top:0in;    }
	.P297 {  font-weight:normal; margin-bottom:0in; margin-top:0in;   margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P298 {  font-weight:normal; margin-bottom:0in; margin-top:0in;   margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P299 { color:#4f81bd;  font-weight:bold; margin-bottom:0in; margin-top:0.139in;   }
	.P300 { color:#4f81bd;  font-weight:normal; margin-bottom:0in; margin-top:0.139in;   }
	.P301 { color:#4f81bd;  font-weight:normal; margin-bottom:0in; margin-top:0.139in;   }
	.P302 { color:#4f81bd;  font-weight:bold; margin-bottom:0in; margin-top:0.139in;   }
	.P303 {  margin-bottom:0in; margin-top:0in;   }
	.P304 {  margin-bottom:0in; margin-top:0in;   }
	.P305 {  margin-bottom:0in; margin-top:0in;   }
	.P306 {  margin-bottom:0in; margin-top:0in;   }
	.P307 {  margin-bottom:0in; margin-top:0in;   }
	.P308 {  margin-bottom:0in; margin-top:0in;   margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P309 {  margin:100%; margin-left:0.5in; margin-right:0in; text-indent:-0.5in;   }
	.P310 {    text-decoration:underline; }
	.P312 {   vertical-align:middle;  }
	.P313 {   vertical-align:middle;  text-decoration:underline; }
	.P314 {   vertical-align:top;  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P317 {  margin-left:0in; margin-right:0in; text-align:left ! important; text-indent:0in;   font-style:italic; }
	.P36 {    font-weight:bold; }
	.P4 {    text-decoration:underline; font-weight:bold; }
	.P5 {    font-weight:bold; }
	.P50 {    text-align:right ! important; }
	.P6 {    font-weight:bold; }
	.P60 {    text-decoration:underline; font-weight:bold; }
	.P61 {    text-decoration:underline; }
	.P62 {    text-decoration:underline; }
	.P63 {    text-decoration:underline; }
	.P64 {    text-decoration:underline; }
	.P65 {    text-decoration:underline; }
	.P66 {    text-decoration:underline; }
	.P67 {    text-decoration:underline; }
	.P68 {    text-decoration:underline; }
	.P69 {    text-decoration:underline; }
	.P7 {    font-weight:bold; }
	.P70 {    font-weight:bold; }
	.P71 {    font-weight:bold; }
	.P72 {    font-weight:bold; }
	.P73 {    font-weight:bold; }
	.P74 {    text-align:right ! important; font-weight:bold; }
	.P75 {    text-decoration:underline; }
	.P81 {    font-style:italic; }
	.P82 {    font-style:italic; }
	.P83 {    font-style:italic; }
	.P84 {    text-decoration:underline; }
	.P86 {    font-weight:bold; background-color:#ffff00; }
	.P87 {    text-decoration:underline; font-weight:bold; }
	.P88 {    text-decoration:underline; }
	.P89 {    font-weight:bold; }
	.P90 {    font-weight:bold; }
	.P93 {    color:#ff0000; }
	.P94 {    color:#ff0000; }
	.P95 {    color:#ff0000; font-weight:bold; }
	.P96 {    color:#ff0000; font-weight:bold; background-color:#ffff00; }
	.P98 {    text-align:right ! important;  }
	.P99 {    text-align:right ! important;  }
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
	.T102 {   font-weight:normal; }
	.T118 { text-decoration:underline; }
	.T12 {  font-weight:bold; }
	.T120 { text-decoration:underline; }
	.T122 { text-decoration:underline; }
	.T132 { font-weight:bold; }
	.T134 { font-style:italic; }
	.T135 { font-style:italic; }
	.T136 { font-style:italic; }
	.T143 { font-style:italic; }
	.T144 { font-style:italic; }
	.T145 { font-style:italic; }
	.T146 { font-style:italic; }
	.T147 { font-style:italic; }
	.T148 { font-style:italic; }
	.T15 {  font-weight:normal; }
	.T150 { font-style:italic; }
	.T151 { font-style:italic; }
	.T152 { font-style:italic; }
	.T153 { font-style:italic; }
	.T154 { font-style:italic; }
	.T155 { font-style:italic; }
	.T156 { font-style:italic; }
	.T157 { font-style:italic; font-weight:bold; }
	.T165 { font-style:italic; }
	.T173 { font-style:italic; }
	.T180 { color:#141413; }
	.T205 {  font-style:italic; }
	.T206 {  font-style:italic; }
	.T207 {  font-style:italic; }
	.T22 {   text-decoration:underline; background-color:#ffff00; }
	.T222 { color:#0000ff;  font-weight:bold; }
	.T223 { vertical-align:sub; font-size:58%;font-style:italic; }
	.T225 {   font-weight:bold; background-color:#ffff00; }
	.T226 { vertical-align:super; font-size:58%;font-style:italic; }
	.T227 { vertical-align:super; font-size:58%;font-style:italic; }
	.T228 {  font-style:italic; }
	.T23 {   text-decoration:underline; }
	.T230 {  font-style:italic; }
	.T231 { color:#141413; }
	.T232 { color:#141413; }
	.T233 { color:#141413; font-style:italic; }
	.T234 { color:#141413; }
	.T235 { font-style:italic; }
	.T25 { font-weight:bold; }
	.T26 { font-weight:bold; }
	.T40 { text-decoration:underline; }
	.T42 { text-decoration:underline; }
	.T43 { text-decoration:underline; }
	.T44 { text-decoration:underline; }
	.T45 { text-decoration:underline; }
	.T62 {  font-style:italic; }
	.T64 {  font-style:italic; }
	.T65 {  font-style:italic; }
	.T66 {  font-style:italic; font-weight:normal; }
	.T74 {   background-color:#ffff00; }
	.T75 {  background-color:#ffff00; }
	.T84 { color:#ff0000; font-weight:bold; background-color:#ffff00; }
	.T9 {   font-weight:normal; }
	.T90 {  font-style:italic; }
	.T93 {  font-style:italic; }
	.T94 {  font-style:italic; }
	.T95 {  font-style:italic; }
        .T166, .T172, .T171 {font-variant: small-caps;}
        div.dataTables_info {display: none !important;}
	</style>
</%block>

<h2>${ctx.name}</h2>

<h3>Summary</h3>
${request.get_datatable('values', h.models.Value, pair=ctx).render()}

<h3>Description</h3>
<div>${u.description(request, ctx.description)|n}</div>

<%def name="sidebar()">
    <%util:well>
        ${util.dl_table(('Recipient language:', h.link(request, ctx.recipient)), ('Donor language:', h.link(request, ctx.donor)), ('Relability of borrowed status/affixhood:', ctx.reliability), ('Borrowed affixes:', ctx.count_borrowed), ('Interelated affixes:', ctx.count_interrel))}
    </%util:well>
    % if len(ctx.recipient.donor_assocs) > 1:
     <%util:well>
        Affixes borrowed from other languages in ${ctx.recipient}:
        ${util.stacked_links([pair for pair in ctx.recipient.donor_assocs if pair != ctx])}
    </%util:well>
   % endif
    <%util:well title="References">
        ${util.sources_list(sorted(list(ctx.sources), key=lambda s: s.name))}
    </%util:well>
</%def>
