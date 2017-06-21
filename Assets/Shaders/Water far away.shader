// Shader created with Shader Forge v1.37 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.37;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:2,spmd:0,trmd:1,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:True,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5367647,fgcg:0.731643,fgcb:1,fgca:1,fgde:0.008,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:True,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:32719,y:32712,varname:node_4013,prsc:2|diff-7698-OUT,spec-6815-OUT,gloss-5675-OUT,normal-6796-OUT,emission-70-OUT,amdfl-5872-OUT,alpha-7085-OUT,refract-9054-OUT;n:type:ShaderForge.SFN_Slider,id:1162,x:31413,y:32295,ptovrint:False,ptlb:Foam length,ptin:_Foamlength,varname:_Foamlength,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:4.74841,max:10;n:type:ShaderForge.SFN_DepthBlend,id:6684,x:31725,y:32321,varname:node_6684,prsc:2|DIST-1162-OUT;n:type:ShaderForge.SFN_OneMinus,id:7580,x:31862,y:32469,varname:node_7580,prsc:2|IN-6684-OUT;n:type:ShaderForge.SFN_Multiply,id:1071,x:31971,y:32580,varname:node_1071,prsc:2|A-7580-OUT,B-3416-OUT,C-4084-B;n:type:ShaderForge.SFN_Slider,id:3416,x:31388,y:32389,ptovrint:False,ptlb:Foam Intensity,ptin:_FoamIntensity,varname:_FoamIntensity,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1.467995,max:40;n:type:ShaderForge.SFN_Tex2d,id:3715,x:31700,y:33378,ptovrint:False,ptlb:Water_smallwaves_Normal,ptin:_Water_smallwaves_Normal,varname:_Normal,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:5376858128ca00346a92dc002fee2ec5,ntxv:3,isnm:True|UVIN-5009-UVOUT;n:type:ShaderForge.SFN_Multiply,id:6796,x:32412,y:33348,varname:node_6796,prsc:2|A-1135-OUT,B-6107-OUT;n:type:ShaderForge.SFN_Slider,id:6107,x:32145,y:33596,ptovrint:False,ptlb:Refraction intensity,ptin:_Refractionintensity,varname:_Refractionintensity,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:3.192113,max:10;n:type:ShaderForge.SFN_ComponentMask,id:9054,x:32643,y:33327,varname:node_9054,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-6796-OUT;n:type:ShaderForge.SFN_Tex2d,id:6677,x:31564,y:33127,ptovrint:False,ptlb:Water_smallwaves,ptin:_Water_smallwaves,varname:_Water,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6b5e3cc64c3200340ba58ee9d95f558f,ntxv:0,isnm:False|UVIN-5009-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:5956,x:30796,y:32945,varname:node_5956,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:7248,x:31243,y:32958,varname:node_7248,prsc:2,spu:0,spv:0.01|UVIN-5956-UVOUT;n:type:ShaderForge.SFN_Slider,id:5675,x:32436,y:32903,ptovrint:False,ptlb:Gloss,ptin:_Gloss,varname:_Gloss,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.2891507,max:1;n:type:ShaderForge.SFN_Multiply,id:7085,x:32176,y:33131,varname:node_7085,prsc:2|A-7103-OUT,B-1094-OUT;n:type:ShaderForge.SFN_DepthBlend,id:1094,x:31975,y:33133,varname:node_1094,prsc:2|DIST-9233-OUT;n:type:ShaderForge.SFN_Slider,id:9233,x:32019,y:33009,ptovrint:False,ptlb:Opacity blend,ptin:_Opacityblend,varname:_Opacityblend,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.238673,max:1;n:type:ShaderForge.SFN_Panner,id:5009,x:31322,y:33141,varname:node_5009,prsc:2,spu:0,spv:0.02|UVIN-4208-OUT;n:type:ShaderForge.SFN_TexCoord,id:8126,x:30796,y:33092,varname:node_8126,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:4208,x:31119,y:33141,varname:node_4208,prsc:2|A-8126-UVOUT,B-9543-OUT;n:type:ShaderForge.SFN_Vector1,id:9543,x:30952,y:33275,varname:node_9543,prsc:2,v1:2;n:type:ShaderForge.SFN_Tex2d,id:3598,x:31539,y:32954,ptovrint:False,ptlb:Water_bigwaves,ptin:_Water_bigwaves,varname:_Water_smallwaves,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:6b5e3cc64c3200340ba58ee9d95f558f,ntxv:0,isnm:False|UVIN-7248-UVOUT;n:type:ShaderForge.SFN_ValueProperty,id:6815,x:32305,y:32673,ptovrint:False,ptlb:specular,ptin:_specular,varname:node_6815,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:5872,x:32361,y:33031,ptovrint:False,ptlb:Ambient light,ptin:_Ambientlight,varname:node_5872,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:1440,x:31819,y:33013,varname:node_1440,prsc:2|A-3598-RGB,B-6677-RGB;n:type:ShaderForge.SFN_Tex2d,id:3646,x:31833,y:33204,ptovrint:False,ptlb:Water_bigwaves_Normal,ptin:_Water_bigwaves_Normal,varname:_Normal_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:5376858128ca00346a92dc002fee2ec5,ntxv:3,isnm:True|UVIN-7248-UVOUT;n:type:ShaderForge.SFN_NormalBlend,id:1135,x:32097,y:33361,varname:node_1135,prsc:2|BSE-3646-RGB,DTL-3715-RGB;n:type:ShaderForge.SFN_Blend,id:2247,x:32241,y:32760,varname:node_2247,prsc:2,blmd:6,clmp:True|SRC-1071-OUT,DST-1440-OUT;n:type:ShaderForge.SFN_ConstantClamp,id:70,x:32495,y:32726,varname:node_70,prsc:2,min:0,max:1|IN-2247-OUT;n:type:ShaderForge.SFN_Tex2d,id:4084,x:31417,y:32732,ptovrint:False,ptlb:Foam middle,ptin:_Foammiddle,varname:_Foam_copy_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:5a6ee3a80c784a344acd4454bf4a284e,ntxv:0,isnm:False|UVIN-7248-UVOUT;n:type:ShaderForge.SFN_ValueProperty,id:7103,x:31957,y:32781,ptovrint:False,ptlb:Opacity,ptin:_Opacity,varname:node_7103,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.2;n:type:ShaderForge.SFN_Vector1,id:1715,x:32277,y:33254,varname:node_1715,prsc:2,v1:2;n:type:ShaderForge.SFN_Blend,id:6417,x:32458,y:32453,varname:node_6417,prsc:2,blmd:5,clmp:True|SRC-3598-RGB,DST-6677-RGB;n:type:ShaderForge.SFN_Color,id:5206,x:32433,y:32252,ptovrint:False,ptlb:Diff color,ptin:_Diffcolor,varname:node_5206,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Add,id:7698,x:32695,y:32221,varname:node_7698,prsc:2|A-5206-RGB,B-6417-OUT;proporder:1162-3416-9233-6107-5675-6815-6677-3598-3715-3646-5872-4084-7103-5206;pass:END;sub:END;*/

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
        _Ambientlight ("Ambient light", Float ) = 0.5
        _Foammiddle ("Foam middle", 2D) = "white" {}
        _Opacity ("Opacity", Float ) = 0.2
        _Diffcolor ("Diff color", Color) = (0.5,0.5,0.5,1)
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
            uniform sampler2D _Water_smallwaves; uniform float4 _Water_smallwaves_ST;
            uniform float _Gloss;
            uniform float _Opacityblend;
            uniform sampler2D _Water_bigwaves; uniform float4 _Water_bigwaves_ST;
            uniform float _specular;
            uniform float _Ambientlight;
            uniform sampler2D _Water_bigwaves_Normal; uniform float4 _Water_bigwaves_Normal_ST;
            uniform sampler2D _Foammiddle; uniform float4 _Foammiddle_ST;
            uniform float _Opacity;
            uniform float4 _Diffcolor;
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
                float4 node_2412 = _Time + _TimeEditor;
                float2 node_7248 = (i.uv0+node_2412.g*float2(0,0.01));
                float3 _Water_bigwaves_Normal_var = UnpackNormal(tex2D(_Water_bigwaves_Normal,TRANSFORM_TEX(node_7248, _Water_bigwaves_Normal)));
                float2 node_5009 = ((i.uv0*2.0)+node_2412.g*float2(0,0.02));
                float3 _Water_smallwaves_Normal_var = UnpackNormal(tex2D(_Water_smallwaves_Normal,TRANSFORM_TEX(node_5009, _Water_smallwaves_Normal)));
                float3 node_1135_nrm_base = _Water_bigwaves_Normal_var.rgb + float3(0,0,1);
                float3 node_1135_nrm_detail = _Water_smallwaves_Normal_var.rgb * float3(-1,-1,1);
                float3 node_1135_nrm_combined = node_1135_nrm_base*dot(node_1135_nrm_base, node_1135_nrm_detail)/node_1135_nrm_base.z - node_1135_nrm_detail;
                float3 node_1135 = node_1135_nrm_combined;
                float3 node_6796 = (node_1135*_Refractionintensity);
                float3 normalLocal = node_6796;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float sceneZ = max(0,LinearEyeDepth (UNITY_SAMPLE_DEPTH(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.projPos)))) - _ProjectionParams.g);
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5 + node_6796.rg;
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = 1;
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float gloss = _Gloss;
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
                float4 _Water_bigwaves_var = tex2D(_Water_bigwaves,TRANSFORM_TEX(node_7248, _Water_bigwaves));
                float4 _Water_smallwaves_var = tex2D(_Water_smallwaves,TRANSFORM_TEX(node_5009, _Water_smallwaves));
                float3 diffuseColor = (_Diffcolor.rgb+saturate(max(_Water_bigwaves_var.rgb,_Water_smallwaves_var.rgb)));
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float4 _Foammiddle_var = tex2D(_Foammiddle,TRANSFORM_TEX(node_7248, _Foammiddle));
                float3 emissive = clamp(saturate((1.0-(1.0-((1.0 - saturate((sceneZ-partZ)/_Foamlength))*_FoamIntensity*_Foammiddle_var.b))*(1.0-(_Water_bigwaves_var.rgb*_Water_smallwaves_var.rgb)))),0,1);
