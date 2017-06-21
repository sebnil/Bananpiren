// Shader created with Shader Forge v1.37 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.37;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:3,spmd:0,trmd:1,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5367647,fgcg:0.731643,fgcb:1,fgca:1,fgde:0.008,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:True,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:32719,y:32712,varname:node_4013,prsc:2|diff-8955-OUT,spec-6815-OUT,gloss-5675-OUT,normal-2802-OUT,emission-70-OUT,amdfl-5872-OUT,alpha-7085-OUT,refract-9298-OUT,voffset-1416-OUT;n:type:ShaderForge.SFN_Slider,id:1162,x:31413,y:32295,ptovrint:False,ptlb:Foam length,ptin:_Foamlength,varname:_Foamlength,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:4.74841,max:10;n:type:ShaderForge.SFN_DepthBlend,id:6684,x:31725,y:32321,varname:node_6684,prsc:2|DIST-1162-OUT;n:type:ShaderForge.SFN_OneMinus,id:7580,x:31862,y:32469,varname:node_7580,prsc:2|IN-6684-OUT;n:type:ShaderForge.SFN_Multiply,id:1071,x:31971,y:32580,varname:node_1071,prsc:2|A-7580-OUT,B-3416-OUT,C-740-OUT;n:type:ShaderForge.SFN_Slider,id:3416,x:31388,y:32389,ptovrint:False,ptlb:Foam Intensity,ptin:_FoamIntensity,varname:_FoamIntensity,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1.467995,max:40;n:type:ShaderForge.SFN_Tex2d,id:3715,x:31700,y:33378,ptovrint:False,ptlb:Water_smallwaves_Normal,ptin:_Water_smallwaves_Normal,varname:_Normal,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:5376858128ca00346a92dc002fee2ec5,ntxv:3,isnm:True|UVIN-5009-UVOUT;n:type:ShaderForge.SFN_Multiply,id:6796,x:32412,y:33348,varname:node_6796,prsc:2|A-6718-OUT,B-6107-OUT;n:type:ShaderForge.SFN_Slider,id:6107,x:32474,y:33621,ptovrint:False,ptlb:Refraction intensity,ptin:_Refractionintensity,varname:_Refractionintensity,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:3.192113,max:10;n:type:ShaderForge.SFN_ComponentMask,id:9054,x:32659,y:33320,varname:node_9054,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-6796-OUT;n:type:ShaderForge.SFN_Tex2d,id:6677,x:31564,y:33127,ptovrint:False,ptlb:Water_smallwaves,ptin:_Water_smallwaves,varname:_Water,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6b5e3cc64c3200340ba58ee9d95f558f,ntxv:0,isnm:False|UVIN-5009-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:5956,x:30796,y:32945,varname:node_5956,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:7248,x:31243,y:32958,varname:node_7248,prsc:2,spu:-0.007,spv:0.01|UVIN-6732-OUT;n:type:ShaderForge.SFN_Slider,id:5675,x:32810,y:32903,ptovrint:False,ptlb:Gloss,ptin:_Gloss,varname:_Gloss,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.2891507,max:1;n:type:ShaderForge.SFN_Multiply,id:7085,x:32237,y:33168,varname:node_7085,prsc:2|A-7626-OUT,B-1094-OUT;n:type:ShaderForge.SFN_DepthBlend,id:1094,x:32032,y:33142,varname:node_1094,prsc:2|DIST-9233-OUT;n:type:ShaderForge.SFN_Slider,id:9233,x:31875,y:32960,ptovrint:False,ptlb:Opacity blend,ptin:_Opacityblend,varname:_Opacityblend,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.238673,max:1;n:type:ShaderForge.SFN_Panner,id:5009,x:31316,y:33153,varname:node_5009,prsc:2,spu:-0.02,spv:0.05|UVIN-6732-OUT;n:type:ShaderForge.SFN_TexCoord,id:8126,x:30796,y:33092,varname:node_8126,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:4208,x:31119,y:33141,varname:node_4208,prsc:2|A-8126-UVOUT,B-9543-OUT;n:type:ShaderForge.SFN_Vector1,id:9543,x:30952,y:33275,varname:node_9543,prsc:2,v1:2;n:type:ShaderForge.SFN_Slider,id:5308,x:32432,y:33219,ptovrint:False,ptlb:Waves distort,ptin:_Wavesdistort,varname:_Wavesdistort,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.2933402,max:2;n:type:ShaderForge.SFN_Tex2d,id:3598,x:31539,y:32954,ptovrint:False,ptlb:Water_bigwaves,ptin:_Water_bigwaves,varname:_Water_smallwaves,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6b5e3cc64c3200340ba58ee9d95f558f,ntxv:0,isnm:False|UVIN-7248-UVOUT;n:type:ShaderForge.SFN_ValueProperty,id:6815,x:32305,y:32673,ptovrint:False,ptlb:specular,ptin:_specular,varname:node_6815,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:5872,x:32333,y:32870,ptovrint:False,ptlb:Ambient light,ptin:_Ambientlight,varname:node_5872,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_Color,id:1298,x:32388,y:32390,ptovrint:False,ptlb:Diffuse color,ptin:_Diffusecolor,varname:node_1298,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.02530276,c2:0.1656425,c3:0.2647059,c4:1;n:type:ShaderForge.SFN_Multiply,id:1440,x:31818,y:32976,varname:node_1440,prsc:2|A-3598-RGB,B-6677-RGB;n:type:ShaderForge.SFN_SwitchProperty,id:9298,x:32947,y:33320,ptovrint:False,ptlb:Rainswitch,ptin:_Rainswitch,varname:node_9298,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-9054-OUT,B-6491-OUT;n:type:ShaderForge.SFN_ComponentMask,id:6491,x:32959,y:33833,varname:node_6491,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-4465-OUT;n:type:ShaderForge.SFN_Multiply,id:9802,x:32219,y:33657,varname:node_9802,prsc:2|A-6718-OUT,B-7021-OUT;n:type:ShaderForge.SFN_Vector1,id:7021,x:32015,y:33641,varname:node_7021,prsc:2,v1:2;n:type:ShaderForge.SFN_SwitchProperty,id:2802,x:32495,y:32918,ptovrint:False,ptlb:Rain normal,ptin:_Rainnormal,varname:node_2802,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-6796-OUT,B-2094-OUT;n:type:ShaderForge.SFN_Multiply,id:4465,x:32702,y:33825,varname:node_4465,prsc:2|A-1643-OUT,B-5910-OUT;n:type:ShaderForge.SFN_Slider,id:5910,x:32515,y:34108,ptovrint:False,ptlb:Rain intensity,ptin:_Rainintensity,varname:node_5910,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.6787068,max:2;n:type:ShaderForge.SFN_Time,id:586,x:31429,y:34027,varname:node_586,prsc:2;n:type:ShaderForge.SFN_Multiply,id:8415,x:31630,y:34027,varname:node_8415,prsc:2|A-6785-OUT,B-586-T;n:type:ShaderForge.SFN_Sin,id:7267,x:31842,y:34027,varname:node_7267,prsc:2|IN-8415-OUT;n:type:ShaderForge.SFN_Tex2d,id:437,x:31966,y:33719,ptovrint:False,ptlb:Rain_1_normal,ptin:_Rain_1_normal,varname:node_437,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:dae5ae738b071f744a3050fde587d348,ntxv:3,isnm:True|UVIN-9447-OUT;n:type:ShaderForge.SFN_Tex2d,id:8063,x:32025,y:33875,ptovrint:False,ptlb:Rain_2_normal,ptin:_Rain_2_normal,varname:node_8063,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:cb21ea4bc392e044d8d5ad93a9ffa91e,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Lerp,id:2986,x:32308,y:33924,varname:node_2986,prsc:2|A-437-RGB,B-8063-RGB,T-1653-OUT;n:type:ShaderForge.SFN_RemapRange,id:1653,x:32025,y:34020,varname:node_1653,prsc:2,frmn:0.2,frmx:1,tomn:0.5,tomx:1|IN-7267-OUT;n:type:ShaderForge.SFN_Add,id:1643,x:32474,y:33738,varname:node_1643,prsc:2|A-9802-OUT,B-2986-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6785,x:31377,y:33780,ptovrint:False,ptlb:rain speed,ptin:_rainspeed,varname:node_6785,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:3;n:type:ShaderForge.SFN_TexCoord,id:4474,x:31593,y:33709,varname:node_4474,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:9447,x:31815,y:33719,varname:node_9447,prsc:2|A-4474-UVOUT,B-5132-OUT;n:type:ShaderForge.SFN_Vector1,id:5132,x:31733,y:33917,varname:node_5132,prsc:2,v1:1.4;n:type:ShaderForge.SFN_Tex2d,id:3646,x:31833,y:33204,ptovrint:False,ptlb:Water_bigwaves_Normal,ptin:_Water_bigwaves_Normal,varname:_Normal_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:5376858128ca00346a92dc002fee2ec5,ntxv:3,isnm:True|UVIN-7248-UVOUT;n:type:ShaderForge.SFN_NormalBlend,id:1135,x:32097,y:33361,varname:node_1135,prsc:2|BSE-3646-RGB,DTL-3715-RGB;n:type:ShaderForge.SFN_Multiply,id:1416,x:32549,y:33065,varname:node_1416,prsc:2|A-3646-RGB,B-5308-OUT;n:type:ShaderForge.SFN_Panner,id:4778,x:30385,y:32304,varname:node_4778,prsc:2,spu:-0.04,spv:0|UVIN-6732-OUT;n:type:ShaderForge.SFN_TexCoord,id:3928,x:29601,y:32190,varname:node_3928,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:6732,x:30080,y:32351,varname:node_6732,prsc:2|A-6148-OUT,B-7673-OUT;n:type:ShaderForge.SFN_Vector1,id:7673,x:30043,y:32486,varname:node_7673,prsc:2,v1:2;n:type:ShaderForge.SFN_Tex2d,id:6635,x:30592,y:32323,ptovrint:False,ptlb:Foam_copy,ptin:_Foam_copy,varname:_Foam_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:5a6ee3a80c784a344acd4454bf4a284e,ntxv:0,isnm:False|UVIN-4778-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:2073,x:30465,y:32112,varname:node_2073,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Vector1,id:876,x:30793,y:32261,varname:node_876,prsc:2,v1:10;n:type:ShaderForge.SFN_Blend,id:6885,x:30852,y:32354,varname:node_6885,prsc:2,blmd:1,clmp:True|SRC-6217-OUT,DST-6635-RGB;n:type:ShaderForge.SFN_Panner,id:1214,x:30442,y:32694,varname:node_1214,prsc:2,spu:0.04,spv:0|UVIN-6732-OUT;n:type:ShaderForge.SFN_Tex2d,id:7985,x:30640,y:32705,ptovrint:False,ptlb:Foam_copy_copy,ptin:_Foam_copy_copy,varname:_Foam_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:5a6ee3a80c784a344acd4454bf4a284e,ntxv:0,isnm:False|UVIN-1214-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:5679,x:30496,y:32512,varname:node_5679,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Vector1,id:5981,x:30598,y:32644,varname:node_5981,prsc:2,v1:10;n:type:ShaderForge.SFN_Blend,id:221,x:30930,y:32696,varname:node_221,prsc:2,blmd:1,clmp:True|SRC-1822-OUT,DST-7985-RGB;n:type:ShaderForge.SFN_Blend,id:6999,x:31074,y:32511,varname:node_6999,prsc:2,blmd:5,clmp:True|SRC-6885-OUT,DST-221-OUT;n:type:ShaderForge.SFN_OneMinus,id:6281,x:30651,y:32133,varname:node_6281,prsc:2|IN-2073-U;n:type:ShaderForge.SFN_Power,id:6217,x:31008,y:32119,varname:node_6217,prsc:2|VAL-6281-OUT,EXP-876-OUT;n:type:ShaderForge.SFN_Power,id:1822,x:30763,y:32530,varname:node_1822,prsc:2|VAL-5679-U,EXP-5981-OUT;n:type:ShaderForge.SFN_Blend,id:2247,x:32241,y:32760,varname:node_2247,prsc:2,blmd:6,clmp:True|SRC-1071-OUT,DST-1440-OUT;n:type:ShaderForge.SFN_ConstantClamp,id:70,x:32495,y:32726,varname:node_70,prsc:2,min:0,max:1|IN-2247-OUT;n:type:ShaderForge.SFN_TexCoord,id:9264,x:30165,y:33433,varname:node_9264,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Vector1,id:7624,x:30493,y:33582,varname:node_7624,prsc:2,v1:10;n:type:ShaderForge.SFN_Blend,id:2800,x:30552,y:33675,varname:node_2800,prsc:2,blmd:1,clmp:True|SRC-6337-OUT,DST-9567-RGB;n:type:ShaderForge.SFN_TexCoord,id:5838,x:30224,y:33833,varname:node_5838,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Vector1,id:8560,x:30298,y:33965,varname:node_8560,prsc:2,v1:10;n:type:ShaderForge.SFN_Blend,id:8697,x:30630,y:34017,varname:node_8697,prsc:2,blmd:1,clmp:True|SRC-3304-OUT,DST-28-RGB;n:type:ShaderForge.SFN_Blend,id:1228,x:30775,y:33865,varname:node_1228,prsc:2,blmd:5,clmp:True|SRC-2800-OUT,DST-8697-OUT;n:type:ShaderForge.SFN_OneMinus,id:3105,x:30351,y:33454,varname:node_3105,prsc:2|IN-9264-U;n:type:ShaderForge.SFN_Power,id:6337,x:30625,y:33428,varname:node_6337,prsc:2|VAL-3105-OUT,EXP-7624-OUT;n:type:ShaderForge.SFN_Power,id:3304,x:30463,y:33851,varname:node_3304,prsc:2|VAL-5838-U,EXP-8560-OUT;n:type:ShaderForge.SFN_Tex2d,id:28,x:30375,y:34036,ptovrint:False,ptlb:Water_smallwaves_Normal_copy,ptin:_Water_smallwaves_Normal_copy,varname:_Water_smallwaves_Normal_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:5376858128ca00346a92dc002fee2ec5,ntxv:3,isnm:True|UVIN-3136-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:9567,x:30351,y:33675,ptovrint:False,ptlb:Water_bigwaves_Normal_copy,ptin:_Water_bigwaves_Normal_copy,varname:_Water_bigwaves_Normal_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:5376858128ca00346a92dc002fee2ec5,ntxv:3,isnm:True|UVIN-9190-UVOUT;n:type:ShaderForge.SFN_Multiply,id:3078,x:31004,y:33810,varname:node_3078,prsc:2|A-1228-OUT,B-5271-OUT;n:type:ShaderForge.SFN_Vector1,id:5271,x:30888,y:34034,varname:node_5271,prsc:2,v1:4;n:type:ShaderForge.SFN_Add,id:6718,x:32108,y:33500,varname:node_6718,prsc:2|A-1135-OUT,B-3078-OUT;n:type:ShaderForge.SFN_Multiply,id:9993,x:31318,y:32591,varname:node_9993,prsc:2|A-6999-OUT,B-3557-OUT;n:type:ShaderForge.SFN_Vector1,id:3557,x:31169,y:32732,varname:node_3557,prsc:2,v1:1.2;n:type:ShaderForge.SFN_Tex2d,id:4084,x:31471,y:32760,ptovrint:False,ptlb:Foam middle,ptin:_Foammiddle,varname:_Foam_copy_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:5a6ee3a80c784a344acd4454bf4a284e,ntxv:0,isnm:False|UVIN-7248-UVOUT;n:type:ShaderForge.SFN_ValueProperty,id:7103,x:31875,y:32807,ptovrint:False,ptlb:Opacity,ptin:_Opacity,varname:node_7103,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_Blend,id:740,x:31688,y:32623,varname:node_740,prsc:2,blmd:6,clmp:True|SRC-9993-OUT,DST-4084-RGB;n:type:ShaderForge.SFN_Blend,id:6911,x:32183,y:32562,varname:node_6911,prsc:2,blmd:6,clmp:True|SRC-9993-OUT,DST-1440-OUT;n:type:ShaderForge.SFN_Blend,id:8955,x:32538,y:32524,varname:node_8955,prsc:2,blmd:6,clmp:True|SRC-1298-RGB,DST-6911-OUT;n:type:ShaderForge.SFN_Vector1,id:1715,x:32277,y:33254,varname:node_1715,prsc:2,v1:2;n:type:ShaderForge.SFN_Multiply,id:2094,x:32719,y:33673,varname:node_2094,prsc:2|A-1643-OUT,B-9519-OUT;n:type:ShaderForge.SFN_Vector1,id:9519,x:32863,y:33736,varname:node_9519,prsc:2,v1:2;n:type:ShaderForge.SFN_Tex2d,id:7907,x:29163,y:32403,ptovrint:False,ptlb:flowmap,ptin:_flowmap,varname:node_7907,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:2016b9119d2647d44bede6118ce6289b,ntxv:0,isnm:False;n:type:ShaderForge.SFN_ComponentMask,id:4034,x:29389,y:32403,varname:node_4034,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-7907-RGB;n:type:ShaderForge.SFN_Multiply,id:2908,x:29692,y:32528,varname:node_2908,prsc:2|A-7484-OUT,B-8164-OUT;n:type:ShaderForge.SFN_Vector1,id:8164,x:29580,y:32588,varname:node_8164,prsc:2,v1:-1;n:type:ShaderForge.SFN_Multiply,id:1140,x:29733,y:32415,varname:node_1140,prsc:2|A-4034-OUT,B-2908-OUT;n:type:ShaderForge.SFN_Vector1,id:7484,x:29543,y:32528,varname:node_7484,prsc:2,v1:0.3;n:type:ShaderForge.SFN_Add,id:6148,x:29928,y:32293,varname:node_6148,prsc:2|A-3928-UVOUT,B-1140-OUT;n:type:ShaderForge.SFN_Panner,id:9190,x:30141,y:33648,varname:node_9190,prsc:2,spu:-0.1,spv:0|UVIN-6732-OUT;n:type:ShaderForge.SFN_Panner,id:3136,x:30068,y:34143,varname:node_3136,prsc:2,spu:0.1,spv:0|UVIN-6732-OUT;n:type:ShaderForge.SFN_ComponentMask,id:9579,x:32047,y:32763,varname:node_9579,prsc:2,cc1:0,cc2:-1,cc3:-1,cc4:-1|IN-8955-OUT;n:type:ShaderForge.SFN_Add,id:7626,x:32196,y:32933,varname:node_7626,prsc:2|A-9579-OUT,B-7103-OUT;proporder:1162-3416-9233-6107-5675-6815-6677-3598-3715-3646-5308-5872-1298-9298-2802-5910-437-8063-6785-6635-7985-28-9567-4084-7103-7907;pass:END;sub:END;*/

