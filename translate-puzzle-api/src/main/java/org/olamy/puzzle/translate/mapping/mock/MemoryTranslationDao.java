package org.olamy.puzzle.translate.mapping.mock;

import org.olamy.puzzle.translate.mapping.MappingException;
import org.olamy.puzzle.translate.mapping.TranslationDao;
import org.olamy.puzzle.translate.model.Translation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MemoryTranslationDao
    implements TranslationDao
{

    private Map<String, Translation> translations = new HashMap<String, Translation>();

    private Logger log = LoggerFactory.getLogger( getClass() );

    @PostConstruct
    public void init()
    {
        Translation t = new Translation( "cake", "en", "gateau", "fr" );
        translations.put( t.getId(), t );
        t = new Translation( "beef", "en", "boeuf", "fr" );
        translations.put( t.getId(), t );
        t = new Translation( "cheese", "en", "fromage", "fr" );
        translations.put( t.getId(), t );
    }

    public Translation translate( Translation translationRequest )
        throws MappingException
    {
        log.info( "translation {}", translationRequest );
        //translationRequest.setTargetText( "translated " + translationRequest.getSourceText() );
        return translations.get( translationRequest.getId() );
        //return translationRequest;
    }

    public void reccordTranslation( Translation translation )
        throws MappingException
    {
        log.info( "reccordTranslation " + translation.toString() );
        translations.put( translation.getId(), translation );
    }

    @Override
    public List<Translation> getTranslations()
        throws MappingException
    {
        return new ArrayList<Translation>( translations.values() );
    }

    @Override
    public Translation getTranslation( String id )
        throws MappingException
    {
        return translations.get( id );
    }

    @Override
    public void deleteTranslation( String id )
        throws MappingException
    {
        translations.remove( id );
    }
}
