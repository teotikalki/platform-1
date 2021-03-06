package org.exoplatform.platform.portlet.juzu.suggestions;

import juzu.Path;
import juzu.Response;
import juzu.View;
import juzu.impl.common.Tools;
import juzu.template.Template;

import javax.inject.Inject;

/**
 * @author <a href="rtouzi@exoplatform.com">rtouzi</a>
 */
public class SuggestionsPeopleSpace {
    @Inject
    @Path("list.gtmpl")
    Template list;

    @View
    public Response.Content index() {
        return list.ok().withCharset(Tools.UTF_8);
    }
}
