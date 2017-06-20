// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.35 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.35;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:4013,x:32719,y:32712,varname:node_4013,prsc:2|diff-1788-OUT,emission-6581-OUT,alpha-7498-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:32375,y:32406,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.8235294,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_DepthBlend,id:8357,x:32286,y:32599,varname:node_8357,prsc:2|DIST-7429-OUT;n:type:ShaderForge.SFN_Multiply,id:1788,x:32579,y:32562,varname:node_1788,prsc:2|A-1304-RGB,B-8357-OUT;n:type:ShaderForge.SFN_Slider,id:7429,x:31963,y:32636,ptovrint:False,ptlb:node_7429,ptin:_node_7429,varname:node_7429,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:4.700855,max:10;n:type:ShaderForge.SFN_Color,id:1016,x:32330,y:32750,ptovrint:False,ptlb:node_1016,ptin:_node_1016,varname:node_1016,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.2456449,c2:0.2054498,c3:0.7352941,c4:1;n:type:ShaderForge.SFN_Multiply,id:6581,x:32529,y:32776,varname:node_6581,prsc:2|A-1016-RGB,B-3062-OUT;n:type:ShaderForge.SFN_DepthBlend,id:7469,x:32194,y:32923,varname:node_7469,prsc:2|DIST-1925-OUT;n:type:ShaderForge.SFN_Slider,id:1925,x:31864,y:32896,ptovrint:False,ptlb:node_7429_copy,ptin:_node_7429_copy,varname:_node_7429_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:2.142595,max:10;n:type:ShaderForge.SFN_Multiply,id:3062,x:32371,y:32917,varname:node_3062,prsc:2|A-1693-RGB,B-7469-OUT;n:type:ShaderForge.SFN_Color,id:1693,x:32506,y:32956,ptovrint:False,ptlb:node_1016_copy,ptin:_node_1016_copy,varname:_node_1016_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:1,c3:0.3379312,c4:1;n:type:ShaderForge.SFN_Slider,id:3971,x:31963,y:33168,ptovrint:False,ptlb:node_7429_copy_copy,ptin:_node_7429_copy_copy,varname:_node_7429_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:5.042736,max:10;n:type:ShaderForge.SFN_DepthBlend,id:7498,x:32491,y:33209,varname:node_7498,prsc:2|DIST-3971-OUT;n:type:ShaderForge.SFN_DepthBlend,id:3456,x:32357,y:33101,varname:node_3456,prsc:2|DIST-2775-OUT;n:type:ShaderForge.SFN_Slider,id:2775,x:31884,y:33063,ptovrint:False,ptlb:node_7429_copy_copy_copy,ptin:_node_7429_copy_copy_copy,varname:_node_7429_copy_copy_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:2.051283,max:10;proporder:1304-7429-1016-1925-1693-3971-2775;pass:END;sub:END;*/

Shader "Shader Forge/Depth blend test" {
    Properties {
        _Color ("Color", Color) = (0.8235294,0,0,1)
        _node_7429 ("node_7429", Range(0, 10)) = 4.700855
        _node_1016 ("node_1016", Color) = (0.2456449,0.2054498,0.7352941,1)
        _node_7429_copy ("node_7429_copy", Range(0, 10)) = 2.142595
        _node_1016_copy ("node_1016_copy", Color) = (0,1,0.3379312,1)
        _node_7429_copy_copy ("node_7429_copy_copy", Range(0, 10)) = 5.042736
        _node_7429_copy_copy_copy ("node_7429_copy_copy_copy", Range(0, 10)) = 2.051283
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
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
            uniform float4 _LightColor0;
            uniform sampler2D _CameraDepthTexture;
            uniform float4 _Color;
            uniform float _node_7429;
            uniform float4 _node_1016;
            uniform float _node_7429_copy;
            uniform float4 _node_1016_copy;
            uniform float _node_7429_copy_copy;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                float4 projPos : TEXCOORD2;
                UNITY_FOG_COORDS(3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float sceneZ = max(0,LinearEyeDepth (UNITY_SAMPLE_DEPTH(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.projPos)))) - _ProjectionParams.g);
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = 1;
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float3 diffuseColor = (_Color.rgb*saturate((sceneZ-partZ)/_node_7429));
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float3 emissive = (_node_1016.rgb*(_node_1016_copy.rgb*saturate((sceneZ-partZ)/_node_7429_copy)));
/// Final Color:
                float3 finalColor = diffuse + emissive;
                fixed4 finalRGBA = fixed4(finalColor,saturate((sceneZ-partZ)/_node_7429_copy_copy));
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
            uniform sampler2D _CameraDepthTexture;
            uniform float4 _Color;
            uniform float _node_7429;
            uniform float4 _node_1016;
            uniform float _node_7429_copy;
            uniform float4 _node_1016_copy;
            uniform float _node_7429_copy_copy;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                float4 projPos : TEXCOORD2;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float sceneZ = max(0,LinearEyeDepth (UNITY_SAMPLE_DEPTH(tex2Dproj(_CameraDepthTexture, UNITY_PROJ_COORD(i.projPos)))) - _ProjectionParams.g);
                float partZ = max(0,i.projPos.z - _ProjectionParams.g);
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 diffuseColor = (_Color.rgb*saturate((sceneZ-partZ)/_node_7429));
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor * saturate((sceneZ-partZ)/_node_7429_copy_copy),0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
