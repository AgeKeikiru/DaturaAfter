varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4 v4_col; //top color
uniform vec4 v4_col2; //bottom color
uniform bool gradient;
uniform vec2 v2_bounds;
uniform float boundMod;

void main(){
    float alpha = texture2D( gm_BaseTexture, v_vTexcoord).a;
	
	gl_FragColor = v4_col;
	
	if(gradient){
        float height = (v2_bounds.y + -v2_bounds.x) * boundMod;
        float mixValue = min((v_vTexcoord.y + -v2_bounds.x) / height,1.0);
        vec4 mixColor = mix(v4_col,v4_col2,mixValue);
        
        gl_FragColor = mixColor;
	}
	
    gl_FragColor.a = min(alpha,gl_FragColor.a);
}