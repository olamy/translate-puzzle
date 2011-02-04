package org.olamy.puzzle.translate.mapping.mock;

import org.olamy.puzzle.translate.mapping.MappingException;
import org.olamy.puzzle.translate.mapping.TranslationDao;
import org.olamy.puzzle.translate.model.Translation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class MockTranslationDao
    implements TranslationDao
{

    private Logger log = LoggerFactory.getLogger( getClass() );
    
    public Translation translate( Translation translationRequest )
        throws MappingException
    {
       log.info( "translation {}", translationRequest );
       translationRequest.setTargetText( "translated " + translationRequest.getSourceText() );
       return translationRequest;
    }

    public void reccordTranslation( Translation translation )
        throws MappingException
    {
        log.info( "reccordTranslation " + translation.toString() );

    }

}
