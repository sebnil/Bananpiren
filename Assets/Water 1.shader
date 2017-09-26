// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.35 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.35;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:2,spmd:0,trmd:1,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:True,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5367647,fgcg:0.731643,fgcb:1,fgca:1,fgde:0.008,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:True,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:4013,x:32719,y:32712,varname:node_4013,prsc:2|diff-1298-RGB,spec-6815-OUT,gloss-5675-OUT,normal-2802-OUT,emission-3425-OUT,amdfl-5872-OUT,alpha-7085-OUT,refract-9298-OUT,voffset-1416-OUT;n:type:ShaderForge.SFN_Slider,id:1162,x:31404,y:32472,ptovrint:False,ptlb:Foam length,ptin:_Foamlength,varname:_Foamlength,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:4.74841,max:10;n:type:ShaderForge.SFN_DepthBlend,id:6684,x:31745,y:32424,varname:node_6684,prsc:2|DIST-1162-OUT;n:type:ShaderForge.SFN_OneMinus,id:7580,x:31864,y:32485,varname:node_7580,prsc:2|IN-6684-OUT;n:type:ShaderForge.SFN_Multiply,id:1071,x:31959,y:32652,varname:node_1071,prsc:2|A-7580-OUT,B-3416-OUT,C-3228-R;n:type:ShaderForge.SFN_ChannelBlend,id:3425,x:32118,y:32870,varname:node_3425,prsc:2,chbt:1|M-1071-OUT,R-5738-RGB,BTM-1440-OUT;n:type:ShaderForge.SFN_Slider,id:3416,x:31455,y:32639,ptovrint:False,ptlb:Foam Intensity,ptin:_FoamIntensity,varname:_FoamIntensity,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.6296527,max:40;n:type:ShaderForge.SFN_Tex2d,id:3715,x:31894,y:33410,ptovrint:False,ptlb:Water_smallwaves_Normal,ptin:_Water_smallwaves_Normal,varname:_Normal,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:5376858128ca00346a92dc002fee2ec5,ntxv:3,isnm:True|UVIN-5009-UVOUT;n:type:ShaderForge.SFN_Multiply,id:6796,x:32396,y:33336,varname:node_6796,prsc:2|A-1135-OUT,B-6107-OUT;n:type:ShaderForge.SFN_Slider,id:6107,x:32396,y:33534,ptovrint:False,ptlb:Refraction intensity,ptin:_Refractionintensity,varname:_Refractionintensity,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:3.192113,max:10;n:type:ShaderForge.SFN_ComponentMask,id:9054,x:32659,y:33320,varname:node_9054,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-6796-OUT;n:type:ShaderForge.SFN_Color,id:5738,x:31921,y:32841,ptovrint:False,ptlb:foam color,ptin:_foamcolor,varname:_foamcolor,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:6677,x:31564,y:33127,ptovrint:False,ptlb:Water_smallwaves,ptin:_Water_smallwaves,varname:_Water,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6b5e3cc64c3200340ba58ee9d95f558f,ntxv:0,isnm:False|UVIN-5009-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:5956,x:30796,y:32949,varname:node_5956,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:7248,x:31243,y:32958,varname:node_7248,prsc:2,spu:-0.007,spv:0.01|UVIN-5956-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:3228,x:31648,y:32784,ptovrint:False,ptlb:Foam,ptin:_Foam,varname:_Foam,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:5a6ee3a80c784a344acd4454bf4a284e,ntxv:0,isnm:False|UVIN-807-UVOUT;n:type:ShaderForge.SFN_Panner,id:807,x:31409,y:32757,varname:node_807,prsc:2,spu:0.02,spv:0.02|UVIN-9037-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:9037,x:31207,y:32774,varname:node_9037,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Slider,id:5675,x:32211,y:32758,ptovrint:False,ptlb:Gloss,ptin:_Gloss,varname:_Gloss,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.2891507,max:1;n:type:ShaderForge.SFN_Multiply,id:7085,x:32282,y:33156,varname:node_7085,prsc:2|A-6677-A,B-1094-OUT;n:type:ShaderForge.SFN_DepthBlend,id:1094,x:32121,y:33211,varname:node_1094,prsc:2|DIST-9233-OUT;n:type:ShaderForge.SFN_Slider,id:9233,x:31964,y:33129,ptovrint:False,ptlb:Opacity blend,ptin:_Opacityblend,varname:_Opacityblend,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.435707,max:1;n:type:ShaderForge.SFN_Panner,id:5009,x:31303,y:33141,varname:node_5009,prsc:2,spu:-0.04,spv:0.1|UVIN-4208-OUT;n:type:ShaderForge.SFN_TexCoord,id:8126,x:30796,y:33092,varname:node_8126,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:4208,x:31119,y:33141,varname:node_4208,prsc:2|A-8126-UVOUT,B-9543-OUT;n:type:ShaderForge.SFN_Vector1,id:9543,x:31060,y:33309,varname:node_9543,prsc:2,v1:2;n:type:ShaderForge.SFN_Slider,id:5308,x:32432,y:33219,ptovrint:False,ptlb:Waves distort,ptin:_Wavesdistort,varname:_Wavesdistort,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:2;n:type:ShaderForge.SFN_Tex2d,id:3598,x:31539,y:32954,ptovrint:False,ptlb:Water_bigwaves,ptin:_Water_bigwaves,varname:_Water_smallwaves,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6b5e3cc64c3200340ba58ee9d95f558f,ntxv:0,isnm:False|UVIN-7248-UVOUT;n:type:ShaderForge.SFN_ValueProperty,id:6815,x:32305,y:32673,ptovrint:False,ptlb:specular,ptin:_specular,varname:node_6815,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:5872,x:32333,y:32870,ptovrint:False,ptlb:Ambient light,ptin:_Ambientlight,varname:node_5872,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_Color,id:1298,x:32470,y:32389,ptovrint:False,ptlb:Diffuse color,ptin:_Diffusecolor,varname:node_1298,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.375,c2:0.637931,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:1440,x:31832,y:33027,varname:node_1440,prsc:2|A-3598-RGB,B-6677-RGB;n:type:ShaderForge.SFN_SwitchProperty,id:9298,x:33083,y:33283,ptovrint:False,ptlb:Rainswitch,ptin:_Rainswitch,varname:node_9298,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-9054-OUT,B-6491-OUT;n:type:ShaderForge.SFN_ComponentMask,id:6491,x:32959,y:33833,varname:node_6491,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-4465-OUT;n:type:ShaderForge.SFN_Multiply,id:9802,x:32219,y:33657,varname:node_9802,prsc:2|A-1135-OUT,B-7021-OUT;n:type:ShaderForge.SFN_Vector1,id:7021,x:32015,y:33641,varname:node_7021,prsc:2,v1:2;n:type:ShaderForge.SFN_SwitchProperty,id:2802,x:32499,y:32888,ptovrint:False,ptlb:Rain normal,ptin:_Rainnormal,varname:node_2802,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-3715-RGB,B-4465-OUT;n:type:ShaderForge.SFN_Multiply,id:4465,x:32728,y:33796,varname:node_4465,prsc:2|A-1643-OUT,B-5910-OUT;n:type:ShaderForge.SFN_Slider,id:5910,x:32515,y:34108,ptovrint:False,ptlb:Rain intensity,ptin:_Rainintensity,varname:node_5910,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.6787068,max:2;n:type:ShaderForge.SFN_Time,id:586,x:31429,y:34027,varname:node_586,prsc:2;n:type:ShaderForge.SFN_Multiply,id:8415,x:31630,y:34027,varname:node_8415,prsc:2|A-6785-OUT,B-586-T;n:type:ShaderForge.SFN_Sin,id:7267,x:31842,y:34027,varname:node_7267,prsc:2|IN-8415-OUT;n:type:ShaderForge.SFN_Tex2d,id:437,x:31980,y:33715,ptovrint:False,ptlb:Rain_1_normal,ptin:_Rain_1_normal,varname:node_437,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:dae5ae738b071f744a3050fde587d348,ntxv:3,isnm:True|UVIN-9447-OUT;n:type:ShaderForge.SFN_Tex2d,id:8063,x:32025,y:33875,ptovrint:False,ptlb:Rain_2_normal,ptin:_Rain_2_normal,varname:node_8063,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:cb21ea4bc392e044d8d5ad93a9ffa91e,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Lerp,id:2986,x:32308,y:33924,varname:node_2986,prsc:2|A-437-RGB,B-8063-RGB,T-1653-OUT;n:type:ShaderForge.SFN_RemapRange,id:1653,x:32025,y:34020,varname:node_1653,prsc:2,frmn:0.2,frmx:1,tomn:0.5,tomx:1|IN-7267-OUT;n:type:ShaderForge.SFN_Add,id:1643,x:32474,y:33747,varname:node_1643,prsc:2|A-9802-OUT,B-2986-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6785,x:31377,y:33780,ptovrint:False,ptlb:rain speed,ptin:_rainspeed,varname:node_6785,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:3;n:type:ShaderForge.SFN_TexCoord,id:4474,x:31593,y:33709,varname:node_4474,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:9447,x:31815,y:33719,varname:node_9447,prsc:2|A-4474-UVOUT,B-5132-OUT;n:type:ShaderForge.SFN_Vector1,id:5132,x:31733,y:33917,varname:node_5132,prsc:2,v1:1.4;n:type:ShaderForge.SFN_Tex2d,id:3646,x:31894,y:33221,ptovrint:False,ptlb:Water_bigwaves_Normal,ptin:_Water_bigwaves_Normal,varname:_Normal_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:5376858128ca00346a92dc002fee2ec5,ntxv:3,isnm:True|UVIN-7248-UVOUT;n:type:ShaderForge.SFN_NormalBlend,id:1135,x:32179,y:33352,varname:node_1135,prsc:2|BSE-3646-RGB,DTL-3715-RGB;n:type:ShaderForge.SFN_Tex2d,id:1755,x:32368,y:33028,ptovrint:False,ptlb:Waves normal,ptin:_Wavesnormal,varname:node_1755,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:a1789a6d4899e9d449c1dc16c0013d57,ntxv:3,isnm:True|UVIN-5009-UVOUT;n:type:ShaderForge.SFN_Multiply,id:1416,x:32543,y:33028,varname:node_1416,prsc:2|A-1755-RGB,B-5308-OUT;proporder:1162-3416-3228-9233-6107-5738-5675-6815-6677-3598-3715-3646-5308-5872-1298-9298-2802-5910-437-8063-6785-1755;pass:END;sub:END;*/

