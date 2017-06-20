// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.35 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.35;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0,fgcg:0,fgcb:0,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:True,fnfb:True;n:type:ShaderForge.SFN_Final,id:4795,x:32716,y:32678,varname:node_4795,prsc:2|emission-2393-OUT,alpha-7835-OUT,refract-2581-OUT;n:type:ShaderForge.SFN_Multiply,id:2393,x:32356,y:32747,varname:node_2393,prsc:2|A-1059-RGB,B-2053-RGB,C-4155-RGB;n:type:ShaderForge.SFN_VertexColor,id:2053,x:31738,y:32804,varname:node_2053,prsc:2;n:type:ShaderForge.SFN_Color,id:4155,x:31738,y:32981,ptovrint:False,ptlb:node_4155,ptin:_node_4155,varname:node_4155,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9852941,c2:0.9852941,c3:0.9852941,c4:0.5;n:type:ShaderForge.SFN_Tex2d,id:1059,x:31766,y:32632,ptovrint:False,ptlb:node_1059,ptin:_node_1059,varname:node_1059,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:dbe9da42a10ea18429442c899ceaab63,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:2276,x:32245,y:32385,ptovrint:False,ptlb:Normal,ptin:_Normal,varname:node_2276,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:a0088363bc3f0ca489420f61fd50ecd5,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Multiply,id:7835,x:32465,y:32917,varname:node_7835,prsc:2|A-2053-A,B-1059-A;n:type:ShaderForge.SFN_Multiply,id:8060,x:32527,y:32381,varname:node_8060,prsc:2|A-2276-RGB,B-5946-OUT;n:type:ShaderForge.SFN_Slider,id:5946,x:32199,y:32586,ptovrint:False,ptlb:Refraction limit,ptin:_Refractionlimit,varname:node_5946,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_ComponentMask,id:2581,x:32658,y:32366,varname:node_2581,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-8060-OUT;proporder:4155-1059-2276-5946;pass:END;sub:END;*/

Shader "Shader Forge/Particle distort" {
    Properties {
        _node_4155 ("node_4155", Color) = (0.9852941,0.9852941,0.9852941,0.5)
        _node_1059 ("node_1059", 2D) = "white" {}
        _Normal ("Normal", 2D) = "bump" {}
        _Refractionlimit ("Refraction limit", Range(0, 1)) = 0
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
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _GrabTexture;
            uniform float4 _node_4155;
            uniform sampler2D _node_1059; uniform float4 _node_1059_ST;
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            uniform float _Refractionlimit;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 screenPos : TEXCOORD1;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos(v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.screenPos = o.pos;
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                #if UNITY_UV_STARTS_AT_TOP
                    float grabSign = -_ProjectionParams.x;
                #else
                    float grabSign = _ProjectionParams.x;
                #endif
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float3 _Normal_var = UnpackNormal(tex2D(_Normal,TRANSFORM_TEX(i.uv0, _Normal)));
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5 + (_Normal_var.rgb*_Refractionlimit).rg;
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
////// Lighting:
////// Emissive:
                float4 _node_1059_var = tex2D(_node_1059,TRANSFORM_TEX(i.uv0, _node_1059));
                float3 emissive = (_node_1059_var.rgb*i.vertexColor.rgb*_node_4155.rgb);
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(lerp(sceneColor.rgb, finalColor,(i.vertexColor.a*_node_1059_var.a)),1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    CustomEditor "ShaderForgeMaterialInspector"
}