Shader "Shader Forge/Water" {
    Properties {
        _Foamlength ("Foam length", Range(0, 10)) = 4.74841
        _FoamIntensity ("Foam Intensity", Range(0, 40)) = 1.467995
        _Opacityblend ("Opacity blend", Range(0, 1)) = 0.238673
        _Refractionintensity ("Refraction intensity", Range(0, 10)) = 3.192113
        _Gloss ("Gloss", Range(0, 1)) = 0.2891507
        _specular ("specular", Float ) = 1
        _Water_smallwaves ("Water_smallwaves", 2D) = "white" {}
        _Water_bigwaves ("Water_bigwaves", 2D) = "white" {}
        _Water_smallwaves_Normal ("Water_smallwaves_Normal", 2D) = "bump" {}
        _Water_bigwaves_Normal ("Water_bigwaves_Normal", 2D) = "bump" {}
        _Wavesdistort ("Waves distort", Range(0, 2)) = 0.2933402
        _Ambientlight ("Ambient light", Float ) = 0.5
        _Diffusecolor ("Diffuse color", Color) = (0.02530276,0.1656425,0.2647059,1)
        [MaterialToggle] _Rainswitch ("Rainswitch", Float ) = 0
        [MaterialToggle] _Rainnormal ("Rain normal", Float ) = 0
        _Rainintensity ("Rain intensity", Range(0, 2)) = 0.6787068
        _Rain_1_normal ("Rain_1_normal", 2D) = "bump" {}
        _Rain_2_normal ("Rain_2_normal", 2D) = "bump" {}
        _rainspeed ("rain speed", Float ) = 3
        _Foam_copy ("Foam_copy", 2D) = "white" {}
        _Foam_copy_copy ("Foam_copy_copy", 2D) = "white" {}
        _Water_smallwaves_Normal_copy ("Water_smallwaves_Normal_copy", 2D) = "bump" {}
        _Water_bigwaves_Normal_copy ("Water_bigwaves_Normal_copy", 2D) = "bump" {}
        _Foammiddle ("Foam middle", 2D) = "white" {}
        _Opacity ("Opacity", Float ) = 0.5
        _flowmap ("flowmap", 2D) = "white" {}
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        GrabPass{ }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend One OneMinusSrcAlpha
            Cull Off
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 2.0
            uniform sampler2D _GrabTexture;
            uniform sampler2D _CameraDepthTexture;
            uniform float4 _TimeEditor;
            uniform float _Foamlength;
            uniform float _FoamIntensity;
            uniform sampler2D _Water_smallwaves_Normal; uniform float4 _Water_smallwaves_Normal_ST;
            uniform float _Refractionintensity;
            uniform sampler2D _Water_smallwaves; uniform float4 _Water_smallwaves_ST;
            uniform float _Gloss;
            uniform float _Opacityblend;
            uniform float _Wavesdistort;
            uniform sampler2D _Water_bigwaves; uniform float4 _Water_bigwaves_ST;
            uniform float _specular;
            uniform float _Ambientlight;
            uniform float4 _Diffusecolor;
            uniform fixed _Rainswitch;
            uniform fixed _Rainnormal;
            uniform float _Rainintensity;
            uniform sampler2D _Rain_1_normal; uniform float4 _Rain_1_normal_ST;
            uniform sampler2D _Rain_2_normal; uniform float4 _Rain_2_normal_ST;
            uniform float _rainspeed;
            uniform sampler2D _Water_bigwaves_Normal; uniform float4 _Water_bigwaves_Normal_ST;
            uniform sampler2D _Foam_copy; uniform float4 _Foam_copy_ST;
            uniform sampler2D _Foam_copy_copy; uniform float4 _Foam_copy_copy_ST;
            uniform sampler2D _Water_smallwaves_Normal_copy; uniform float4 _Water_smallwaves_Normal_copy_ST;
            uniform sampler2D _Water_bigwaves_Normal_copy; uniform float4 _Water_bigwaves_Normal_copy_ST;
            uniform sampler2D _Foammiddle; uniform float4 _Foammiddle_ST;
            uniform float _Opacity;
            uniform sampler2D _flowmap; uniform float4 _flowmap_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                float4 screenPos : TEXCOORD5;
                float4 projPos : TEXCOORD6;
                UNITY_FOG_COORDS(7)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                float4 node_4388 = _Time + _TimeEditor;
                float4 _flowmap_var = tex2Dlod(_flowmap,float4(TRANSFORM_TEX(o.uv0, _flowmap),0.0,0));
                float2 node_6732 = ((o.uv0+(_flowmap_var.rgb.rg*(0.3*(-1.0))))*2.0);
                float2 node_7248 = (node_6732+node_4388.g*float2(-0.007,0.01));
                float3 _Water_bigwaves_Normal_var = UnpackNormal(tex2Dlod(_Water_bigwaves_Normal,float4(TRANSFORM_TEX(node_7248, _Water_bigwaves_Normal),0.0,0)));
                v.vertex.xyz += (_Water_bigwaves_Normal_var.rgb*_Wavesdistort);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                o.screenPos = o.pos;
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                #if UNITY_UV_STARTS_AT_TOP
                    float grabSign = -_ProjectionParams.x;
                #else
                    float grabSign = _ProjectionParams.x;
                #endif
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float4 node_4388 = _Time + _TimeEditor;
                float4 _flowmap_var = tex2D(_flowmap,TRANSFORM_TEX(i.uv0, _flowmap));
                float2 node_6732 = ((i.uv0+(_flowmap_var.rgb.rg*(0.3*(-1.0))))*2.0);
                float2 node_7248 = (node_6732+node_4388.g*float2(-0.007,0.01));
                float3 _Water_bigwaves_Normal_var = UnpackNormal(tex2D(_Water_bigwaves_Normal,TRANSFORM_TEX(node_7248, _Water_bigwaves_Normal)));
                float2 node_5009 = (node_6732+node_4388.g*float2(-0.02,0.05));
                float3 _Water_smallwaves_Normal_var = UnpackNormal(tex2D(_Water_smallwaves_Normal,TRANSFORM_TEX(node_5009, _Water_smallwaves_Normal)));
                float3 node_1135_nrm_base = _Water_bigwaves_Normal_var.rgb + float3(0,0,1);
                float3 node_1135_nrm_detail = _Water_smallwaves_Normal_var.rgb * float3(-1,-1,1);
                float3 node_1135_nrm_combined = node_1135_nrm_base*dot(node_1135_nrm_base, node_1135_nrm_detail)/node_1135_nrm_base.z - node_1135_nrm_detail;
                float3 node_1135 = node_1135_nrm_combined;
                float2 node_9190 = (node_6732+node_4388.g*float2(-0.1,0));
                float3 _Water_bigwaves_Normal_copy_var = UnpackNormal(tex2D(_Water_bigwaves_Normal_copy,TRANSFORM_TEX(node_9190, _Water_bigwaves_Normal_copy)));
                float2 node_3136 = (node_6732+node_4388.g*float2(0.1,0));
                float3 _Water_smallwaves_Normal_copy_var = UnpackNormal(tex2D(_Water_smallwaves_Normal_copy,TRANSFORM_TEX(node_3136, _Water_smallwaves_Normal_copy)));
                float3 node_6718 = (node_1135+(saturate(max(saturate((pow((1.0 - i.uv0.r),10.0)*_Water_bigwaves_Normal_copy_var.rgb)),saturate((pow(i.uv0.r,10.0)*_Water_smallwaves_Normal_copy_var.rgb))))*4.0));
                float3 node_6796 = (node_6718*_Refractionintensity);
                float2 node_9447 = (i.uv0*1.4);
                float3 _Rain_1_normal_var = UnpackNormal(tex2D(_Rain_1_normal,TRANSFORM_TEX(node_9447, _Rain_1_normal)));
                float3 _Rain_2_normal_var = UnpackNormal(tex2D(_Rain_2_normal,TRANSFORM_TEX(i.uv0, _Rain_2_normal)));
                float4 node_586 = _Time + _TimeEditor;
                float3 node_1643 = ((node_6718*2.0)+lerp(_Rain_1_normal_var.rgb,_Rain_2_normal_var.rgb,(sin((_rainspeed*node_586.g))*0.625+0.375)));
                float3 normalLocal = lerp( node_6796, (node_1643*2.0), _Rainnormal );
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float sceneZ = max(0,LinearEyeDepth (UNITY_SAMPLE_DEPTH(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.projPos)))) - _ProjectionParams.g);
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5 + lerp( node_6796.rg, (node_1643*_Rainintensity).rg, _Rainswitch );
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = 1;
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float gloss = _Gloss;
                float perceptualRoughness = 1.0 - _Gloss;
                float roughness = perceptualRoughness * perceptualRoughness;
                float specPow = exp2( gloss * 10.0 + 1.0 );
