<%inherit file="../waab.mako"/>
<%namespace name="util" file="../util.mako"/>
<%! active_menu_item = "pairs" %>


<%block name="head">
<style type="text/css">
        .T53, .T58, .T59, .T62 {font-variant: small-caps;}
        div.dataTables_info {display: none !important;}

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
	.P102 { font-weight:bold; background-color:#ffff00; }
	.P103 { font-weight:bold; background-color:#ffff00; }
	.P104 { font-weight:bold; }
	.P106 { text-align:right ! important; }
	.P107 { text-align:right ! important; }
	.P109 { font-weight:bold; }
	.P111 { text-align:right ! important; font-weight:bold; }
	.P118 { text-decoration:underline; }
	.P119 { text-decoration:underline; }
	.P124 { color:#008000; }
	.P125 { color:#008000; }
	.P126 { color:#008000; font-weight:bold; }
	.P127 { text-align:right ! important; color:#008000; font-weight:bold; }
	.P128 { color:#008000; font-weight:bold; }
	.P129 { text-align:right ! important; color:#008000; }
	.P130 { color:#008000; }
	.P131 { color:#008000; }
	.P132 { color:#008000; font-weight:bold; }
	.P133 { color:#008000; }
	.P134 { color:#008000; }
	.P135 { color:#0000ff; }
	.P136 { color:#0000ff; }
	.P137 { color:#0000ff; }
	.P138 { color:#0000ff; }
	.P139 { color:#0000ff; }
	.P140 { color:#0000ff; }
	.P141 { color:#0000ff; font-weight:bold; }
	.P142 { color:#0000ff; font-weight:bold; }
	.P143 { color:#0000ff; font-style:italic; }
	.P144 { color:#0000ff; font-style:italic; }
	.P145 { color:#0000ff; font-weight:bold; }
	.P146 { color:#0000ff; font-weight:bold; }
	.P147 { text-align:right ! important; color:#0000ff; font-weight:bold; }
	.P148 { color:#0000ff; font-weight:bold; }
	.P149 { color:#0000ff; }
	.P150 { color:#0000ff; }
	.P151 { color:#0000ff; }
	.P152 { color:#0000ff; }
	.P153 { color:#0000ff; }
	.P154 { color:#0000ff; }
	.P155 { color:#0000ff; }
	.P156 { color:#0000ff; }
	.P157 { color:#0000ff; font-style:italic; }
	.P158 { color:#0000ff; font-weight:bold; }
	.P159 { color:#0000ff; }
	.P160 { color:#0000ff; }
	.P161 { color:#0000ff; font-weight:bold; }
	.P162 { color:#0000ff; font-weight:bold; }
	.P163 { color:#141413; }
	.P164 { color:#141413; text-decoration:underline; }
	.P165 { color:#141413; text-decoration:underline; }
	.P166 { color:#141413; text-decoration:underline; }
	.P167 { color:#141413; }
	.P168 { color:#141413; }
	.P169 { color:#141413; }
	.P170 { color:#141413; }
	.P171 { color:#141413; }
	.P172 { margin-left:0in; margin-right:-0.0425in; text-indent:0in; text-decoration:underline; }
	.P173 { margin-left:0in; margin-right:-0.0425in; text-indent:0in; }
	.P174 { margin-left:0in; margin-right:-0.0425in; text-indent:0in; }
	.P175 { margin-left:0in; margin-right:-0.0425in; text-indent:0in; }
	.P176 { margin-left:0in; margin-right:-0.0425in; text-indent:0in; color:#008000; }
	.P177 { margin-left:0in; margin-right:-0.0425in; text-indent:0in; color:#0000ff; }
	.P178 { margin-left:-0.0398in; margin-right:0in; text-indent:0in; text-decoration:underline; font-weight:bold; }
	.P179 { margin-left:-0.0398in; margin-right:0in; text-indent:0in; }
	.P180 { margin-left:-0.0398in; margin-right:0in; text-indent:0in; font-weight:bold; }
	.P181 { margin-left:-0.0398in; margin-right:0in; text-indent:0in; font-weight:bold; }
	.P182 { margin-left:-0.0398in; margin-right:0in; text-indent:0in; font-weight:bold; }
	.P183 { margin-left:-0.0398in; margin-right:0in; text-indent:0in; font-weight:bold; }
	.P184 { margin-left:-0.0398in; margin-right:0in; text-indent:0in; color:#008000; }
	.P185 { margin-left:-0.0398in; margin-right:0in; text-indent:0in; color:#008000; font-weight:bold; }
	.P186 { margin-left:-0.0398in; margin-right:0in; text-indent:0in; color:#008000; }
	.P187 { margin-left:-0.0398in; margin-right:0in; text-indent:0in; color:#008000; }
	.P188 { margin-left:-0.0398in; margin-right:0in; text-indent:0in; font-weight:bold; }
	.P189 { margin-left:-0.0398in; margin-right:0in; text-indent:0in; font-weight:bold; }
	.P190 { margin-left:-0.0398in; margin-right:0in; text-indent:0in; color:#0000ff; font-weight:bold; }
	.P191 { margin-left:-0.0398in; margin-right:0in; text-indent:0in; color:#0000ff; font-style:italic; }
	.P192 { margin-left:-0.0398in; margin-right:0in; text-indent:0in; font-weight:bold; }
	.P193 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P194 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P195 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P196 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P197 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P198 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P199 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P200 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P201 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P202 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P203 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P204 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P205 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P206 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P207 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P208 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P209 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P210 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P211 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P212 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P213 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P214 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P215 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P216 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P217 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; text-decoration:underline; }
	.P218 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; text-decoration:underline; }
	.P219 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; font-style:italic; }
	.P220 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P221 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P222 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P223 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P224 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P225 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P226 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P227 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P228 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P229 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P230 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P231 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P232 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P233 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P234 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; color:#141413; }
	.P235 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; color:#141413; }
	.P236 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; color:#141413; }
	.P237 { margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; color:#141413; }
	.P238 { margin-left:1in; margin-right:0in; text-indent:-1in; }
	.P239 { margin-left:-0.272in; margin-right:0in; text-indent:0.272in; font-weight:bold; }
	.P240 { margin-left:-0.272in; margin-right:0in; text-indent:0.272in; background-color:#ffff00; }
	.P241 { margin-left:-0.272in; margin-right:0in; text-indent:0.272in; }
	.P242 { margin-left:0.3937in; margin-right:0in; text-indent:-0.3937in; }
	.P243 { text-align:left ! important; }
	.P244 { text-align:left ! important; margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P245 { color:#4f81bd; font-weight:normal; margin-bottom:0in; margin-top:0.139in; }
	.P246 { color:#4f81bd; font-weight:normal; margin-bottom:0in; margin-top:0.139in; }
	.P247_borderStart { color:#4f81bd; font-weight:bold; margin-top:0.139in; background-color:#ffff00; padding-bottom:0in;  border-bottom-style:none; }
	.P247 { color:#4f81bd; font-weight:bold; background-color:#ffff00; padding-bottom:0in; padding-top:0.139in;  border-top-style:none; border-bottom-style:none; }
	.P247_borderEnd { color:#4f81bd; font-weight:bold; margin-bottom:0in; background-color:#ffff00; padding-top:0.139in;  border-top-style:none;}
	.P248 { font-weight:bold; margin-bottom:0in; margin-top:0in; }
	.P249 { font-weight:bold; margin-bottom:0in; margin-top:0in; }
	.P25 { text-align:right ! important; }
	.P250 { font-weight:bold; margin-bottom:0in; margin-top:0in; }
	.P251 { font-weight:bold; margin-bottom:0in; margin-top:0in; }
	.P252 { font-weight:bold; margin-bottom:0in; margin-top:0in; }
	.P253 { font-weight:normal; margin-bottom:0in; margin-top:0in; }
	.P254 { font-weight:normal; margin-bottom:0in; margin-top:0in; }
	.P255 { font-weight:bold; margin-bottom:0in; margin-top:0in; }
	.P256 { font-weight:bold; margin-bottom:0in; margin-top:0in; }
	.P257 { font-weight:bold; margin-bottom:0in; margin-top:0in; }
	.P258 { font-weight:bold; margin-bottom:0in; margin-top:0in; }
	.P259 { font-weight:bold; margin-bottom:0in; margin-top:0in; }
	.P260 { font-weight:bold; margin-bottom:0in; margin-top:0in; }
	.P261_borderStart { font-weight:bold; margin-top:0in; background-color:#ffff00; padding-bottom:0in;  border-bottom-style:none; }
	.P261 { font-weight:bold; background-color:#ffff00; padding-bottom:0in; padding-top:0in;  border-top-style:none; border-bottom-style:none; }
	.P261_borderEnd { font-weight:bold; margin-bottom:0in; background-color:#ffff00; padding-top:0in;  border-top-style:none;}
	.P262_borderStart { font-weight:bold; margin-top:0in; background-color:#ffff00; padding-bottom:0in;  border-bottom-style:none; }
	.P262 { font-weight:bold; background-color:#ffff00; padding-bottom:0in; padding-top:0in;  border-top-style:none; border-bottom-style:none; }
	.P262_borderEnd { font-weight:bold; margin-bottom:0in; background-color:#ffff00; padding-top:0in;  border-top-style:none;}
	.P263_borderStart { font-weight:bold; margin-top:0in; background-color:#ffff00; padding-bottom:0in;  border-bottom-style:none; }
	.P263 { font-weight:bold; background-color:#ffff00; padding-bottom:0in; padding-top:0in;  border-top-style:none; border-bottom-style:none; }
	.P263_borderEnd { font-weight:bold; margin-bottom:0in; background-color:#ffff00; padding-top:0in;  border-top-style:none;}
	.P264 { font-weight:normal; margin-bottom:0in; margin-top:0in; }
	.P265 { font-weight:normal; margin-bottom:0in; margin-top:0in; }
	.P266 { font-weight:normal; margin-bottom:0in; margin-top:0in; }
	.P267 { font-weight:normal; margin-bottom:0in; margin-top:0in; }
	.P268_borderStart { font-weight:normal; margin-top:0in; background-color:#ffff00; padding-bottom:0in;  border-bottom-style:none; }
	.P268 { font-weight:normal; background-color:#ffff00; padding-bottom:0in; padding-top:0in;  border-top-style:none; border-bottom-style:none; }
	.P268_borderEnd { font-weight:normal; margin-bottom:0in; background-color:#ffff00; padding-top:0in;  border-top-style:none;}
	.P269_borderStart { font-weight:normal; margin-top:0in; background-color:#ffff00; padding-bottom:0in;  border-bottom-style:none; }
	.P269 { font-weight:normal; background-color:#ffff00; padding-bottom:0in; padding-top:0in;  border-top-style:none; border-bottom-style:none; }
	.P269_borderEnd { font-weight:normal; margin-bottom:0in; background-color:#ffff00; padding-top:0in;  border-top-style:none;}
	.P270_borderStart { font-weight:normal; margin-top:0in; text-decoration:underline; background-color:#ffff00; padding-bottom:0in;  border-bottom-style:none; }
	.P270 { font-weight:normal; text-decoration:underline; background-color:#ffff00; padding-bottom:0in; padding-top:0in;  border-top-style:none; border-bottom-style:none; }
	.P270_borderEnd { font-weight:normal; margin-bottom:0in; text-decoration:underline; background-color:#ffff00; padding-top:0in;  border-top-style:none;}
	.P271 { font-weight:bold; margin-bottom:0in; margin-top:0in; }
	.P272 { font-weight:bold; margin-bottom:0in; margin-top:0in; }
	.P273 { font-weight:bold; margin-bottom:0in; margin-top:0in; }
	.P274 { font-weight:normal; margin-bottom:0in; margin-top:0in; }
	.P275 { font-weight:normal; margin-bottom:0in; margin-top:0in; }
	.P276 { font-weight:normal; margin-bottom:0in; margin-top:0in; }
	.P277 { font-weight:normal; margin-bottom:0in; margin-top:0in; }
	.P278 { font-weight:normal; margin-bottom:0in; margin-top:0in; text-decoration:underline; }
	.P279 { font-weight:normal; margin-bottom:0in; margin-top:0in; color:#008000; }
	.P280 { font-weight:bold; margin-bottom:0in; margin-top:0in; color:#008000; }
	.P281 { font-weight:bold; margin-bottom:0in; margin-top:0in; color:#008000; }
	.P282 { font-weight:normal; margin-bottom:0in; margin-top:0in; color:#008000; }
	.P283 { font-weight:normal; margin-bottom:0in; margin-top:0in; color:#008000; }
	.P284 { font-weight:bold; margin-bottom:0in; margin-top:0in; color:#008000; }
	.P285 { font-weight:bold; margin-bottom:0in; margin-top:0in; color:#008000; }
	.P286 { font-weight:bold; margin-bottom:0in; margin-top:0in; color:#008000; }
	.P287 { font-weight:bold; margin-bottom:0in; margin-top:0in; color:#008000; }
	.P288 { font-weight:bold; margin-bottom:0in; margin-top:0in; color:#008000; }
	.P289 { font-weight:bold; margin-bottom:0in; margin-top:0in; color:#0000ff; }
	.P290 { font-weight:normal; margin-bottom:0in; margin-top:0in; color:#0000ff; }
	.P291 { font-weight:bold; margin-bottom:0in; margin-top:0in; }
	.P292 { font-weight:normal; margin-bottom:0in; margin-top:0in; margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P293 { font-weight:normal; margin-bottom:0in; margin-top:0in; margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P294 { margin-bottom:0in; margin-top:0in; }
	.P295 { margin-bottom:0in; margin-top:0in; }
	.P296 { margin-bottom:0in; margin-top:0in; }
	.P297 { margin-bottom:0in; margin-top:0in; }
	.P298 { margin-bottom:0in; margin-top:0in; }
	.P299 { margin-bottom:0in; margin-top:0in; margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P300 { margin:100%; margin-left:0.5in; margin-right:0in; text-indent:-0.5in; }
	.P301 { text-decoration:underline; }
	.P303 { vertical-align:middle; }
	.P304 { vertical-align:middle; text-decoration:underline; }
	.P305 { vertical-align:top; margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P306 { margin-left:0.1972in; margin-right:0in; text-align:left ! important; text-indent:-0.1972in; }
	.P307 { margin-left:0in; margin-right:0in; text-align:left ! important; text-indent:0in; }
	.P308 { margin-left:0in; margin-right:0in; text-align:left ! important; text-indent:0in; font-style:italic; }
	.P32 { text-decoration:underline; font-weight:bold; }
	.P33 { text-decoration:underline; }
	.P34 { text-decoration:underline; }
	.P35 { text-decoration:underline; }
	.P36 { text-decoration:underline; }
	.P37 { text-decoration:underline; }
	.P38 { text-decoration:underline; }
	.P39 { text-decoration:underline; }
	.P40 { text-decoration:underline; }
	.P41 { text-decoration:underline; }
	.P42 { font-weight:bold; }
	.P43 { text-align:right ! important; font-weight:bold; }
	.P44 { font-weight:bold; }
	.P45 { font-weight:bold; }
	.P46 { font-weight:bold; }
	.P47 { text-decoration:underline; }
	.P52 { font-style:italic; }
	.P53 { font-style:italic; }
	.P54 { font-style:italic; }
	.P56 { text-decoration:underline; }
	.P58 { text-decoration:underline; font-weight:bold; }
	.P59 { font-weight:bold; }
	.P60 { font-weight:bold; }
	.P61 { font-weight:bold; }
	.P70 { background-color:#ffff00; }
	.P71 { font-weight:bold; }
	.P72 { font-weight:bold; }
	.P73 { font-weight:bold; }
	.P74 { font-weight:bold; }
	.P75 { font-weight:bold; }
	.P76 { font-weight:bold; }
	.P77 { font-weight:bold; background-color:#ffff00; }
	.P78 { font-weight:bold; background-color:#ffff00; }
	.P79 { text-decoration:underline; font-weight:bold; background-color:#ffff00; }
	.P80 { text-decoration:underline; font-weight:bold; background-color:#ffff00; }
	.P81 { text-decoration:underline; background-color:#ffff00; }
	.P82 { text-decoration:underline; font-weight:bold; }
	.P83 { text-decoration:underline; }
	.P84 { font-weight:bold; }
	.P85 { font-weight:bold; }
	.P97 { font-weight:bold; }
	.P99 { font-weight:bold; }
	.Table1 { width:13.409in; margin-left:-0.0785in; }
	.Table1_A1 { vertical-align:top; padding-left:0.075in; padding-right:0.075in; padding-top:0in; padding-bottom:0in; border-left-width:0.0176cm; border-left-style:solid; border-left-border-right-style:none; border-top-width:0.0176cm; border-top-style:solid; border-top-border-bottom-width:0.0176cm; border-bottom-style:solid; border-bottom-}
	.Table1_A102 { vertical-align:top; background-color:#99cc00; padding-left:0.075in; padding-right:0.075in; padding-top:0in; padding-bottom:0in; border-left-width:0.0176cm; border-left-style:solid; border-left-border-right-style:none; border-top-width:0.0176cm; border-top-style:solid; border-top-border-bottom-width:0.0176cm; border-bottom-style:solid; border-bottom-}
	.Table1_D26 { vertical-align:top; background-color:#ff9900; padding-left:0.075in; padding-right:0.075in; padding-top:0in; padding-bottom:0in; border-left-width:0.0176cm; border-left-style:solid; border-left-border-right-style:none; border-top-width:0.0176cm; border-top-style:solid; border-top-border-bottom-width:0.0176cm; border-bottom-style:solid; border-bottom-}
	.Table1_E26 { vertical-align:top; background-color:#ff9900; padding-left:0.075in; padding-right:0.075in; padding-top:0in; padding-bottom:0in; border-left-style:none; border-right-style:none; border-top-width:0.0176cm; border-top-style:solid; border-top-border-bottom-width:0.0176cm; border-bottom-style:solid; border-bottom-}
	.Table1_G1 { vertical-align:top; background-color:#00ffff; padding-left:0.075in; padding-right:0.075in; padding-top:0in; padding-bottom:0in; border-left-width:0.0176cm; border-left-style:solid; border-left-border-right-style:none; border-top-width:0.0176cm; border-top-style:solid; border-top-border-bottom-width:0.0176cm; border-bottom-style:solid; border-bottom-}
	.Table1_M11 { vertical-align:top; background-padding-left:0.075in; padding-right:0.075in; padding-top:0in; padding-bottom:0in; border-left-width:0.0176cm; border-left-style:solid; border-left-border-right-style:none; border-top-width:0.0176cm; border-top-style:solid; border-top-border-bottom-width:0.0176cm; border-bottom-style:solid; border-bottom-}
	.Table1_V1 { vertical-align:top; background-color:#ffcc99; padding-left:0.075in; padding-right:0.075in; padding-top:0in; padding-bottom:0in; border-left-width:0.0176cm; border-left-style:solid; border-left-border-right-style:none; border-top-width:0.0176cm; border-top-style:solid; border-top-border-bottom-width:0.0176cm; border-bottom-style:solid; border-bottom-}
	.Table1_W1 { vertical-align:top; background-color:#ffff00; padding-left:0.075in; padding-right:0.075in; padding-top:0in; padding-bottom:0in; border-left-width:0.0176cm; border-left-style:solid; border-left-border-right-style:none; border-top-width:0.0176cm; border-top-style:solid; border-top-border-bottom-width:0.0176cm; border-bottom-style:solid; border-bottom-}
	.Table1_d1 { vertical-align:top; background-color:#ffff00; padding-left:0.075in; padding-right:0.075in; padding-top:0in; padding-bottom:0in; border-width:0.0176cm; border-style:solid; border-}
	.Table1_d33 { vertical-align:top; background-padding-left:0.075in; padding-right:0.075in; padding-top:0in; padding-bottom:0in; border-width:0.0176cm; border-style:solid; border-}
	.Table1_A { width:0.2528in; }
	.Table1_B { width:0.3938in; }
	.Table1_C { width:0.216in; }
	.Table1_D { width:0.2958in; }
	.Table1_E { width:0.2951in; }
	.Table1_F { width:0.1965in; }
	.Table1_G { width:0.1972in; }
	.Table1_K { width:0.5903in; }
	.Table1_N { width:0.3611in; }
	.Table1_O { width:4.8694in; }
	.Table1_P { width:0.2882in; }
	.Table1_Q { width:0.4313in; }
	.Table1_T { width:0.416in; }
	.Table1_U { width:0.4743in; }
	.Table1_V { width:0.166in; }
	.Table1_W { width:0.2375in; }
	.Table1_X { width:0.2396in; }
	.Table1_d { width:0.2465in; }
	.Internet_20_link { color:#0000ff; text-decoration:underline; }
	.Strong_20_Emphasis { font-weight:bold; }
	.T102 { font-weight:normal; }
	.T103 { font-style:italic; }
	.T104 { font-style:italic; }
	.T107 { font-style:italic; }
	.T109 { vertical-align:sub; font-size:58%;font-style:italic; }
	.T111 { vertical-align:super; font-size:58%;font-style:italic; }
	.T112 { vertical-align:super; font-size:58%;font-style:italic; }
	.T113 { color:#0000ff; font-weight:bold; }
	.T114 { font-style:italic; }
	.T115 { font-style:italic; }
	.T116 { font-style:italic; }
	.T118 { font-style:italic; }
	.T119 { font-style:italic; }
	.T120 { font-style:italic; }
	.T123 { font-style:italic; }
	.T124 { color:#141413; }
	.T125 { color:#141413; }
	.T126 { color:#141413; font-style:italic; }
	.T127 { color:#141413; }
	.T128 { font-style:italic; }
	.T15 { font-weight:bold; }
	.T17 { font-style:italic; }
	.T18 { font-style:italic; }
	.T19 { font-style:italic; }
	.T26 { font-style:italic; }
	.T28 { font-style:italic; }
	.T29 { font-style:italic; }
	.T3 { text-decoration:underline; }
	.T30 { font-style:italic; }
	.T31 { font-style:italic; }
	.T32 { font-style:italic; }
	.T33 { font-style:italic; }
	.T34 { font-style:italic; }
	.T35 { font-style:italic; }
	.T36 { font-style:italic; }
	.T37 { font-style:italic; }
	.T38 { font-style:italic; }
	.T39 { font-style:italic; }
	.T4 { text-decoration:underline; }
	.T40 { font-style:italic; }
	.T41 { font-style:italic; font-weight:bold; }
	.T47 { font-weight:normal; }
	.T48 { text-decoration:underline; }
	.T49 { text-decoration:underline; }
	.T5 { text-decoration:underline; }
	.T50 { text-decoration:underline; }
	.T51 { text-decoration:underline; }
	.T52 { text-decoration:underline; }
	.T60 { font-style:italic; }
	.T68 { color:#141413; }
	.T76 { font-weight:normal; }
	.T79 { text-decoration:underline; background-color:#ffff00; }
	.T80 { text-decoration:underline; }
	.T86 { font-weight:bold; }
	.T87 { font-weight:bold; }
	.T93 { font-style:italic; }
	.T95 { font-style:italic; }
	.T96 { font-style:italic; }
	.T97 { font-style:italic; }
	.T99 { font-weight:normal; }
	</style>
</%block>

<h2>${ctx.name}</h2>

<h3>Summary</h3>
${request.get_datatable('values', h.models.Value, pair=ctx).render()}

<h3>Description</h3>
<div>${u.description(request, ctx.description)|n}</div>

<%def name="sidebar()">
    <%util:well>
        ${util.dl_table(('Recipient language', h.link(request, ctx.recipient)), ('Donor language', h.link(request, ctx.donor)), ('Reliability of borrowed status/affixhood', ctx.reliability), ('Borrowed affixes', ctx.count_borrowed), ('Interrelated affixes', ctx.count_interrel))}
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