Shader "Shader Forge/Water" {
    Properties {
        _Foamlength ("Foam length", Range(0, 10)) = 4.74841
        _FoamIntensity ("Foam Intensity", Range(0, 40)) = 0.6296527
        _Foam ("Foam", 2D) = "white" {}
        _Opacityblend ("Opacity blend", Range(0, 1)) = 0.435707
        _Refractionintensity ("Refraction intensity", Range(0, 10)) = 3.192113
        _foamcolor ("foam color", Color) = (1,1,1,1)
        _Gloss ("Gloss", Range(0, 1)) = 0.2891507
        _specular ("specular", Float ) = 1
        _Water_smallwaves ("Water_smallwaves", 2D) = "white" {}
        _Water_bigwaves ("Water_bigwaves", 2D) = "white" {}
        _Water_smallwaves_Normal ("Water_smallwaves_Normal", 2D) = "bump" {}
        _Water_bigwaves_Normal ("Water_bigwaves_Normal", 2D) = "bump" {}
        _Wavesdistort ("Waves distort", Range(0, 2)) = 0
        _Ambientlight ("Ambient light", Float ) = 0.5
        _Diffusecolor ("Diffuse color", Color) = (0.375,0.637931,1,1)
        [MaterialToggle] _Rainswitch ("Rainswitch", Float ) = 0
        [MaterialToggle] _Rainnormal ("Rain normal", Float ) = 0
        _Rainintensity ("Rain intensity", Range(0, 2)) = 0.6787068
        _Rain_1_normal ("Rain_1_normal", 2D) = "bump" {}
        _Rain_2_normal ("Rain_2_normal", 2D) = "bump" {}
        _rainspeed ("rain speed", Float ) = 3
        _Wavesnormal ("Waves normal", 2D) = "bump" {}
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
            #define _GLOSSYENV 1
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
            uniform float4 _foamcolor;
            uniform sampler2D _Water_smallwaves; uniform float4 _Water_smallwaves_ST;
            uniform sampler2D _Foam; uniform float4 _Foam_ST;
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
            uniform sampler2D _Wavesnormal; uniform float4 _Wavesnormal_ST;
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
                float4 node_5431 = _Time + _TimeEditor;
                float2 node_5009 = ((o.uv0*2.0)+node_5431.g*float2(-0.04,0.1));
                float3 _Wavesnormal_var = UnpackNormal(tex2Dlod(_Wavesnormal,float4(TRANSFORM_TEX(node_5009, _Wavesnormal),0.0,0)));
                v.vertex.xyz += (_Wavesnormal_var.rgb*_Wavesdistort);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex );
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
                float4 node_5431 = _Time + _TimeEditor;
                float2 node_5009 = ((i.uv0*2.0)+node_5431.g*float2(-0.04,0.1));
                float3 _Water_smallwaves_Normal_var = UnpackNormal(tex2D(_Water_smallwaves_Normal,TRANSFORM_TEX(node_5009, _Water_smallwaves_Normal)));
                float2 node_7248 = (i.uv0+node_5431.g*float2(-0.007,0.01));
                float3 _Water_bigwaves_Normal_var = UnpackNormal(tex2D(_Water_bigwaves_Normal,TRANSFORM_TEX(node_7248, _Water_bigwaves_Normal)));
                float3 node_1135_nrm_base = _Water_bigwaves_Normal_var.rgb + float3(0,0,1);
                float3 node_1135_nrm_detail = _Water_smallwaves_Normal_var.rgb * float3(-1,-1,1);
                float3 node_1135_nrm_combined = node_1135_nrm_base*dot(node_1135_nrm_base, node_1135_nrm_detail)/node_1135_nrm_base.z - node_1135_nrm_detail;
                float3 node_1135 = node_1135_nrm_combined;
                float2 node_9447 = (i.uv0*1.4);
                float3 _Rain_1_normal_var = UnpackNormal(tex2D(_Rain_1_normal,TRANSFORM_TEX(node_9447, _Rain_1_normal)));
                float3 _Rain_2_normal_var = UnpackNormal(tex2D(_Rain_2_normal,TRANSFORM_TEX(i.uv0, _Rain_2_normal)));
                float4 node_586 = _Time + _TimeEditor;
                float3 node_4465 = (((node_1135*2.0)+lerp(_Rain_1_normal_var.rgb,_Rain_2_normal_var.rgb,(sin((_rainspeed*node_586.g))*0.625+0.375)))*_Rainintensity);
                float3 normalLocal = lerp( _Water_smallwaves_Normal_var.rgb, node_4465, _Rainnormal );
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float sceneZ = max(0,LinearEyeDepth (UNITY_SAMPLE_DEPTH(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.projPos)))) - _ProjectionParams.g);
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5 + lerp( (node_1135*_Refractionintensity).rg, node_4465.rg, _Rainswitch );
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = 1;
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float gloss = _Gloss;
                float specPow = exp2( gloss * 10.0+1.0);
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
                #if UNITY_SPECCUBE_BLENDING || UNITY_SPECCUBE_BOX_PROJECTION
                    d.boxMin[0] = unity_SpecCube0_BoxMin;
                    d.boxMin[1] = unity_SpecCube1_BoxMin;
                #endif
                #if UNITY_SPECCUBE_BOX_PROJECTION
                    d.boxMax[0] = unity_SpecCube0_BoxMax;
                    d.boxMax[1] = unity_SpecCube1_BoxMax;
                    d.probePosition[0] = unity_SpecCube0_ProbePosition;
                    d.probePosition[1] = unity_SpecCube1_ProbePosition;
                #endif
                d.probeHDR[0] = unity_SpecCube0_HDR;
                d.probeHDR[1] = unity_SpecCube1_HDR;
                Unity_GlossyEnvironmentData ugls_en_data;
                ugls_en_data.roughness = 1.0 - gloss;
                ugls_en_data.reflUVW = viewReflectDirection;
                UnityGI gi = UnityGlobalIllumination(d, 1, normalDirection, ugls_en_data );
                lightDirection = gi.light.dir;
                lightColor = gi.light.color;
