

#ifndef LUAMDECLARE_NOT_INCLUDE_DEPS
#define error luaerror
#include "dependencies/LuaCEmbedOne.c"
#undef error
#include "dependencies/MDeclareApiOne.c"
#endif

LuaCEmbedResponse  *luamdeclare_transform_dir(LuaCEmbed *args) {
  
    LuaCEmbedTable *entries = LuaCEmbed_get_arg_table(args, 0);
    if(LuaCEmbed_has_errors(args)) {
        char *error_msg = LuaCEmbed_get_error_message(args);
        return LuaCEmbed_send_error(error_msg);
    }
    char *dir = LuaCembedTable_get_string_prop(entries, "dir");

    if(LuaCEmbed_has_errors(args)) {
        char *error_msg = LuaCEmbed_get_error_message(args);
        return LuaCEmbed_send_error(error_msg);
    }
    bool include_paths = true;
    
    if(LuaCEmbedTable_get_type_prop(entries, "include_paths") != LUA_CEMBED_NOT_FOUND) {
        include_paths = LuaCembedTable_get_bool_prop(entries, "include_paths");
    }

    if(LuaCEmbed_has_errors(args)) {
        char *error_msg = LuaCEmbed_get_error_message(args);
        return LuaCEmbed_send_error(error_msg);
    }
    const char *starts_with = NULL;
    if(LuaCEmbedTable_get_type_prop(entries, "starts_with") != LUA_CEMBED_NOT_FOUND) {
        starts_with = LuaCembedTable_get_string_prop(entries, "starts_with");
    }

    if(LuaCEmbed_has_errors(args)) {
        char *error_msg = LuaCEmbed_get_error_message(args);
        return LuaCEmbed_send_error(error_msg);
    }
    const char *ends_with = NULL;
    if(LuaCEmbedTable_get_type_prop(entries, "ends_with") != LUA_CEMBED_NOT_FOUND) {
        ends_with = LuaCembedTable_get_string_prop(entries, "ends_with");
    }

    if(LuaCEmbed_has_errors(args)) {
        char *error_msg = LuaCEmbed_get_error_message(args);
        return LuaCEmbed_send_error(error_msg);
    }
    char *result = mdeclare_transform_dir(dir,include_paths, starts_with, ends_with);
    LuaCEmbedResponse *response = LuaCEmbed_send_str(result);
    free(result);
    return response;
}

LuaCEmbedResponse *luamdeclare_transform_file(LuaCEmbed  *args){
    char *entrie = LuaCEmbed_get_str_arg(args, 0);
    if(LuaCEmbed_has_errors(args)) {
        char *error_msg = LuaCEmbed_get_error_message(args);
        return LuaCEmbed_send_error(error_msg);
    }
   char *result = mdeclare_transform_content(entrie);
   LuaCEmbedResponse *response = LuaCEmbed_send_str(result);
   free(result);
   return response;
}

int luaopen_luamdeclare(lua_State *state) {
    LuaCEmbed *l = newLuaCEmbedLib(state);
    LuaCEmbed_add_callback(l, "transform_dir", luamdeclare_transform_dir);
    LuaCEmbed_add_callback(l, "transform_file", luamdeclare_transform_file);
    return LuaCembed_perform(l);
}