/////// GI Data:
                UnityLight light;
                #ifdef LIGHTMAP_OFF
                    light.color = lightColor;
                    light.dir = lightDirection;
                    light.ndotl = LambertTerm (normalDirection, light.dir);
                #else
                    light.color = half3(0.f, 0.f, 0.f);
                    light.ndotl = 0.0f;
                    light.dir = half3(0.f, 0.f, 0.f);
                #endif
                UnityGIInput d;
                d.light = light;
                d.worldPos = i.posWorld.xyz;
                d.worldViewDir = viewDirection;
                d.atten = attenuation;
                Unity_GlossyEnvironmentData ugls_en_data;
                ugls_en_data.roughness = 1.0 - gloss;
                ugls_en_data.reflUVW = viewReflectDirection;
                UnityGI gi = UnityGlobalIllumination(d, 1, normalDirection, ugls_en_data );
                lightDirection = gi.light.dir;
                lightColor = gi.light.color;
////// Specular:
                float NdotL = saturate(dot( normalDirection, lightDirection ));
                float LdotH = saturate(dot(lightDirection, halfDirection));
                float3 specularColor = float3(_specular,_specular,_specular);
                float specularMonochrome;
                float2 node_4778 = (node_6732+node_4388.g*float2(-0.04,0));
                float4 _Foam_copy_var = tex2D(_Foam_copy,TRANSFORM_TEX(node_4778, _Foam_copy));
                float2 node_1214 = (node_6732+node_4388.g*float2(0.04,0));
                float4 _Foam_copy_copy_var = tex2D(_Foam_copy_copy,TRANSFORM_TEX(node_1214, _Foam_copy_copy));
                float3 node_9993 = (saturate(max(saturate((pow((1.0 - i.uv0.r),10.0)*_Foam_copy_var.rgb)),saturate((pow(i.uv0.r,10.0)*_Foam_copy_copy_var.rgb))))*1.2);
                float4 _Water_bigwaves_var = tex2D(_Water_bigwaves,TRANSFORM_TEX(node_7248, _Water_bigwaves));
                float4 _Water_smallwaves_var = tex2D(_Water_smallwaves,TRANSFORM_TEX(node_5009, _Water_smallwaves));
                float3 node_1440 = (_Water_bigwaves_var.rgb*_Water_smallwaves_var.rgb);
                float3 node_8955 = saturate((1.0-(1.0-_Diffusecolor.rgb)*(1.0-saturate((1.0-(1.0-node_9993)*(1.0-node_1440))))));
                float3 diffuseColor = node_8955; // Need this for specular when using metallic
                diffuseColor = EnergyConservationBetweenDiffuseAndSpecular(diffuseColor, specularColor, specularMonochrome);
                specularMonochrome = 1.0-specularMonochrome;
                float NdotV = abs(dot( normalDirection, viewDirection ));
                float NdotH = saturate(dot( normalDirection, halfDirection ));
                float VdotH = saturate(dot( viewDirection, halfDirection ));
                float visTerm = SmithJointGGXVisibilityTerm( NdotL, NdotV, roughness );
                float normTerm = GGXTerm(NdotH, roughness);
                float specularPBL = (visTerm*normTerm) * UNITY_PI;
                #ifdef UNITY_COLORSPACE_GAMMA
                    specularPBL = sqrt(max(1e-4h, specularPBL));
                #endif
                specularPBL = max(0, specularPBL * NdotL);
                #if defined(_SPECULARHIGHLIGHTS_OFF)
                    specularPBL = 0.0;
                #endif
                specularPBL *= any(specularColor) ? 1.0 : 0.0;
                float3 directSpecular = attenColor*specularPBL*FresnelTerm(specularColor, LdotH);
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
                float nlPow5 = Pow5(1-NdotL);
                float nvPow5 = Pow5(1-NdotV);
                float3 directDiffuse = ((1 +(fd90 - 1)*nlPow5) * (1 + (fd90 - 1)*nvPow5) * NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                indirectDiffuse += float3(_Ambientlight,_Ambientlight,_Ambientlight); // Diffuse Ambient Light
                diffuseColor *= 1-specularMonochrome;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float4 _Foammiddle_var = tex2D(_Foammiddle,TRANSFORM_TEX(node_7248, _Foammiddle));
                float3 emissive = clamp(saturate((1.0-(1.0-((1.0 - saturate((sceneZ-partZ)/_Foamlength))*_FoamIntensity*saturate((1.0-(1.0-node_9993)*(1.0-_Foammiddle_var.rgb)))))*(1.0-node_1440))),0,1);
/// Final Color:
                float3 finalColor = diffuse * ((node_8955.r+_Opacity)*saturate((sceneZ-partZ)/_Opacityblend)) + specular + emissive;
                fixed4 finalRGBA = fixed4(lerp(sceneColor.rgb, finalColor,((node_8955.r+_Opacity)*saturate((sceneZ-partZ)/_Opacityblend))),1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            Cull Off
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdadd
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 2.0
            uniform sampler2D _GrabTexture;
            uniform sampler2D _CameraDepthTexture;
            uniform float4 _TimeEditor;
            uniform float _Foamlength;
            uniform float _FoamIntensity;
            uniform sampler2D _Water_smallwaves_Normal; uniform float4 _Water_smallwaves_Normal_ST;
            uniform float _Refractionintensity;
            uniform sampler2D _Water_smallwaves; uniform float4 _Water_smallwaves_ST;
            uniform float _Gloss;
            uniform float _Opacityblend;
            uniform float _Wavesdistort;
            uniform sampler2D _Water_bigwaves; uniform float4 _Water_bigwaves_ST;
            uniform float _specular;
            uniform float4 _Diffusecolor;
            uniform fixed _Rainswitch;
            uniform fixed _Rainnormal;
            uniform float _Rainintensity;
            uniform sampler2D _Rain_1_normal; uniform float4 _Rain_1_normal_ST;
            uniform sampler2D _Rain_2_normal; uniform float4 _Rain_2_normal_ST;
            uniform float _rainspeed;
            uniform sampler2D _Water_bigwaves_Normal; uniform float4 _Water_bigwaves_Normal_ST;
            uniform sampler2D _Foam_copy; uniform float4 _Foam_copy_ST;
            uniform sampler2D _Foam_copy_copy; uniform float4 _Foam_copy_copy_ST;
            uniform sampler2D _Water_smallwaves_Normal_copy; uniform float4 _Water_smallwaves_Normal_copy_ST;
            uniform sampler2D _Water_bigwaves_Normal_copy; uniform float4 _Water_bigwaves_Normal_copy_ST;
            uniform sampler2D _Foammiddle; uniform float4 _Foammiddle_ST;
            uniform float _Opacity;
            uniform sampler2D _flowmap; uniform float4 _flowmap_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                float4 screenPos : TEXCOORD5;
                float4 projPos : TEXCOORD6;
                LIGHTING_COORDS(7,8)
                UNITY_FOG_COORDS(9)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                float4 node_1976 = _Time + _TimeEditor;
                float4 _flowmap_var = tex2Dlod(_flowmap,float4(TRANSFORM_TEX(o.uv0, _flowmap),0.0,0));
                float2 node_6732 = ((o.uv0+(_flowmap_var.rgb.rg*(0.3*(-1.0))))*2.0);
                float2 node_7248 = (node_6732+node_1976.g*float2(-0.007,0.01));
                float3 _Water_bigwaves_Normal_var = UnpackNormal(tex2Dlod(_Water_bigwaves_Normal,float4(TRANSFORM_TEX(node_7248, _Water_bigwaves_Normal),0.0,0)));
                v.vertex.xyz += (_Water_bigwaves_Normal_var.rgb*_Wavesdistort);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                o.screenPos = o.pos;
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                #if UNITY_UV_STARTS_AT_TOP
                    float grabSign = -_ProjectionParams.x;
                #else
                    float grabSign = _ProjectionParams.x;
                #endif
                i.normalDir = normalize(i.normalDir);
                i.normalDir *= faceSign;
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float4 node_1976 = _Time + _TimeEditor;
                float4 _flowmap_var = tex2D(_flowmap,TRANSFORM_TEX(i.uv0, _flowmap));
                float2 node_6732 = ((i.uv0+(_flowmap_var.rgb.rg*(0.3*(-1.0))))*2.0);
                float2 node_7248 = (node_6732+node_1976.g*float2(-0.007,0.01));
                float3 _Water_bigwaves_Normal_var = UnpackNormal(tex2D(_Water_bigwaves_Normal,TRANSFORM_TEX(node_7248, _Water_bigwaves_Normal)));
                float2 node_5009 = (node_6732+node_1976.g*float2(-0.02,0.05));
                float3 _Water_smallwaves_Normal_var = UnpackNormal(tex2D(_Water_smallwaves_Normal,TRANSFORM_TEX(node_5009, _Water_smallwaves_Normal)));
                float3 node_1135_nrm_base = _Water_bigwaves_Normal_var.rgb + float3(0,0,1);
                float3 node_1135_nrm_detail = _Water_smallwaves_Normal_var.rgb * float3(-1,-1,1);
                float3 node_1135_nrm_combined = node_1135_nrm_base*dot(node_1135_nrm_base, node_1135_nrm_detail)/node_1135_nrm_base.z - node_1135_nrm_detail;
                float3 node_1135 = node_1135_nrm_combined;
                float2 node_9190 = (node_6732+node_1976.g*float2(-0.1,0));
                float3 _Water_bigwaves_Normal_copy_var = UnpackNormal(tex2D(_Water_bigwaves_Normal_copy,TRANSFORM_TEX(node_9190, _Water_bigwaves_Normal_copy)));
                float2 node_3136 = (node_6732+node_1976.g*float2(0.1,0));
                float3 _Water_smallwaves_Normal_copy_var = UnpackNormal(tex2D(_Water_smallwaves_Normal_copy,TRANSFORM_TEX(node_3136, _Water_smallwaves_Normal_copy)));
                float3 node_6718 = (node_1135+(saturate(max(saturate((pow((1.0 - i.uv0.r),10.0)*_Water_bigwaves_Normal_copy_var.rgb)),saturate((pow(i.uv0.r,10.0)*_Water_smallwaves_Normal_copy_var.rgb))))*4.0));
                float3 node_6796 = (node_6718*_Refractionintensity);
                float2 node_9447 = (i.uv0*1.4);
                float3 _Rain_1_normal_var = UnpackNormal(tex2D(_Rain_1_normal,TRANSFORM_TEX(node_9447, _Rain_1_normal)));
                float3 _Rain_2_normal_var = UnpackNormal(tex2D(_Rain_2_normal,TRANSFORM_TEX(i.uv0, _Rain_2_normal)));
                float4 node_586 = _Time + _TimeEditor;
                float3 node_1643 = ((node_6718*2.0)+lerp(_Rain_1_normal_var.rgb,_Rain_2_normal_var.rgb,(sin((_rainspeed*node_586.g))*0.625+0.375)));
                float3 normalLocal = lerp( node_6796, (node_1643*2.0), _Rainnormal );
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float sceneZ = max(0,LinearEyeDepth (UNITY_SAMPLE_DEPTH(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.projPos)))) - _ProjectionParams.g);
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5 + lerp( node_6796.rg, (node_1643*_Rainintensity).rg, _Rainswitch );
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
///////// Gloss:
                float gloss = _Gloss;
                float perceptualRoughness = 1.0 - _Gloss;
                float roughness = perceptualRoughness * perceptualRoughness;
                float specPow = exp2( gloss * 10.0 + 1.0 );
