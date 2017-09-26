// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.35 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.35;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:2,spmd:0,trmd:1,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5367647,fgcg:0.731643,fgcb:1,fgca:1,fgde:0.008,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:4013,x:32719,y:32712,varname:node_4013,prsc:2|spec-6815-OUT,gloss-5675-OUT,normal-2802-OUT,emission-3425-OUT,amdfl-5872-OUT,alpha-7085-OUT,refract-9298-OUT,voffset-6566-OUT;n:type:ShaderForge.SFN_Slider,id:1162,x:31404,y:32472,ptovrint:False,ptlb:Foam length,ptin:_Foamlength,varname:_Foamlength,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:4.74841,max:10;n:type:ShaderForge.SFN_DepthBlend,id:6684,x:31745,y:32424,varname:node_6684,prsc:2|DIST-1162-OUT;n:type:ShaderForge.SFN_OneMinus,id:7580,x:31864,y:32485,varname:node_7580,prsc:2|IN-6684-OUT;n:type:ShaderForge.SFN_Multiply,id:1071,x:31959,y:32652,varname:node_1071,prsc:2|A-7580-OUT,B-3416-OUT,C-3228-R;n:type:ShaderForge.SFN_ChannelBlend,id:3425,x:32118,y:32870,varname:node_3425,prsc:2,chbt:1|M-1071-OUT,R-5738-RGB,BTM-1440-OUT;n:type:ShaderForge.SFN_Slider,id:3416,x:31455,y:32639,ptovrint:False,ptlb:Foam Intensity,ptin:_FoamIntensity,varname:_FoamIntensity,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.6296527,max:40;n:type:ShaderForge.SFN_Tex2d,id:3715,x:32025,y:33368,ptovrint:False,ptlb:Normal,ptin:_Normal,varname:_Normal,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:5376858128ca00346a92dc002fee2ec5,ntxv:3,isnm:True|UVIN-5009-UVOUT;n:type:ShaderForge.SFN_Multiply,id:6796,x:32396,y:33336,varname:node_6796,prsc:2|A-3715-RGB,B-6107-OUT;n:type:ShaderForge.SFN_Slider,id:6107,x:32396,y:33534,ptovrint:False,ptlb:Refraction intensity,ptin:_Refractionintensity,varname:_Refractionintensity,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:3.192113,max:10;n:type:ShaderForge.SFN_ComponentMask,id:9054,x:32659,y:33320,varname:node_9054,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-6796-OUT;n:type:ShaderForge.SFN_Color,id:5738,x:31921,y:32841,ptovrint:False,ptlb:foam color,ptin:_foamcolor,varname:_foamcolor,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:6677,x:31569,y:33191,ptovrint:False,ptlb:Water,ptin:_Water,varname:_Water,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6b5e3cc64c3200340ba58ee9d95f558f,ntxv:0,isnm:False|UVIN-5009-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:5956,x:30796,y:32949,varname:node_5956,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:7248,x:31243,y:32958,varname:node_7248,prsc:2,spu:-0.007,spv:0.01|UVIN-5956-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:3228,x:31648,y:32784,ptovrint:False,ptlb:Foam,ptin:_Foam,varname:_Foam,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:5a6ee3a80c784a344acd4454bf4a284e,ntxv:0,isnm:False|UVIN-807-UVOUT;n:type:ShaderForge.SFN_Panner,id:807,x:31409,y:32757,varname:node_807,prsc:2,spu:-0.01,spv:0.01|UVIN-9037-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:9037,x:31207,y:32774,varname:node_9037,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Slider,id:5675,x:32211,y:32758,ptovrint:False,ptlb:Gloss,ptin:_Gloss,varname:_Gloss,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.2891507,max:1;n:type:ShaderForge.SFN_Multiply,id:7085,x:32277,y:33074,varname:node_7085,prsc:2|A-6677-A,B-1094-OUT;n:type:ShaderForge.SFN_DepthBlend,id:1094,x:32121,y:33211,varname:node_1094,prsc:2|DIST-9233-OUT;n:type:ShaderForge.SFN_Slider,id:9233,x:31800,y:33282,ptovrint:False,ptlb:Opacity blend,ptin:_Opacityblend,varname:_Opacityblend,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.435707,max:1;n:type:ShaderForge.SFN_Multiply,id:6566,x:32525,y:33060,varname:node_6566,prsc:2|A-3715-RGB,B-5308-OUT;n:type:ShaderForge.SFN_Panner,id:5009,x:31303,y:33141,varname:node_5009,prsc:2,spu:-0.04,spv:0.1|UVIN-4208-OUT;n:type:ShaderForge.SFN_TexCoord,id:8126,x:30796,y:33092,varname:node_8126,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:4208,x:31119,y:33141,varname:node_4208,prsc:2|A-8126-UVOUT,B-9543-OUT;n:type:ShaderForge.SFN_Vector1,id:9543,x:31060,y:33309,varname:node_9543,prsc:2,v1:2;n:type:ShaderForge.SFN_Slider,id:5308,x:32410,y:33211,ptovrint:False,ptlb:Waves distort,ptin:_Wavesdistort,varname:_Wavesdistort,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:2;n:type:ShaderForge.SFN_Tex2d,id:3598,x:31519,y:32977,ptovrint:False,ptlb:Water_smallwaves,ptin:_Water_smallwaves,varname:_Water_smallwaves,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6b5e3cc64c3200340ba58ee9d95f558f,ntxv:0,isnm:False|UVIN-7248-UVOUT;n:type:ShaderForge.SFN_ValueProperty,id:6815,x:32305,y:32673,ptovrint:False,ptlb:specular,ptin:_specular,varname:node_6815,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:5872,x:32333,y:32870,ptovrint:False,ptlb:Ambient light,ptin:_Ambientlight,varname:node_5872,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_Color,id:1298,x:32470,y:32389,ptovrint:False,ptlb:node_1298,ptin:_node_1298,varname:node_1298,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.375,c2:0.637931,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:1440,x:31832,y:33027,varname:node_1440,prsc:2|A-3598-RGB,B-6677-RGB;n:type:ShaderForge.SFN_Tex2d,id:3543,x:31955,y:33894,ptovrint:False,ptlb:rain,ptin:_rain,varname:node_3543,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:f5c0f2620ffe43a4ead7970b59746670,ntxv:3,isnm:True|UVIN-3823-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:9298,x:33083,y:33283,ptovrint:False,ptlb:Rainswitch,ptin:_Rainswitch,varname:node_9298,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-9054-OUT,B-6491-OUT;n:type:ShaderForge.SFN_ComponentMask,id:6491,x:32959,y:33833,varname:node_6491,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-4465-OUT;n:type:ShaderForge.SFN_NormalBlend,id:580,x:32318,y:33910,varname:node_580,prsc:2|BSE-9802-OUT,DTL-3543-RGB;n:type:ShaderForge.SFN_Multiply,id:9802,x:32217,y:33633,varname:node_9802,prsc:2|A-3715-RGB,B-7021-OUT;n:type:ShaderForge.SFN_Vector1,id:7021,x:32025,y:33633,varname:node_7021,prsc:2,v1:1;n:type:ShaderForge.SFN_SwitchProperty,id:2802,x:32499,y:32888,ptovrint:False,ptlb:Rain normal,ptin:_Rainnormal,varname:node_2802,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-3715-RGB,B-4465-OUT;n:type:ShaderForge.SFN_Multiply,id:4465,x:32564,y:33802,varname:node_4465,prsc:2|A-580-OUT,B-5910-OUT;n:type:ShaderForge.SFN_Slider,id:5910,x:32407,y:34050,ptovrint:False,ptlb:Rain intensity,ptin:_Rainintensity,varname:node_5910,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.6787068,max:2;n:type:ShaderForge.SFN_Vector4Property,id:613,x:29580,y:33753,ptovrint:False,ptlb:Spritesheet,ptin:_Spritesheet,cmnt:X Cols Y Rows Z Speed,varname:node_613,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:4,v2:2,v3:0.2,v4:0.2;n:type:ShaderForge.SFN_Relay,id:483,x:29919,y:33651,cmnt:NumRows,varname:node_483,prsc:2|IN-613-X;n:type:ShaderForge.SFN_Relay,id:5016,x:29958,y:33806,cmnt:NumCols,varname:node_5016,prsc:2|IN-613-Y;n:type:ShaderForge.SFN_Relay,id:6193,x:29818,y:33986,cmnt:Speed,varname:node_6193,prsc:2|IN-613-Z;n:type:ShaderForge.SFN_Time,id:2987,x:29560,y:34189,varname:node_2987,prsc:2;n:type:ShaderForge.SFN_Multiply,id:6483,x:29816,y:34227,varname:node_6483,prsc:2|A-6193-OUT,B-2987-T;n:type:ShaderForge.SFN_Frac,id:2344,x:30023,y:34227,varname:node_2344,prsc:2|IN-6483-OUT;n:type:ShaderForge.SFN_Multiply,id:1033,x:30231,y:34070,cmnt:total number of frames,varname:node_1033,prsc:2|A-483-OUT,B-5016-OUT;n:type:ShaderForge.SFN_Multiply,id:470,x:30384,y:34234,cmnt:CurrentFrames,varname:node_470,prsc:2|A-1033-OUT,B-2344-OUT;n:type:ShaderForge.SFN_Round,id:2415,x:30582,y:34234,cmnt:CurrentIndex,varname:node_2415,prsc:2|IN-470-OUT;n:type:ShaderForge.SFN_Divide,id:2977,x:30809,y:34244,varname:node_2977,prsc:2|A-2415-OUT,B-483-OUT;n:type:ShaderForge.SFN_Divide,id:5969,x:30796,y:34082,varname:node_5969,prsc:2|A-4531-OUT,B-5016-OUT;n:type:ShaderForge.SFN_Divide,id:9654,x:30788,y:33785,varname:node_9654,prsc:2|A-6738-OUT,B-483-OUT;n:type:ShaderForge.SFN_Fmod,id:6738,x:30804,y:33934,varname:node_6738,prsc:2|A-2415-OUT,B-483-OUT;n:type:ShaderForge.SFN_Floor,id:4531,x:30994,y:34244,varname:node_4531,prsc:2|IN-2977-OUT;n:type:ShaderForge.SFN_Append,id:6380,x:30945,y:33637,varname:node_6380,prsc:2|A-483-OUT,B-5016-OUT;n:type:ShaderForge.SFN_Append,id:9898,x:31131,y:33868,varname:node_9898,prsc:2|A-9654-OUT,B-9521-OUT;n:type:ShaderForge.SFN_OneMinus,id:9521,x:30994,y:34082,varname:node_9521,prsc:2|IN-5969-OUT;n:type:ShaderForge.SFN_Add,id:3823,x:31390,y:33854,varname:node_3823,prsc:2|A-8259-OUT,B-9898-OUT;n:type:ShaderForge.SFN_Multiply,id:8259,x:31416,y:33722,varname:node_8259,prsc:2|A-6380-OUT,B-3702-OUT;n:type:ShaderForge.SFN_TexCoord,id:4121,x:31436,y:33354,varname:node_4121,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Divide,id:3702,x:31438,y:33584,varname:node_3702,prsc:2|A-4121-UVOUT,B-6380-OUT;proporder:1162-3416-3715-6107-5738-6677-3228-5675-9233-5308-3598-6815-5872-1298-3543-9298-2802-5910-613;pass:END;sub:END;*/

