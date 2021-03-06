package org.olamy.puzzle.translate.services;

/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

import org.olamy.puzzle.translate.mapping.MappingException;
import org.olamy.puzzle.translate.mapping.TranslationDao;
import org.olamy.puzzle.translate.model.Translation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import java.util.List;
import java.util.Set;

@Service("translationService#default")
@Path( "TranslationService" )
public class DefaultTranslationService
    implements TranslationService
{

    private Logger log = LoggerFactory.getLogger( getClass() );

    @Inject
    private TranslationDao translationDao;

    @Context
    protected HttpServletRequest httpServletRequest;

    @Context
    protected ServletContext servletContext;

    @POST
    @Path( "/translate" )
    @Produces( { MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON } )
    @Consumes( { MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON } )
    public Translation translate( Translation translationRequest )
        throws TranslationException
    {

        log.info( "translation {}", translationRequest );
        Set paths = servletContext.getResourcePaths( "/" );
        // TODO some caching here
        try
        {
            return translationDao.translate( translationRequest );
        }
        catch ( MappingException e )
        {
            log.error( e.getMessage(), e );
            throw new TranslationException( e.getMessage(), e );
        }
    }

    @POST
    @Path( "/reccordTranslation" )
    @Consumes( { MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON } )
    public void reccordTranslation( Translation translation )
        throws TranslationException
    {
        try
        {
            translationDao.reccordTranslation( translation );
        }
        catch ( MappingException e )
        {
            log.error( e.getMessage(), e );
            throw new TranslationException( e.getMessage(), e );
        }
    }

    @GET
    @Path( "/getTranslations" )
    @Produces( { MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON } )
    public List<Translation> getTranslations()
        throws TranslationException
    {
        try
        {
            return translationDao.getTranslations();
        }
        catch ( MappingException e )
        {
            log.error( e.getMessage(), e );
            throw new TranslationException( e.getMessage(), e );
        }
    }

    @GET
    @Path( "/getTranslation" )
    @Produces( { MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON } )
    public Translation getTranslation( @QueryParam( "id" ) String id )
        throws TranslationException
    {
        try
        {
            return translationDao.getTranslation( id );
        }
        catch ( MappingException e )
        {
            log.error( e.getMessage(), e );
            throw new TranslationException( e.getMessage(), e );
        }
    }

    @DELETE
    @Path( "/deleteTranslation" )
    public void deleteTranslation( @QueryParam( "id" ) String id )
        throws TranslationException
    {
        try
        {
            translationDao.deleteTranslation( id );
        }
        catch ( MappingException e )
        {
            log.error( e.getMessage(), e );
            throw new TranslationException( e.getMessage(), e );
        }
    }
}
