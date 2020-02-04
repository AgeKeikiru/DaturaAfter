varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 texel;
uniform vec4 uvs;
uniform float region;

vec2 rand(vec2 seed)
{
    return vec2(mod(seed.x*263.0 + seed.y*399.0, 100.0)/100.0,mod(seed.x*133.0 + seed.y*271.0, 100.0)/100.0);
}

void main()
{
    vec2 dim = vec2((uvs[2]-uvs[0])/(texel.x*region),(uvs[3]-uvs[1])/(texel.y*region));
    vec2 current_region =    vec2(
                                floor((v_vTexcoord.x-uvs[0])/(texel.x*region)),
                                floor((v_vTexcoord.y-uvs[1])/(texel.y*region))
                            );
                        
    vec2 offset = rand(current_region);
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, vec2(mod(v_vTexcoord.x + (offset.x-0.5),1.0),mod(v_vTexcoord.y + (offset.y-0.5),1.0)));
    gl_FragColor.a = texture2D( gm_BaseTexture, v_vTexcoord).a;
}

/* example draw event

shader_set(sh_glitch);

var uvs = sprite_get_uvs(sprite_index,image_index);
var tex = sprite_get_texture(sprite_index, image_index);
shader_set_uniform_f(suni_uvs, uvs[0],uvs[1],uvs[2],uvs[3]);
shader_set_uniform_f(suni_region, 10);
shader_set_uniform_f(suni_texel, texture_get_texel_width(tex),texture_get_texel_height(tex));

draw_self();

shader_reset();

*/

/* example create event

suni_region = shader_get_uniform(sh_glitch, "region");
suni_uvs = shader_get_uniform(sh_glitch, "uvs");
suni_texel = shader_get_uniform(sh_glitch, "texel");

*/