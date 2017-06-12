// Shader created with Shader Forge v1.35 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.35;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:3,spmd:1,trmd:1,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:False,rprd:True,enco:False,rmgx:True,imps:False,rpth:0,vtps:1,hqsc:True,nrmq:1,nrsp:0,vomd:1,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:6,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:1,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:True,fnfb:True;n:type:ShaderForge.SFN_Final,id:2865,x:32358,y:33004,varname:node_2865,prsc:2|diff-1648-OUT,spec-641-OUT,gloss-1198-OUT,normal-3380-OUT,emission-4354-RGB,alpha-1198-OUT,refract-2225-OUT;n:type:ShaderForge.SFN_Color,id:4354,x:30741,y:33011,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_4354,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Tex2d,id:4618,x:30741,y:32795,ptovrint:False,ptlb:Raindrops,ptin:_Raindrops,varname:node_4618,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:821fe276784f26046a5523a0b2e313fa,ntxv:0,isnm:False;n:type:ShaderForge.SFN_ValueProperty,id:1080,x:30741,y:33216,ptovrint:False,ptlb:BumpOffset,ptin:_BumpOffset,varname:node_1080,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.003;n:type:ShaderForge.SFN_Vector1,id:9683,x:30741,y:33323,varname:node_9683,prsc:2,v1:0;n:type:ShaderForge.SFN_Multiply,id:1648,x:31424,y:32690,varname:node_1648,prsc:2|A-4618-RGB,B-4354-RGB;n:type:ShaderForge.SFN_TexCoord,id:1140,x:31028,y:32909,varname:node_1140,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Append,id:7106,x:31028,y:33053,varname:node_7106,prsc:2|A-1080-OUT,B-9683-OUT;n:type:ShaderForge.SFN_TexCoord,id:3069,x:31028,y:33201,varname:node_3069,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Append,id:7056,x:31028,y:33354,varname:node_7056,prsc:2|A-9683-OUT,B-1080-OUT;n:type:ShaderForge.SFN_Add,id:2533,x:31264,y:33264,varname:node_2533,prsc:2|A-3069-UVOUT,B-7056-OUT;n:type:ShaderForge.SFN_Vector1,id:2975,x:31799,y:33305,varname:node_2975,prsc:2,v1:1;n:type:ShaderForge.SFN_Add,id:9161,x:31264,y:33098,varname:node_9161,prsc:2|A-1140-UVOUT,B-7106-OUT;n:type:ShaderForge.SFN_Tex2d,id:3103,x:31504,y:33063,ptovrint:False,ptlb:Rain_NormHoriz,ptin:_Rain_NormHoriz,varname:node_3103,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:4b97bc9992aed804e808871f881cc7f6,ntxv:0,isnm:False|UVIN-9161-OUT;n:type:ShaderForge.SFN_Tex2d,id:4400,x:31493,y:32867,ptovrint:False,ptlb:Bump2Norm,ptin:_Bump2Norm,varname:_Rain_NormHoriz_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:4b97bc9992aed804e808871f881cc7f6,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:8383,x:31504,y:33264,ptovrint:False,ptlb:Rain_Normvertikal,ptin:_Rain_Normvertikal,varname:_Bump2Norm_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:4b97bc9992aed804e808871f881cc7f6,ntxv:0,isnm:False|UVIN-2533-OUT;n:type:ShaderForge.SFN_Subtract,id:9720,x:31799,y:33037,varname:node_9720,prsc:2|A-4400-R,B-3103-R;n:type:ShaderForge.SFN_Subtract,id:7800,x:31799,y:33182,varname:node_7800,prsc:2|A-4400-R,B-8383-R;n:type:ShaderForge.SFN_Multiply,id:1198,x:32074,y:32863,varname:node_1198,prsc:2|A-4400-R,B-5177-OUT;n:type:ShaderForge.SFN_ValueProperty,id:641,x:32010,y:33342,ptovrint:False,ptlb:Metalness,ptin:_Metalness,varname:node_641,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Append,id:3380,x:32076,y:33152,varname:node_3380,prsc:2|A-9720-OUT,B-7800-OUT,C-2975-OUT;n:type:ShaderForge.SFN_ValueProperty,id:5177,x:31915,y:32984,ptovrint:False,ptlb:RoughnessBoost,ptin:_RoughnessBoost,varname:node_5177,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_Vector2,id:2225,x:32028,y:33491,varname:node_2225,prsc:2,v1:0.1,v2:0.1;proporder:4354-4618-641-1080-3103-4400-8383-5177;pass:END;sub:END;*/

