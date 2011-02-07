package org.olamy.puzzle.translate.mapping.mock;

import java.util.HashMap;
import java.util.Map;

import org.olamy.puzzle.translate.mapping.MappingException;
import org.olamy.puzzle.translate.mapping.TranslationDao;
import org.olamy.puzzle.translate.model.Translation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class MemoryTranslationDao
    implements TranslationDao
{
    
    private Map<String,Translation> translations = new HashMap<String, Translation>();

    private Logger log = LoggerFactory.getLogger( getClass() );
    
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

}