////// Specular:
                float NdotL = saturate(dot( normalDirection, lightDirection ));
                float3 specularColor = float3(_specular,_specular,_specular);
                float3 directSpecular = attenColor * pow(max(0,dot(reflect(-lightDirection, normalDirection),viewDirection)),specPow)*specularColor;
                float3 indirectSpecular = (gi.indirect.specular)*specularColor;
                float3 specular = (directSpecular + indirectSpecular);
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                indirectDiffuse += float3(_Ambientlight,_Ambientlight,_Ambientlight); // Diffuse Ambient Light
                float3 diffuseColor = _Diffusecolor.rgb;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float2 node_807 = (i.uv0+node_5431.g*float2(0.02,0.02));
                float4 _Foam_var = tex2D(_Foam,TRANSFORM_TEX(node_807, _Foam));
                float node_1071 = ((1.0 - saturate((sceneZ-partZ)/_Foamlength))*_FoamIntensity*_Foam_var.r);
                float4 _Water_bigwaves_var = tex2D(_Water_bigwaves,TRANSFORM_TEX(node_7248, _Water_bigwaves));
                float4 _Water_smallwaves_var = tex2D(_Water_smallwaves,TRANSFORM_TEX(node_5009, _Water_smallwaves));
                float3 emissive = (lerp( (_Water_bigwaves_var.rgb*_Water_smallwaves_var.rgb), _foamcolor.rgb, node_1071.r ));