Shader "Shader Forge/Rain test post" {
    Properties {
        _Color ("Color", Color) = (0.5,0.5,0.5,1)
        _Raindrops ("Raindrops", 2D) = "white" {}
        _Metalness ("Metalness", Float ) = 0
        _BumpOffset ("BumpOffset", Float ) = 0.003
        _Rain_NormHoriz ("Rain_NormHoriz", 2D) = "white" {}
        _Bump2Norm ("Bump2Norm", 2D) = "white" {}
        _Rain_Normvertikal ("Rain_Normvertikal", 2D) = "white" {}
        _RoughnessBoost ("RoughnessBoost", Float ) = 0.5
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent+1"
            "RenderType"="Transparent"
        }
        LOD 3
        GrabPass{ }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            Cull Off
            ZTest Always
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _GrabTexture;
            uniform float4 _Color;
            uniform sampler2D _Raindrops; uniform float4 _Raindrops_ST;
            uniform float _BumpOffset;
            uniform sampler2D _Rain_NormHoriz; uniform float4 _Rain_NormHoriz_ST;
            uniform sampler2D _Bump2Norm; uniform float4 _Bump2Norm_ST;
            uniform sampler2D _Rain_Normvertikal; uniform float4 _Rain_Normvertikal_ST;
            uniform float _Metalness;
            uniform float _RoughnessBoost;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
                float3 normalDir : TEXCOORD4;
                float3 tangentDir : TEXCOORD5;
                float3 bitangentDir : TEXCOORD6;
                float4 screenPos : TEXCOORD7;
                #if defined(LIGHTMAP_ON) || defined(UNITY_SHOULD_SAMPLE_SH)
                    float4 ambientOrLightmapUV : TEXCOORD8;
                #endif
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                #ifdef LIGHTMAP_ON
                    o.ambientOrLightmapUV.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
                    o.ambientOrLightmapUV.zw = 0;
                #elif UNITY_SHOULD_SAMPLE_SH
                #endif
                #ifdef DYNAMICLIGHTMAP_ON
                    o.ambientOrLightmapUV.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
                #endif
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = v.vertex;
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
                float4 _Bump2Norm_var = tex2D(_Bump2Norm,TRANSFORM_TEX(i.uv0, _Bump2Norm));
                float node_9683 = 0.0;
                float2 node_9161 = (i.uv0+float2(_BumpOffset,node_9683));
                float4 _Rain_NormHoriz_var = tex2D(_Rain_NormHoriz,TRANSFORM_TEX(node_9161, _Rain_NormHoriz));
                float2 node_2533 = (i.uv0+float2(node_9683,_BumpOffset));
                float4 _Rain_Normvertikal_var = tex2D(_Rain_Normvertikal,TRANSFORM_TEX(node_2533, _Rain_Normvertikal));
                float3 normalLocal = float3((_Bump2Norm_var.r-_Rain_NormHoriz_var.r),(_Bump2Norm_var.r-_Rain_Normvertikal_var.r),1.0);
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5 + float2(0.1,0.1);
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
                float node_1198 = (_Bump2Norm_var.r*_RoughnessBoost);
                float gloss = node_1198;
                float perceptualRoughness = 1.0 - node_1198;
                float roughness = perceptualRoughness * perceptualRoughness;
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
                #if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
                    d.ambient = 0;
                    d.lightmapUV = i.ambientOrLightmapUV;
                #else
                    d.ambient = i.ambientOrLightmapUV;
                #endif
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
                float LdotH = saturate(dot(lightDirection, halfDirection));
                float3 specularColor = _Metalness;
                float specularMonochrome;
                float4 _Raindrops_var = tex2D(_Raindrops,TRANSFORM_TEX(i.uv0, _Raindrops));
                float3 diffuseColor = (_Raindrops_var.rgb*_Color.rgb); // Need this for specular when using metallic
                diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, specularColor, specularColor, specularMonochrome );
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
                half surfaceReduction;
                #ifdef UNITY_COLORSPACE_GAMMA
                    surfaceReduction = 1.0-0.28*roughness*perceptualRoughness;
                #else
                    surfaceReduction = 1.0/(roughness*roughness + 1.0);
                #endif
                specularPBL *= any(specularColor) ? 1.0 : 0.0;
                float3 directSpecular = attenColor*specularPBL*FresnelTerm(specularColor, LdotH);
                half grazingTerm = saturate( gloss + specularMonochrome );
                float3 indirectSpecular = (gi.indirect.specular);
                indirectSpecular *= FresnelLerp (specularColor, grazingTerm, NdotV);
                indirectSpecular *= surfaceReduction;
                float3 specular = (directSpecular + indirectSpecular);
