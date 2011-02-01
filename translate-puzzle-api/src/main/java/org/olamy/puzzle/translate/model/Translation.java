package org.olamy.puzzle.translate.model;

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

import java.io.Serializable;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * @author Olivier Lamy
 */
@XmlRootElement(name = "TranslationRequest")
public class Translation
    implements Serializable
{
    private String sourceText;

    /**
     * iso or ietf code : en, pt, pt-br
     */
    private String sourceLanguage;

    private String targetLanguage;
    
    private String targetText;

    public Translation()
    {
        // noop
    }

    public Translation( String sourceText, String sourceLanguage, String targetLanguage )
    {
        this.sourceText = sourceText;
        this.sourceLanguage = sourceLanguage;
        this.targetLanguage = targetLanguage;
    }

    public String getSourceText()
    {
        return sourceText;
    }

    public void setSourceText( String sourceText )
    {
        this.sourceText = sourceText;
    }

    public String getSourceLanguage()
    {
        return sourceLanguage;
    }

    public void setSourceLanguage( String sourceLanguage )
    {
        this.sourceLanguage = sourceLanguage;
    }

    public String getTargetLanguage()
    {
        return targetLanguage;
    }

    public void setTargetLanguage( String targetLanguage )
    {
        this.targetLanguage = targetLanguage;
    }

    public String getTargetText()
    {
        return targetText;
    }

    public void setTargetText( String targetText )
    {
        this.targetText = targetText;
    }
}