/// Final Color:
                float3 finalColor = diffuse * (_Water_smallwaves_var.a*saturate((sceneZ-partZ)/_Opacityblend)) + specular + emissive;
                fixed4 finalRGBA = fixed4(lerp(sceneColor.rgb, finalColor,(_Water_smallwaves_var.a*saturate((sceneZ-partZ)/_Opacityblend))),1);
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
            #define _GLOSSYENV 1
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
            uniform float4 _foamcolor;
            uniform sampler2D _Water_smallwaves; uniform float4 _Water_smallwaves_ST;
            uniform sampler2D _Foam; uniform float4 _Foam_ST;
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
            uniform sampler2D _Wavesnormal; uniform float4 _Wavesnormal_ST;
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
                float4 node_9186 = _Time + _TimeEditor;
                float2 node_5009 = ((o.uv0*2.0)+node_9186.g*float2(-0.04,0.1));
                float3 _Wavesnormal_var = UnpackNormal(tex2Dlod(_Wavesnormal,float4(TRANSFORM_TEX(node_5009, _Wavesnormal),0.0,0)));
                v.vertex.xyz += (_Wavesnormal_var.rgb*_Wavesdistort);
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
                float4 node_9186 = _Time + _TimeEditor;
                float2 node_5009 = ((i.uv0*2.0)+node_9186.g*float2(-0.04,0.1));
                float3 _Water_smallwaves_Normal_var = UnpackNormal(tex2D(_Water_smallwaves_Normal,TRANSFORM_TEX(node_5009, _Water_smallwaves_Normal)));
                float2 node_7248 = (i.uv0+node_9186.g*float2(-0.007,0.01));
                float3 _Water_bigwaves_Normal_var = UnpackNormal(tex2D(_Water_bigwaves_Normal,TRANSFORM_TEX(node_7248, _Water_bigwaves_Normal)));
                float3 node_1135_nrm_base = _Water_bigwaves_Normal_var.rgb + float3(0,0,1);
                float3 node_1135_nrm_detail = _Water_smallwaves_Normal_var.rgb * float3(-1,-1,1);
                float3 node_1135_nrm_combined = node_1135_nrm_base*dot(node_1135_nrm_base, node_1135_nrm_detail)/node_1135_nrm_base.z - node_1135_nrm_detail;
                float3 node_1135 = node_1135_nrm_combined;
                float2 node_9447 = (i.uv0*1.4);
                float3 _Rain_1_normal_var = UnpackNormal(tex2D(_Rain_1_normal,TRANSFORM_TEX(node_9447, _Rain_1_normal)));
                float3 _Rain_2_normal_var = UnpackNormal(tex2D(_Rain_2_normal,TRANSFORM_TEX(i.uv0, _Rain_2_normal)));
                float4 node_586 = _Time + _TimeEditor;
                float3 node_4465 = (((node_1135*2.0)+lerp(_Rain_1_normal_var.rgb,_Rain_2_normal_var.rgb,(sin((_rainspeed*node_586.g))*0.625+0.375)))*_Rainintensity);
                float3 normalLocal = lerp( _Water_smallwaves_Normal_var.rgb, node_4465, _Rainnormal );
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float sceneZ = max(0,LinearEyeDepth (UNITY_SAMPLE_DEPTH(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.projPos)))) - _ProjectionParams.g);
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5 + lerp( (node_1135*_Refractionintensity).rg, node_4465.rg, _Rainswitch );
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
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 diffuseColor = _Diffusecolor.rgb;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float4 _Water_smallwaves_var = tex2D(_Water_smallwaves,TRANSFORM_TEX(node_5009, _Water_smallwaves));
                float3 finalColor = diffuse * (_Water_smallwaves_var.a*saturate((sceneZ-partZ)/_Opacityblend)) + specular;
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
            #define _GLOSSYENV 1
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
            uniform sampler2D _Wavesnormal; uniform float4 _Wavesnormal_ST;
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
                float4 node_6853 = _Time + _TimeEditor;
                float2 node_5009 = ((o.uv0*2.0)+node_6853.g*float2(-0.04,0.1));
                float3 _Wavesnormal_var = UnpackNormal(tex2Dlod(_Wavesnormal,float4(TRANSFORM_TEX(node_5009, _Wavesnormal),0.0,0)));
                v.vertex.xyz += (_Wavesnormal_var.rgb*_Wavesdistort);
                o.pos = UnityObjectToClipPos(v.vertex );
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
