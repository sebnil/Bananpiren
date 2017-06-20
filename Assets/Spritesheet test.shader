// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.35 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.35;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:4013,x:33496,y:32706,varname:node_4013,prsc:2|diff-7745-RGB,normal-7585-OUT,alpha-4228-OUT,refract-5793-OUT;n:type:ShaderForge.SFN_Relay,id:2345,x:30517,y:32771,cmnt:NumRows,varname:node_2345,prsc:2|IN-3609-X;n:type:ShaderForge.SFN_Vector4Property,id:3609,x:29890,y:32780,ptovrint:False,ptlb:SeqSettings,ptin:_SeqSettings,cmnt:X Cols Y Rows Z Speed,varname:_SeqSettings,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:2,v2:2,v3:4,v4:0;n:type:ShaderForge.SFN_Relay,id:485,x:30232,y:33108,cmnt:Speed,varname:node_485,prsc:2|IN-3609-Z;n:type:ShaderForge.SFN_Multiply,id:112,x:30418,y:33324,varname:node_112,prsc:2|A-485-OUT,B-3505-T;n:type:ShaderForge.SFN_Time,id:3505,x:29906,y:33224,varname:node_3505,prsc:2;n:type:ShaderForge.SFN_Frac,id:797,x:30664,y:33324,varname:node_797,prsc:2|IN-112-OUT;n:type:ShaderForge.SFN_Relay,id:7456,x:30232,y:32937,cmnt:NumCols,varname:node_7456,prsc:2|IN-3609-Y;n:type:ShaderForge.SFN_Multiply,id:2977,x:30802,y:33196,cmnt:Total Number frames,varname:node_2977,prsc:2|A-2345-OUT,B-7456-OUT;n:type:ShaderForge.SFN_Multiply,id:8766,x:30961,y:33332,cmnt:CurrentFrame,varname:node_8766,prsc:2|A-2977-OUT,B-797-OUT;n:type:ShaderForge.SFN_Round,id:8698,x:31143,y:33332,cmnt:CurrentIndex,varname:node_8698,prsc:2|IN-8766-OUT;n:type:ShaderForge.SFN_Divide,id:6003,x:31480,y:32813,cmnt:UOffset,varname:node_6003,prsc:2|A-716-OUT,B-2345-OUT;n:type:ShaderForge.SFN_Fmod,id:716,x:31480,y:32991,cmnt:CurrentCol,varname:node_716,prsc:2|A-8698-OUT,B-2345-OUT;n:type:ShaderForge.SFN_Divide,id:9994,x:31480,y:33139,cmnt:VOffset,varname:node_9994,prsc:2|A-3002-OUT,B-7456-OUT;n:type:ShaderForge.SFN_Floor,id:3002,x:31615,y:33306,cmnt:Current Row,varname:node_3002,prsc:2|IN-4461-OUT;n:type:ShaderForge.SFN_Divide,id:4461,x:31444,y:33306,varname:node_4461,prsc:2|A-8698-OUT,B-2345-OUT;n:type:ShaderForge.SFN_OneMinus,id:3896,x:31665,y:33139,cmnt:TopToBottom,varname:node_3896,prsc:2|IN-9994-OUT;n:type:ShaderForge.SFN_Append,id:2836,x:31802,y:32976,varname:node_2836,prsc:2|A-6003-OUT,B-3896-OUT;n:type:ShaderForge.SFN_Append,id:1409,x:31677,y:32686,varname:node_1409,prsc:2|A-2345-OUT,B-7456-OUT;n:type:ShaderForge.SFN_Add,id:9636,x:31994,y:32976,varname:node_9636,prsc:2|A-5470-OUT,B-2836-OUT;n:type:ShaderForge.SFN_Divide,id:5470,x:31994,y:32824,varname:node_5470,prsc:2|A-7275-UVOUT,B-1409-OUT;n:type:ShaderForge.SFN_TexCoord,id:7275,x:31994,y:32655,varname:node_7275,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Tex2d,id:8247,x:31994,y:33204,ptovrint:False,ptlb:Normal rain,ptin:_Normalrain,cmnt:Spritesheet blend texture,varname:_Normalrain,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:a27bcab9e92d1a94da4d84485cd3e278,ntxv:3,isnm:True|UVIN-9636-OUT;n:type:ShaderForge.SFN_Tex2d,id:2087,x:32255,y:32889,ptovrint:False,ptlb:Normal watter,ptin:_Normalwatter,cmnt:Base Texture,varname:_Normalwatter,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:5376858128ca00346a92dc002fee2ec5,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Color,id:7745,x:33323,y:32659,ptovrint:False,ptlb:Basecolor,ptin:_Basecolor,varname:_node_7745,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_SwitchProperty,id:7585,x:32701,y:33069,ptovrint:False,ptlb:Rain Switch,ptin:_RainSwitch,varname:_node_7585,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:True|A-2087-RGB,B-905-OUT;n:type:ShaderForge.SFN_NormalBlend,id:905,x:32432,y:33107,varname:node_905,prsc:2|BSE-2087-RGB,DTL-8247-RGB;n:type:ShaderForge.SFN_ComponentMask,id:5793,x:33090,y:33158,varname:node_5793,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-5988-OUT;n:type:ShaderForge.SFN_Vector1,id:4228,x:33300,y:32967,varname:node_4228,prsc:2,v1:0;n:type:ShaderForge.SFN_Multiply,id:5988,x:32894,y:33158,varname:node_5988,prsc:2|A-7585-OUT,B-553-OUT;n:type:ShaderForge.SFN_Slider,id:553,x:32564,y:33257,ptovrint:False,ptlb:Refraction,ptin:_Refraction,varname:_Refraction,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.4517806,max:1;proporder:3609-8247-2087-7745-7585-553;pass:END;sub:END;*/

