// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.35 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.35;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:3,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:4013,x:32719,y:32712,varname:node_4013,prsc:2|gloss-5675-OUT,normal-3715-RGB,emission-3425-OUT,alpha-7085-OUT,refract-9054-OUT;n:type:ShaderForge.SFN_Slider,id:1162,x:31404,y:32472,ptovrint:False,ptlb:Foam length,ptin:_Foamlength,varname:node_1162,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:4.74841,max:10;n:type:ShaderForge.SFN_DepthBlend,id:6684,x:31888,y:32454,varname:node_6684,prsc:2|DIST-1162-OUT;n:type:ShaderForge.SFN_OneMinus,id:7580,x:32095,y:32510,varname:node_7580,prsc:2|IN-6684-OUT;n:type:ShaderForge.SFN_Multiply,id:1071,x:32253,y:32645,varname:node_1071,prsc:2|A-7580-OUT,B-3416-OUT,C-3228-R;n:type:ShaderForge.SFN_ChannelBlend,id:3425,x:32196,y:32885,varname:node_3425,prsc:2,chbt:1|M-1071-OUT,R-5738-RGB,BTM-6677-RGB;n:type:ShaderForge.SFN_Slider,id:3416,x:31455,y:32639,ptovrint:False,ptlb:Foam Intensity,ptin:_FoamIntensity,varname:node_3416,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.6296527,max:1;n:type:ShaderForge.SFN_TexCoord,id:8115,x:31309,y:33407,varname:node_8115,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Tex2d,id:3715,x:32055,y:33403,ptovrint:False,ptlb:node_3715,ptin:_node_3715,varname:node_3715,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:5376858128ca00346a92dc002fee2ec5,ntxv:3,isnm:True|UVIN-2934-UVOUT;n:type:ShaderForge.SFN_Multiply,id:6796,x:32320,y:33372,varname:node_6796,prsc:2|A-3715-RGB,B-6107-OUT;n:type:ShaderForge.SFN_Slider,id:6107,x:31969,y:33688,ptovrint:False,ptlb:Refraction intensity,ptin:_Refractionintensity,varname:node_6107,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:2,max:10;n:type:ShaderForge.SFN_ComponentMask,id:9054,x:32563,y:33318,varname:node_9054,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-6796-OUT;n:type:ShaderForge.SFN_Color,id:5738,x:31796,y:32958,ptovrint:False,ptlb:foam color,ptin:_foamcolor,varname:node_5738,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:6677,x:31796,y:33137,ptovrint:False,ptlb:node_6677,ptin:_node_6677,varname:node_6677,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:026a7ab06e1dcde4c8c995d3ff98f958,ntxv:0,isnm:False|UVIN-7248-UVOUT;n:type:ShaderForge.SFN_Panner,id:2934,x:31689,y:33412,varname:node_2934,prsc:2,spu:0.01,spv:0.03|UVIN-8115-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:5956,x:31224,y:33139,varname:node_5956,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:7248,x:31501,y:33144,varname:node_7248,prsc:2,spu:-0.01,spv:0.02|UVIN-5956-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:3228,x:31648,y:32784,ptovrint:False,ptlb:node_3228,ptin:_node_3228,varname:node_3228,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:edbc3719f341f1f43a22d93a7bed0b19,ntxv:0,isnm:False|UVIN-807-UVOUT;n:type:ShaderForge.SFN_Panner,id:807,x:31409,y:32757,varname:node_807,prsc:2,spu:-0.01,spv:0.01|UVIN-9037-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:9037,x:31207,y:32774,varname:node_9037,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Slider,id:5675,x:32379,y:32586,ptovrint:False,ptlb:Gloss,ptin:_Gloss,varname:node_5675,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.3333333,max:1;n:type:ShaderForge.SFN_Multiply,id:7085,x:32225,y:33120,varname:node_7085,prsc:2|A-6677-A,B-1094-OUT;n:type:ShaderForge.SFN_DepthBlend,id:1094,x:32125,y:33201,varname:node_1094,prsc:2|DIST-9233-OUT;n:type:ShaderForge.SFN_Slider,id:9233,x:31821,y:33299,ptovrint:False,ptlb:Opacity blend,ptin:_Opacityblend,varname:node_9233,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;proporder:1162-3416-3715-6107-5738-6677-3228-5675-9233;pass:END;sub:END;*/

Shader "Shader Forge/Water" {
    Properties {
        _Foamlength ("Foam length", Range(0, 10)) = 4.74841
        _FoamIntensity ("Foam Intensity", Range(0, 1)) = 0.6296527
        _node_3715 ("node_3715", 2D) = "bump" {}
        _Refractionintensity ("Refraction intensity", Range(0, 10)) = 2
        _foamcolor ("foam color", Color) = (1,1,1,1)
        _node_6677 ("node_6677", 2D) = "white" {}
        _node_3228 ("node_3228", 2D) = "white" {}
        _Gloss ("Gloss", Range(0, 1)) = 0.3333333
        _Opacityblend ("Opacity blend", Range(0, 1)) = 0
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
            Blend SrcAlpha OneMinusSrcAlpha
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
            #pragma target 3.0
            uniform sampler2D _GrabTexture;
            uniform sampler2D _CameraDepthTexture;
            uniform float4 _TimeEditor;
            uniform float _Foamlength;
            uniform float _FoamIntensity;
            uniform sampler2D _node_3715; uniform float4 _node_3715_ST;
            uniform float _Refractionintensity;
            uniform float4 _foamcolor;
            uniform sampler2D _node_6677; uniform float4 _node_6677_ST;
            uniform sampler2D _node_3228; uniform float4 _node_3228_ST;
            uniform float _Gloss;
            uniform float _Opacityblend;
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
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
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
                float4 node_6465 = _Time + _TimeEditor;
                float2 node_2934 = (i.uv0+node_6465.g*float2(0.01,0.03));
                float3 _node_3715_var = UnpackNormal(tex2D(_node_3715,TRANSFORM_TEX(node_2934, _node_3715)));
                float3 normalLocal = _node_3715_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float sceneZ = max(0,LinearEyeDepth (UNITY_SAMPLE_DEPTH(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.projPos)))) - _ProjectionParams.g);
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5 + (_node_3715_var.rgb*_Refractionintensity).rg;
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
////// Lighting:
////// Emissive:
                float2 node_807 = (i.uv0+node_6465.g*float2(-0.01,0.01));
                float4 _node_3228_var = tex2D(_node_3228,TRANSFORM_TEX(node_807, _node_3228));
                float node_1071 = ((1.0 - saturate((sceneZ-partZ)/_Foamlength))*_FoamIntensity*_node_3228_var.r);
                float2 node_7248 = (i.uv0+node_6465.g*float2(-0.01,0.02));
                float4 _node_6677_var = tex2D(_node_6677,TRANSFORM_TEX(node_7248, _node_6677));
                float3 emissive = (lerp( _node_6677_var.rgb, _foamcolor.rgb, node_1071.r ));
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(lerp(sceneColor.rgb, finalColor,(_node_6677_var.a*saturate((sceneZ-partZ)/_Opacityblend))),1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
