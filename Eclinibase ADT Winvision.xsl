
   <!-- 
	No. Date       User     Description / commentaires (Optionnel)
	+++ ++++++++++ ++++++++ +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
	1   2018-09-26 lajrob   
-->
   <xsl:stylesheet xmlns:exsl="http://exslt.org/common"
                   xmlns:fn="http://www.w3.org/2005/xpath-functions"
                   xmlns:xs="http://www.w3.org/2001/XMLSchema"
                   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                   exclude-result-prefixes="#all"
                   extension-element-prefixes="exsl"
                   version="3.0">
      <!-- options, format de sortie -->
      <xsl:strip-space elements="*"/>
      <xsl:output encoding="UTF-8"
                  indent="yes"
                  method="xml"
                  omit-xml-declaration="yes"
                  version="1.0"/>
      
      <!-- Inclusion des Templates  -->
      <xsl:include href="util-Templates.xsl"/>
      <!-- déclaration des paramètres -->
      <xsl:param name="varParam1"/>
      <xsl:param name="varParam2"/>
      <xsl:param name="varParam3"/>
      <xsl:param name="varParam4"/>
      <xsl:param name="varParam5"/>
      <xsl:param name="varParam6"/>
      <xsl:param name="varParam7"/>
      <xsl:param name="varParam8"/>
      <xsl:param name="varParam9"/>
      
      <!-- votre code ici -->
      <!-- this is the identity transform: it copies everything that isn't matched by a more specific template -->
      <!-- recopie de tous les élements (node=balise, @=attribut) -->
      
      <xsl:template name="MSH">
         <xsl:element name="MSH">
         </xsl:element>
      </xsl:template> 
      
      <xsl:template name="MSH.1">
         <xsl:element name="MSH.1.1">
            <xsl:value-of select="/HL7/MSH/MSH.1.1"/>
         </xsl:element>
      </xsl:template>
      
      <!-- Encoding Characters-->
      <xsl:template name="MSH.2">
         <xsl:element name="MSH.2.1">
            <xsl:value-of select="/HL7/MSH/MSH.2.1"/>
         </xsl:element>
      </xsl:template>
      
      <!-- Sending Application-->
      <xsl:template name="MSH.3">
         <xsl:element name="MSH.3.1">
            <xsl:value-of select="/HL7/MSH/MSH.3.1"/>
         </xsl:element>
      </xsl:template>
      
      <xsl:variable name="sendingApplicationName" select="/HL7/PV1/PV1.2.1" />
      
      <xsl:template name="MSH.7">
         <xsl:element name="MSH.7.1">
            <xsl:value-of select="/HL7/MSH/MSH.7.1"/>
         </xsl:element>
      </xsl:template> 
      
      <xsl:variable name="messageType" select="/HL7/MSH/MSH.9.2" />
      <xsl:variable name="eventCode" select="/HL7/EVN/EVN.4.1" />
      
      <xsl:template name="MSH.9">
         
         <xsl:element name="MSH.9.1">
            <xsl:value-of select="/HL7/MSH/MSH.9.1"/>
         </xsl:element>
         
         <xsl:element name="MSH.9.2">  
            <xsl:choose>
               <xsl:when test="$messageType = 'A48'  and $eventCode = '215'">  
                     <xsl:value-of select="'A28'"/>
                </xsl:when>
               
               <xsl:when test="$messageType = 'A48' and $eventCode = '119'">  
                  <xsl:value-of select="'A46'"/>
               </xsl:when>   
       
               <xsl:when test="$messageType = 'A23'">  
                     <xsl:value-of select="'A11'"/>
               </xsl:when>   
               
                <xsl:otherwise>
                     <xsl:value-of select="$messageType"/>
                </xsl:otherwise>
               
            </xsl:choose>
         </xsl:element>
         
      </xsl:template>      
      
      <xsl:template name="MSH.10">
         <xsl:element name="MSH.10.1">
            <xsl:value-of select="/HL7/MSH/MSH.10.1"/>
         </xsl:element>
      </xsl:template>
      
      <xsl:template name="MSH.11">
         <xsl:element name="MSH.11.1">
            <xsl:value-of select="/HL7/MSH/MSH.11.1"/>
         </xsl:element>
      </xsl:template>      
      
      <xsl:template name="MSH.12">
         <xsl:element name="MSH.12.1">
            <xsl:value-of select="'2.4'"/>
         </xsl:element>
      </xsl:template> 
      
      <xsl:template name="EVN">   
           <xsl:element name="EVN">     
           <xsl:element name="EVN.1.1">    
              <xsl:choose>
                 <xsl:when test="$messageType = 'A48' and $eventCode = '215'">  
                    <xsl:value-of select="'A28'"/>
                 </xsl:when>
                 
                 <xsl:when test="$messageType = 'A48' and $eventCode = '119'">  
                    <xsl:value-of select="'A46'"/>
                 </xsl:when>                 
                 
                 <xsl:when test="$messageType = 'A23'">  
                    <xsl:value-of select="'A11'"/>
                 </xsl:when>   
                 
                 <xsl:otherwise>
                    <xsl:value-of select="$messageType"/>
                 </xsl:otherwise>
              </xsl:choose>
           </xsl:element>
         
         
              <!-- Sending Application-->
              <!--     <xsl:if test="($sendingApplicationName = 'I')">    
                 <xsl:element name="EVN.2.1"> 
                    <xsl:value-of select="/HL7/EVN/EVN.2.1"/>  
                 </xsl:element>
                 
                 <xsl:element name="EVN.6.1"> 
                    <xsl:value-of select="/HL7/EVN/EVN.6.1"/>  
                 </xsl:element>  
         </xsl:if> -->
         
         
         <xsl:if test="($sendingApplicationName = 'I') or $messageType = 'A48'">    
                   <xsl:element name="EVN.2.1"> 
                      <xsl:value-of select="concat(format-number(/HL7/EVN/EVN.2.1,'000000000000'),'01')"/>  
                   </xsl:element>
         
                  <xsl:element name="EVN.6.1"> 
                     <xsl:value-of select="concat(format-number(/HL7/EVN/EVN.6.1,'000000000000'),'01')"/>  
                  </xsl:element>  
         </xsl:if> 
                
         <xsl:if test="($sendingApplicationName = 'E')">   
                   <xsl:element name="EVN.2.1"> 
                      <xsl:value-of select="concat(/HL7/EVN/EVN.2.1,'00')"/>
                   </xsl:element>
            
                   <xsl:element name="EVN.6.1"> 
                      <xsl:value-of select="concat(/HL7/EVN/EVN.2.1,'00')"/>
                   </xsl:element>  
         </xsl:if>
              
              <xsl:element name="EVN.7.1">
              </xsl:element>   
         
        </xsl:element> 
      </xsl:template>      
     
      <xsl:template name="PID">
         <xsl:element name="PID">
            
            <xsl:element name="PID.1.1">
               <xsl:value-of select="number(/HL7/PID/PID.1.1)"/>
            </xsl:element>
            
            <xsl:variable name="patientId">
               <xsl:if test="($sendingApplicationName = 'I')"> 
                  <xsl:value-of select="/HL7/ZI1/ZI1.2.1" />
               </xsl:if> 
               
               <xsl:if test="($sendingApplicationName = 'E' and $messageType = 'A08') or ($sendingApplicationName = 'E' and $messageType = 'A04')"> 
                  <xsl:value-of select="/HL7/ZI1/ZI1.2.1" />
               </xsl:if>       
            </xsl:variable>
            
            <xsl:element name="PID.2.1">
               <xsl:value-of select="$patientId"/>
            </xsl:element>     
            
            <xsl:if test="($sendingApplicationName = 'E')"> 
               <xsl:element name="PID.2.4">  
                  <xsl:value-of select="'RAMQ'"/>
               </xsl:element>
            </xsl:if>  
            
            <xsl:if test="($patientId != '')"> 
            <xsl:element name="PID.2.5">
                  <xsl:value-of select="'NAM'"/>
            </xsl:element>  
               
            <xsl:if test="($sendingApplicationName = 'E')"> 
            <xsl:element name="PID.2.6">  
                  <xsl:value-of select="'CANQC'"/>
            </xsl:element>      
            </xsl:if>         
            
            <xsl:element name="PID.2.8">
             <xsl:if test="($sendingApplicationName = 'I')"> 
               <xsl:value-of select="concat(/HL7/ZI1/ZI1.5.1,'28')"/>
             </xsl:if>
               
             <xsl:if test="($sendingApplicationName = 'E')"> 
                <xsl:variable name="checkDigitSchema" select="/HL7/ZI1/ZI1.5.1"/>
                  <xsl:variable name="month" select="substring($checkDigitSchema,5,6)"/>
                
                  <xsl:variable name="monthsWith30Days" select="'04 06 09 11'"/>
                  <xsl:variable name="monthsWith31Days" select="'01 03 05 07 08 10 12'"/>
                  <xsl:variable name="monthsWith28Days" select="'02'"/>
                
                <xsl:if test=" contains(concat(' ',$monthsWith30Days, ' '), concat(' ', $month, ' '))">
                   <xsl:value-of select="concat($checkDigitSchema,'30')"/>
                </xsl:if>
                
                <xsl:if test=" contains(concat(' ',$monthsWith31Days, ' '), concat(' ', $month, ' '))">
                   <xsl:value-of select="concat($checkDigitSchema,'31')"/>
                </xsl:if> 
                
                <xsl:if test=" contains(concat(' ',$monthsWith28Days, ' '), concat(' ', $month, ' '))">
                   <xsl:value-of select="concat($checkDigitSchema,'28')"/>
                </xsl:if>       
            </xsl:if>
               
            </xsl:element>  
            </xsl:if>  
            
            <xsl:element name="PID.3.1">
               
               <xsl:variable name="dossierPatient">
               <xsl:if test="($sendingApplicationName = 'I' or $messageType = 'A48')"> 
                     <xsl:value-of select="/HL7/PID/PID.4.1[1]"/>  
               </xsl:if> 
               
               <xsl:if test="($sendingApplicationName = 'E')"> 
                  <xsl:value-of select="/HL7/PID/PID.4.1[1]"/>  
               </xsl:if>            
               </xsl:variable>
               
                     <xsl:variable name="lettreIdDossier" select="substring($dossierPatient,1,1)" />  
               
               <xsl:choose>
                  <xsl:when test="$lettreIdDossier = 'A'">  
                     <xsl:variable name="afterFirstLetter" select="substring-after($dossierPatient,$lettreIdDossier)" />  
                     <xsl:variable name="afterFirstLetterWithoutZeros" select="replace($afterFirstLetter,'^0+','' )"/>
                     <xsl:value-of select="concat($lettreIdDossier,$afterFirstLetterWithoutZeros)"/>
                  </xsl:when>
                  
                  <xsl:when test="$lettreIdDossier = 'B'">  
                     <xsl:variable name="afterFirstLetter" select="substring-after($dossierPatient,$lettreIdDossier)" />  
                     <xsl:variable name="afterFirstLetterWithoutZeros" select="replace($afterFirstLetter,'^0+','' )"/>
                     <xsl:value-of select="concat($lettreIdDossier,$afterFirstLetterWithoutZeros)"/>
                  </xsl:when>
                  
                  <xsl:when test="$lettreIdDossier = 'C'">  
                     <xsl:variable name="afterFirstLetter" select="substring-after($dossierPatient,$lettreIdDossier)" />  
                     <xsl:variable name="afterFirstLetterWithoutZeros" select="replace($afterFirstLetter,'^0+','' )"/>
                     <xsl:value-of select="concat($lettreIdDossier,$afterFirstLetterWithoutZeros)"/>
                  </xsl:when>
                  
                  <xsl:otherwise>
                     <xsl:value-of select="$dossierPatient"/>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:element>
            
            <xsl:element name="PID.3.3">
               <xsl:value-of select="'HMR'"/>
            </xsl:element>    
            
            <xsl:element name="PID.3.5">
               <xsl:value-of select="'MR'"/>
            </xsl:element> 
            
            <xsl:element name="PID.3.6">
               <xsl:value-of select="''"/>
            </xsl:element> 
            
            <!-- date ouverture du dossier -->
            <xsl:if test="(/HL7/ZI1/ZI1.21.1 != '') and $sendingApplicationName = 'I'"> 
                      <xsl:element name="PID.3.7">
                         <xsl:value-of select="/HL7/ZI1/ZI1.21.1"/>
                      </xsl:element>
            </xsl:if>  
            
            <xsl:if test="($sendingApplicationName = 'E')"> 
               <xsl:element name="PID.3.7">
                  <xsl:value-of select="''"/>
               </xsl:element> 
            </xsl:if>  
            
            <xsl:element name="PID.4.1">
               <xsl:value-of select="''"/>
            </xsl:element> 
            
            <xsl:element name="PID.5.1">
               <xsl:value-of select="/HL7/PID/PID.5.1"/>
            </xsl:element> 
            
            <xsl:element name="PID.5.2">
               <xsl:value-of select="/HL7/PID/PID.5.2"/>
            </xsl:element> 
            
            
            <xsl:variable name="areaCityCode" select="/HL7/PID/PID.14.6" /> 
            <xsl:for-each select="/HL7/NK1">
            <xsl:choose>
               <xsl:when test="substring(./NK1.1.1,4,4) = '4' or ./NK1.1.1='4'"> 
                   <xsl:element name="PID.6.1">
                      <xsl:value-of select="./NK1.2.1"/> 
                   </xsl:element>  
                   
                   <xsl:element name="PID.6.2">
                      <xsl:value-of select="./NK1.2.2"/> 
                   </xsl:element>   
                </xsl:when>
            </xsl:choose>
            </xsl:for-each>   
               
            <xsl:element name="PID.7.1">
               <xsl:value-of select="substring(/HL7/PID/PID.7.1,1,8)"/>
            </xsl:element> 
            
            <xsl:element name="PID.8.1">
               <xsl:value-of select="/HL7/PID/PID.8.1"/>
            </xsl:element> 
            
            <xsl:if test="(/HL7/PID/PID.9.1 != '')">
                      <xsl:element name="PID.9.1">
                         <xsl:value-of select="/HL7/PID/PID.9.1"/>
                      </xsl:element> 
            </xsl:if>  
            
            <xsl:if test="(/HL7/PID/PID.9.2 != '')">
                      <xsl:element name="PID.9.2">
                         <xsl:value-of select="/HL7/PID/PID.9.2"/>
                      </xsl:element> 
            </xsl:if>  
            
            
            <xsl:if test="(/HL7/PID/PID.11.1 != '')">
                         <xsl:element name="PID.11.1">
                            <xsl:value-of select="/HL7/PID/PID.11.1"/>
                         </xsl:element> 
                         
                         <xsl:element name="PID.11.2">
                            <xsl:value-of select="''"/>
                         </xsl:element> 
                         
                         <xsl:element name="PID.11.3">
                            <xsl:value-of select="/HL7/PID/PID.11.2"/>
                         </xsl:element> 
                         
                         <xsl:element name="PID.11.4">
                            <xsl:value-of select="/HL7/PID/PID.11.4"/>
                         </xsl:element> 
                         
                        <xsl:element name="PID.11.5">
                            <xsl:value-of select="/HL7/PID/PID.11.5"/>
                         </xsl:element> 
                         
                         <xsl:element name="PID.11.6">
                            <xsl:value-of select="''"/>
                         </xsl:element> 
                      
                         <xsl:element name="PID.11.7">
                            <xsl:value-of select="'H'"/>
                         </xsl:element>
                         
               <xsl:if test="/HL7/PID/PID.11.8 != ''">
                         <xsl:element name="PID.11.8">
                            <xsl:value-of select="/HL7/PID/PID.11.8"/>
                         </xsl:element>
               </xsl:if>
            </xsl:if>     
               
               
            <xsl:if test="($sendingApplicationName = 'I' or $messageType = 'A48')">
               
               <xsl:variable name="areaCityCodeFirst" select="/HL7/PID/PID.13.6" /> 
               <xsl:variable name="firstThreeDigits" select="substring(/HL7/PID/PID.13.7,1,3)" />
               <xsl:variable name="lastDigits" select="substring(/HL7/PID/PID.13.7,4)" /> 
               
               <xsl:if test="(/HL7/PID/PID.13.6 != '')">
                     <xsl:element name="PID.13.1">
                        <xsl:value-of select="concat('(',$areaCityCodeFirst,')',$firstThreeDigits,'-',$lastDigits)"/>
                     </xsl:element> 
                     
                     <xsl:element name="PID.13.2">
                        <xsl:value-of select="/HL7/PID/PID.13.2"/>
                     </xsl:element>
                     
                     <xsl:element name="PID.13.3">
                        <xsl:value-of select="'PH'"/>
                     </xsl:element>
               </xsl:if>
            </xsl:if>
            
            
            <xsl:if test="($sendingApplicationName = 'I' or $messageType = 'A48')">  
               
            <xsl:variable name="areaCityCodeFirstw" select="/HL7/PID/PID.14.6" /> 
            <xsl:variable name="firstThreeDigitsw" select="substring(/HL7/PID/PID.14.7,1,3)" />
            <xsl:variable name="lastDigitsw" select="substring(/HL7/PID/PID.14.7,4)" />
               
                        <xsl:if test="($areaCityCode != '')"> 
                             <xsl:element name="PID.14.1">
                                <xsl:value-of select="concat('(',$areaCityCodeFirstw,')',$firstThreeDigitsw,'-',$lastDigitsw)"/>
                             </xsl:element> 
                             
                             <xsl:element name="PID.14.2">
                                <xsl:value-of select="/HL7/PID/PID.14.2"/>
                             </xsl:element> 
                     
                             <xsl:element name="PID.14.3">
                                 <xsl:value-of select="'PH'"/>
                             </xsl:element>
                        </xsl:if>      
           </xsl:if> 
            
            <xsl:if test="($sendingApplicationName = 'E')">
               
               <!-- telephone number -->
               <!--  <xsl:variable name="areaCityCode" select="substring(/HL7/PID/PID.13.1,2,3)"/>  -->
               <!--    <xsl:variable name="telephoneNumber" select="substring(/HL7/PID/PID.13.1,5,7)"/> -->
               
               <xsl:element name="PID.13.1">
                  <!--   <xsl:value-of select="concat('(',$areaCityCode,')',$telephoneNumber)"/>-->
                  <xsl:value-of select="/HL7/PID/PID.13.1"/>
               </xsl:element>
               
               <xsl:element name="PID.13.2">
                  <xsl:value-of select="'PRN'"/>
               </xsl:element>
               
               <xsl:element name="PID.13.3">
                  <xsl:value-of select="'PH'"/>
               </xsl:element>   
            </xsl:if> 
            
            <xsl:if test="(/HL7/PID/PID.15.1 != '')"> 
                      <xsl:element name="PID.15.1">
                         <xsl:value-of select="/HL7/PID/PID.15.1"/>
                      </xsl:element> 
            </xsl:if> 
            
            <xsl:if test="(/HL7/PID/PID.15.2 != '')"> 
                      <xsl:element name="PID.15.2">
                         <xsl:value-of select="/HL7/PID/PID.15.2"/>
                      </xsl:element>          
            </xsl:if>
            
             <xsl:choose>
                <xsl:when test="/HL7/PID/PID.16.1 = '1'">
                      <xsl:element name="PID.16.1">  
                      <xsl:value-of select="'ZN'"/>
                      </xsl:element> 
                   
                      <xsl:element name="PID.16.2">  
                      <xsl:value-of select="'Nouveau-ne'"/>
                      </xsl:element> 
                </xsl:when> 
                
                <xsl:when test="/HL7/PID/PID.16.1 = '3'">
                      <xsl:element name="PID.16.1">  
                      <xsl:value-of select="'M'"/>
                      </xsl:element>          
                   
                      <xsl:element name="PID.16.2">  
                      <xsl:value-of select="'Marie'"/>
                      </xsl:element>                    
                </xsl:when> 
                
                <xsl:when test="/HL7/PID/PID.16.1 = '4'">
                      <xsl:element name="PID.16.1">  
                      <xsl:value-of select="'W'"/>
                      </xsl:element>                      
                   
                      <xsl:element name="PID.16.2">  
                      <xsl:value-of select="'Divorce'"/>
                      </xsl:element>                                       
                </xsl:when>
                
                <xsl:otherwise> 
                      <xsl:element name="PID.16.1">  
                      <xsl:value-of select="'S'"/>
                      </xsl:element>
                   
                      <xsl:element name="PID.16.2">  
                      <xsl:value-of select="'Celibataire'"/>
                      </xsl:element>                          
                </xsl:otherwise>
             </xsl:choose>
            
            <!-- Religion -->
            <xsl:element name="PID.17.1">
               <xsl:value-of select="''"/>
            </xsl:element> 
            
            <!-- Birth place -->
            <xsl:element name="PID.23.1">
               <xsl:variable name="birthPlace" select="/HL7/PID/PID.23.1" />  
                       
                        <xsl:if test="($birthPlace = 'Québec')">
                            <xsl:value-of select="'1'"/>
                        </xsl:if>
               
                         <xsl:if test="($birthPlace = 'Ontario')">
                            <xsl:value-of select="'2'"/>
                         </xsl:if>
               
                        <xsl:if test="($birthPlace = 'Nouveau-Brunswick')">
                           <xsl:value-of select="'3'"/>
                        </xsl:if>
               
                        <xsl:if test="($birthPlace = 'Autres provinces ou territoire')">
                           <xsl:value-of select="'4'"/>
                        </xsl:if>
               
                        <xsl:if test="($birthPlace = 'Etats-Unis')">
                           <xsl:value-of select="'5'"/>
                        </xsl:if>
               
                        <xsl:if test="($birthPlace = 'Angleterre')">
                           <xsl:value-of select="'6'"/>
                        </xsl:if>
               
                        <xsl:if test="($birthPlace = 'Ecosse')">
                           <xsl:value-of select="'7'"/>
                        </xsl:if>
               
                        <xsl:if test="($birthPlace = 'Pologne')">
                           <xsl:value-of select="'8'"/>
                        </xsl:if>
               
                        <xsl:if test="($birthPlace = 'Russie')">
                           <xsl:value-of select="'9'"/>
                        </xsl:if>
               
                        <xsl:if test="($birthPlace = 'Hongrie')">
                           <xsl:value-of select="'10'"/>
                        </xsl:if>
               
                        <xsl:if test="($birthPlace = 'Roumanie')">
                           <xsl:value-of select="'11'"/>
                        </xsl:if>
               
                        <xsl:if test="($birthPlace = 'Haiti')">
                           <xsl:value-of select="'15'"/>
                        </xsl:if>
               
                        <xsl:if test="($birthPlace = 'Italie')">
                           <xsl:value-of select="'12'"/>
                        </xsl:if>
               
                        <xsl:if test="($birthPlace = 'Grèce')">
                           <xsl:value-of select="'13'"/>
                        </xsl:if>
               
                        <xsl:if test="($birthPlace = 'Allemagne')">
                            <xsl:value-of select="'14'"/>
                        </xsl:if>
               
                        <xsl:if test="($birthPlace = 'Autres pays')">
                            <xsl:value-of select="'16'"/>
                        </xsl:if>
 
                        <xsl:if test="($birthPlace = 'Inconnu')">
                            <xsl:value-of select="'17'"/>
                        </xsl:if>
               
                        <xsl:if test="($birthPlace = 'Boznie-Herzégovine')">
                           <xsl:value-of select="'18'"/>
                       </xsl:if>
               
                      <xsl:if test="($birthPlace = 'Croatie')">
                         <xsl:value-of select="'20'"/>
                      </xsl:if>
               
                      <xsl:if test="($birthPlace = 'Rwanda')">
                         <xsl:value-of select="'21'"/>
                      </xsl:if>
               
                        <xsl:if test="($birthPlace = 'Burundi')">
                           <xsl:value-of select="'21'"/>
                        </xsl:if>
               
                        <xsl:if test="($birthPlace = 'Congo')">
                            <xsl:value-of select="'23'"/>
                        </xsl:if>
               
                        <xsl:if test="($birthPlace = 'Afghanistan')">
                           <xsl:value-of select="'24'"/>
                        </xsl:if>
               
                        <xsl:if test="($birthPlace = 'Éthiopie')">
                           <xsl:value-of select="'25'"/>
                        </xsl:if>
               
                       <xsl:if test="($birthPlace = 'Irak')">
                          <xsl:value-of select="'26'"/>
                       </xsl:if>
               
                        <xsl:if test="($birthPlace = 'Algérie')">
                           <xsl:value-of select="'27'"/>
                        </xsl:if>
               
                        <xsl:if test="($birthPlace = 'Tunisie')">
                           <xsl:value-of select="'28'"/>
                        </xsl:if>
               
                        <xsl:if test="($birthPlace = 'Maroc')">
                           <xsl:value-of select="'29'"/>
                        </xsl:if>
               
                        <xsl:if test="($birthPlace = 'Sénégal')">
                           <xsl:value-of select="'30'"/>
                        </xsl:if>
                       
                       <xsl:if test="($birthPlace = 'Iran')">
                          <xsl:value-of select="'31'"/>
                       </xsl:if>
               
                        <xsl:if test="($birthPlace = 'Albanie')">
                           <xsl:value-of select="'32'"/>
                        </xsl:if>
                        
                        <xsl:if test="($birthPlace = 'Chine')">
                           <xsl:value-of select="'33'"/>
                        </xsl:if>
               
                         <xsl:if test="($birthPlace = 'Viêt Nam')">
                           <xsl:value-of select="'34'"/>
                        </xsl:if>
               
                        <xsl:if test="($birthPlace = 'Philippines')">
                           <xsl:value-of select="'35'"/>
                        </xsl:if>
               
                        <xsl:if test="($birthPlace = 'Togo')">
                          <xsl:value-of select="'36'"/>
                        </xsl:if>
               
                        <xsl:if test="($birthPlace = 'Colombie')">
                           <xsl:value-of select="'37'"/>
                        </xsl:if>
               
                        <xsl:if test="($birthPlace = 'Salvador')">
                           <xsl:value-of select="'38'"/>
                        </xsl:if>
               
                        <xsl:if test="($birthPlace = 'Chili')">
                           <xsl:value-of select="'39'"/>
                        </xsl:if>
                        
                        <xsl:if test="($birthPlace = 'France')">
                           <xsl:value-of select="'44'"/>
                        </xsl:if> 
   
                        <xsl:if test="($birthPlace = 'Syrienne, République arabe')">
                           <xsl:value-of select="'46'"/>
                        </xsl:if> 
            </xsl:element> 
            
            <!-- Citizenship -->
            <xsl:element name="PID.26.1">
               <xsl:value-of select="''"/>
            </xsl:element> 
            
            <!-- Nationality -->
            <xsl:element name="PID.28.1">
               <xsl:value-of select="''"/>
            </xsl:element> 
            
            <xsl:if test="$messageType = 'A48' and $eventCode = '119' and /HL7/PID/PID.29.1!=''">
               <xsl:element name="PID.29.1">
                   <xsl:value-of select="/HL7/PID/PID.29.1"/>
               </xsl:element> 
            </xsl:if>
            
            <xsl:variable name="patientDeathIndicator" select="/HL7/PID/PID.30.1" />  
            
            <xsl:if test="($patientDeathIndicator = 'Y') and $sendingApplicationName = 'I'">
               <xsl:element name="PID.29.1">
                  <xsl:value-of select="/HL7/PID/PID.29.1"/>
               </xsl:element> 
            </xsl:if> 
            
             <xsl:element name="PID.30.1">
                  <xsl:value-of select="$patientDeathIndicator"/>
             </xsl:element> 
            
            <xsl:element name="PID.31.1">
                   <xsl:value-of select="''"/>
            </xsl:element> 
            </xsl:element>    
      </xsl:template>    
        
      <xsl:template name="NK1">    
         <xsl:for-each select="/HL7/NK1[./NK1.2.1!='' and ./NK1.3.1!='' and ./NK1.3.2!='' ]">
            
               <xsl:element name="NK1">
                  
                  <xsl:element name="NK1.1.1">
                     <xsl:value-of select="position()"/> 
                  </xsl:element>
                                    
                  <xsl:element name="NK1.2.1">
                     <xsl:value-of select="./NK1.2.1"/>
                  </xsl:element>  
                  
                  <xsl:element name="NK1.2.2">
                     <xsl:value-of select="./NK1.2.2"/>
                  </xsl:element> 
                  
                  <xsl:variable name="setID" select="./NK1.1.1" /> 
                  
                  <xsl:variable name="kinTelephoneNumber"> 
                  <xsl:if test="($sendingApplicationName = 'E') and ./NK1.5.1!=''">
                     <xsl:value-of select="translate(./NK1.5.1, translate(./NK1.5.1, '0123456789', ''), '')"/> 
                  </xsl:if> 
                  </xsl:variable>
                  
                  <xsl:variable name="familyIdFirst" select="./NK1.3.1" />
                  <xsl:variable name="familyIdSecond" select="./NK1.3.2" /> 
                  
                  <!-- family ties -->
                  
                     <xsl:choose>  
                        <xsl:when test="$familyIdFirst = 'PERE' and $familyIdSecond = 'PERE'">
                           <xsl:element name="NK1.3.1">
                              <xsl:value-of select="'FTH'"/> 
                           </xsl:element> 
                           
                           <xsl:if test="$kinTelephoneNumber != ''">
                                   <xsl:element name="NK1.5.1">
                                      <xsl:value-of select="$kinTelephoneNumber"/> 
                                   </xsl:element> 
                           </xsl:if> 
                           
                           <xsl:element name="NK1.4.1">
                              <xsl:value-of select="''"/> 
                           </xsl:element>
                        </xsl:when>
                        
                        <xsl:when test="$familyIdFirst = 'CONJ' and $familyIdSecond = 'CONJOINT'">
                                  <xsl:element name="NK1.3.1">
                                     <xsl:value-of select="'SPO'"/> 
                                  </xsl:element>
                           
                           <xsl:if test="$kinTelephoneNumber != ''">   
                                    <xsl:element name="NK1.5.1">
                                       <xsl:value-of select="$kinTelephoneNumber"/> 
                                    </xsl:element>
                           </xsl:if> 
                           
                           <xsl:element name="NK1.4.1">
                              <xsl:value-of select="''"/> 
                           </xsl:element>
                        </xsl:when>
                        
                        <xsl:when test="$familyIdFirst = 'SOEUR' or $familyIdSecond = 'SOEUR'">
                                      <xsl:element name="NK1.3.1">
                                         <xsl:value-of select="''"/> 
                                      </xsl:element>
                        
                           <xsl:if test="$kinTelephoneNumber != ''">   
                                      <xsl:element name="NK1.5.1">
                                         <xsl:value-of select="$kinTelephoneNumber"/> 
                                      </xsl:element>
                           </xsl:if>
                        </xsl:when>
                        
                        <xsl:when test="$familyIdFirst = 'MERE' and $familyIdSecond ='MERE'"> 
                           <xsl:element name="NK1.3.1">
                              <xsl:value-of select="'MTH'"/> 
                           </xsl:element>
                       
                           <xsl:if test="$kinTelephoneNumber != ''">   
                                       <xsl:element name="NK1.5.1">
                                            <xsl:value-of select="$kinTelephoneNumber"/> 
                                       </xsl:element>
                           </xsl:if>
                           
                           <xsl:element name="NK1.4.1">
                              <xsl:value-of select="''"/> 
                           </xsl:element>
                        </xsl:when>
                        
                        <xsl:otherwise> 
                           <!-- family ties -->
                           <xsl:element name="NK1.3.1">
                                  <xsl:value-of select="''"/>
                           </xsl:element>
                           
                           <xsl:if test="$kinTelephoneNumber != ''">   
                              <xsl:element name="NK1.5.1">
                                 <xsl:value-of select="$kinTelephoneNumber"/> 
                              </xsl:element>
                           </xsl:if>  
                           
                           <xsl:if test="($sendingApplicationName = 'MedUrge')">
                           <xsl:element name="NK1.4.1">
                              <xsl:value-of select="./NK1.4.1"/> 
                           </xsl:element>
                              
                           <xsl:element name="NK1.4.2">
                              <xsl:value-of select="./NK1.4.3"/> 
                           </xsl:element>
                              
                           <xsl:element name="NK1.4.3">
                              <xsl:value-of select="./NK1.4.5"/> 
                           </xsl:element>
      
                           <xsl:element name="NK1.5.1">
                                 <xsl:value-of select="./NK1.5.1"/> 
                           </xsl:element>   
                           </xsl:if>
                        </xsl:otherwise> 
                     </xsl:choose>
                  </xsl:element> 
             
          </xsl:for-each>      
      </xsl:template>
         
      <xsl:template match="@* | node()">
         <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
         </xsl:copy>
      </xsl:template>
   </xsl:stylesheet>