Shader "Shader Forge/Water" {
    Properties {
        _Foamlength ("Foam length", Range(0, 10)) = 4.74841
        _FoamIntensity ("Foam Intensity", Range(0, 40)) = 0.6296527
        _Normal ("Normal", 2D) = "bump" {}
        _Refractionintensity ("Refraction intensity", Range(0, 10)) = 3.192113
        _foamcolor ("foam color", Color) = (1,1,1,1)
        _Water ("Water", 2D) = "white" {}
        _Foam ("Foam", 2D) = "white" {}
        _Gloss ("Gloss", Range(0, 1)) = 0.2891507
        _Opacityblend ("Opacity blend", Range(0, 1)) = 0.435707
        _Wavesdistort ("Waves distort", Range(0, 2)) = 0
        _Water_smallwaves ("Water_smallwaves", 2D) = "white" {}
        _specular ("specular", Float ) = 1
        _Ambientlight ("Ambient light", Float ) = 0.5
        _node_1298 ("node_1298", Color) = (0.375,0.637931,1,1)
        _rain ("rain", 2D) = "bump" {}
        [MaterialToggle] _Rainswitch ("Rainswitch", Float ) = 0
        [MaterialToggle] _Rainnormal ("Rain normal", Float ) = 0
        _Rainintensity ("Rain intensity", Range(0, 2)) = 0.6787068
        _Spritesheet ("Spritesheet", Vector) = (4,2,0.2,0.2)
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
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _GrabTexture;
            uniform sampler2D _CameraDepthTexture;
            uniform float4 _TimeEditor;
            uniform float _Foamlength;
            uniform float _FoamIntensity;
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            uniform float _Refractionintensity;
            uniform float4 _foamcolor;
            uniform sampler2D _Water; uniform float4 _Water_ST;
            uniform sampler2D _Foam; uniform float4 _Foam_ST;
            uniform float _Gloss;
            uniform float _Opacityblend;
            uniform float _Wavesdistort;
            uniform sampler2D _Water_smallwaves; uniform float4 _Water_smallwaves_ST;
            uniform float _specular;
            uniform float _Ambientlight;
            uniform sampler2D _rain; uniform float4 _rain_ST;
            uniform fixed _Rainswitch;
            uniform fixed _Rainnormal;
            uniform float _Rainintensity;
            uniform float4 _Spritesheet;
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
                float4 node_4108 = _Time + _TimeEditor;
                float2 node_5009 = ((o.uv0*2.0)+node_4108.g*float2(-0.04,0.1));
                float3 _Normal_var = UnpackNormal(tex2Dlod(_Normal,float4(TRANSFORM_TEX(node_5009, _Normal),0.0,0)));
                v.vertex.xyz += (_Normal_var.rgb*_Wavesdistort);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                o.screenPos = o.pos;
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                #if UNITY_UV_STARTS_AT_TOP
                    float grabSign = -_ProjectionParams.x;
                #else
                    float grabSign = _ProjectionParams.x;
                #endif
                i.normalDir = normalize(i.normalDir);
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float4 node_4108 = _Time + _TimeEditor;
                float2 node_5009 = ((i.uv0*2.0)+node_4108.g*float2(-0.04,0.1));
                float3 _Normal_var = UnpackNormal(tex2D(_Normal,TRANSFORM_TEX(node_5009, _Normal)));
                float node_483 = _Spritesheet.r; // NumRows
                float node_5016 = _Spritesheet.g; // NumCols
                float2 node_6380 = float2(node_483,node_5016);
                float4 node_2987 = _Time + _TimeEditor;
                float node_2415 = round(((node_483*node_5016)*frac((_Spritesheet.b*node_2987.g)))); // CurrentIndex
                float2 node_3823 = ((node_6380*(i.uv0/node_6380))+float2((fmod(node_2415,node_483)/node_483),(1.0 - (floor((node_2415/node_483))/node_5016))));
                float3 _rain_var = UnpackNormal(tex2D(_rain,TRANSFORM_TEX(node_3823, _rain)));
                float3 node_580_nrm_base = (_Normal_var.rgb*1.0) + float3(0,0,1);
                float3 node_580_nrm_detail = _rain_var.rgb * float3(-1,-1,1);
                float3 node_580_nrm_combined = node_580_nrm_base*dot(node_580_nrm_base, node_580_nrm_detail)/node_580_nrm_base.z - node_580_nrm_detail;
                float3 node_580 = node_580_nrm_combined;
                float3 node_4465 = (node_580*_Rainintensity);
                float3 normalLocal = lerp( _Normal_var.rgb, node_4465, _Rainnormal );
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float sceneZ = max(0,LinearEyeDepth (UNITY_SAMPLE_DEPTH(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.projPos)))) - _ProjectionParams.g);
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5 + lerp( (_Normal_var.rgb*_Refractionintensity).rg, node_4465.rg, _Rainswitch );
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = 1;
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float gloss = _Gloss;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = saturate(dot( normalDirection, lightDirection ));
                float3 specularColor = float3(_specular,_specular,_specular);
                float3 directSpecular = attenColor * pow(max(0,dot(reflect(-lightDirection, normalDirection),viewDirection)),specPow)*specularColor;
                float3 specular = directSpecular;
