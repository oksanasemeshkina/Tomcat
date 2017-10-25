echo "digraph {" > architecture.dot ; grep -R "^import" * | sed -E "s/\//./g" | \
sed -E "s/\.java//g" | sed -E "s/\.\*//g" | sed -E "s/import //g" | \
grep -v ":java" | grep -v ":javax" | sed -E "s/;//g" | sed -E "s/:/ -> /" | \
grep -v "\.properties" | sed -E "s/\./_/g" | sed -E "s/_[A-Z].* ->/ ->/g" | \
sed -E "s/-> ([a-z_]*)_[A-Z][a-zA-Z]*/-> \1/g" | sed -E "s/org_apache_//g" | \
grep -v "juli_logging" | \
grep -v "tomcat_util" | \
grep -v "catalina_util" | \
grep -v "coyote_http11_filters_SavedRequestInputFilter" | \
grep -v "coyote_http11_filters_BufferedInputFilter" | \
grep -v "coyote_http11_filters_ChunkedInputFilter" | \
grep -v "coyote_http11_filters_ChunkedOutputFilter" | \
grep -v "coyote_http11_filters_GzipOutputFilter" | \
grep -v "coyote_http11_filters" | \
grep -v "coyote_memory" | \
grep -v "coyote_http11_filters_IdentityOutputFilter" | \
grep -v "coyote_http11_filters_VoidInputFilter" | \
grep -v "coyote_http11_filters_VoidOutputFilter" | \
grep -v "coyote_http11_filters_IdentityOutputFilter" | \
grep -v "coyote_http11_filters_VoidInputFilter" | \
grep -v "coyote_http11_filters_VoidOutputFilter" | \
grep -v "coyote_http11_filters_IdentityInputFilter" | \
grep -v "coyote_memory" | \
grep -v "jk_apr" | \
grep -v "coyote_http11_OutputFilter" | \
grep -v "coyote_http11_Constants" | \
grep -v "coyote_http11_InputFilter" | \
grep -v "tools_ant_taskdefs_condition" | \
grep -v "org_w3c_dom_Element" | \
grep -v "org_eclipse_jdt_internal_compiler" | \
grep -v "org_eclipse_jdt_core_compiler" | \
grep -v "jasper_compiler_Text" | \
grep -v "jasper_compiler_Root" | \
grep -v "jasper_compiler_NamedAttribute" | \
grep -v "jasper_compiler_Function" | \
grep -v "jasper_compiler" | \
grep -v "catalina_ha_util" | \
grep -v "catalina_tribes_group_interceptors15Interceptor" | \
grep -v "catalina_tribes_tipis_MapOwner" | \
grep -v "static" | \
grep -v "catalina_tribes_FaultyMember" | \
grep -v "el" | \
grep -v "el_lang" | \
grep -v "el_parser" | \
grep -v "el_util" | \
grep -v "jasper_el" | \
grep -v "org_xml_sax_ext2" | \
grep -v "org_w3c_dom_NodeList" | \
grep -v "org_w3c_dom_NamedNodeMap" | \
grep -v "org_w3c_dom_Text" | \
grep -v "org_w3c_dom_Comment" | \
grep -v "org_w3c_dom_Node" | \
grep -v "tools_ant_taskdefs" | \
grep -v "tools_ant_types" | \
grep -v "catalina_ant" | \
grep -v "catalina_ant_jmx" | \
grep -v "jk_config" | \
grep -v "tomcat_buildutil" | \
grep -v "org_w3c_dom_Document" | \
grep -v "org_w3c_dom_ls_DOMImplementationLS" | \
grep -v "org_xml_sax" | \
grep -v "naming" | \
grep -v "catalina_authenticator" | \
grep -v "catalina_filters" | \
grep -v "juli" | \
grep -v "catalina_security" | \
grep -v "catalina_deploy" | \
grep -v "org_apache" | \
grep -v "catalina_ha_authenticator" | \
grep -v "jk_server" | \
grep -v "jk_common" | \
grep -v "jk_core" | \
grep -v "catalina_users" | \
grep -v "catalina_manager_util" | \
grep -v "catalina_ssi" | \
grep -v "catalina_mbeans" | \
grep -v "catalina_loader" | \
grep -v "catalina_ha" | \
grep -v "catalina_session_" | \
grep -v "catalina_tribes_" | \
grep -v "catalina_session" | \
grep -v "coyote_ajp" | \
grep -v "tools_ant" | \
grep -v "jasper_" | \
grep -v "catalina_manager_host" | \
sort | uniq >> architecture.dot ; \

# clustering
echo "subgraph cluster_1 { label="Catalina";" >> architecture.dot; 
sed -E "s/([a-z_0-9]+)/\1\n/g" architecture.dot | \
grep ".*catalina.*" | \
sed -E "s/ -> (.+)/\1/g" | uniq >> architecture.dot;
echo "}" >> architecture.dot; \

# Description
echo 'catalina_realm[label="catalina_realm\nRealm database implementation"]' >> architecture.dot; \
echo 'tomcat_jni[label="tomcat_jni\nPlatformspecific implementation"]' >> architecture.dot; \

# Description + highlighting
echo 'catalina_servlets[color=Blue, label="catalina_servlets\nDefault servlet for static resources such as HTML pages and images"]' >> architecture.dot; \
echo 'coyote_http11[color=Blue, label="coyote_http11\nProcesses HTTP requests"]' >> architecture.dot; \
echo 'coyote[color=Blue, label="coyote\nThe Coyote HTTP/1.1 Connector element represents a Connector component that supports the HTTP/1.1 protocol.\nIt enables Catalina to function as a stand-alone web server,\nin addition to its ability to execute servlets and JSP pages."]' >> architecture.dot; \
echo 'catalina_startup[color=Blue, label="catalina_startup\nstart/stop shellcommands\nstartupclassloader for catalina\nstarts the regular execution of the container\nReads configuration\nListens for a new context(webapplication)\nUserDatabase"]' >> architecture.dot; \
echo 'catalina_core[color=Blue, label="catalina_core\nMany standard implementations (StandardServer, StandardPipeline, Standardhost\nStandardEngine, StandardContext...)"]' >> architecture.dot; \
echo 'catalina[color=Blue, label="catalina\nThe entire Servlet container"]' >> architecture.dot; \
echo 'catalina_connector[color=Blue, label="catalina_connector\nImplementation of a Coyote connector.\nHandles connections with the client.\nLives inside a service. Alone or with multiple other connectors.\nOther Coyote implementations(Request, Resp., Writer, Adapter...)"]' >> architecture.dot; \
echo 'catalina_manager[color=Blue, label="catalina_manager\nServlets that enables remote management of the web applications"]' >> architecture.dot; \
echo 'tomcat_util_net[color=Blue, label="tomcat_util_net\nEntrypoint for http calls\nContinue with coyote_http11"]' >> architecture.dot; \
echo 'catalina_valves[color=Blue, label="catalina_valves\nMany Valve implemantations\nA Valve is a request processing component associated with a particular Container.\nA series of Valves are generally associated with each other into a Pipeline.\nThe Valve name was assigned to this concept because a valve is what you\nuse in a real world pipeline to control and/or modify flows through it."]' >> architecture.dot; \
echo 'jasper[color=Blue, label="jasper\nJava Server Pages implementation"]' >> architecture.dot; \
echo "}" >> architecture.dot ; \
dot -Tpng architecture.dot > architecture.png;