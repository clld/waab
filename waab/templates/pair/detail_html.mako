<%inherit file="../${context.get('request').registry.settings.get('clld.app_template', 'app.mako')}"/>
<%namespace name="util" file="../util.mako"/>
<%! active_menu_item = "pairs" %>


<%block name="head">
<style type="text/css">
	table { border-collapse:collapse; border-spacing:0; empty-cells:show }
	td, th { vertical-align:top;}
	h1, h2, h3, h4, h5, h6 { clear:both }
	ol, ul { margin:0; padding:0;}
	li { list-style: none; margin:0; padding:0;}
	<!-- "li span.odfLiEnd" - IE 7 issue-->
	li span. { clear: both; line-height:0; width:0; height:0; margin:0; padding:0; }
	span.footnodeNumber { padding-right:1em; }
	span.annotation_style_by_filter { font-size:95%; background-color:#fff000;  margin:0; border:0; padding:0;  }
	* { margin:0;}
	.P1 { color:#000000; line-height:100%; vertical-align:middle; }
	.P10 { font-weight:normal; margin-bottom:0in; margin-top:0in; }
	.P100 { text-decoration:underline; }
	.P101 { text-decoration:underline; }
	.P102 { text-decoration:underline; }
	.P103 { text-decoration:underline; }
	.P104 { text-decoration:underline; }
	.P105 { text-decoration:underline; }
	.P106 { text-decoration:underline; }
	.P107 { font-weight:bold; }
	.P108 { text-align:right ! important; font-weight:bold; }
	.P109 { font-weight:bold; }
	.P11 { font-weight:bold; margin-bottom:0in; margin-top:0in; }
	.P110 { font-weight:bold; }
	.P111 { font-weight:bold; }
	.P112 { text-decoration:underline; }
	.P113 { }
	.P114 { }
	.P115 { }
	.P116 { }
	.P117 { font-style:italic; }
	.P118 { font-style:italic; }
	.P119 { font-style:italic; }
	.P12 { font-weight:bold; margin-bottom:0in; margin-top:0in; }
	.P120 { }
	.P121 { text-decoration:underline; font-weight:bold; }
	.P122 { font-weight:bold; }
	.P123 { font-weight:bold; }
	.P124 { font-weight:bold; }
	.P125 { }
	.P126 { }
	.P127 { }
	.P128 { }
	.P129 { }
	.P13 { font-weight:bold; margin-bottom:0in; margin-top:0in; }
	.P130 { }
	.P131 { }
	.P132 { }
	.P133 { background-color:#ffff00; }
	.P134 { font-weight:bold; }
	.P135 { font-weight:bold; }
	.P136 { font-weight:bold; }
	.P137 { font-weight:bold; }
	.P138 { font-weight:bold; }
	.P139 { font-weight:bold; }
	.P14 { font-weight:bold; margin-bottom:0in; margin-top:0in; }
	.P140 { font-weight:bold; background-color:#ffff00; }
	.P141 { font-weight:bold; background-color:#ffff00; }
	.P142 { text-decoration:underline; font-weight:bold; background-color:#ffff00; }
	.P143 { text-decoration:underline; font-weight:bold; background-color:#ffff00; }
	.P144 { text-decoration:underline; background-color:#ffff00; }
	.P145 { text-decoration:underline; font-weight:bold; }
	.P146 { text-decoration:underline; }
	.P147 { font-weight:bold; }
	.P148 { font-weight:bold; }
	.P149 { }
	.P15 { font-weight:bold; margin-bottom:0in; margin-top:0in; }
	.P150 { }
	.P151 { }
	.P152 { }
	.P153 { }
	.P154 { }
	.P155 { }
	.P156 { }
	.P157 { }
	.P158 { }
	.P159 { }
	.P16 { font-weight:bold; margin-bottom:0in; margin-top:0in; }
	.P160 { font-weight:bold; }
	.P161 { }
	.P162 { color:#ff0000; font-weight:bold; }
	.P163 { color:#ff0000; }
	.P164 { color:#ff0000; }
	.P165 { color:#ff0000; font-weight:bold; background-color:#ffff00; }
	.P166 { color:#ff0000; font-weight:bold; background-color:#ffff00; }
	.P167 { color:#000000; font-weight:bold; }
	.P168 { color:#000000; }
	.P169 { text-align:right ! important; color:#000000; }
	.P17_borderStart { font-weight:bold; margin-top:0in; background-color:#ffff00; padding-bottom:0in;  border-bottom-style:none; }
	.P17 { font-weight:bold; background-color:#ffff00; padding-bottom:0in; padding-top:0in;  border-top-style:none; border-bottom-style:none; }
	.P17_borderEnd { font-weight:bold; margin-bottom:0in; background-color:#ffff00; padding-top:0in;  border-top-style:none;}
	.P170 { text-align:right ! important; color:#000000; }
	.P171 { color:#000000; }
	.P172 { color:#000000; font-weight:bold; }
	.P173 { color:#000000; }
	.P174 { text-align:right ! important; color:#000000; font-weight:bold; }
	.P175 { color:#000000; }
	.P176 { color:#000000; }
	.P177 { color:#000000; }
	.P178 { color:#000000; }
	.P179 { color:#000000; }
	.P18_borderStart { font-weight:bold; margin-top:0in; background-color:#ffff00; padding-bottom:0in;  border-bottom-style:none; }
	.P18 { font-weight:bold; background-color:#ffff00; padding-bottom:0in; padding-top:0in;  border-top-style:none; border-bottom-style:none; }
	.P18_borderEnd { font-weight:bold; margin-bottom:0in; background-color:#ffff00; padding-top:0in;  border-top-style:none;}
	.P180 { color:#000000; }
	.P181 { color:#000000; text-decoration:underline; }
	.P182 { color:#000000; text-decoration:underline; }
	.P183 { color:#000000; }
	.P184 { color:#000000; }
	.P185 { color:#000000; }
	.P186 { color:#000000; }
	.P187 { color:#000000; }
	.P188 { color:#000000; }
	.P189 { color:#008000; }
	.P19_borderStart { font-weight:bold; margin-top:0in; background-color:#ffff00; padding-bottom:0in;  border-bottom-style:none; }
	.P19 { font-weight:bold; background-color:#ffff00; padding-bottom:0in; padding-top:0in;  border-top-style:none; border-bottom-style:none; }
	.P19_borderEnd { font-weight:bold; margin-bottom:0in; background-color:#ffff00; padding-top:0in;  border-top-style:none;}
	.P190 { color:#008000; }
	.P191 { color:#008000; font-weight:bold; }
	.P192 { text-align:right ! important; color:#008000; font-weight:bold; }
	.P193 { color:#008000; font-weight:bold; }
	.P194 { text-align:right ! important; color:#008000; }
	.P195 { color:#008000; }
	.P196 { color:#008000; }
	.P197 { color:#008000; font-weight:bold; }
	.P198 { color:#008000; }
	.P199 { color:#008000; }
	.P2 { color:#000000; line-height:100%; vertical-align:middle; text-decoration:underline; }
	.P20 { font-weight:normal; margin-bottom:0in; margin-top:0in; }
	.P200 { color:#0000ff; }
	.P201 { color:#0000ff; }
	.P202 { color:#0000ff; }
	.P203 { color:#0000ff; }
	.P204 { color:#0000ff; }
	.P205 { color:#0000ff; }
	.P206 { color:#0000ff; font-weight:bold; }
	.P207 { color:#0000ff; font-weight:bold; }
	.P208 { color:#0000ff; font-style:italic; }
	.P209 { color:#0000ff; font-style:italic; }
	.P21 { font-weight:normal; margin-bottom:0in; margin-top:0in; }
	.P210 { color:#0000ff; font-weight:bold; }
	.P211 { color:#0000ff; font-weight:bold; }
	.P212 { text-align:right ! important; color:#0000ff; font-weight:bold; }
	.P213 { color:#0000ff; font-weight:bold; }
	.P214 { color:#0000ff; }
	.P215 { color:#0000ff; }
	.P216 { color:#0000ff; }
	.P217 { color:#0000ff; }
	.P218 { color:#0000ff; }
	.P219 { color:#0000ff; }
	.P22 { font-weight:normal; margin-bottom:0in; margin-top:0in; }
	.P220 { color:#0000ff; }
	.P221 { color:#0000ff; }
	.P222 { color:#0000ff; font-style:italic; }
	.P223 { color:#0000ff; font-weight:bold; }
	.P224 { color:#0000ff; }
	.P225 { color:#0000ff; }
	.P226 { color:#0000ff; font-weight:bold; }
	.P227 { color:#0000ff; font-weight:bold; }
	.P228 { color:#141413; }
	.P229 { color:#141413; text-decoration:underline; }
	.P23 { font-weight:normal; margin-bottom:0in; margin-top:0in; }
	.P230 { color:#141413; text-decoration:underline; }
	.P231 { color:#141413; text-decoration:underline; }
	.P232 { color:#141413; }
	.P233 { color:#141413; }
	.P234 { color:#141413; }
	.P235 { color:#141413; }
	.P236 { color:#141413; }
	.P237 { margin-left:0in; margin-right:-0.0425in; text-indent:0in; text-decoration:underline; }
	.P238 { margin-left:0in; margin-right:-0.0425in; text-indent:0in; }
	.P239 { margin-left:0in; margin-right:-0.0425in; text-indent:0in; }
	.P24_borderStart { font-weight:normal; margin-top:0in; background-color:#ffff00; padding-bottom:0in;  border-bottom-style:none; }
	.P24 { font-weight:normal; background-color:#ffff00; padding-bottom:0in; padding-top:0in;  border-top-style:none; border-bottom-style:none; }
	.P24_borderEnd { font-weight:normal; margin-bottom:0in; background-color:#ffff00; padding-top:0in;  border-top-style:none;}
	.P240 { margin-left:0in; margin-right:-0.0425in; text-indent:0in; }
	.P241 { margin-left:0in; margin-right:-0.0425in; text-indent:0in; color:#008000; }
	.P242 { margin-left:0in; margin-right:-0.0425in; text-indent:0in; color:#0000ff; }
	.P243 { margin-left:-0.0398in; margin-right:0in; text-indent:0in; text-decoration:underline; font-weight:bold; }
	.P244 { margin-left:-0.0398in; margin-right:0in; text-indent:0in; }
	.P245 { margin-left:-0.0398in; margin-right:0in; text-indent:0in; font-weight:bold; }
	.P246 { margin-left:-0.0398in; margin-right:0in; text-indent:0in; font-weight:bold; }
	.P247 { margin-left:-0.0398in; margin-right:0in; text-indent:0in; font-weight:bold; }
	.P248 { margin-left:-0.0398in; margin-right:0in; text-indent:0in; font-weight:bold; }
	.P249 { margin-left:-0.0398in; margin-right:0in; text-indent:0in; color:#008000; }
	.P25_borderStart { font-weight:normal; margin-top:0in; background-color:#ffff00; padding-bottom:0in;  border-bottom-style:none; }
	.P25 { font-weight:normal; background-color:#ffff00; padding-bottom:0in; padding-top:0in;  border-top-style:none; border-bottom-style:none; }
	.P25_borderEnd { font-weight:normal; margin-bottom:0in; background-color:#ffff00; padding-top:0in;  border-top-style:none;}
	.P250 { margin-left:-0.0398in; margin-right:0in; text-indent:0in; color:#008000; font-weight:bold; }
	.P251 { margin-left:-0.0398in; margin-right:0in; text-indent:0in; color:#008000; }
	.P252 { margin-left:-0.0398in; margin-right:0in; text-indent:0in; color:#008000; }
	.P253 { margin-left:-0.0398in; margin-right:0in; text-indent:0in; font-weight:bold; }
	.P254 { margin-left:-0.0398in; margin-right:0in; text-indent:0in; font-weight:bold; }
	.P255 { margin-left:-0.0398in; margin-right:0in; text-indent:0in; color:#0000ff; font-weight:bold; }
	.P256 { margin-left:-0.0398in; margin-right:0in; text-indent:0in; color:#0000ff; font-style:italic; }
	.P257 { margin-left:-0.0398in; margin-right:0in; text-indent:0in; color:#000000; font-weight:bold; }
	.P258 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P259 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P26_borderStart { font-weight:normal; margin-top:0in; text-decoration:underline; background-color:#ffff00; padding-bottom:0in;  border-bottom-style:none; }
	.P26 { font-weight:normal; text-decoration:underline; background-color:#ffff00; padding-bottom:0in; padding-top:0in;  border-top-style:none; border-bottom-style:none; }
	.P26_borderEnd { font-weight:normal; margin-bottom:0in; text-decoration:underline; background-color:#ffff00; padding-top:0in;  border-top-style:none;}
	.P260 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P261 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P262 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P263 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P264 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P265 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P266 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P267 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P268 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P269 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P27 { font-weight:bold; margin-bottom:0in; margin-top:0in; }
	.P270 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P271 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P272 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P273 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P274 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P275 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P276 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P277 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P278 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P279 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P28 { font-weight:bold; margin-bottom:0in; margin-top:0in; }
	.P280 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P281 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; text-decoration:underline; }
	.P282 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; text-decoration:underline; }
	.P283 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; font-style:italic; }
	.P284 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P285 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P286 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P287 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P288 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; color:#000000; }
	.P289 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; color:#000000; }
	.P29 { font-weight:bold; margin-bottom:0in; margin-top:0in; }
	.P290 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; color:#000000; }
	.P291 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; color:#000000; }
	.P292 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; color:#000000; }
	.P293 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; color:#000000; }
	.P294 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; color:#000000; }
	.P295 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; color:#000000; }
	.P296 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; color:#141413; }
	.P297 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; color:#141413; }
	.P298 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; color:#141413; }
	.P299 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; color:#141413; }
	.P3 { color:#000000; line-height:100%; vertical-align:top; margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P30 { font-weight:normal; margin-bottom:0in; margin-top:0in; }
	.P300 { margin-left:1in; margin-right:0in; text-indent:-1in; }
	.P301 { margin-left:-0.272in; margin-right:0in; text-indent:0.272in; font-weight:bold; }
	.P302 { margin-left:-0.272in; margin-right:0in; text-indent:0.272in; background-color:#ffff00; }
	.P303 { margin-left:-0.272in; margin-right:0in; text-indent:0.272in; }
	.P304 { margin-left:0.3937in; margin-right:0in; text-indent:-0.3937in; }
	.P305 { text-decoration:underline; }
	.P306 { }
	.P31 { font-weight:normal; margin-bottom:0in; margin-top:0in; }
	.P32 { font-weight:normal; margin-bottom:0in; margin-top:0in; }
	.P33 { font-weight:normal; margin-bottom:0in; margin-top:0in; }
	.P34 { font-weight:normal; margin-bottom:0in; margin-top:0in; text-decoration:underline; }
	.P35 { font-weight:normal; margin-bottom:0in; margin-top:0in; color:#008000; }
	.P36 { font-weight:bold; margin-bottom:0in; margin-top:0in; color:#008000; }
	.P37 { font-weight:bold; margin-bottom:0in; margin-top:0in; color:#008000; }
	.P38 { font-weight:normal; margin-bottom:0in; margin-top:0in; color:#008000; }
	.P39 { font-weight:normal; margin-bottom:0in; margin-top:0in; color:#008000; }
	.P4 { font-weight:bold; margin-bottom:0in; margin-top:0in; }
	.P40 { font-weight:bold; margin-bottom:0in; margin-top:0in; color:#008000; }
	.P41 { font-weight:bold; margin-bottom:0in; margin-top:0in; color:#008000; }
	.P42 { font-weight:bold; margin-bottom:0in; margin-top:0in; color:#008000; }
	.P43 { font-weight:bold; margin-bottom:0in; margin-top:0in; color:#008000; }
	.P44 { font-weight:bold; margin-bottom:0in; margin-top:0in; color:#008000; }
	.P45 { font-weight:bold; margin-bottom:0in; margin-top:0in; color:#0000ff; }
	.P46 { font-weight:normal; margin-bottom:0in; margin-top:0in; color:#0000ff; }
	.P47 { font-weight:bold; margin-bottom:0in; margin-top:0in; color:#000000; }
	.P48 { font-weight:normal; margin-bottom:0in; margin-top:0in; margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P49 { font-weight:normal; margin-bottom:0in; margin-top:0in; margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P5 { font-weight:bold; margin-bottom:0in; margin-top:0in; }
	.P50 { text-align:left ! important; }
	.P51 { text-align:left ! important; margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P52 { color:#4f81bd; font-weight:normal; margin-bottom:0in; margin-top:0.139in; }
	.P53 { color:#4f81bd; font-weight:normal; margin-bottom:0in; margin-top:0.139in; }
	.P54_borderStart { color:#4f81bd; font-weight:bold; margin-top:0.139in; background-color:#ffff00; padding-bottom:0in;  border-bottom-style:none; }
	.P54 { color:#4f81bd; font-weight:bold; background-color:#ffff00; padding-bottom:0in; padding-top:0.139in;  border-top-style:none; border-bottom-style:none; }
	.P54_borderEnd { color:#4f81bd; font-weight:bold; margin-bottom:0in; background-color:#ffff00; padding-top:0.139in;  border-top-style:none;}
	.P55 { margin:100%; margin-left:0.3937in; margin-right:0in; text-indent:-0.3937in; }
	.P56 { margin:100%; margin-left:0.3937in; margin-right:0in; text-indent:-0.3937in; }
	.P57 { margin-bottom:0in; margin-top:0in; }
	.P58 { margin-bottom:0in; margin-top:0in; }
	.P59 { margin-bottom:0in; margin-top:0in; }
	.P6 { font-weight:bold; margin-bottom:0in; margin-top:0in; }
	.P60 { margin-bottom:0in; margin-top:0in; }
	.P61 { margin-bottom:0in; margin-top:0in; }
	.P62 { margin-bottom:0in; margin-top:0in; margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P63 { line-height:100%; margin:100%; margin-left:0.1972in; margin-right:0in; text-align:left ! important; text-indent:-0.1972in; }
	.P64 { line-height:100%; margin:100%; margin-left:0in; margin-right:0in; text-align:left ! important; text-indent:0in; }
	.P65 { line-height:100%; margin:100%; margin-left:0in; margin-right:0in; text-align:left ! important; text-indent:0in; font-style:italic; }
	.P66 { }
	.P67 { }
	.P68 { }
	.P69 { }
	.P7 { font-weight:bold; margin-bottom:0in; margin-top:0in; }
	.P70 { }
	.P71 { }
	.P72 { }
	.P73 { }
	.P74 { }
	.P75 { }
	.P76 { }
	.P77 { }
	.P78 { }
	.P79 { }
	.P8 { font-weight:bold; margin-bottom:0in; margin-top:0in; }
	.P80 { }
	.P81 { }
	.P82 { }
	.P83 { }
	.P84 { }
	.P85 { }
	.P86 { }
	.P87 { }
	.P88 { }
	.P89 { }
	.P9 { font-weight:normal; margin-bottom:0in; margin-top:0in; }
	.P90 { text-align:right ! important; }
	.P91 { }
	.P92 { }
	.P93 { }
	.P94 { }
	.P95 { }
	.P96 { }
	.P97 { text-decoration:underline; font-weight:bold; }
	.P98 { text-decoration:underline; }
	.P99 { text-decoration:underline; }
	.Standard { }
	.Table1 { width:13.2451in; margin-left:-0.0785in; }
	.Table1_A1 { vertical-align:top; padding-left:0.075in; padding-right:0.075in; padding-top:0in; padding-bottom:0in; border-left-width:0.0176cm; border-left-style:solid; border-left-color:#000000; border-right-style:none; border-top-width:0.0176cm; border-top-style:solid; border-top-color:#000000; border-bottom-width:0.0176cm; border-bottom-style:solid; border-bottom-color:#000000; }
	.Table1_A102 { vertical-align:top; background-color:#99cc00; padding-left:0.075in; padding-right:0.075in; padding-top:0in; padding-bottom:0in; border-left-width:0.0176cm; border-left-style:solid; border-left-color:#000000; border-right-style:none; border-top-width:0.0176cm; border-top-style:solid; border-top-color:#000000; border-bottom-width:0.0176cm; border-bottom-style:solid; border-bottom-color:#000000; }
	.Table1_D26 { vertical-align:top; background-color:#ff9900; padding-left:0.075in; padding-right:0.075in; padding-top:0in; padding-bottom:0in; border-left-width:0.0176cm; border-left-style:solid; border-left-color:#000000; border-right-style:none; border-top-width:0.0176cm; border-top-style:solid; border-top-color:#000000; border-bottom-width:0.0176cm; border-bottom-style:solid; border-bottom-color:#000000; }
	.Table1_E26 { vertical-align:top; background-color:#ff9900; padding-left:0.075in; padding-right:0.075in; padding-top:0in; padding-bottom:0in; border-left-style:none; border-right-style:none; border-top-width:0.0176cm; border-top-style:solid; border-top-color:#000000; border-bottom-width:0.0176cm; border-bottom-style:solid; border-bottom-color:#000000; }
	.Table1_G1 { vertical-align:top; background-color:#00ffff; padding-left:0.075in; padding-right:0.075in; padding-top:0in; padding-bottom:0in; border-left-width:0.0176cm; border-left-style:solid; border-left-color:#000000; border-right-style:none; border-top-width:0.0176cm; border-top-style:solid; border-top-color:#000000; border-bottom-width:0.0176cm; border-bottom-style:solid; border-bottom-color:#000000; }
	.Table1_M11 { vertical-align:top; background-color:#ff0000; padding-left:0.075in; padding-right:0.075in; padding-top:0in; padding-bottom:0in; border-left-width:0.0176cm; border-left-style:solid; border-left-color:#000000; border-right-style:none; border-top-width:0.0176cm; border-top-style:solid; border-top-color:#000000; border-bottom-width:0.0176cm; border-bottom-style:solid; border-bottom-color:#000000; }
	.Table1_V1 { vertical-align:top; background-color:#ffcc99; padding-left:0.075in; padding-right:0.075in; padding-top:0in; padding-bottom:0in; border-left-width:0.0176cm; border-left-style:solid; border-left-color:#000000; border-right-style:none; border-top-width:0.0176cm; border-top-style:solid; border-top-color:#000000; border-bottom-width:0.0176cm; border-bottom-style:solid; border-bottom-color:#000000; }
	.Table1_W1 { vertical-align:top; background-color:#ffff00; padding-left:0.075in; padding-right:0.075in; padding-top:0in; padding-bottom:0in; border-left-width:0.0176cm; border-left-style:solid; border-left-color:#000000; border-right-style:none; border-top-width:0.0176cm; border-top-style:solid; border-top-color:#000000; border-bottom-width:0.0176cm; border-bottom-style:solid; border-bottom-color:#000000; }
	.Table1_d1 { vertical-align:top; background-color:#ffff00; padding-left:0.075in; padding-right:0.075in; padding-top:0in; padding-bottom:0in; border-width:0.0176cm; border-style:solid; border-color:#000000; }
	.Table1_d33 { vertical-align:top; background-color:#ff0000; padding-left:0.075in; padding-right:0.075in; padding-top:0in; padding-bottom:0in; border-width:0.0176cm; border-style:solid; border-color:#000000; }
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
	.Table1_d { width:0.2465in; }
	.HTML_20_Typewriter { }
	.Internet_20_link { color:#0000ff; text-decoration:underline; }
	.Strong_20_Emphasis { font-weight:bold; }
	.T1 { }
	.T100 { font-style:italic; }
	.T101 { }
	.T102 { }
	.T103 { font-style:italic; }
	.T104 { color:#141413; }
	.T105 { color:#141413; }
	.T106 { color:#141413; font-style:italic; }
	.T107 { color:#141413; }
	.T108 { font-style:italic; }
	.T18 { font-weight:bold; }
	.T19 { font-style:italic; }
	.T24 { color:#000000; }
	.T25 { font-style:italic; }
	.T26 { font-style:italic; }
	.T27 { font-style:italic; }
	.T28 { font-style:italic; }
	.T29 { font-style:italic; }
	.T3 { text-decoration:underline; }
	.T30 { font-style:italic; }
	.T31 { font-style:italic; }
	.T32 { font-style:italic; }
	.T33 { font-style:italic; }
	.T34 { font-style:italic; }
	.T35 { font-style:italic; }
	.T36 { font-style:italic; font-weight:bold; }
	.T38 { font-style:italic; font-weight:normal; }
	.T4 { text-decoration:underline; }
	.T40 { text-decoration:underline; }
	.T41 { text-decoration:underline; }
	.T42 { text-decoration:underline; }
	.T43 { text-decoration:underline; }
	.T5 { text-decoration:underline; }
	.T51 { font-style:italic; }
	.T52 { color:#000000; }
	.T53 { }
	.T54 { color:#141413; }
	.T58 { }
	.T59 { }
	.T60 { }
	.T61 { }
	.T62 { font-weight:normal; }
	.T63 { }
	.T64 { }
	.T65 { text-decoration:underline; background-color:#ffff00; }
	.T66 { text-decoration:underline; }
	.T67 { }
	.T71 { color:#000000; }
	.T72 { color:#000000; }
	.T73 { color:#000000; }
	.T74 { color:#000000; }
	.T75 { color:#000000; font-style:italic; }
	.T76 { color:#000000; font-style:italic; }
	.T77 { color:#000000; font-style:italic; }
	.T78 { color:#000000; font-weight:normal; }
	.T79 { color:#000000; }
	.T80 { color:#000000; }
	.T81 { font-weight:normal; }
	.T82 { font-style:italic; }
	.T83 { font-style:italic; }
	.T84 { }
	.T85 { }
	.T88 { font-weight:bold; }
	.T89 { font-weight:bold; }
	.T90 { vertical-align:sub; font-size:58%;font-style:italic; }
	.T91 { }
	.T92 { vertical-align:super; font-size:58%;font-style:italic; }
	.T93 { vertical-align:super; font-size:58%;font-style:italic; }
	.T94 { font-style:italic; }
	.T95 { font-style:italic; }
	.T96 { font-style:italic; }
	.T97 { }
	.T98 { font-style:italic; }
	.T99 { font-style:italic; }
	.WW8Num4z0 { }
	.WW8Num4z1 { }
	.WW8Num4z2 { }
	.WW8Num6z0 { }
	.WW8Num6z1 { }
	.WW8Num6z2 { }
	.WW8Num9z0 { }
	.WW8Num9z1 { }
	.WW8Num9z2 { }
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
        ${util.dl_table(('Recipient language:', h.link(request, ctx.recipient)), ('Source language:', h.link(request, ctx.donor)), ('Relability of borrowed status/affixhood:', ctx.reliability), ('Borrowed affixes:', ctx.count_borrowed), ('Interelated affixes:', ctx.count_interrel))}
    </%util:well>
    <%util:well title="References">
        ${util.sources_list(sorted(list(ctx.sources), key=lambda s: s.name))}
    </%util:well>
</%def>