/// Final Color:
                float3 finalColor = diffuse * (_Opacity*saturate((sceneZ-partZ)/_Opacityblend)) + specular + emissive;
                fixed4 finalRGBA = fixed4(lerp(sceneColor.rgb, finalColor,(_Opacity*saturate((sceneZ-partZ)/_Opacityblend))),1);
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
            uniform sampler2D _Water_smallwaves; uniform float4 _Water_smallwaves_ST;
            uniform float _Gloss;
            uniform float _Opacityblend;
            uniform sampler2D _Water_bigwaves; uniform float4 _Water_bigwaves_ST;
            uniform float _specular;
            uniform sampler2D _Water_bigwaves_Normal; uniform float4 _Water_bigwaves_Normal_ST;
            uniform sampler2D _Foammiddle; uniform float4 _Foammiddle_ST;
            uniform float _Opacity;
            uniform float4 _Diffcolor;
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
                float4 node_2744 = _Time + _TimeEditor;
                float2 node_7248 = (i.uv0+node_2744.g*float2(0,0.01));
                float3 _Water_bigwaves_Normal_var = UnpackNormal(tex2D(_Water_bigwaves_Normal,TRANSFORM_TEX(node_7248, _Water_bigwaves_Normal)));
                float2 node_5009 = ((i.uv0*2.0)+node_2744.g*float2(0,0.02));
                float3 _Water_smallwaves_Normal_var = UnpackNormal(tex2D(_Water_smallwaves_Normal,TRANSFORM_TEX(node_5009, _Water_smallwaves_Normal)));
                float3 node_1135_nrm_base = _Water_bigwaves_Normal_var.rgb + float3(0,0,1);
                float3 node_1135_nrm_detail = _Water_smallwaves_Normal_var.rgb * float3(-1,-1,1);
                float3 node_1135_nrm_combined = node_1135_nrm_base*dot(node_1135_nrm_base, node_1135_nrm_detail)/node_1135_nrm_base.z - node_1135_nrm_detail;
                float3 node_1135 = node_1135_nrm_combined;
                float3 node_6796 = (node_1135*_Refractionintensity);
                float3 normalLocal = node_6796;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float sceneZ = max(0,LinearEyeDepth (UNITY_SAMPLE_DEPTH(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.projPos)))) - _ProjectionParams.g);
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5 + node_6796.rg;
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float gloss = _Gloss;
                float specPow = exp2( gloss * 10.0 + 1.0 );
////// Specular:
                float NdotL = saturate(dot( normalDirection, lightDirection ));
                float3 specularColor = float3(_specular,_specular,_specular);
                float3 directSpecular = attenColor * pow(max(0,dot(reflect(-lightDirection, normalDirection),viewDirection)),specPow)*specularColor;
                float3 specular = directSpecular;
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float4 _Water_bigwaves_var = tex2D(_Water_bigwaves,TRANSFORM_TEX(node_7248, _Water_bigwaves));
                float4 _Water_smallwaves_var = tex2D(_Water_smallwaves,TRANSFORM_TEX(node_5009, _Water_smallwaves));
                float3 diffuseColor = (_Diffcolor.rgb+saturate(max(_Water_bigwaves_var.rgb,_Water_smallwaves_var.rgb)));
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse * (_Opacity*saturate((sceneZ-partZ)/_Opacityblend)) + specular;
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
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
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