////// Emissive:
                float2 node_807 = (i.uv0+node_4108.g*float2(-0.01,0.01));
                float4 _Foam_var = tex2D(_Foam,TRANSFORM_TEX(node_807, _Foam));
                float node_1071 = ((1.0 - saturate((sceneZ-partZ)/_Foamlength))*_FoamIntensity*_Foam_var.r);
                float2 node_7248 = (i.uv0+node_4108.g*float2(-0.007,0.01));
                float4 _Water_smallwaves_var = tex2D(_Water_smallwaves,TRANSFORM_TEX(node_7248, _Water_smallwaves));
                float4 _Water_var = tex2D(_Water,TRANSFORM_TEX(node_5009, _Water));
                float3 emissive = (lerp( (_Water_smallwaves_var.rgb*_Water_var.rgb), _foamcolor.rgb, node_1071.r ));
/// Final Color:
                float3 finalColor = specular + emissive;
                fixed4 finalRGBA = fixed4(lerp(sceneColor.rgb, finalColor,(_Water_var.a*saturate((sceneZ-partZ)/_Opacityblend))),1);
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
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _GrabTexture;
            uniform sampler2D _CameraDepthTexture;
            uniform float4 _TimeEditor;
            uniform float _Foamlength;
            uniform float _FoamIntensity;
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            uniform float _Refractionintensity;
            uniform float4 _foamcolor;
            uniform sampler2D _Water; uniform float4 _Water_ST;
            uniform sampler2D _Foam; uniform float4 _Foam_ST;
            uniform float _Gloss;
            uniform float _Opacityblend;
            uniform float _Wavesdistort;
            uniform sampler2D _Water_smallwaves; uniform float4 _Water_smallwaves_ST;
            uniform float _specular;
            uniform sampler2D _rain; uniform float4 _rain_ST;
            uniform fixed _Rainswitch;
            uniform fixed _Rainnormal;
            uniform float _Rainintensity;
            uniform float4 _Spritesheet;
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
                float4 node_5508 = _Time + _TimeEditor;
                float2 node_5009 = ((o.uv0*2.0)+node_5508.g*float2(-0.04,0.1));
                float3 _Normal_var = UnpackNormal(tex2Dlod(_Normal,float4(TRANSFORM_TEX(node_5009, _Normal),0.0,0)));
                v.vertex.xyz += (_Normal_var.rgb*_Wavesdistort);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                o.screenPos = o.pos;
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                #if UNITY_UV_STARTS_AT_TOP
                    float grabSign = -_ProjectionParams.x;
                #else
                    float grabSign = _ProjectionParams.x;
                #endif
                i.normalDir = normalize(i.normalDir);
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float4 node_5508 = _Time + _TimeEditor;
                float2 node_5009 = ((i.uv0*2.0)+node_5508.g*float2(-0.04,0.1));
                float3 _Normal_var = UnpackNormal(tex2D(_Normal,TRANSFORM_TEX(node_5009, _Normal)));
                float node_483 = _Spritesheet.r; // NumRows
                float node_5016 = _Spritesheet.g; // NumCols
                float2 node_6380 = float2(node_483,node_5016);
                float4 node_2987 = _Time + _TimeEditor;
                float node_2415 = round(((node_483*node_5016)*frac((_Spritesheet.b*node_2987.g)))); // CurrentIndex
                float2 node_3823 = ((node_6380*(i.uv0/node_6380))+float2((fmod(node_2415,node_483)/node_483),(1.0 - (floor((node_2415/node_483))/node_5016))));
                float3 _rain_var = UnpackNormal(tex2D(_rain,TRANSFORM_TEX(node_3823, _rain)));
                float3 node_580_nrm_base = (_Normal_var.rgb*1.0) + float3(0,0,1);
                float3 node_580_nrm_detail = _rain_var.rgb * float3(-1,-1,1);
                float3 node_580_nrm_combined = node_580_nrm_base*dot(node_580_nrm_base, node_580_nrm_detail)/node_580_nrm_base.z - node_580_nrm_detail;
                float3 node_580 = node_580_nrm_combined;
                float3 node_4465 = (node_580*_Rainintensity);
                float3 normalLocal = lerp( _Normal_var.rgb, node_4465, _Rainnormal );
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float sceneZ = max(0,LinearEyeDepth (UNITY_SAMPLE_DEPTH(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.projPos)))) - _ProjectionParams.g);
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5 + lerp( (_Normal_var.rgb*_Refractionintensity).rg, node_4465.rg, _Rainswitch );
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float gloss = _Gloss;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = saturate(dot( normalDirection, lightDirection ));
                float3 specularColor = float3(_specular,_specular,_specular);
                float3 directSpecular = attenColor * pow(max(0,dot(reflect(-lightDirection, normalDirection),viewDirection)),specPow)*specularColor;
                float3 specular = directSpecular;
/// Final Color:
                float4 _Water_var = tex2D(_Water,TRANSFORM_TEX(node_5009, _Water));
                float3 finalColor = specular;
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
            Cull Back
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            uniform float _Wavesdistort;
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
                float4 node_5047 = _Time + _TimeEditor;
                float2 node_5009 = ((o.uv0*2.0)+node_5047.g*float2(-0.04,0.1));
                float3 _Normal_var = UnpackNormal(tex2Dlod(_Normal,float4(TRANSFORM_TEX(node_5009, _Normal),0.0,0)));
                v.vertex.xyz += (_Normal_var.rgb*_Wavesdistort);
                o.pos = UnityObjectToClipPos(v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