Shader "Shader Forge/Spritesheet test" {
    Properties {
        _SeqSettings ("SeqSettings", Vector) = (2,2,4,0)
        _Normalrain ("Normal rain", 2D) = "bump" {}
        _Normalwatter ("Normal watter", 2D) = "bump" {}
        _Basecolor ("Basecolor", Color) = (0.5,0.5,0.5,1)
        [MaterialToggle] _RainSwitch ("Rain Switch", Float ) = 0
        _Refraction ("Refraction", Range(0, 1)) = 0.4517806
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
            uniform float4 _LightColor0;
            uniform sampler2D _GrabTexture;
            uniform float4 _TimeEditor;
            uniform float4 _SeqSettings;
            uniform sampler2D _Normalrain; uniform float4 _Normalrain_ST;
            uniform sampler2D _Normalwatter; uniform float4 _Normalwatter_ST;
            uniform float4 _Basecolor;
            uniform fixed _RainSwitch;
            uniform float _Refraction;
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
                UNITY_FOG_COORDS(6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
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
                i.normalDir = normalize(i.normalDir);
                i.screenPos = float4( i.screenPos.xy / i.screenPos.w, 0, 0 );
                i.screenPos.y *= _ProjectionParams.x;
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _Normalwatter_var = UnpackNormal(tex2D(_Normalwatter,TRANSFORM_TEX(i.uv0, _Normalwatter))); // Base Texture
                float node_2345 = _SeqSettings.r; // NumRows
                float node_7456 = _SeqSettings.g; // NumCols
                float4 node_3505 = _Time + _TimeEditor;
                float node_8698 = round(((node_2345*node_7456)*frac((_SeqSettings.b*node_3505.g)))); // CurrentIndex
                float2 node_9636 = ((i.uv0/float2(node_2345,node_7456))+float2((fmod(node_8698,node_2345)/node_2345),(1.0 - (floor((node_8698/node_2345))/node_7456))));
                float3 _Normalrain_var = UnpackNormal(tex2D(_Normalrain,TRANSFORM_TEX(node_9636, _Normalrain))); // Spritesheet blend texture
                float3 node_905_nrm_base = _Normalwatter_var.rgb + float3(0,0,1);
                float3 node_905_nrm_detail = _Normalrain_var.rgb * float3(-1,-1,1);
                float3 node_905_nrm_combined = node_905_nrm_base*dot(node_905_nrm_base, node_905_nrm_detail)/node_905_nrm_base.z - node_905_nrm_detail;
                float3 node_905 = node_905_nrm_combined;
                float3 _RainSwitch_var = lerp( _Normalwatter_var.rgb, node_905, _RainSwitch );
                float3 normalLocal = _RainSwitch_var;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5 + (_RainSwitch_var*_Refraction).rg;
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
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
                float3 diffuseColor = _Basecolor.rgb;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(lerp(sceneColor.rgb, finalColor,0.0),1);
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
            uniform float4 _TimeEditor;
            uniform float4 _SeqSettings;
            uniform sampler2D _Normalrain; uniform float4 _Normalrain_ST;
            uniform sampler2D _Normalwatter; uniform float4 _Normalwatter_ST;
            uniform float4 _Basecolor;
            uniform fixed _RainSwitch;
            uniform float _Refraction;
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
                LIGHTING_COORDS(6,7)
                UNITY_FOG_COORDS(8)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos(v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
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
                float3 _Normalwatter_var = UnpackNormal(tex2D(_Normalwatter,TRANSFORM_TEX(i.uv0, _Normalwatter))); // Base Texture
                float node_2345 = _SeqSettings.r; // NumRows
                float node_7456 = _SeqSettings.g; // NumCols
                float4 node_3505 = _Time + _TimeEditor;
                float node_8698 = round(((node_2345*node_7456)*frac((_SeqSettings.b*node_3505.g)))); // CurrentIndex
                float2 node_9636 = ((i.uv0/float2(node_2345,node_7456))+float2((fmod(node_8698,node_2345)/node_2345),(1.0 - (floor((node_8698/node_2345))/node_7456))));
                float3 _Normalrain_var = UnpackNormal(tex2D(_Normalrain,TRANSFORM_TEX(node_9636, _Normalrain))); // Spritesheet blend texture
                float3 node_905_nrm_base = _Normalwatter_var.rgb + float3(0,0,1);
                float3 node_905_nrm_detail = _Normalrain_var.rgb * float3(-1,-1,1);
                float3 node_905_nrm_combined = node_905_nrm_base*dot(node_905_nrm_base, node_905_nrm_detail)/node_905_nrm_base.z - node_905_nrm_detail;
                float3 node_905 = node_905_nrm_combined;
                float3 _RainSwitch_var = lerp( _Normalwatter_var.rgb, node_905, _RainSwitch );
                float3 normalLocal = _RainSwitch_var;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5 + (_RainSwitch_var*_Refraction).rg;
                float4 sceneColor = tex2D(_GrabTexture, sceneUVs);
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 diffuseColor = _Basecolor.rgb;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor * 0.0,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
