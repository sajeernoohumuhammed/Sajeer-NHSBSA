
Feature:As a person from Wales 
I need to know what help I can get with my NHS costs 
So that I can get the treatment I need 

@nhscostchecker
  Scenario Outline: NHS Eligibility checker with claiming benefits
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, getting any of the universal credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, take home pay less than <Pay> <PayLessThanOrEquals>
    Then Verify I will get a help or not

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit|UniversalCreditBenefits|Pay   |PayLessThanOrEquals|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"yes"          | "yes"                 |"935" |"yes"              |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"yes"          | "yes"                 |"935" |"yes"              |
      
 @nhscostchecker
  Scenario Outline: NHS Eligibility checker without claiming benefits
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Are you pregnant - <PregnantStatus>
    And Do I have injury by serving armed forces - <InjuryStatus>
    And Do I have diabetes  <DiabetesStatus>
    And Do I or family member have glaucoma  <GlaucomaStatus>
    And Do I or partner live in care home  <CareHome>
    And Do I have more than 16000 in savings  <Savings>
    Then Verify I will get a help or not with above conditions

    Examples: 
      | Country| DOB         |Couple|Benefits|PregnantStatus|InjuryStatus|DiabetesStatus|GlaucomaStatus|CareHome|Savings|
      | "wales"| "27-05-1986"|"yes" |"no"    |"yes"         | "yes"      |"yes"         |"no"          |"no"    |"no"   |
      | "wales"| "27-05-1996"|"no"  |"no"    |"yes"         | "yes"      |"yes"         |"no"          |"no"    |"no"   |
  
   @nhscostchecker
  Scenario Outline: NHS Eligibility checker with claiming benefits but not getting mentioned items and take home pay less than 435
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, getting any of the universal credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, take home pay less than <Pay> <PayLessThanOrEquals>
    Then Verify I will get a help or not

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit|UniversalCreditBenefits|Pay   |PayLessThanOrEquals|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"yes"          | "no"                  |"435" |"yes"              |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"yes"          | "no"                  |"435" |"yes"              |
   
    
   @nhscostchecker
  Scenario Outline: NHS Eligibility checker with claiming benefits but not getting mentioned items not taking home pay less than 435 and live in care home with help of local council
                   
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, getting any of the universal credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, take home pay less than <Pay> <PayLessThanOrEquals>
     And Are you pregnant - <PregnantStatus>
    And Do I have injury by serving armed forces - <InjuryStatus>
    And Do I have diabetes  <DiabetesStatus>
    And Do I or family member have glaucoma  <GlaucomaStatus>
    And Do I or partner live in care home  <CareHome>
    And I get help to pay care home <GetHelpToPayStatus>
    Then Verify I can apply for help from NHS

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit|UniversalCreditBenefits|Pay   |PayLessThanOrEquals|PregnantStatus|InjuryStatus|DiabetesStatus|GlaucomaStatus|CareHome|GetHelpToPayStatus|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"yes"          | "no"                  |"435" |"no"               |"no"          |"yes"       |"no"          |"yes"         |"yes"   |"yes"             |     
      | "wales"| "27-05-1996"|"no"  |"yes"   |"yes"          | "no"                  |"435" |"no"               |"no"          |"no"        |"yes"         | "no"         |"yes"   |"yes"             |
      
      
      @nhscostchecker
  Scenario Outline: NHS Eligibility checker with claiming benefits but not getting mentioned items not taking home pay less than 435 and live in care home with out help of local council
                   
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, getting any of the universal credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, take home pay less than <Pay> <PayLessThanOrEquals>
    And Are you pregnant - <PregnantStatus>
    And Do I have injury by serving armed forces - <InjuryStatus>
    And Do I have diabetes  <DiabetesStatus>
    And Do I or family member have glaucoma  <GlaucomaStatus>
    And Do I or partner live in care home  <CareHome>
    And I get help to pay care home <GetHelpToPayStatus>
    Then Verify I will get a help or not with above conditions
    
  Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit|UniversalCreditBenefits|Pay   |PayLessThanOrEquals|PregnantStatus|InjuryStatus|DiabetesStatus|GlaucomaStatus|CareHome|GetHelpToPayStatus|          
      | "wales"| "27-05-1996"|"yes" |"yes"   |"yes"          | "no"                  |"435" |"no"               |"no"          |"no"        |"yes"         | "no"         |"yes"   |"no"              |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"yes"          | "no"                  |"435" |"no"               |"no"          |"no"        |"yes"         | "no"         |"yes"   |"no"              |
      
      
      @nhscostchecker
  Scenario Outline: NHS Eligibility checker with claiming universal credit benefits , take home pay not less than or equal 935 and live in care home with help of local council
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, getting any of the universal credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, take home pay less than <Pay> <PayLessThanOrEquals>
    And Are you pregnant - <PregnantStatus>
    And Do I have injury by serving armed forces - <InjuryStatus>
    And Do I have diabetes  <DiabetesStatus>
    And Do I or family member have glaucoma  <GlaucomaStatus>
    And Do I or partner live in care home  <CareHome>
    And I get help to pay care home <GetHelpToPayStatus>
    Then Verify I can apply for help from NHS

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit|UniversalCreditBenefits|Pay   |PayLessThanOrEquals|PregnantStatus|InjuryStatus|DiabetesStatus|GlaucomaStatus|CareHome|GetHelpToPayStatus|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"yes"          | "yes"                 |"935" |"no"               |"no"          |"no"        |"yes"         | "no"         |"yes"   |"yes"             |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"yes"          | "yes"                 |"935" |"no"               |"no"          |"no"        |"yes"         | "no"         |"yes"   |"yes"             |
      
       @nhscostchecker
  Scenario Outline: NHS Eligibility checker with claiming universal credit benefits , take home pay not less than or equal 935 and and live in care home with out help of local council
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, getting any of the universal credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, take home pay less than <Pay> <PayLessThanOrEquals>
    And Are you pregnant - <PregnantStatus>
    And Do I have injury by serving armed forces - <InjuryStatus>
    And Do I have diabetes  <DiabetesStatus>
    And Do I or family member have glaucoma  <GlaucomaStatus>
    And Do I or partner live in care home  <CareHome>
    And I get help to pay care home <GetHelpToPayStatus>
    Then Verify I will get a help or not with above conditions

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit|UniversalCreditBenefits|Pay   |PayLessThanOrEquals|PregnantStatus|InjuryStatus|DiabetesStatus|GlaucomaStatus|CareHome|GetHelpToPayStatus|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"yes"          | "yes"                 |"935" |"no"               |"no"          |"no"        |"yes"         | "no"         |"yes"   |"no"              |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"yes"          | "yes"                 |"935" |"no"               |"no"          |"no"        |"yes"         | "no"         |"yes"   |"no"              |
      
  
  @nhscostchecker
  Scenario Outline: NHS Eligibility checker with universal credit benefits applied , having working & child tax credit , income 15276 or less
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, type of tax credits - <TaxCredits>
    And Me or My partner -if partner exists, house hold income less than <IncomeLessThanOrEquals>
    Then Verify I will get a help or not

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit|UniversalCreditBenefits|TaxCredits                  |IncomeLessThanOrEquals|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"not-yet"      | "taxCredit"           |"workingChildTaxCredit"     |"yes"                  |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"not-yet"      | "taxCredit"           |"workingChildTaxCredit"     |"yes"                  |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"not-yet"      | "taxCredit"           |"workingDisabilityTaxCredit"|"yes"                  |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"not-yet"      | "taxCredit"           |"childTaxCredit"            |"yes"                  |
      
  @nhscostchecker
  Scenario Outline: NHS Eligibility checker with universal credit benefits applied , having working & child tax credit , income more than 15276 and live in care home with help of local council
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, type of tax credits - <TaxCredits>
    And Me or My partner -if partner exists, house hold income less than <IncomeLessThanOrEquals> 
    And Are you pregnant - <PregnantStatus>
    And Do I have injury by serving armed forces - <InjuryStatus>
    And Do I have diabetes  <DiabetesStatus>
    And Do I or family member have glaucoma  <GlaucomaStatus>
    And Do I or partner live in care home  <CareHome>
    And I get help to pay care home <GetHelpToPayStatus>
    Then Verify I can apply for help from NHS

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit|UniversalCreditBenefits|TaxCredits                  |IncomeLessThanOrEquals|PregnantStatus|InjuryStatus|DiabetesStatus|GlaucomaStatus|CareHome|GetHelpToPayStatus|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"not-yet"      | "taxCredit"           |"workingChildTaxCredit"     |"no"                  |"no"          |"no"        |"yes"         | "no"         |"yes"   |"yes"             |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"not-yet"      | "taxCredit"           |"workingChildTaxCredit"     |"no"                  |"no"          |"no"        |"yes"         | "no"         |"yes"   |"yes"             |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"not-yet"      | "taxCredit"           |"workingDisabilityTaxCredit"|"no"                  |"no"          |"no"        |"yes"         | "no"         |"yes"   |"yes"             |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"not-yet"      | "taxCredit"           |"childTaxCredit"            |"no"                  |"no"          |"no"        |"yes"         | "no"         |"yes"   |"yes"             |
      
  @nhscostchecker
  Scenario Outline: NHS Eligibility checker with universal credit benefits applied , having working & child tax credit , income more than 15276 and live in care home with out help of local council
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, type of tax credits - <TaxCredits>
    And Me or My partner -if partner exists, house hold income less than <IncomeLessThanOrEquals> 
    And Are you pregnant - <PregnantStatus>
    And Do I have injury by serving armed forces - <InjuryStatus>
    And Do I have diabetes  <DiabetesStatus>
    And Do I or family member have glaucoma  <GlaucomaStatus>
    And Do I or partner live in care home  <CareHome>
    And I get help to pay care home <GetHelpToPayStatus>
    Then Verify I will get a help or not with above conditions

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit|UniversalCreditBenefits|TaxCredits                  |IncomeLessThanOrEquals|PregnantStatus|InjuryStatus|DiabetesStatus|GlaucomaStatus|CareHome|GetHelpToPayStatus|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"not-yet"      | "taxCredit"           |"workingChildTaxCredit"     |"no"                  |"no"          |"no"        |"yes"         | "no"         |"yes"   |"no"              |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"not-yet"      | "taxCredit"           |"workingChildTaxCredit"     |"no"                  |"no"          |"no"        |"yes"         | "no"         |"yes"   |"no"              |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"not-yet"      | "taxCredit"           |"workingDisabilityTaxCredit"|"no"                  |"no"          |"no"        |"yes"         | "no"         |"yes"   |"no"              |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"not-yet"      | "taxCredit"           |"childTaxCredit"            |"no"                  |"no"          |"no"        |"yes"         | "no"         |"yes"   |"no"              |
      
  @nhscostchecker
  Scenario Outline: NHS Eligibility checker with universal credit benefits applied , having working tax credit its own and live in care home with help of local council
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, type of tax credits - <TaxCredits>
    And Are you pregnant - <PregnantStatus>
    And Do I have injury by serving armed forces - <InjuryStatus>
    And Do I have diabetes  <DiabetesStatus>
    And Do I or family member have glaucoma  <GlaucomaStatus>
    And Do I or partner live in care home  <CareHome>
    And I get help to pay care home <GetHelpToPayStatus>
    Then Verify I can apply for help from NHS

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit|UniversalCreditBenefits|TaxCredits             |PregnantStatus|InjuryStatus|DiabetesStatus|GlaucomaStatus|CareHome|GetHelpToPayStatus|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"not-yet"      | "taxCredit"           |"workingTaxCredit"     |"no"          |"no"        |"yes"         | "no"         |"yes"   |"yes"             |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"not-yet"      | "taxCredit"           |"workingTaxCredit"     |"no"          |"no"        |"yes"         | "no"         |"yes"   |"yes"             |
      
      @nhscostchecker
  Scenario Outline: NHS Eligibility checker with universal credit benefits applied , having working tax credit its own and live in care home with out help of local council
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, type of tax credits - <TaxCredits>
    And Are you pregnant - <PregnantStatus>
    And Do I have injury by serving armed forces - <InjuryStatus>
    And Do I have diabetes  <DiabetesStatus>
    And Do I or family member have glaucoma  <GlaucomaStatus>
    And Do I or partner live in care home  <CareHome>
    And I get help to pay care home <GetHelpToPayStatus>
    Then Verify I will get a help or not with above conditions

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit|UniversalCreditBenefits|TaxCredits             |PregnantStatus|InjuryStatus|DiabetesStatus|GlaucomaStatus|CareHome|GetHelpToPayStatus|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"not-yet"      | "taxCredit"           |"workingTaxCredit"     |"no"          |"no"        |"yes"         | "no"         |"yes"   |"no"              |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"not-yet"      | "taxCredit"           |"workingTaxCredit"     |"no"          |"no"        |"yes"         | "no"         |"yes"   |"no"              |
      
  
  @nhscostchecker
  Scenario Outline: NHS Eligibility checker with universal credit benefits applied and having income support benefit
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    Then Verify I will get a help or not

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit|UniversalCreditBenefits|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"not-yet"      | "incSupport"          |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"not-yet"      | "incSupport"          |
      
  @nhscostchecker
  Scenario Outline: NHS Eligibility checker with universal credit benefits applied and having income related ESA 
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, select type of allowance - <TypeOFAllowance>
    Then Verify I will get a help or not

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit|UniversalCreditBenefits|TypeOFAllowance|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"not-yet"      | "esa"                 |"income-esa"   |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"not-yet"      | "esa"                 |"income-esa"   |
      
  @nhscostchecker
  Scenario Outline: NHS Eligibility checker with universal credit benefits applied, having contribution based ESA and live in care home with help of local council
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, select type of allowance - <TypeOFAllowance>
    And Are you pregnant - <PregnantStatus>
    And Do I have injury by serving armed forces - <InjuryStatus>
    And Do I have diabetes  <DiabetesStatus>
    And Do I or family member have glaucoma  <GlaucomaStatus>
    And Do I or partner live in care home  <CareHome>
    And I get help to pay care home <GetHelpToPayStatus>
    Then Verify I can apply for help from NHS

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit|UniversalCreditBenefits|TypeOFAllowance   |PregnantStatus|InjuryStatus|DiabetesStatus|GlaucomaStatus|CareHome|GetHelpToPayStatus|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"not-yet"      | "esa"                 |"contribution-esa"|"no"          |"no"        |"yes"         | "no"         |"yes"   |"yes"             |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"not-yet"      | "esa"                 |"contribution-esa"|"no"          |"no"        |"yes"         | "no"         |"yes"   |"yes"             |
      
  @nhscostchecker
  Scenario Outline: NHS Eligibility checker with universal credit benefits applied, having contribution based ESA and live in care home with out help of local council
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, select type of allowance - <TypeOFAllowance>
    And Are you pregnant - <PregnantStatus>
    And Do I have injury by serving armed forces - <InjuryStatus>
    And Do I have diabetes  <DiabetesStatus>
    And Do I or family member have glaucoma  <GlaucomaStatus>
    And Do I or partner live in care home  <CareHome>
    And I get help to pay care home <GetHelpToPayStatus>
    Then Verify I will get a help or not with above conditions

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit|UniversalCreditBenefits|TypeOFAllowance   |PregnantStatus|InjuryStatus|DiabetesStatus|GlaucomaStatus|CareHome|GetHelpToPayStatus|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"not-yet"      | "esa"                 |"contribution-esa"|"no"          |"no"        |"yes"         | "no"         |"yes"   |"no"              |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"not-yet"      | "esa"                 |"contribution-esa"|"no"          |"no"        |"yes"         | "no"         |"yes"   |"no"              |
     
 @nhscostchecker
  Scenario Outline: NHS Eligibility checker with universal credit benefits applied, having contribution based ESA and not live in care home 
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, select type of allowance - <TypeOFAllowance>
    And Are you pregnant - <PregnantStatus>
    And Do I have injury by serving armed forces - <InjuryStatus>
    And Do I have diabetes  <DiabetesStatus>
    And Do I or family member have glaucoma  <GlaucomaStatus>
    And Do I or partner live in care home  <CareHome>
    And Do I have more than 16000 in savings  <Savings>
    Then Verify I will get a help or not with above conditions

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit|UniversalCreditBenefits|TypeOFAllowance   |PregnantStatus|InjuryStatus|DiabetesStatus|GlaucomaStatus|CareHome|Savings|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"not-yet"      | "esa"                 |"contribution-esa"|"no"          |"no"        |"yes"         | "no"         |"no"    |"yes"  |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"not-yet"      | "esa"                 |"contribution-esa"|"no"          |"no"        |"yes"         | "no"         |"no"    |"yes"  |
      
  @nhscostchecker
  Scenario Outline: NHS Eligibility checker with universal credit benefits applied and having income related JSA 
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, select type of allowance - <TypeOFAllowance>
    Then Verify I will get a help or not

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit|UniversalCreditBenefits|TypeOFAllowance|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"not-yet"      | "jsa"                 |"income-jsa"   |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"not-yet"      | "jsa"                 |"income-jsa"   |
      
   @nhscostchecker
  Scenario Outline: NHS Eligibility checker with universal credit benefits applied, having contribution based JSA and live in care home with help of local council
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, select type of allowance - <TypeOFAllowance>
    And Are you pregnant - <PregnantStatus>
    And Do I have injury by serving armed forces - <InjuryStatus>
    And Do I have diabetes  <DiabetesStatus>
    And Do I or family member have glaucoma  <GlaucomaStatus>
    And Do I or partner live in care home  <CareHome>
    And I get help to pay care home <GetHelpToPayStatus>
    Then Verify I can apply for help from NHS

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit|UniversalCreditBenefits|TypeOFAllowance   |PregnantStatus|InjuryStatus|DiabetesStatus|GlaucomaStatus|CareHome|GetHelpToPayStatus|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"not-yet"      | "jsa"                 |"contbasejsa"     |"no"          |"no"        |"yes"         | "no"         |"yes"   |"yes"             |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"not-yet"      | "jsa"                 |"contbasejsa"     |"no"          |"no"        |"yes"         | "no"         |"yes"   |"yes"             |
      
  @nhscostchecker
  Scenario Outline: NHS Eligibility checker with universal credit benefits applied, having contribution based JSA and live in care home with out help of local council
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, select type of allowance - <TypeOFAllowance>
    And Are you pregnant - <PregnantStatus>
    And Do I have injury by serving armed forces - <InjuryStatus>
    And Do I have diabetes  <DiabetesStatus>
    And Do I or family member have glaucoma  <GlaucomaStatus>
    And Do I or partner live in care home  <CareHome>
    And I get help to pay care home <GetHelpToPayStatus>
    Then Verify I will get a help or not with above conditions

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit|UniversalCreditBenefits|TypeOFAllowance   |PregnantStatus|InjuryStatus|DiabetesStatus|GlaucomaStatus|CareHome|GetHelpToPayStatus|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"not-yet"      | "jsa"                 |"contbasejsa"     |"no"          |"no"        |"yes"         | "no"         |"yes"   |"no"              |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"not-yet"      | "jsa"                 |"contbasejsa"     |"no"          |"no"        |"yes"         | "no"         |"yes"   |"no"              |
     
 @nhscostchecker
  Scenario Outline: NHS Eligibility checker with universal credit benefits applied, having contribution based JSA and not live in care home 
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, select type of allowance - <TypeOFAllowance>
    And Are you pregnant - <PregnantStatus>
    And Do I have injury by serving armed forces - <InjuryStatus>
    And Do I have diabetes  <DiabetesStatus>
    And Do I or family member have glaucoma  <GlaucomaStatus>
    And Do I or partner live in care home  <CareHome>
    And Do I have more than 16000 in savings  <Savings>
    Then Verify I will get a help or not with above conditions

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit|UniversalCreditBenefits|TypeOFAllowance   |PregnantStatus|InjuryStatus|DiabetesStatus|GlaucomaStatus|CareHome|Savings|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"not-yet"      | "jsa"                 |"contbasejsa"     |"no"          |"no"        |"yes"         | "no"         |"no"    |"yes"  |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"not-yet"      | "jsa"                 |"contbasejsa"     |"no"          |"no"        |"yes"         | "no"         |"no"    |"no"   |
      
   @nhscostchecker
  Scenario Outline: NHS Eligibility checker with universal credit benefits applied and having pension guarnteed credit
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, select type of pension credit - <TypeOfPensionCredit>
    Then Verify I will get a help or not

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit|UniversalCreditBenefits|TypeOfPensionCredit  |
      | "wales"| "27-05-1986"|"yes" |"yes"   |"not-yet"      | "penCredit"           |"guaranteecreditonly"|
      | "wales"| "27-05-1996"|"no"  |"yes"   |"not-yet"      | "penCredit"           |"guaranteecreditonly"|  
      
  @nhscostchecker
  Scenario Outline: NHS Eligibility checker with universal credit benefits applied and having pension guarnteed credit with savings credit
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, select type of pension credit - <TypeOfPensionCredit>
    Then Verify I will get a help or not

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit|UniversalCreditBenefits|TypeOfPensionCredit              |
      | "wales"| "27-05-1986"|"yes" |"yes"   |"not-yet"      | "penCredit"           |"guaranteecreditwithsavingcredit"|
      | "wales"| "27-05-1996"|"no"  |"yes"   |"not-yet"      | "penCredit"           |"guaranteecreditwithsavingcredit"|  
      
      
 @nhscostchecker
  Scenario Outline: NHS Eligibility checker with universal credit benefits applied, having pension savings credit
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, select type of pension credit - <TypeOfPensionCredit>
    And Are you pregnant - <PregnantStatus>
    And Do I have injury by serving armed forces - <InjuryStatus>
    And Do I have diabetes  <DiabetesStatus>
    And Do I or family member have glaucoma  <GlaucomaStatus>
    And Do I or partner live in care home  <CareHome>
    And I get help to pay care home <GetHelpToPayStatus>
    Then Verify I can apply for help from NHS

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit|UniversalCreditBenefits|TypeOfPensionCredit|PregnantStatus|InjuryStatus|DiabetesStatus|GlaucomaStatus|CareHome|GetHelpToPayStatus|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"not-yet"      | "penCredit"           |"savingcredit"     |"no"          |"no"        |"yes"         | "no"         |"yes"   |"yes"             |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"not-yet"      | "penCredit"           |"savingcredit"     |"no"          |"no"        |"yes"         | "no"         |"yes"   |"yes"             |
   
   @nhscostchecker
  Scenario Outline: NHS Eligibility checker with universal credit benefits applied, having pension savings credit and live in care home with help of local council
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, select type of pension credit - <TypeOfPensionCredit>
    And Are you pregnant - <PregnantStatus>
    And Do I have injury by serving armed forces - <InjuryStatus>
    And Do I have diabetes  <DiabetesStatus>
    And Do I or family member have glaucoma  <GlaucomaStatus>
    And Do I or partner live in care home  <CareHome>
    And I get help to pay care home <GetHelpToPayStatus>
    Then Verify I can apply for help from NHS

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit|UniversalCreditBenefits|TypeOfPensionCredit|PregnantStatus|InjuryStatus|DiabetesStatus|GlaucomaStatus|CareHome|GetHelpToPayStatus|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"not-yet"      |"penCredit"            |"savingcredit"     |"no"          |"no"        |"yes"         | "no"         |"yes"   |"yes"             |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"not-yet"      |"penCredit"            |"savingcredit"     |"no"          |"no"        |"yes"         | "no"         |"yes"   |"yes"             |
      
      
  @nhscostchecker
  Scenario Outline: NHS Eligibility checker with universal credit benefits applied, having pension savings credit and live in care home with out help of local council
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, select type of pension credit - <TypeOfPensionCredit>
    And Are you pregnant - <PregnantStatus>
    And Do I have injury by serving armed forces - <InjuryStatus>
    And Do I have diabetes  <DiabetesStatus>
    And Do I or family member have glaucoma  <GlaucomaStatus>
    And Do I or partner live in care home  <CareHome>
    And I get help to pay care home <GetHelpToPayStatus>
    Then Verify I will get a help or not with above conditions

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit|UniversalCreditBenefits|TypeOfPensionCredit|PregnantStatus|InjuryStatus|DiabetesStatus|GlaucomaStatus|CareHome|GetHelpToPayStatus|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"not-yet"      | "penCredit"           |"savingcredit"     |"no"          |"no"        |"yes"         | "no"         |"yes"   |"no"              |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"not-yet"      | "penCredit"           |"savingcredit"     |"no"          |"no"        |"yes"         | "no"         |"yes"   |"no"              |
     
 @nhscostchecker
  Scenario Outline: NHS Eligibility checker with universal credit benefits applied, having pension savings credit and not live in care home 
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, select type of pension credit - <TypeOfPensionCredit>
    And Are you pregnant - <PregnantStatus>
    And Do I have injury by serving armed forces - <InjuryStatus>
    And Do I have diabetes  <DiabetesStatus>
    And Do I or family member have glaucoma  <GlaucomaStatus>
    And Do I or partner live in care home  <CareHome>
    And Do I have more than 16000 in savings  <Savings>
    Then Verify I will get a help or not with above conditions

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit|UniversalCreditBenefits|TypeOfPensionCredit|PregnantStatus|InjuryStatus|DiabetesStatus|GlaucomaStatus|CareHome|Savings|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"not-yet"      | "penCredit"           |"savingcredit"     |"no"          |"no"        |"yes"         | "no"         |"no"    |"yes"  |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"not-yet"      | "penCredit"           |"savingcredit"     |"no"          |"no"        |"yes"         | "no"         |"no"    |"no"   |
      
 
  @nhscostchecker
  Scenario Outline: NHS Eligibility checker with universal credit benefits applied, having no benefits and live in care home with help of local council
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Are you pregnant - <PregnantStatus>
    And Do I have injury by serving armed forces - <InjuryStatus>
    And Do I have diabetes  <DiabetesStatus>
    And Do I or family member have glaucoma  <GlaucomaStatus>
    And Do I or partner live in care home  <CareHome>
    And I get help to pay care home <GetHelpToPayStatus>
    Then Verify I can apply for help from NHS

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit|UniversalCreditBenefits|PregnantStatus|InjuryStatus|DiabetesStatus|GlaucomaStatus|CareHome|GetHelpToPayStatus|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"not-yet"      | "continue"            |"no"          |"no"        |"yes"         | "no"         |"yes"   |"yes"             |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"not-yet"      | "continue"            |"no"          |"no"        |"yes"         | "no"         |"yes"   |"yes"             |
      
      
  @nhscostchecker
  Scenario Outline: NHS Eligibility checker with universal credit benefits applied, having no benefits and live in care home with out help of local council
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Are you pregnant - <PregnantStatus>
    And Do I have injury by serving armed forces - <InjuryStatus>
    And Do I have diabetes  <DiabetesStatus>
    And Do I or family member have glaucoma  <GlaucomaStatus>
    And Do I or partner live in care home  <CareHome>
    And I get help to pay care home <GetHelpToPayStatus>
    Then Verify I will get a help or not with above conditions

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit|UniversalCreditBenefits|PregnantStatus|InjuryStatus|DiabetesStatus|GlaucomaStatus|CareHome|GetHelpToPayStatus|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"not-yet"      | "continue"            |"no"          |"no"        |"yes"         | "no"         |"yes"   |"no"              |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"not-yet"      | "continue"            |"no"          |"no"        |"yes"         | "no"         |"yes"   |"no"              |
     
 @nhscostchecker
  Scenario Outline: NHS Eligibility checker with universal credit benefits applied, having no benefits and not live in care home 
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Are you pregnant - <PregnantStatus>
    And Do I have injury by serving armed forces - <InjuryStatus>
    And Do I have diabetes  <DiabetesStatus>
    And Do I or family member have glaucoma  <GlaucomaStatus>
    And Do I or partner live in care home  <CareHome>
    And Do I have more than 16000 in savings  <Savings>
    Then Verify I will get a help or not with above conditions

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit|UniversalCreditBenefits|PregnantStatus|InjuryStatus|DiabetesStatus|GlaucomaStatus|CareHome|Savings|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"not-yet"      | "continue"            |"no"          |"no"        |"yes"         | "no"         |"no"    |"yes"  |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"not-yet"      | "continue"            |"no"          |"no"        |"yes"         | "no"         |"no"    |"no"   |
      
  @nhscostchecker
  Scenario Outline: NHS Eligibility checker with different benefits other than universal credit payment, having working & child tax credit , income 15276 or less
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, type of tax credits - <TaxCredits>
    And Me or My partner -if partner exists, house hold income less than <IncomeLessThanOrEquals>
    Then Verify I will get a help or not

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit     |UniversalCreditBenefits|TaxCredits                  |IncomeLessThanOrEquals|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"different-benefit" | "taxCredit"           |"workingChildTaxCredit"     |"yes"                  |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"different-benefit" | "taxCredit"           |"workingChildTaxCredit"     |"yes"                  |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"different-benefit" | "taxCredit"           |"workingDisabilityTaxCredit"|"yes"                  |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"different-benefit" | "taxCredit"           |"childTaxCredit"            |"yes"                  |
      
  @nhscostchecker
  Scenario Outline: NHS Eligibility checker with different benefits other than universal credit payment, having working & child tax credit , income more than 15276 and live in care home with help of local council
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, type of tax credits - <TaxCredits>
    And Me or My partner -if partner exists, house hold income less than <IncomeLessThanOrEquals> 
    And Are you pregnant - <PregnantStatus>
    And Do I have injury by serving armed forces - <InjuryStatus>
    And Do I have diabetes  <DiabetesStatus>
    And Do I or family member have glaucoma  <GlaucomaStatus>
    And Do I or partner live in care home  <CareHome>
    And I get help to pay care home <GetHelpToPayStatus>
    Then Verify I can apply for help from NHS

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit    |UniversalCreditBenefits|TaxCredits                  |IncomeLessThanOrEquals|PregnantStatus|InjuryStatus|DiabetesStatus|GlaucomaStatus|CareHome|GetHelpToPayStatus|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"different-benefit"| "taxCredit"           |"workingChildTaxCredit"     |"no"                  |"no"          |"no"        |"yes"         | "no"         |"yes"   |"yes"             |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"different-benefit"| "taxCredit"           |"workingChildTaxCredit"     |"no"                  |"no"          |"no"        |"yes"         | "no"         |"yes"   |"yes"             |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"different-benefit"| "taxCredit"           |"workingDisabilityTaxCredit"|"no"                  |"no"          |"no"        |"yes"         | "no"         |"yes"   |"yes"             |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"different-benefit"| "taxCredit"           |"childTaxCredit"            |"no"                  |"no"          |"no"        |"yes"         | "no"         |"yes"   |"yes"             |
      
  @nhscostchecker
  Scenario Outline: NHS Eligibility checker with different benefits other than universal credit payment , having working & child tax credit , income more than 15276 and live in care home with out help of local council
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, type of tax credits - <TaxCredits>
    And Me or My partner -if partner exists, house hold income less than <IncomeLessThanOrEquals> 
    And Are you pregnant - <PregnantStatus>
    And Do I have injury by serving armed forces - <InjuryStatus>
    And Do I have diabetes  <DiabetesStatus>
    And Do I or family member have glaucoma  <GlaucomaStatus>
    And Do I or partner live in care home  <CareHome>
    And I get help to pay care home <GetHelpToPayStatus>
    Then Verify I will get a help or not with above conditions

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit    |UniversalCreditBenefits|TaxCredits                  |IncomeLessThanOrEquals|PregnantStatus|InjuryStatus|DiabetesStatus|GlaucomaStatus|CareHome|GetHelpToPayStatus|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"different-benefit"| "taxCredit"           |"workingChildTaxCredit"     |"no"                  |"no"          |"no"        |"yes"         | "no"         |"yes"   |"no"              |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"different-benefit"| "taxCredit"           |"workingChildTaxCredit"     |"no"                  |"no"          |"no"        |"yes"         | "no"         |"yes"   |"no"              |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"different-benefit"| "taxCredit"           |"workingDisabilityTaxCredit"|"no"                  |"no"          |"no"        |"yes"         | "no"         |"yes"   |"no"              |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"different-benefit"| "taxCredit"           |"childTaxCredit"            |"no"                  |"no"          |"no"        |"yes"         | "no"         |"yes"   |"no"              |
      
  @nhscostchecker
  Scenario Outline: NHS Eligibility checker with different benefits other than universal credit payment , having working tax credit its own and live in care home with help of local council
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, type of tax credits - <TaxCredits>
    And Are you pregnant - <PregnantStatus>
    And Do I have injury by serving armed forces - <InjuryStatus>
    And Do I have diabetes  <DiabetesStatus>
    And Do I or family member have glaucoma  <GlaucomaStatus>
    And Do I or partner live in care home  <CareHome>
    And I get help to pay care home <GetHelpToPayStatus>
    Then Verify I can apply for help from NHS

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit    |UniversalCreditBenefits|TaxCredits             |PregnantStatus|InjuryStatus|DiabetesStatus|GlaucomaStatus|CareHome|GetHelpToPayStatus|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"different-benefit"| "taxCredit"           |"workingTaxCredit"     |"no"          |"no"        |"yes"         | "no"         |"yes"   |"yes"             |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"different-benefit"| "taxCredit"           |"workingTaxCredit"     |"no"          |"no"        |"yes"         | "no"         |"yes"   |"yes"             |
      
      @nhscostchecker
  Scenario Outline: NHS Eligibility checker with different benefits other than universal credit payment , having working tax credit its own and live in care home with out help of local council
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, type of tax credits - <TaxCredits>
    And Are you pregnant - <PregnantStatus>
    And Do I have injury by serving armed forces - <InjuryStatus>
    And Do I have diabetes  <DiabetesStatus>
    And Do I or family member have glaucoma  <GlaucomaStatus>
    And Do I or partner live in care home  <CareHome>
    And I get help to pay care home <GetHelpToPayStatus>
    Then Verify I will get a help or not with above conditions

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit    |UniversalCreditBenefits|TaxCredits             |PregnantStatus|InjuryStatus|DiabetesStatus|GlaucomaStatus|CareHome|GetHelpToPayStatus|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"different-benefit"| "taxCredit"           |"workingTaxCredit"     |"no"          |"no"        |"yes"         | "no"         |"yes"   |"no"              |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"different-benefit"| "taxCredit"           |"workingTaxCredit"     |"no"          |"no"        |"yes"         | "no"         |"yes"   |"no"              |
      
  
  @nhscostchecker
  Scenario Outline: NHS Eligibility checker with different benefits other than universal credit payment and having income support benefit
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    Then Verify I will get a help or not

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit    |UniversalCreditBenefits|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"different-benefit"| "incSupport"          |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"different-benefit"| "incSupport"          |
      
  @nhscostchecker
  Scenario Outline: NHS Eligibility checker with different benefits other than universal credit payment and having income related ESA 
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, select type of allowance - <TypeOFAllowance>
    Then Verify I will get a help or not

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit    |UniversalCreditBenefits|TypeOFAllowance|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"different-benefit"| "esa"                 |"income-esa"   |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"different-benefit"| "esa"                 |"income-esa"   |
      
  @nhscostchecker
  Scenario Outline: NHS Eligibility checker with different benefits other than universal credit payment, having contribution based ESA and live in care home with help of local council
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, select type of allowance - <TypeOFAllowance>
    And Are you pregnant - <PregnantStatus>
    And Do I have injury by serving armed forces - <InjuryStatus>
    And Do I have diabetes  <DiabetesStatus>
    And Do I or family member have glaucoma  <GlaucomaStatus>
    And Do I or partner live in care home  <CareHome>
    And I get help to pay care home <GetHelpToPayStatus>
    Then Verify I can apply for help from NHS

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit    |UniversalCreditBenefits|TypeOFAllowance   |PregnantStatus|InjuryStatus|DiabetesStatus|GlaucomaStatus|CareHome|GetHelpToPayStatus|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"different-benefit"| "esa"                 |"contribution-esa"|"no"          |"no"        |"yes"         | "no"         |"yes"   |"yes"             |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"different-benefit"| "esa"                 |"contribution-esa"|"no"          |"no"        |"yes"         | "no"         |"yes"   |"yes"             |
      
  @nhscostchecker
  Scenario Outline: NHS Eligibility checker different benefits other than universal credit payment, having contribution based ESA and live in care home with out help of local council
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, select type of allowance - <TypeOFAllowance>
    And Are you pregnant - <PregnantStatus>
    And Do I have injury by serving armed forces - <InjuryStatus>
    And Do I have diabetes  <DiabetesStatus>
    And Do I or family member have glaucoma  <GlaucomaStatus>
    And Do I or partner live in care home  <CareHome>
    And I get help to pay care home <GetHelpToPayStatus>
    Then Verify I will get a help or not with above conditions

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit    |UniversalCreditBenefits|TypeOFAllowance   |PregnantStatus|InjuryStatus|DiabetesStatus|GlaucomaStatus|CareHome|GetHelpToPayStatus|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"different-benefit"| "esa"                 |"contribution-esa"|"no"          |"no"        |"yes"         | "no"         |"yes"   |"no"              |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"different-benefit"| "esa"                 |"contribution-esa"|"no"          |"no"        |"yes"         | "no"         |"yes"   |"no"              |
     
 @nhscostchecker
  Scenario Outline: NHS Eligibility checker with different benefits other than universal credit payment, having contribution based ESA and not live in care home 
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, select type of allowance - <TypeOFAllowance>
    And Are you pregnant - <PregnantStatus>
    And Do I have injury by serving armed forces - <InjuryStatus>
    And Do I have diabetes  <DiabetesStatus>
    And Do I or family member have glaucoma  <GlaucomaStatus>
    And Do I or partner live in care home  <CareHome>
    And Do I have more than 16000 in savings  <Savings>
    Then Verify I will get a help or not with above conditions

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit    |UniversalCreditBenefits|TypeOFAllowance   |PregnantStatus|InjuryStatus|DiabetesStatus|GlaucomaStatus|CareHome|Savings|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"different-benefit"| "esa"                 |"contribution-esa"|"no"          |"no"        |"yes"         | "no"         |"no"    |"yes"  |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"different-benefit"| "esa"                 |"contribution-esa"|"no"          |"no"        |"yes"         | "no"         |"no"    |"no"   |
      
  @nhscostchecker
  Scenario Outline: NHS Eligibility checker with different benefits other than universal credit payment and having income related JSA 
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, select type of allowance - <TypeOFAllowance>
    Then Verify I will get a help or not

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit    |UniversalCreditBenefits|TypeOFAllowance|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"different-benefit"| "jsa"                 |"income-jsa"   |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"different-benefit"| "jsa"                 |"income-jsa"   |
      
   @nhscostchecker
  Scenario Outline: NHS Eligibility checker with different benefits other than universal credit payment, having contribution based JSA and live in care home with help of local council
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, select type of allowance - <TypeOFAllowance>
    And Are you pregnant - <PregnantStatus>
    And Do I have injury by serving armed forces - <InjuryStatus>
    And Do I have diabetes  <DiabetesStatus>
    And Do I or family member have glaucoma  <GlaucomaStatus>
    And Do I or partner live in care home  <CareHome>
    And I get help to pay care home <GetHelpToPayStatus>
    Then Verify I can apply for help from NHS

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit    |UniversalCreditBenefits|TypeOFAllowance   |PregnantStatus|InjuryStatus|DiabetesStatus|GlaucomaStatus|CareHome|GetHelpToPayStatus|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"different-benefit"| "jsa"                 |"contbasejsa"     |"no"          |"no"        |"yes"         | "no"         |"yes"   |"yes"             |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"different-benefit"| "jsa"                 |"contbasejsa"     |"no"          |"no"        |"yes"         | "no"         |"yes"   |"yes"             |
      
  @nhscostchecker
  Scenario Outline: NHS Eligibility checker with different benefits other than universal credit payment, having contribution based JSA and live in care home with out help of local council
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, select type of allowance - <TypeOFAllowance>
    And Are you pregnant - <PregnantStatus>
    And Do I have injury by serving armed forces - <InjuryStatus>
    And Do I have diabetes  <DiabetesStatus>
    And Do I or family member have glaucoma  <GlaucomaStatus>
    And Do I or partner live in care home  <CareHome>
    And I get help to pay care home <GetHelpToPayStatus>
    Then Verify I will get a help or not with above conditions

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit    |UniversalCreditBenefits|TypeOFAllowance   |PregnantStatus|InjuryStatus|DiabetesStatus|GlaucomaStatus|CareHome|GetHelpToPayStatus|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"different-benefit"| "jsa"                 |"contbasejsa"     |"no"          |"no"        |"yes"         | "no"         |"yes"   |"no"              |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"different-benefit"| "jsa"                 |"contbasejsa"     |"no"          |"no"        |"yes"         | "no"         |"yes"   |"no"              |
     
 @nhscostchecker
  Scenario Outline: NHS Eligibility checker with different benefits other than universal credit payment, having contribution based JSA and not live in care home 
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, select type of allowance - <TypeOFAllowance>
    And Are you pregnant - <PregnantStatus>
    And Do I have injury by serving armed forces - <InjuryStatus>
    And Do I have diabetes  <DiabetesStatus>
    And Do I or family member have glaucoma  <GlaucomaStatus>
    And Do I or partner live in care home  <CareHome>
    And Do I have more than 16000 in savings  <Savings>
    Then Verify I will get a help or not with above conditions

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit    |UniversalCreditBenefits|TypeOFAllowance   |PregnantStatus|InjuryStatus|DiabetesStatus|GlaucomaStatus|CareHome|Savings|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"different-benefit"| "jsa"                 |"contbasejsa"     |"no"          |"no"        |"yes"         | "no"         |"no"    |"yes"  |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"different-benefit"| "jsa"                 |"contbasejsa"     |"no"          |"no"        |"yes"         | "no"         |"no"    |"no"   |
      
   @nhscostchecker
  Scenario Outline: NHS Eligibility checker with different benefits other than universal credit payment and having pension guarnteed credit
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, select type of pension credit - <TypeOfPensionCredit>
    Then Verify I will get a help or not

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit    |UniversalCreditBenefits|TypeOfPensionCredit  |
      | "wales"| "27-05-1986"|"yes" |"yes"   |"different-benefit"| "penCredit"           |"guaranteecreditonly"|
      | "wales"| "27-05-1996"|"no"  |"yes"   |"different-benefit"| "penCredit"           |"guaranteecreditonly"|  
      
  @nhscostchecker
  Scenario Outline: NHS Eligibility checker with different benefits other than universal credit payment and having pension guarnteed credit with savings credit
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, select type of pension credit - <TypeOfPensionCredit>
    Then Verify I will get a help or not

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit    |UniversalCreditBenefits|TypeOfPensionCredit              |
      | "wales"| "27-05-1986"|"yes" |"yes"   |"different-benefit"| "penCredit"           |"guaranteecreditwithsavingcredit"|
      | "wales"| "27-05-1996"|"no"  |"yes"   |"different-benefit"| "penCredit"           |"guaranteecreditwithsavingcredit"|  
      
      
 @nhscostchecker
  Scenario Outline: NHS Eligibility checker with different benefits other than universal credit payment, having pension savings credit
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, select type of pension credit - <TypeOfPensionCredit>
    And Are you pregnant - <PregnantStatus>
    And Do I have injury by serving armed forces - <InjuryStatus>
    And Do I have diabetes  <DiabetesStatus>
    And Do I or family member have glaucoma  <GlaucomaStatus>
    And Do I or partner live in care home  <CareHome>
    And I get help to pay care home <GetHelpToPayStatus>
    Then Verify I can apply for help from NHS

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit    |UniversalCreditBenefits|TypeOfPensionCredit|PregnantStatus|InjuryStatus|DiabetesStatus|GlaucomaStatus|CareHome|GetHelpToPayStatus|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"different-benefit"| "penCredit"           |"savingcredit"     |"no"          |"no"        |"yes"         | "no"         |"yes"   |"yes"             |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"different-benefit"| "penCredit"           |"savingcredit"     |"no"          |"no"        |"yes"         | "no"         |"yes"   |"yes"             |
   
   @nhscostchecker
  Scenario Outline: NHS Eligibility checker with different benefits other than universal credit payment, having pension savings credit and live in care home with help of local council
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, select type of pension credit - <TypeOfPensionCredit>
    And Are you pregnant - <PregnantStatus>
    And Do I have injury by serving armed forces - <InjuryStatus>
    And Do I have diabetes  <DiabetesStatus>
    And Do I or family member have glaucoma  <GlaucomaStatus>
    And Do I or partner live in care home  <CareHome>
    And I get help to pay care home <GetHelpToPayStatus>
    Then Verify I can apply for help from NHS

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit    |UniversalCreditBenefits|TypeOfPensionCredit|PregnantStatus|InjuryStatus|DiabetesStatus|GlaucomaStatus|CareHome|GetHelpToPayStatus|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"different-benefit"| "penCredit"           |"savingcredit"     |"no"          |"no"        |"yes"         | "no"         |"yes"   |"yes"             |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"different-benefit"| "penCredit"           |"savingcredit"     |"no"          |"no"        |"yes"         | "no"         |"yes"   |"yes"             |
      
      
  @nhscostchecker
  Scenario Outline: NHS Eligibility checker with different benefits other than universal credit payment, having pension savings credit and live in care home with out help of local council
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, select type of pension credit - <TypeOfPensionCredit>
    And Are you pregnant - <PregnantStatus>
    And Do I have injury by serving armed forces - <InjuryStatus>
    And Do I have diabetes  <DiabetesStatus>
    And Do I or family member have glaucoma  <GlaucomaStatus>
    And Do I or partner live in care home  <CareHome>
    And I get help to pay care home <GetHelpToPayStatus>
    Then Verify I will get a help or not with above conditions

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit    |UniversalCreditBenefits|TypeOfPensionCredit|PregnantStatus|InjuryStatus|DiabetesStatus|GlaucomaStatus|CareHome|GetHelpToPayStatus|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"different-benefit"| "penCredit"           |"savingcredit"     |"no"          |"no"        |"yes"         | "no"         |"yes"   |"no"              |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"different-benefit"| "penCredit"           |"savingcredit"     |"no"          |"no"        |"yes"         | "no"         |"yes"   |"no"              |
     
 @nhscostchecker
  Scenario Outline: NHS Eligibility checker with different benefits other than universal credit payment, having pension savings credit and not live in care home 
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Me or My partner -if partner exists, select type of pension credit - <TypeOfPensionCredit>
    And Are you pregnant - <PregnantStatus>
    And Do I have injury by serving armed forces - <InjuryStatus>
    And Do I have diabetes  <DiabetesStatus>
    And Do I or family member have glaucoma  <GlaucomaStatus>
    And Do I or partner live in care home  <CareHome>
    And Do I have more than 16000 in savings  <Savings>
    Then Verify I will get a help or not with above conditions

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit    |UniversalCreditBenefits|TypeOfPensionCredit|PregnantStatus|InjuryStatus|DiabetesStatus|GlaucomaStatus|CareHome|Savings|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"different-benefit"| "penCredit"           |"savingcredit"     |"no"          |"no"        |"yes"         | "no"         |"no"    |"yes"  |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"different-benefit"| "penCredit"           |"savingcredit"     |"no"          |"no"        |"yes"         | "no"         |"no"    |"no"   |
      
 
  @nhscostchecker
  Scenario Outline: NHS Eligibility checker with different benefits other than universal credit payment, having no benefits and live in care home with help of local council
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Are you pregnant - <PregnantStatus>
    And Do I have injury by serving armed forces - <InjuryStatus>
    And Do I have diabetes  <DiabetesStatus>
    And Do I or family member have glaucoma  <GlaucomaStatus>
    And Do I or partner live in care home  <CareHome>
    And I get help to pay care home <GetHelpToPayStatus>
    Then Verify I can apply for help from NHS

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit     |UniversalCreditBenefits|PregnantStatus|InjuryStatus|DiabetesStatus|GlaucomaStatus|CareHome|GetHelpToPayStatus|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"different-benefit" | "continue"            |"no"          |"no"        |"yes"         | "no"         |"yes"   |"yes"             |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"different-benefit" | "continue"            |"no"          |"no"        |"yes"         | "no"         |"yes"   |"yes"             |
      
      
  @nhscostchecker
  Scenario Outline: NHS Eligibility checker with different benefits other than universal credit payment, having no benefits and live in care home with out help of local council
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Are you pregnant - <PregnantStatus>
    And Do I have injury by serving armed forces - <InjuryStatus>
    And Do I have diabetes  <DiabetesStatus>
    And Do I or family member have glaucoma  <GlaucomaStatus>
    And Do I or partner live in care home  <CareHome>
    And I get help to pay care home <GetHelpToPayStatus>
    Then Verify I will get a help or not with above conditions

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit      |UniversalCreditBenefits|PregnantStatus|InjuryStatus|DiabetesStatus|GlaucomaStatus|CareHome|GetHelpToPayStatus|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"different-benefit"  | "continue"            |"no"          |"no"        |"yes"         | "no"         |"yes"   |"no"              |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"different-benefit"  | "continue"            |"no"          |"no"        |"yes"         | "no"         |"yes"   |"no"              |
     
 @nhscostchecker
  Scenario Outline: NHS Eligibility checker with different benefits other than universal credit payment , having no benefits and not live in care home 
    Given I am person from <Country>
    When My Date of birth is <DOB> , Live With partner status <Couple>
    And Me or My partner -if partner exists, claim any benefits - <Benefits>
    And Me or My partner -if partner exists, getting universal credits - <UniversalCredit>
    And Me or My partner -if partner exists, select any of the credit benefits - <UniversalCreditBenefits>
    And Are you pregnant - <PregnantStatus>
    And Do I have injury by serving armed forces - <InjuryStatus>
    And Do I have diabetes  <DiabetesStatus>
    And Do I or family member have glaucoma  <GlaucomaStatus>
    And Do I or partner live in care home  <CareHome>
    And Do I have more than 16000 in savings  <Savings>
    Then Verify I will get a help or not with above conditions

    Examples: 
      | Country| DOB         |Couple|Benefits|UniversalCredit     |UniversalCreditBenefits|PregnantStatus|InjuryStatus|DiabetesStatus|GlaucomaStatus|CareHome|Savings|
      | "wales"| "27-05-1986"|"yes" |"yes"   |"different-benefit" | "continue"            |"no"          |"no"        |"yes"         | "no"         |"no"    |"yes"  |
      | "wales"| "27-05-1996"|"no"  |"yes"   |"different-benefit" | "continue"            |"no"          |"no"        |"yes"         | "no"         |"no"    |"no"   |
      
 
 
       