<%inherit file="../${context.get('request').registry.settings.get('clld.app_template', 'app.mako')}"/>
<%namespace name="util" file="../util.mako"/>


<%block name="head">
<style type="text/css">
	@page {  }
	table { border-collapse:collapse; border-spacing:0; empty-cells:show }
	td, th { vertical-align:top; font-size:12pt;}
	h1, h2, h3, h4, h5, h6 { clear:both }
	ol, ul { margin:0; padding:0;}
	li { list-style: none; margin:0; padding:0;}
	<!-- "li span.odfLiEnd" - IE 7 issue-->
	li span. { clear: both; line-height:0; width:0; height:0; margin:0; padding:0; }
	span.footnodeNumber { padding-right:1em; }
	span.annotation_style_by_filter { font-size:95%; font-family:Arial; background-color:#fff000;  margin:0; border:0; padding:0;  }
	* { margin:0;}
	.P100 {  font-weight:bold; background-color:#00ff00; }
	.P103 {  background-color:#00ff00; }
	.P105 { font-size:4pt;  font-weight:bold; }
	.P115 { font-size:4pt;  background-color:#00ff00; }
	.P117 { font-size:4pt; font-family:Calibri;  color:#ff0000; font-weight:bold; }
	.P118 { font-size:4pt; font-family:Calibri;  color:#ff0000; }
	.P119 { font-size:4pt; font-family:Calibri;  color:#ff0000; }
	.P120 { font-size:4pt; font-family:Calibri;  color:#ff0000; background-color:#00ff00; }
	.P121 { font-family:Calibri;  color:#ff0000; font-weight:bold; background-color:#ffff00; }
	.P122 {  color:#ff0000; font-weight:bold; background-color:#ffff00; }
	.P123 { font-size:4pt; font-family:Calibri;  color:#000000; font-weight:bold; }
	.P124 { font-size:4pt; font-family:Calibri;  color:#000000; }
	.P125 { font-size:4pt; font-family:Calibri;  text-align:right ! important; color:#000000; }
	.P126 { font-size:4pt; font-family:Calibri;  text-align:right ! important; color:#000000; }
	.P127 { font-size:4pt; font-family:Calibri;  color:#000000; }
	.P128 { font-size:4pt; font-family:Calibri;  color:#000000; background-color:#00ff00; }
	.P129 { font-size:4pt; font-family:Calibri;  text-align:right ! important; color:#000000; background-color:#00ff00; }
	.P130 { font-family:Calibri;  color:#000000; font-weight:bold; }
	.P131 { font-family:Calibri;  color:#000000; }
	.P132 {  text-align:right ! important; color:#000000; font-weight:bold; }
	.P133 {  text-align:right ! important; color:#000000; font-weight:bold; background-color:#00ff00; }
	.P134 {  color:#000000; }
	.P135 {  color:#000000; }
	.P136 {  color:#000000; }
	.P137 {  color:#000000; }
	.P138 {  color:#000000; }
	.P139 {  color:#000000; }
	.P140 {  color:#000000; }
	.P141 {  color:#000000; }
	.P142 {  color:#000000; text-decoration:underline; }
	.P143 {  color:#000000; text-decoration:underline; }
	.P144 {  color:#000000; }
	.P145 {  color:#000000; }
	.P146 {  color:#000000; }
	.P147 {  color:#000000; }
	.P148 { font-size:4pt;  color:#000000; }
	.P149 { font-size:4pt;  color:#000000; }
	.P151 {  color:#0000ff; font-weight:bold; }
	.P152 {  text-align:right ! important; color:#0000ff; font-weight:bold; }
	.P153 {  color:#0000ff; font-weight:bold; }
	.P154 {  color:#0000ff; font-weight:bold; }
	.P155 {  color:#0000ff; font-weight:bold; }
	.P156 {  color:#0000ff; }
	.P157 {  color:#0000ff; }
	.P158 {  color:#0000ff; }
	.P159 {  color:#0000ff; }
	.P160 {  color:#0000ff; }
	.P161 {  color:#0000ff; }
	.P162 {  color:#0000ff; }
	.P163 {  color:#0000ff; }
	.P164 {  color:#0000ff; }
	.P165 {  color:#0000ff; }
	.P166 {  color:#0000ff; text-decoration:underline; font-weight:bold; }
	.P167 {  color:#0000ff; text-decoration:underline; font-weight:bold; }
	.P168 {  color:#0000ff; text-decoration:underline; }
	.P169 {  color:#0000ff; text-decoration:underline; }
	.P170 {  color:#0000ff; text-decoration:underline; }
	.P171 {  color:#0000ff; }
	.P172 {  color:#0000ff; }
	.P173 {  color:#0000ff; }
	.P174 {  color:#0000ff; font-style:italic; }
	.P175 {  color:#0000ff; font-weight:bold; }
	.P176 {  color:#0000ff; font-weight:bold; }
	.P177 {  color:#0000ff; }
	.P178 { font-size:4pt;  color:#0000ff; }
	.P179 { font-size:4pt;  color:#0000ff; }
	.P180 { font-size:4pt;  color:#0000ff; }
	.P181 { font-size:4pt;  color:#0000ff; }
	.P182 { font-size:4pt;  color:#0000ff; }
	.P183 { font-size:4pt;  color:#0000ff; }
	.P184 { font-size:4pt;  color:#0000ff; font-weight:bold; }
	.P185 { font-size:4pt;  color:#0000ff; font-weight:bold; }
	.P186 { font-size:4pt;  color:#0000ff; font-style:italic; }
	.P187 { font-family:Calibri;  color:#0000ff; }
	.P188 { font-family:Calibri;  color:#0000ff; font-weight:bold; }
	.P189 { font-family:Calibri;  color:#0000ff; font-weight:bold; }
	.P190 {  color:#008000; }
	.P191 {  color:#008000; }
	.P192 {  color:#008000; font-weight:bold; }
	.P193 {  color:#008000; }
	.P194 {  text-align:right ! important; color:#008000; font-weight:bold; }
	.P195 {  color:#008000; font-weight:bold; }
	.P196 {  text-align:right ! important; color:#008000; }
	.P197 {  color:#008000; }
	.P198 {  color:#008000; }
	.P199 { font-family:Calibri;  color:#008000; font-weight:bold; }
	.P200 { font-family:Calibri;  color:#008000; font-weight:bold; }
	.P201 { font-family:Calibri;  color:#008000; }
	.P202 { font-family:Calibri;  color:#008000; }
	.P203 { font-family:Calibri;  color:#008000; }
	.P204 { font-family:Calibri;  color:#008000; }
	.P205 {  color:#141413; text-decoration:underline; }
	.P206 {  color:#141413; text-decoration:underline; }
	.P207 {  color:#141413; text-decoration:underline; }
	.P208 {  color:#141413; }
	.P209 {  color:#141413; }
	.P210 {  color:#141413; }
	.P211 {  margin-left:0in; margin-right:-0.0425in; text-indent:0in; text-decoration:underline; }
	.P212 {  margin-left:0in; margin-right:-0.0425in; text-indent:0in; }
	.P213 {  margin-left:0in; margin-right:-0.0425in; text-indent:0in; }
	.P214 {  margin-left:0in; margin-right:-0.0425in; text-indent:0in; }
	.P215 {  margin-left:0in; margin-right:-0.0425in; text-indent:0in; background-color:#00ff00; }
	.P216 {  margin-left:0in; margin-right:-0.0425in; text-indent:0in; color:#0000ff; }
	.P217 {  margin-left:0in; margin-right:-0.0425in; text-indent:0in; color:#008000; }
	.P218 {  margin-left:0in; margin-right:-0.0425in; text-indent:0in; color:#008000; }
	.P219 {  margin-left:-0.0398in; margin-right:0in; text-indent:0in; text-decoration:underline; font-weight:bold; }
	.P220 {  margin-left:-0.0398in; margin-right:0in; text-indent:0in; }
	.P221 {  margin-left:-0.0398in; margin-right:0in; text-indent:0in; font-weight:bold; }
	.P222 {  margin-left:-0.0398in; margin-right:0in; text-indent:0in; font-weight:bold; }
	.P223 {  margin-left:-0.0398in; margin-right:0in; text-indent:0in; font-weight:bold; }
	.P224 {  margin-left:-0.0398in; margin-right:0in; text-indent:0in; font-weight:bold; background-color:#00ff00; }
	.P225 {  margin-left:-0.0398in; margin-right:0in; text-indent:0in; font-weight:bold; }
	.P226 {  margin-left:-0.0398in; margin-right:0in; text-indent:0in; color:#0000ff; font-weight:bold; }
	.P227 {  margin-left:-0.0398in; margin-right:0in; text-indent:0in; color:#0000ff; font-style:italic; }
	.P228 {  margin-left:-0.0398in; margin-right:0in; text-indent:0in; color:#008000; }
	.P229 {  margin-left:-0.0398in; margin-right:0in; text-indent:0in; color:#008000; font-weight:bold; }
	.P230 {  margin-left:-0.0398in; margin-right:0in; text-indent:0in; color:#008000; }
	.P231 { font-family:Times;  margin-left:-0.0398in; margin-right:0in; text-indent:0in; color:#008000; }
	.P232 { font-family:Times;  margin-left:-0.0398in; margin-right:0in; text-indent:0in; color:#008000; font-weight:bold; }
	.P233 { font-family:Times;  margin-left:-0.0398in; margin-right:0in; text-indent:0in; font-weight:bold; }
	.P234 { font-family:Times;  margin-left:-0.0398in; margin-right:0in; text-indent:0in; font-weight:bold; }
	.P235 {  margin-left:-0.0398in; margin-right:0in; text-indent:0in; color:#000000; font-weight:bold; }
	.P236 { font-size:12pt;  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P237 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P238 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P239 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P240 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P241 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P242 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P243 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P244 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P245 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P246 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P247 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P248 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P249 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P25 {  text-align:right ! important; }
	.P250 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P251 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P252 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P253 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P254 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P255 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P256 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P257 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P258 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P259 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P260 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; text-decoration:underline; }
	.P261 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; text-decoration:underline; }
	.P262 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; text-decoration:underline; }
	.P263 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; text-decoration:underline; }
	.P264 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; font-style:italic; }
	.P265 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P266 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P267 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P268 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; color:#0000ff; }
	.P269 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; color:#0000ff; }
	.P270 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; color:#0000ff; }
	.P271 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; color:#0000ff; font-style:italic; }
	.P272 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; color:#0000ff; }
	.P273 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; color:#0000ff; }
	.P274 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; color:#0000ff; text-decoration:underline; }
	.P275 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; color:#000000; }
	.P276 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; color:#000000; }
	.P277 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; color:#000000; }
	.P278 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; color:#000000; }
	.P279 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; color:#000000; }
	.P280 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; color:#000000; }
	.P281 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; color:#000000; }
	.P282 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; color:#000000; }
	.P283 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; color:#141413; }
	.P284 {  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; color:#141413; }
	.P285 {  margin-left:1in; margin-right:0in; text-indent:-1in; }
	.P286 { font-family:Calibri;  margin-left:-0.272in; margin-right:0in; text-indent:0.272in; font-weight:bold; }
	.P287 { font-family:Calibri;  margin-left:-0.272in; margin-right:0in; text-indent:0.272in; background-color:#ffff00; }
	.P288 {  margin-left:-0.272in; margin-right:0in; text-indent:0.272in; }
	.P289 { text-align:left ! important;  }
	.P290 { text-align:left ! important;  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P291 { font-size:24pt; font-weight:bold; margin-bottom:0in; margin-top:0in; font-family:Times;  }
	.P292 { font-weight:bold; margin-bottom:0in; margin-top:0in; font-family:Times;  }
	.P293 { font-weight:bold; margin-bottom:0in; margin-top:0in; font-family:Times;  }
	.P294 { font-weight:bold; margin-bottom:0in; margin-top:0in; font-family:Times;  }
	.P295 { font-weight:bold; margin-bottom:0in; margin-top:0in; font-family:Times;  }
	.P296 { font-weight:normal; margin-bottom:0in; margin-top:0in; font-family:Calibri;  }
	.P297 { font-weight:normal; margin-bottom:0in; margin-top:0in; font-family:Calibri;  }
	.P298_borderStart { font-weight:normal; margin-top:0in; font-family:Calibri;  background-color:#00ff00; padding-bottom:0in;  border-bottom-style:none; }
	.P298 { font-weight:normal; font-family:Calibri;  background-color:#00ff00; padding-bottom:0in; padding-top:0in;  border-top-style:none; border-bottom-style:none; }
	.P298_borderEnd { font-weight:normal; margin-bottom:0in; font-family:Calibri;  background-color:#00ff00; padding-top:0in;  border-top-style:none;}
	.P299 { font-weight:bold; margin-bottom:0in; margin-top:0in; font-family:Calibri;  }
	.P300 { font-weight:bold; margin-bottom:0in; margin-top:0in; font-family:Calibri;  }
	.P301_borderStart { font-weight:bold; margin-top:0in; font-family:Calibri;  background-color:#00ff00; padding-bottom:0in;  border-bottom-style:none; }
	.P301 { font-weight:bold; font-family:Calibri;  background-color:#00ff00; padding-bottom:0in; padding-top:0in;  border-top-style:none; border-bottom-style:none; }
	.P301_borderEnd { font-weight:bold; margin-bottom:0in; font-family:Calibri;  background-color:#00ff00; padding-top:0in;  border-top-style:none;}
	.P302 { font-weight:bold; margin-bottom:0in; margin-top:0in; font-family:Calibri;  }
	.P303 { font-weight:bold; margin-bottom:0in; margin-top:0in; font-family:Calibri;  }
	.P304 { font-weight:bold; margin-bottom:0in; margin-top:0in; font-family:Calibri;  }
	.P305 { font-weight:bold; margin-bottom:0in; margin-top:0in; font-family:Calibri;  }
	.P306_borderStart { font-weight:bold; margin-top:0in; font-family:Calibri;  background-color:#ffff00; padding-bottom:0in;  border-bottom-style:none; }
	.P306 { font-weight:bold; font-family:Calibri;  background-color:#ffff00; padding-bottom:0in; padding-top:0in;  border-top-style:none; border-bottom-style:none; }
	.P306_borderEnd { font-weight:bold; margin-bottom:0in; font-family:Calibri;  background-color:#ffff00; padding-top:0in;  border-top-style:none;}
	.P307_borderStart { font-weight:bold; margin-top:0in; font-family:Calibri;  background-color:#ffff00; padding-bottom:0in;  border-bottom-style:none; }
	.P307 { font-weight:bold; font-family:Calibri;  background-color:#ffff00; padding-bottom:0in; padding-top:0in;  border-top-style:none; border-bottom-style:none; }
	.P307_borderEnd { font-weight:bold; margin-bottom:0in; font-family:Calibri;  background-color:#ffff00; padding-top:0in;  border-top-style:none;}
	.P308_borderStart { font-weight:bold; margin-top:0in; font-family:Calibri;  background-color:#ffff00; padding-bottom:0in;  border-bottom-style:none; }
	.P308 { font-weight:bold; font-family:Calibri;  background-color:#ffff00; padding-bottom:0in; padding-top:0in;  border-top-style:none; border-bottom-style:none; }
	.P308_borderEnd { font-weight:bold; margin-bottom:0in; font-family:Calibri;  background-color:#ffff00; padding-top:0in;  border-top-style:none;}
	.P309 { font-weight:normal; margin-bottom:0in; margin-top:0in; font-family:Calibri;  }
	.P310 { font-weight:normal; margin-bottom:0in; margin-top:0in; font-family:Calibri;  }
	.P311 { font-weight:normal; margin-bottom:0in; margin-top:0in; font-family:Calibri;  }
	.P312 { font-weight:normal; margin-bottom:0in; margin-top:0in; font-family:Calibri;  }
	.P313 { font-weight:normal; margin-bottom:0in; margin-top:0in; font-family:Calibri;  }
	.P314_borderStart { font-weight:normal; margin-top:0in; font-family:Calibri;  background-color:#ffff00; padding-bottom:0in;  border-bottom-style:none; }
	.P314 { font-weight:normal; font-family:Calibri;  background-color:#ffff00; padding-bottom:0in; padding-top:0in;  border-top-style:none; border-bottom-style:none; }
	.P314_borderEnd { font-weight:normal; margin-bottom:0in; font-family:Calibri;  background-color:#ffff00; padding-top:0in;  border-top-style:none;}
	.P315_borderStart { font-weight:normal; margin-top:0in; font-family:Calibri;  background-color:#ffff00; padding-bottom:0in;  border-bottom-style:none; }
	.P315 { font-weight:normal; font-family:Calibri;  background-color:#ffff00; padding-bottom:0in; padding-top:0in;  border-top-style:none; border-bottom-style:none; }
	.P315_borderEnd { font-weight:normal; margin-bottom:0in; font-family:Calibri;  background-color:#ffff00; padding-top:0in;  border-top-style:none;}
	.P316_borderStart { font-weight:normal; margin-top:0in; font-family:Calibri;  background-color:#ffff00; padding-bottom:0in;  border-bottom-style:none; }
	.P316 { font-weight:normal; font-family:Calibri;  background-color:#ffff00; padding-bottom:0in; padding-top:0in;  border-top-style:none; border-bottom-style:none; }
	.P316_borderEnd { font-weight:normal; margin-bottom:0in; font-family:Calibri;  background-color:#ffff00; padding-top:0in;  border-top-style:none;}
	.P317_borderStart { font-weight:normal; margin-top:0in; font-family:Calibri;  background-color:#00ff00; padding-bottom:0in;  border-bottom-style:none; }
	.P317 { font-weight:normal; font-family:Calibri;  background-color:#00ff00; padding-bottom:0in; padding-top:0in;  border-top-style:none; border-bottom-style:none; }
	.P317_borderEnd { font-weight:normal; margin-bottom:0in; font-family:Calibri;  background-color:#00ff00; padding-top:0in;  border-top-style:none;}
	.P318_borderStart { font-weight:normal; margin-top:0in; font-family:Calibri;  background-color:#00ff00; padding-bottom:0in;  border-bottom-style:none; }
	.P318 { font-weight:normal; font-family:Calibri;  background-color:#00ff00; padding-bottom:0in; padding-top:0in;  border-top-style:none; border-bottom-style:none; }
	.P318_borderEnd { font-weight:normal; margin-bottom:0in; font-family:Calibri;  background-color:#00ff00; padding-top:0in;  border-top-style:none;}
	.P319_borderStart { font-weight:normal; margin-top:0in; font-family:Calibri;  text-decoration:underline; background-color:#00ff00; padding-bottom:0in;  border-bottom-style:none; }
	.P319 { font-weight:normal; font-family:Calibri;  text-decoration:underline; background-color:#00ff00; padding-bottom:0in; padding-top:0in;  border-top-style:none; border-bottom-style:none; }
	.P319_borderEnd { font-weight:normal; margin-bottom:0in; font-family:Calibri;  text-decoration:underline; background-color:#00ff00; padding-top:0in;  border-top-style:none;}
	.P32 {  text-decoration:underline; font-weight:bold; }
	.P320_borderStart { font-weight:normal; margin-top:0in; font-family:Calibri;  text-decoration:underline; background-color:#ffff00; padding-bottom:0in;  border-bottom-style:none; }
	.P320 { font-weight:normal; font-family:Calibri;  text-decoration:underline; background-color:#ffff00; padding-bottom:0in; padding-top:0in;  border-top-style:none; border-bottom-style:none; }
	.P320_borderEnd { font-weight:normal; margin-bottom:0in; font-family:Calibri;  text-decoration:underline; background-color:#ffff00; padding-top:0in;  border-top-style:none;}
	.P321 { font-weight:bold; margin-bottom:0in; margin-top:0in; font-family:Times;  }
	.P322 { font-weight:normal; margin-bottom:0in; margin-top:0in; font-family:Calibri;  color:#0000ff; }
	.P323 { font-weight:bold; margin-bottom:0in; margin-top:0in; font-family:Calibri;  color:#0000ff; }
	.P324 { font-weight:normal; margin-bottom:0in; margin-top:0in; font-family:Calibri;  color:#0000ff; }
	.P325 { font-weight:bold; margin-bottom:0in; margin-top:0in; font-family:Calibri;  color:#0000ff; }
	.P326 { font-weight:bold; margin-bottom:0in; margin-top:0in; font-family:Calibri;  color:#0000ff; }
	.P327 { font-size:4pt; font-weight:bold; margin-bottom:0in; margin-top:0in; font-family:Times;  color:#0000ff; }
	.P328 { font-size:4pt; font-weight:bold; margin-bottom:0in; margin-top:0in; font-family:Times;  }
	.P329 { font-size:4pt; font-weight:bold; margin-bottom:0in; margin-top:0in; font-family:Times;  }
	.P33 {  text-decoration:underline; }
	.P330 { font-size:4pt; font-weight:normal; margin-bottom:0in; margin-top:0in;  }
	.P331 { font-weight:normal; margin-bottom:0in; margin-top:0in;  }
	.P332 { font-weight:normal; margin-bottom:0in; margin-top:0in;  }
	.P333 { font-weight:bold; margin-bottom:0in; margin-top:0in;  }
	.P334 { font-weight:normal; margin-bottom:0in; margin-top:0in;  text-decoration:underline; }
	.P335 { font-weight:normal; margin-bottom:0in; margin-top:0in; font-family:Calibri;  color:#008000; }
	.P336 { font-weight:bold; margin-bottom:0in; margin-top:0in; font-family:Calibri;  color:#008000; }
	.P337 { font-weight:bold; margin-bottom:0in; margin-top:0in; font-family:Calibri;  color:#008000; }
	.P338 { font-weight:normal; margin-bottom:0in; margin-top:0in; font-family:Calibri;  color:#008000; }
	.P339 { font-weight:normal; margin-bottom:0in; margin-top:0in; font-family:Calibri;  color:#008000; }
	.P34 {  text-decoration:underline; }
	.P340 { font-weight:bold; margin-bottom:0in; margin-top:0in; font-family:Calibri;  color:#008000; }
	.P341 { font-weight:bold; margin-bottom:0in; margin-top:0in; font-family:Calibri;  color:#008000; }
	.P342 { font-weight:bold; margin-bottom:0in; margin-top:0in; font-family:Times;  color:#008000; }
	.P343 { font-weight:bold; margin-bottom:0in; margin-top:0in; font-family:Times;  color:#008000; }
	.P344 { font-weight:bold; margin-bottom:0in; margin-top:0in; font-family:Times;  color:#008000; }
	.P345 { font-weight:bold; margin-bottom:0in; margin-top:0in; font-family:Calibri;  color:#000000; }
	.P346 { font-weight:normal; margin-bottom:0in; margin-top:0in;  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P347 { font-weight:normal; margin-bottom:0in; margin-top:0in;  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P348 { color:#4f81bd; font-weight:normal; margin-bottom:0in; margin-top:0.139in; font-family:Calibri;  }
	.P349 { color:#4f81bd; font-weight:normal; margin-bottom:0in; margin-top:0.139in; font-family:Calibri;  }
	.P35 {  text-decoration:underline; }
	.P350_borderStart { color:#4f81bd; font-size:12pt; font-weight:bold; margin-top:0.139in; font-family:Calibri;  background-color:#ffff00; padding-bottom:0in;  border-bottom-style:none; }
	.P350 { color:#4f81bd; font-size:12pt; font-weight:bold; font-family:Calibri;  background-color:#ffff00; padding-bottom:0in; padding-top:0.139in;  border-top-style:none; border-bottom-style:none; }
	.P350_borderEnd { color:#4f81bd; font-size:12pt; font-weight:bold; margin-bottom:0in; font-family:Calibri;  background-color:#ffff00; padding-top:0.139in;  border-top-style:none;}
	.P351 { margin-bottom:0in; margin-top:0in; font-family:Times;  }
	.P352 { margin-bottom:0in; margin-top:0in; font-family:Times;  }
	.P353 { margin-bottom:0in; margin-top:0in; font-family:Times;  }
	.P354 { font-size:4pt; margin-bottom:0in; margin-top:0in; font-family:Times;  }
	.P355 { font-size:4pt; margin-bottom:0in; margin-top:0in;  }
	.P356 { margin-bottom:0in; margin-top:0in;  }
	.P357 { margin-bottom:0in; margin-top:0in;  }
	.P358 { margin-bottom:0in; margin-top:0in;  text-decoration:underline; }
	.P359 { margin-bottom:0in; margin-top:0in;  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P36 {  text-decoration:underline; }
	.P360 { font-size:12pt; margin:100%; margin-left:0.4335in; margin-right:0in; text-indent:-0.4335in;  }
	.P361 {  text-decoration:underline; }
	.P363 { color:#000000; line-height:100%; vertical-align:middle;  }
	.P364 { color:#000000; line-height:100%; vertical-align:middle;  text-decoration:underline; }
	.P365 { color:#000000; line-height:100%; vertical-align:top;  margin-left:0.1972in; margin-right:0in; text-indent:-0.1972in; }
	.P366 { line-height:100%; margin:100%; margin-left:0.1972in; margin-right:0in; text-align:left ! important; text-indent:-0.1972in;  }
	.P367 { line-height:100%; margin:100%; margin-left:0in; margin-right:0in; text-align:left ! important; text-indent:0in;  }
	.P368 { line-height:100%; margin:100%; margin-left:0in; margin-right:0in; text-align:left ! important; text-indent:0in;  font-style:italic; }
	.P37 {  text-decoration:underline; }
	.P38 {  text-decoration:underline; }
	.P39 {  text-decoration:underline; }
	.P40 {  text-decoration:underline; }
	.P41 {  text-decoration:underline; }
	.P42 {  text-decoration:underline; }
	.P43 {  text-decoration:underline; }
	.P44 {  font-weight:bold; }
	.P45 {  text-align:right ! important; font-weight:bold; }
	.P46 {  font-weight:bold; }
	.P47 {  font-weight:bold; }
	.P48 {  font-weight:bold; }
	.P49 {  font-weight:bold; background-color:#00ff00; }
	.P50 {  text-decoration:underline; }
	.P51 {  background-color:#00ff00; }
	.P52 {  background-color:#00ff00; }
	.P57 {  text-decoration:underline; }
	.P58 {  text-decoration:underline; }
	.P59 {  font-weight:bold; }
	.P60 {  font-weight:bold; }
	.P61 {  font-style:italic; }
	.P62 {  font-style:italic; }
	.P63 {  font-style:italic; }
	.P64 {  background-color:#00ff00; }
	.P65 { font-family:Calibri;  text-decoration:underline; font-weight:bold; }
	.P66 { font-family:Calibri;  font-weight:bold; }
	.P67 { font-family:Calibri;  font-weight:bold; background-color:#00ff00; }
	.P68 { font-family:Calibri;  }
	.P69 { font-family:Calibri;  font-weight:bold; }
	.P70 { font-family:Calibri;  font-weight:bold; }
	.P71 { font-family:Calibri;  font-weight:bold; }
	.P72 { font-family:Calibri;  }
	.P73 { font-family:Calibri;  }
	.P74 { font-family:Calibri;  }
	.P75 { font-family:Calibri;  }
	.P76 { font-family:Calibri;  background-color:#00ff00; }
	.P77 { font-family:Calibri;  }
	.P78 { font-family:Calibri;  }
	.P79 { font-family:Calibri;  }
	.P80 { font-family:Calibri;  }
	.P81 { font-family:Calibri;  }
	.P82 { font-family:Calibri;  }
	.P83 { font-family:Calibri;  background-color:#ffff00; }
	.P84 { font-family:Calibri;  background-color:#00ff00; }
	.P85 { font-family:Calibri;  text-decoration:underline; font-weight:bold; background-color:#ffff00; }
	.P86 { font-family:Calibri;  text-decoration:underline; background-color:#ffff00; }
	.P87 { font-family:Calibri;  font-weight:bold; background-color:#ffff00; }
	.P88 { font-family:Calibri;  font-weight:bold; background-color:#ffff00; }
	.P89 { font-family:Calibri;  font-weight:bold; }
	.P90 { font-family:Calibri;  font-weight:bold; }
	.P91 { font-family:Calibri;  font-weight:bold; }
	.P92 { font-family:Calibri;  font-weight:bold; }
	.P93 { font-family:Calibri;  font-weight:bold; }
	.P94 { font-family:Calibri;  font-weight:bold; }
	.P95 { font-family:Calibri;  text-decoration:underline; font-weight:bold; background-color:#ffff00; }
	.P96 {  text-decoration:underline; font-weight:bold; }
	.P97 {  text-decoration:underline; }
	.P98 {  font-weight:bold; }
	.P99 {  font-weight:bold; }
	.Standard { font-size:12pt;  }
	.Table1 { width:13.2451in; margin-left:-0.0785in;  }
	.Table1_A1 { vertical-align:top; padding-left:0.075in; padding-right:0.075in; padding-top:0in; padding-bottom:0in; border-left-width:0.0176cm; border-left-style:solid; border-left-color:#000000; border-right-style:none; border-top-width:0.0176cm; border-top-style:solid; border-top-color:#000000; border-bottom-width:0.0176cm; border-bottom-style:solid; border-bottom-color:#000000;  }
	.Table1_A105 { vertical-align:top; background-color:#99cc00; padding-left:0.075in; padding-right:0.075in; padding-top:0in; padding-bottom:0in; border-left-width:0.0176cm; border-left-style:solid; border-left-color:#000000; border-right-style:none; border-top-width:0.0176cm; border-top-style:solid; border-top-color:#000000; border-bottom-width:0.0176cm; border-bottom-style:solid; border-bottom-color:#000000;  }
	.Table1_D28 { vertical-align:top; background-color:#ff9900; padding-left:0.075in; padding-right:0.075in; padding-top:0in; padding-bottom:0in; border-left-width:0.0176cm; border-left-style:solid; border-left-color:#000000; border-right-style:none; border-top-width:0.0176cm; border-top-style:solid; border-top-color:#000000; border-bottom-width:0.0176cm; border-bottom-style:solid; border-bottom-color:#000000;  }
	.Table1_E28 { vertical-align:top; background-color:#ff9900; padding-left:0.075in; padding-right:0.075in; padding-top:0in; padding-bottom:0in; border-left-style:none; border-right-style:none; border-top-width:0.0176cm; border-top-style:solid; border-top-color:#000000; border-bottom-width:0.0176cm; border-bottom-style:solid; border-bottom-color:#000000;  }
	.Table1_G1 { vertical-align:top; background-color:#00ffff; padding-left:0.075in; padding-right:0.075in; padding-top:0in; padding-bottom:0in; border-left-width:0.0176cm; border-left-style:solid; border-left-color:#000000; border-right-style:none; border-top-width:0.0176cm; border-top-style:solid; border-top-color:#000000; border-bottom-width:0.0176cm; border-bottom-style:solid; border-bottom-color:#000000;  }
	.Table1_M13 { vertical-align:top; background-color:#ff0000; padding-left:0.075in; padding-right:0.075in; padding-top:0in; padding-bottom:0in; border-left-width:0.0176cm; border-left-style:solid; border-left-color:#000000; border-right-style:none; border-top-width:0.0176cm; border-top-style:solid; border-top-color:#000000; border-bottom-width:0.0176cm; border-bottom-style:solid; border-bottom-color:#000000;  }
	.Table1_V1 { vertical-align:top; background-color:#ffcc99; padding-left:0.075in; padding-right:0.075in; padding-top:0in; padding-bottom:0in; border-left-width:0.0176cm; border-left-style:solid; border-left-color:#000000; border-right-style:none; border-top-width:0.0176cm; border-top-style:solid; border-top-color:#000000; border-bottom-width:0.0176cm; border-bottom-style:solid; border-bottom-color:#000000;  }
	.Table1_W1 { vertical-align:top; background-color:#ffff00; padding-left:0.075in; padding-right:0.075in; padding-top:0in; padding-bottom:0in; border-left-width:0.0176cm; border-left-style:solid; border-left-color:#000000; border-right-style:none; border-top-width:0.0176cm; border-top-style:solid; border-top-color:#000000; border-bottom-width:0.0176cm; border-bottom-style:solid; border-bottom-color:#000000;  }
	.Table1_d1 { vertical-align:top; background-color:#ffff00; padding-left:0.075in; padding-right:0.075in; padding-top:0in; padding-bottom:0in; border-width:0.0176cm; border-style:solid; border-color:#000000;  }
	.Table1_d35 { vertical-align:top; background-color:#ff0000; padding-left:0.075in; padding-right:0.075in; padding-top:0in; padding-bottom:0in; border-width:0.0176cm; border-style:solid; border-color:#000000;  }
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
	.HTML_20_Typewriter { font-family:Courier; }
	.Internet_20_link { color:#0000ff; text-decoration:underline; }
	.Strong_20_Emphasis { font-weight:bold; }
	.T100 { font-family:Calibri; }
	.T101 { font-family:Calibri; font-weight:normal; }
	.T102 { font-family:Calibri; }
	.T103 { font-family:Calibri; text-decoration:underline; background-color:#ffff00; }
	.T104 { font-family:Calibri; text-decoration:underline; }
	.T105 { font-family:Calibri; }
	.T108 { text-decoration:underline; }
	.T109 { text-decoration:underline; }
	.T111 { text-decoration:underline; }
	.T112 { text-decoration:underline; }
	.T113 { text-decoration:underline; background-color:#00ff00; }
	.T114 { text-decoration:underline; }
	.T115 { text-decoration:underline; }
	.T119 { font-style:italic; }
	.T120 { font-style:italic; }
	.T122 { color:#000000; }
	.T123 { color:#000000; }
	.T124 { color:#000000; }
	.T125 { color:#000000; }
	.T126 { color:#000000; }
	.T127 { color:#000000; }
	.T128 { color:#000000; }
	.T129 { color:#000000; text-decoration:underline; }
	.T130 { color:#000000; text-decoration:underline; }
	.T131 { color:#000000; font-style:italic; }
	.T132 { color:#000000; font-style:italic; }
	.T133 { color:#000000; font-style:italic; }
	.T134 { color:#000000; font-style:italic; }
	.T135 { color:#000000; font-style:italic; }
	.T136 { color:#000000; }
	.T137 { color:#000000; font-weight:normal; }
	.T138 { color:#000000; font-family:Times; }
	.T139 { color:#000000; font-family:Times; }
	.T140 { color:#000000; font-family:Times; }
	.T141 { font-weight:normal; }
	.T142 { font-weight:normal; }
	.T143 { font-weight:normal; }
	.T144 { font-weight:bold; }
	.T145 { font-weight:bold; }
	.T146 { font-weight:bold; }
	.T147 { font-weight:bold; }
	.T148 { font-style:italic; }
	.T149 { background-color:#00ff00; }
	.T151 { vertical-align:sub; font-size:58%;font-style:italic; }
	.T152 { font-family:Courier; }
	.T153 { vertical-align:super; font-size:58%;}
	.T154 { vertical-align:super; font-size:58%;font-style:italic; }
	.T155 { vertical-align:super; font-size:58%;font-style:italic; }
	.T156 { vertical-align:super; font-size:58%;}
	.T157 { font-family:Doulos SIL; font-style:italic; }
	.T158 { font-family:Doulos SIL; font-style:italic; }
	.T159 { font-family:Doulos SIL; font-style:italic; }
	.T160 { font-family:Doulos SIL; font-style:italic; }
	.T161 { font-family:Doulos SIL; }
	.T162 { font-family:Times; font-style:italic; }
	.T163 { font-family:Times; font-style:italic; }
	.T164 { font-family:Times; font-style:italic; }
	.T165 { font-family:Times; }
	.T166 { font-family:Times; }
	.T167 { font-family:Lucida Grande; font-style:italic; }
	.T168 { color:#141413; text-decoration:underline; }
	.T169 { color:#141413; text-decoration:underline; }
	.T170 { color:#141413; }
	.T171 { color:#141413; font-style:italic; }
	.T172 { color:#141413; font-style:italic; }
	.T173 { color:#141413; }
	.T174 { color:#141413; }
	.T175 { color:#141413; }
	.T176 { font-style:italic; }
	.T21 { text-decoration:underline; }
	.T22 { text-decoration:underline; }
	.T23 { text-decoration:underline; }
	.T24 { text-decoration:underline; }
	.T26 { font-weight:bold; }
	.T27 { font-weight:bold; }
	.T32 { color:#000000; }
	.T38 { font-style:italic; }
	.T39 { font-style:italic; }
	.T40 { font-style:italic; }
	.T41 { font-style:italic; }
	.T42 { font-style:italic; }
	.T43 { font-style:italic; }
	.T45 { font-style:italic; }
	.T46 { font-style:italic; }
	.T47 { font-style:italic; }
	.T48 { font-style:italic; }
	.T49 { font-style:italic; }
	.T50 { font-style:italic; }
	.T51 { font-style:italic; }
	.T52 { font-style:italic; }
	.T53 { font-style:italic; }
	.T54 { font-style:italic; }
	.T55 { font-style:italic; }
	.T56 { font-style:italic; }
	.T57 { font-style:italic; }
	.T58 { font-style:italic; }
	.T59 { font-style:italic; }
	.T60 { font-style:italic; }
	.T61 { font-style:italic; }
	.T62 { font-style:italic; }
	.T63 { font-style:italic; }
	.T64 { font-style:italic; }
	.T65 { font-style:italic; }
	.T66 { font-style:italic; font-weight:bold; }
	.T67 { font-style:italic; text-decoration:underline; }
	.T68 { font-style:italic; font-weight:normal; }
	.T69 { font-style:italic; font-weight:normal; }
	.T84 { font-style:italic; }
	.T86 { color:#000000; }
	.T87 { color:#000000; }
	.T88 { color:#000000; }
	.T92 { font-family:Times; }
	.T93 { color:#141413; }
	.T98 { font-family:Calibri; }
	.T99 { font-family:Calibri; }
	.WW8Num2z0 { font-family:Symbol; }
	.WW8Num2z1 { font-family:Courier New; }
	.WW8Num2z2 { font-family:Wingdings; }
	.WW8Num3z0 { font-family:Symbol; }
	.WW8Num3z1 { font-family:Courier New; }
	.WW8Num3z2 { font-family:Wingdings; }
	.WW8Num5z0 { font-family:Symbol; }
	.WW8Num5z1 { font-family:Courier New; }
	.WW8Num5z2 { font-family:Wingdings; }
	<!-- ODF styles with no properties representable as CSS -->
	.Table1.1 .T10 .T106 .T107 .T11 .T12 .T121 .T13 .T14 .T15 .T150 .T16 .T17 .T18 .T19 .T2 .T20 .T25 .T28 .T29 .T3 .T30 .T31 .T33 .T34 .T35 .T36 .T37 .T4 .T44 .T5 .T6 .T7 .T70 .T71 .T72 .T73 .T74 .T75 .T76 .T77 .T78 .T79 .T8 .T80 .T81 .T82 .T83 .T85 .T89 .T9 .T90 .T91 .T94 .T95 .T96 .T97 .breadcrumbs .code-info .hps .mw-headline .st { }
	</style>
</%block>

<h2>${ctx.name}</h2>

<div>${u.description(request, ctx.description)|n}</div>

${request.get_datatable('values', h.models.Value, language=ctx.recipient).render()}


<%def name="sidebar()">
    <%util:well title="Languages">
        ${util.dl_table(('recipient', h.link(request, ctx.recipient)), ('donor', h.link(request, ctx.donor)))}
    </%util:well>
</%def>