/////// Diffuse:
                NdotL = max(0.0,dot( normalDirection, lightDirection ));
                half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
                float nlPow5 = Pow5(1-NdotL);
                float nvPow5 = Pow5(1-NdotV);
                float3 directDiffuse = ((1 +(fd90 - 1)*nlPow5) * (1 + (fd90 - 1)*nvPow5) * NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += gi.indirect.diffuse;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
////// Emissive:
                float3 emissive = _Color.rgb;
/// Final Color:
                float3 finalColor = diffuse * node_1198 + specular + emissive;
                return fixed4(lerp(sceneColor.rgb, finalColor,node_1198),1);
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
            ZTest Always
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdadd
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _GrabTexture;
            uniform float4 _Color;
            uniform sampler2D _Raindrops; uniform float4 _Raindrops_ST;
            uniform float _BumpOffset;
            uniform sampler2D _Rain_NormHoriz; uniform float4 _Rain_NormHoriz_ST;
            uniform sampler2D _Bump2Norm; uniform float4 _Bump2Norm_ST;
            uniform sampler2D _Rain_Normvertikal; uniform float4 _Rain_Normvertikal_ST;
            uniform float _Metalness;
            uniform float _RoughnessBoost;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
                float3 normalDir : TEXCOORD4;
                float3 tangentDir : TEXCOORD5;
                float3 bitangentDir : TEXCOORD6;
                float4 screenPos : TEXCOORD7;
                LIGHTING_COORDS(8,9)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = v.vertex;
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
                float4 _Bump2Norm_var = tex2D(_Bump2Norm,TRANSFORM_TEX(i.uv0, _Bump2Norm));
                float node_9683 = 0.0;
                float2 node_9161 = (i.uv0+float2(_BumpOffset,node_9683));
                float4 _Rain_NormHoriz_var = tex2D(_Rain_NormHoriz,TRANSFORM_TEX(node_9161, _Rain_NormHoriz));
                float2 node_2533 = (i.uv0+float2(node_9683,_BumpOffset));
                float4 _Rain_Normvertikal_var = tex2D(_Rain_Normvertikal,TRANSFORM_TEX(node_2533, _Rain_Normvertikal));
                float3 normalLocal = float3((_Bump2Norm_var.r-_Rain_NormHoriz_var.r),(_Bump2Norm_var.r-_Rain_Normvertikal_var.r),1.0);
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float2 sceneUVs = float2(1,grabSign)*i.screenPos.xy*0.5+0.5 + float2(0.1,0.1);
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
                float node_1198 = (_Bump2Norm_var.r*_RoughnessBoost);
                float gloss = node_1198;
                float perceptualRoughness = 1.0 - node_1198;
                float roughness = perceptualRoughness * perceptualRoughness;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = saturate(dot( normalDirection, lightDirection ));
                float LdotH = saturate(dot(lightDirection, halfDirection));
                float3 specularColor = _Metalness;
                float specularMonochrome;
                float4 _Raindrops_var = tex2D(_Raindrops,TRANSFORM_TEX(i.uv0, _Raindrops));
                float3 diffuseColor = (_Raindrops_var.rgb*_Color.rgb); // Need this for specular when using metallic
                diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, specularColor, specularColor, specularMonochrome );
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
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse * node_1198 + specular;
                return fixed4(finalColor,0);
            }
            ENDCG
        }
    }
    CustomEditor "ShaderForgeMaterialInspector"
}
