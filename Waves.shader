Shader "Custom/Waves" {
	//This is a Unity simple shader that offsets vertices of a 3D model in the y direction according to a composed wave function.
	//Version: 1.0
	//Date: 12/08/2021
    Properties {
        _MainTex ("Texture", 2D) = "white" {}
		_Amplitude("Amplitude", float) = 1
		_Alpha("Alpha", float) = 1
		_Frequency("Frequency", float) = 1
		_Amplitude2("Amplitude 2", float) = 1
		_Alpha2("Alpha 2", float) = 1
		_Frequency2("Frequency 2",float) = 1
    }
    SubShader {
        Tags { "RenderType"="Opaque" }
        LOD 100
        Pass {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
			struct data {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
				float4 normal : NORMAL;
				float4 tangent : TANGENT;
				float4 color : COLOR;
			};
            sampler2D _MainTex;
            float4 _MainTex_ST;
			float _Amplitude, _Alpha, _Frequency, _Amplitude2,_Alpha2, _Frequency2;
            data vert (data v) {
                data o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
				float wave = _Amplitude*pow(2.71828182845, -_Alpha*length(v.uv-0.5))*sin(length(v.uv-0.5)*_Frequency-_Time.y);
				wave += _Amplitude2*pow(2.71828182845, -_Alpha2*length(v.uv-0.5))*sin(length(v.uv-0.5)*_Frequency2-_Time.y);
				o.vertex.y += wave;
				o.color.xyz = (1-wave)*0.3;
                return o;
            }
            float4 frag(data i) : SV_Target {
                float4 col = (tex2D(_MainTex,i.uv)+i.color)/2;
                return col;
            }
            ENDCG
        }
    }
}