////// Specular:
                float NdotL = saturate(dot( normalDirection, lightDirection ));
                float LdotH = saturate(dot(lightDirection, halfDirection));
                float3 specularColor = float3(_specular,_specular,_specular);
                float specularMonochrome;
                float2 node_4778 = (node_6732+node_1976.g*float2(-0.04,0));
                float4 _Foam_copy_var = tex2D(_Foam_copy,TRANSFORM_TEX(node_4778, _Foam_copy));
                float2 node_1214 = (node_6732+node_1976.g*float2(0.04,0));
                float4 _Foam_copy_copy_var = tex2D(_Foam_copy_copy,TRANSFORM_TEX(node_1214, _Foam_copy_copy));
                float3 node_9993 = (saturate(max(saturate((pow((1.0 - i.uv0.r),10.0)*_Foam_copy_var.rgb)),saturate((pow(i.uv0.r,10.0)*_Foam_copy_copy_var.rgb))))*1.2);
                float4 _Water_bigwaves_var = tex2D(_Water_bigwaves,TRANSFORM_TEX(node_7248, _Water_bigwaves));
                float4 _Water_smallwaves_var = tex2D(_Water_smallwaves,TRANSFORM_TEX(node_5009, _Water_smallwaves));
                float3 node_1440 = (_Water_bigwaves_var.rgb*_Water_smallwaves_var.rgb);
                float3 node_8955 = saturate((1.0-(1.0-_Diffusecolor.rgb)*(1.0-saturate((1.0-(1.0-node_9993)*(1.0-node_1440))))));
                float3 diffuseColor = node_8955; // Need this for specular when using metallic
                diffuseColor = EnergyConservationBetweenDiffuseAndSpecular(diffuseColor, specularColor, specularMonochrome);
                specularMonochrome = 1.0-specularMonochrome;
                float NdotV = abs(dot( normalDirection, viewDirection ));
                float NdotH = saturate(dot( normalDirection, halfDirection ));
                float VdotH = saturate(dot( viewDirection, halfDirection ));
                float visTerm = SmithJointGGXVisibilityTerm( NdotL, NdotV, roughness );
                float normTerm = GGXTerm(NdotH, roughness);
                float specularPBL = (visTerm*normTerm) * UNITY_PI;
                #ifdef UNITY_COLORSPACE_GAMMA
                    specularPBL = sqrt(max(1e-4h, specularPBL));
                #endif
                specularPBL = max(0, specularPBL * NdotL);
                #if defined(_SPECULARHIGHLIGHTS_OFF)
                    specularPBL = 0.0;
                #endif
                specularPBL *= any(specularColor) ? 1.0 : 0.0;
                float3 directSpecular = attenColor*specularPBL*FresnelTerm(specularColor, LdotH);
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
                float nlPow5 = Pow5(1-NdotL);
                float nvPow5 = Pow5(1-NdotV);
                float3 directDiffuse = ((1 +(fd90 - 1)*nlPow5) * (1 + (fd90 - 1)*nvPow5) * NdotL) * attenColor;
                diffuseColor *= 1-specularMonochrome;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse * ((node_8955.r+_Opacity)*saturate((sceneZ-partZ)/_Opacityblend)) + specular;
                fixed4 finalRGBA = fixed4(finalColor,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 2.0
            uniform float4 _TimeEditor;
            uniform float _Wavesdistort;
            uniform sampler2D _Water_bigwaves_Normal; uniform float4 _Water_bigwaves_Normal_ST;
            uniform sampler2D _flowmap; uniform float4 _flowmap_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                float4 node_8683 = _Time + _TimeEditor;
                float4 _flowmap_var = tex2Dlod(_flowmap,float4(TRANSFORM_TEX(o.uv0, _flowmap),0.0,0));
                float2 node_6732 = ((o.uv0+(_flowmap_var.rgb.rg*(0.3*(-1.0))))*2.0);
                float2 node_7248 = (node_6732+node_8683.g*float2(-0.007,0.01));
                float3 _Water_bigwaves_Normal_var = UnpackNormal(tex2Dlod(_Water_bigwaves_Normal,float4(TRANSFORM_TEX(node_7248, _Water_bigwaves_Normal),0.0,0)));
                v.vertex.xyz += (_Water_bigwaves_Normal_var.rgb*_Wavesdistort);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
