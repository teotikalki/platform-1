/**
 * Copyright (C) 2012 eXo Platform SAS.
 *
 * This is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation; either version 2.1 of
 * the License, or (at your option) any later version.
 *
 * This software is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this software; if not, write to the Free
 * Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
 * 02110-1301 USA, or see the FSF site: http://www.fsf.org.
 */

package org.exoplatform.platform.portlet.juzu.invitations;

import org.exoplatform.web.application.RequestContext;
import juzu.Path;
import juzu.View;
import juzu.template.Template;

import javax.inject.Inject;
import java.util.Locale;
import java.util.ResourceBundle;

/**
 * @author <a href="hzekri@exoplatform.com">hzekri</a>
 * @date 10/12/12
 */

public class Invitations {

    @Inject
    @Path("invitations.gtmpl")
    Template index;



    @View
    public void index() {
        Locale locale = RequestContext.getCurrentInstance().getLocale();
        ResourceBundle rs = ResourceBundle.getBundle("invitations/invitations", locale);
        String invitationsLabel = rs.getString("invitations.label");
        index.with().set("invitationsLabel",invitationsLabel).render();
    }
}