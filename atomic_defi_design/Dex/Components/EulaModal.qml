// Qt Imports
import QtQuick 2.15
import QtQuick.Layouts 1.15

// Project Imports
import "../Constants"
import App 1.0 //> API.app_name

MultipageModal
{
    id: root

    onClosed:
    {
        accept_eula.checked = false
        accept_tac.checked = false
    }

    property
    var onConfirm: () =>
    {}
    property bool close_only: false

    MultipageModalContent
    {
        titleText: qsTr("Disclaimer & Terms of Service")

        InnerBackground
        {
            id: eula_rect

            height: 400
            Layout.fillWidth: true

            DefaultFlickable
            {
                anchors.fill: parent
                anchors.margins: 20
                anchors.rightMargin: 0

                contentWidth: eula_text.width - 10
                contentHeight: eula_text.height

                DefaultText
                {
                    id: eula_text
                    font: DexTypo.body1
                    text_value: getEula()

                    width: eula_rect.width - 40
                }
            }
        }

        // Checkboxes
        DefaultCheckBox
        {
            id: accept_eula
            Layout.preferredWidth: parent.width
            visible: !close_only
            labelWidth: eula_rect.width - 80
            text: qsTr("Accept EULA")
        }

        DefaultCheckBox
        {
            id: accept_tac
            Layout.preferredWidth: parent.width
            visible: !close_only
            labelWidth: eula_rect.width - 80
            text: qsTr("Accept Terms and Conditions")
        }

        // Buttons
        footer: [
            RowLayout
            {
                width: root.width - 40
                height: 50
                spacing: 10
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignRight


                DefaultButton
                {
                    text: close_only ? qsTr("Close") : qsTr("Cancel")
                    radius: 18
                    leftPadding: 30
                    rightPadding: 30
                    onClicked: root.close()
                }

                Item
                {
                    height: 1
                    Layout.fillWidth: true

                }

                GradientButton
                {
                    visible: !close_only
                    text: qsTr("Confirm")
                    radius: 18
                    height: 40
                    leftPadding: 30
                    rightPadding: 30
                    enabled: accept_eula.checked && accept_tac.checked
                    onClicked:
                    {
                        onConfirm()
                        root.close()
                    }
                }


            }
        ]
    }

    function getEula()
    {
        return "<h2>SmartFi Non-Custodial Wallet</h2>
<h3>Terms of Service</h3>
<h4>February 16 2021</h4>
<p>Power Block Coin LLC, doing business as c, (<b>'SmartFi'</b> or <b>'we'</b> or <b>'us'</b> or <b>'our'</b>) makes available to users certain software services accessible via desktop application a mobile device application and or website, including the SmartFi Wallet (the <b>'Wallet Application'</b> or <b>'App'</b>). The Wallet Application enables users to (i) self custody digital assets; (ii) access a digital asset browser and link to decentralized applications and decentralized exchanges
(<b>'Dapp(s)'</b>); (iii) view addresses and information that are part of digital asset networks and broadcast transactions; and (iv) additional functionality as SmartFi may add to the App from time to time (collectively the <b>'Services'</b>). SmartFi developed these Terms of Service (these <b>'Terms'</b>) to describe the terms that govern your use of all versions of the Wallet Application. These terms and additional information about the Wallet Application can be found on the SmartFi website located at www.smartfi.com (the <b>'Site'</b>).</p>
<h2>Agreement to Terms</h2>
<p>By clicking 'I Agree' or by accessing the Wallet Application or using any or all of the Services, you agree to be bound by these Terms. If you don't agree to be bound by these Terms, you may not access or use the Services.</p>
<h2>Privacy Policy</h2>
<p>Please refer to our SmartFi Wallet Privacy Policy for information on how we collect, use and disclose information from our users. You acknowledge and agree that your use of the Services is subject to, and that we can collect, use and/or disclose your information (including any personal data you provide to us) in accordance with, our Privacy Policy.</p>
<h2>Changes to Terms or Services</h2>
<p>We may modify the Terms at any time at our sole discretion. If we do so, we'll let you know either by posting the modified Terms on the Site, by providing you a notice through the App, or through other methods of communication which we deem reasonable. The modified Terms will be effective at the time they are posted on the Site. It's important that you review the Terms whenever we modify them because if you continue to use the Services after we have modified the Terms, you are agreeing to be bound by the modified Terms. If you don't agree to be bound by the modified Terms, then you may not use the Services. Because our Services are evolving over time we may change or discontinue all or any part of the Services, at any time and without notice, at our sole discretion.</p>
<p><b>ARBITRATION NOTICE: THESE TERMS CONTAIN AN ARBITRATION CLAUSE FOR USERS IN CERTAIN JURISDICTIONS. IF YOU ARE A USER LOCATED IN THE UNITED STATES YOU AGREE THAT DISPUTES BETWEEN YOU AND SMARTFI WILL BE RESOLVED BY BINDING, INDIVIDUAL ARBITRATION IN THE UNITED STATES, AND YOU ARE WAIVING YOUR RIGHT TO A TRIAL BY JURY OR TO PARTICIPATE AS A PLAINTIFF OR CLASS MEMBER IN ANY PURPORTED CLASS ACTION OR REPRESENTATIVE PROCEEDING.</b></p>
<h2>Who May Use the Services</h2>
<h3>Eligibility</h3>
<p>You may use the Services if you are 18 years or older and are not barred from using the Services under applicable law.</p> 
<h3>Registration and Your Information</h3>
<p>If you want to use the Services you'll have to create an account (<b>'Account'</b>) via the App. You agree that you won't disclose your Account credentials to anyone and you'll notify us immediately of any unauthorized use of your Account. You're responsible for all activities that occur under your Account, or are otherwise referable to your Account credentials, whether or not you know about them. We reserve the right to suspend or terminate your Account if you provide inaccurate, untrue, or incomplete information, or if you fail to comply with the Account registration requirements or these terms.</p>
<p>You are solely responsible for the retention and security of your twelve word recovery phrase (<b>'Recovery Phrase'</b>). Your Recovery Phrase is the only way to access the cryptocurrency associated with your Account. Anyone that has access to your Recovery Phrase can access your cryptocurrency. If you lose your Recovery Phrase, you will not be able to access your cryptocurrency. You acknowledge that SmartFi does not store and is not responsible in any way for the security of your Recovery Phrase and you agree to hold SmartFi harmless and that SmartFi shall not be liable in any way in the event you lose your Recovery Phrase and cannot access your cryptocurrency.</p>
<h2>Feedback</h2>
<p>We welcome feedback, comments, ideas, and suggestions for improvements to the Services (<b>'Feedback'</b>). You can submit Feedback by contacting us <a href='mailto:support@smartfi.zendesk.com'>support@smartfi.zendesk.com</a>. You grant to us a non-exclusive, worldwide, perpetual, irrevocable, fully-paid, royalty-free, sublicensable and transferable license under any and all intellectual property rights that you own or control to use, copy, modify, create derivative works based upon and otherwise exploit the Feedback for any purpose. <b>If you lose your Recovery Phrase, you will not be able to access your cryptocurrency. You acknowledge that SmartFi does not store and is not responsible in any way for the security of your Recovery Phrase and you agree to hold SmartFi harmless and that SmartFi shall not be liable in any way in the event you lose your Recovery Phrase and cannot access your cryptocurrency.</b></p>
<h2>Content Ownership, Responsibility and Removal</h2>
<p>For purposes of these Terms: (i) <b>'Content'</b> means text, graphics, images, music, software, audio, video, works of authorship of any kind, and information or other materials that are posted, generated, provided or otherwise made available through the Services; and (ii) <b>'User Content'</b> means any Content that Account holders (including you) make available through the Services. Content includes without limitation User Content.</p>
<p>We do not claim any ownership rights in any User Content and nothing in these Terms will be deemed to restrict any rights that you may have to use and exploit your User Content.</p> 
<p>Subject to the foregoing, SmartFi and its licensors exclusively own all right, title and interest in and to the Services and Content, including all associated intellectual property rights. You acknowledge that the Services and Content are protected by copyright, trademark, and other laws of the United States and foreign countries. You agree not to remove, alter or obscure any copyright, trademark, service mark or other proprietary rights notices incorporated in or accompanying the Services or Content.</p>
<h3>Rights in User Content Granted by You</h3>
<p>In order to operate and provide our Services, you grant us a worldwide, non-exclusive, royalty-free, sublicensable, and transferable license to use, copy, distribute, create derivative works of, display, and perform the User Content that you upload, submit, store, send, or receive on the App or through our Services. The rights you grant in this license are for the limited purpose of operating and providing our Services. Additional information about your privacy and how we use User Content is available in the Privacy Policy.</p>
<p>You warrant and represent that you have the right and authority to submit your User Content and that the User Content or any part thereof does not infringe the intellectual property rights or any other rights of any third party.</p> 
<p>You acknowledge that, in certain instances, where you have removed your User Content by specifically deleting it, some of your User Content (such as posts or comments you make) may not be completely removed and copies of your User Content may continue to exist on the Services. We are not responsible or liable for the removal or deletion of (or the failure to remove or delete) any of your User Content.</p>
<h3>Rights in Content Granted by SmartFi</h3>
<p>Subject to your compliance with these Terms, we grant you a limited, non-exclusive, non-transferable, non-sublicensable license to download, view, copy, display and print the Content solely in connection with your permitted use of the Services.</p>
<h3>Rights in App, Site and Services Granted by SmartFi</h3>
<p>The App, Site and Services are proprietary to SmartFi and its licensors and must not be used other than strictly in accordance with these Terms. SmartFi grants to you a limited, non-exclusive, non-transferable, non-sublicensable right to use the App and Site for the purposes of accessing and using the Services in accordance with these Terms.</p> 
<h2>Fees</h2>
<p>We may charge fees for some or part of the Services we make available to you. We reserve the right to change those fees at our discretion with notice. We will disclose the amount of fees we will charge you for the applicable Service at the time that you access the Service.</p> 
<p>You may incur charges from third parties for use of linked services. For example, you may be charged fees via the Dapps and/or decentralized exchanges ('<b>DEXs</b>') that you may access via the App. You may also be charged fees by SmartFi if you elect to link the Wallet App to your SmartFi exchange account and transact in your SmartFi exchange account. Third party fees are not charged by SmartFi and are not paid to SmartFi.</p>
<h2>Acceptable Use and SmartFi Wallet Holding's Enforcement Rights</h2>
<p>You agree not to use the Services in ways that:</p>
<ul>
<li>Violate, misappropriate, or infringe the rights of SmartFi, our users, or others, including privacy, publicity, intellectual property, or other proprietary rights;</li>
<li>Are illegal, obscene, defamatory, threatening, intimidating, harassing, hateful, racially, or ethnically offensive, or instigate or encourage conduct that would be illegal, or otherwise inappropriate, including promoting violent crimes;</li>
<li>Involve publishing falsehoods, misrepresentations, or misleading statements, including impersonating someone;</li>
<li>Breach any duty toward or rights of any person or entity, including rights of publicity, privacy, or trademark;</li>
<li>Involve sending illegal or impermissible communications such as bulk messaging, auto-messaging, auto-dialing, and the like;</li>
<li>Avoid, bypass, remove, deactivate, impair, descramble or otherwise circumvent any technological measure implemented by us or any of our service providers or any other third party (including another user) to protect the Services or Content;</li>
<li>Disguise your location through IP proxying or other methods;</li>
<li>Interfere with, or attempt to interfere with, the access of any user, host or network, including, without limitation, sending a virus, overloading, flooding, spamming, or mail-bombing the Services;</li>
<li>Violate any applicable law or regulation; or</li>
<li>Encourage or enable any other individual to do any of the foregoing.</li>
<p>Although we have no obligation to monitor any User Content, we have absolute discretion to remove User Content at any time and for any reason without notice. You understand that by using the Services, you may be exposed to User Content that is offensive, indecent, or objectionable. We take no responsibility and assume no liability for any User Content, including any loss or damage to any of your User Content.</p>
<p>You agree to comply with all applicable U.S. and non-U.S. export control and trade sanctions laws (<b>'Export Laws'</b>). Without limiting the foregoing, you may not download the App or use the Services if 1) you are in, under the control of, or a national or resident of Cuba, Iran, North Korea, Sudan, or Syria or any other country subject to United States embargo, UN Security Council Resolutions ('UNSCR'), HM Treasury's financial sanctions regime, or if you are on the U.S. Treasury Department's Specially Designated Nationals List or the U.S. Commerce Department's Denied Persons List, Unverified List, Entity List HM Treasury's financial sanctions regime; or (2) you intend to supply any Services to Cuba, Iran, North Korea, Sudan or Syria or any other country subject to United States embargo or HM Treasury's financial sanctions regime (or a national or resident of one of these countries), or to a person on the Specially Designated Nationals List, Denied Persons List, Unverified List, Entity List, or HM Treasury's financial sanctions regime.</p>
<h2>Third Party Materials</h2>
<p>The Services and App may contain links to third-party services and/or Dapps (<b>'Third Party Materials'</b>). The Services enable you to access Dapps via a Dapp browser and Wallet Link by navigating away from the App to the Dapp or by enabling a native frontend software link within the App. When using a Dapp or other Third Party Materials, you understand that you are at no time transferring your assets to us. We provide access to Third Party Materials only as a convenience, do not have control over their content, do not warrant or endorse, and are not responsible for the availability or legitimacy of, the content, products or services on or accessible from those Third Party Materials (including any related websites, resources or links displayed therein). We make no warranties or representations, express or implied, about such linked Third Party Materials, the third parties they are owned and operated by, the information contained on them or the suitability of their products or services. You acknowledge sole responsibility for and assume all risk arising from your use of any third-party websites, applications, or resources.</p>
<p>You may be able to link Wallet to your SmartFi exchange account to enable access to your SmartFi account from Wallet. In doing so, you understand and agree that all transactions made when accessing your SmartFi exchange account from the Smartfi Wallet is subject to the terms of use for the SmartFi exchange account and the SmartFi exchange privacy policy.</p>
<h2>Termination</h2>
<p>We may terminate your access to and use of the Services, at our sole discretion, at any time and without notice to you. You may cancel your Account at any time by following the account closure instructions in the App. Upon any termination, discontinuation or cancellation of Services or your Account, (i) all rights and/or licences granted to you under these Terms shall immediately cease and terminate and you shall forthwith cease the use and/or access of the App, Site, Services and Content in any way whatsoever; and (ii) notwithstanding the foregoing, the following provisions will survive: Feedback, Content and Content Rights, Content Ownership, Responsibility and Removal (save for the subsection 'Rights in Content Granted by SmartFi'), Termination, Warranty Disclaimers, Indemnity, Limitation of Liability, Dispute Resolution, and General Terms.</p>
<h2>Warranty Disclaimers</h2>
<p>YOU EXPRESSLY ACKNOWLEDGE AND AGREE THAT USE OF THE SERVICES (INCLUDING ANY PRIVATE KEY STORAGE SERVICE OFFERED AS PART OF THE SERVICES, WHETHER CLOUD OR HARDWARE-BASED) AND CONTENT IS AT YOUR SOLE RISK AND THAT THE ENTIRE RISK AS TO SATISFACTORY QUALITY, PERFORMANCE, ACCURACY AND EFFORT IS WITH YOU. THE APP, SITE AND SERVICES ARE PROVIDED ON AN 'AS IS' AND 'AS AVAILABLE' BASIS WITHOUT ANY REPRESENTATION OR WARRANTY, WHETHER EXPRESS, IMPLIED OR STATUTORY. TO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE LAW, SMARTFI SPECIFICALLY DISCLAIMS ANY EXPRESS OR IMPLIED WARRANTIES OF TITLE, MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND/OR NON-INFRINGEMENT. SMARTFI DOES NOT MAKE ANY REPRESENTATIONS OR WARRANTIES THAT ACCESS TO THE SERVICES OR ANY OF THE MATERIALS CONTAINED THEREIN WILL BE CONTINUOUS, UNINTERRUPTED, TIMELY, OR ERROR-FREE.</p>
<p>USE OF ANY PRIVATE KEY STORAGE SERVICE INCLUDED AS PART OF THE SERVICES IS OFFERED TO YOU AS A CONVENIENCE, SUBJECT TO THE LIMITATIONS ABOVE. TO BE SAFE, YOU SHOULD ALWAYS BACKUP YOUR PRIVATE ACCESS KEY VIA SECONDARY MEANS.</p>
<h2>Disclaimers; Risks</h2>
<h3>Warranty disclaimer</h3>
<p>You expressly understand and agree that your use of the Services is at your sole risk. The Services (including the Site, the App and the Content) are provided on an 'as is' and 'as available' basis, without warranties of any kind, either express or implied, including, without limitation, implied warranties of merchantability, fitness for a particular purpose or non-infringement. You acknowledge that SmartFi has no control over, and no duty to take any action regarding: which users gain access to or use the Services; what effects the Content may have on you; how you may interpret or use the Content; or what actions you may take as a result of having been exposed to the Content. You release SmartFi from all liability for you having acquired or not acquired Content through the Services. SmartFi makes no representations concerning any Content contained in or accessed through the Services, and SmartFi will not be responsible or liable for the accuracy, copyright compliance, legality or decency of material contained in or accessed through the Services.</p>
<p>We do not represent or warrant that access to the Services will be continuous, uninterrupted, timely or secure. You acknowledge and accept that the Services (a) may contain bugs, errors and defects, (b) may function improperly or be subject to periods of downtime and unavailability, (c) may result in total or partial loss or corruption of data and (d) may be modified at any time, including through the release of subsequent versions, all with or without notice to you.</p>
<p>You acknowledge that SmartFi is not responsible for transferring, safeguarding, or maintaining your private keys or any digital currency associated therewith. If you lose, mishandle or have stolen associated digital currency private keys, you acknowledge that you may not be able to recover associated digital currency, and that SmartFi is not responsible for such loss. You acknowledge that SmartFi is not responsible for any loss, damage or liability arising from your failure to comply with the terms hereunder.</p>
<h3>Sophistication and Risk of Cryptographic Systems</h3>
<p>By utilizing the Services or interacting with the Content or platform in any way, you represent that you understand the inherent risks associated with cryptographic systems; and warrant that you have an understanding of the usage and intricacies of native cryptographic tokens such as Ether (ETH) and Bitcoin (BTC), smart contract based tokens such as those that follow an Ethereum token standard (e.g. <a href='https://github.com/ethereum/EIPs/issues/20'>https://github.com/ethereum/EIPs/issues/20</a>), and blockchain-based software systems.</p>
<h3>Risk of Regulatory Actions in One or More Jurisdictions</h3>
<p>SmartFi and any supported cryptographic token and blockchain could be impacted by one or more regulatory inquiries or regulatory action, which could impede or limit the ability of SmartFi to continue to develop, or which could impede or limit your ability to access or use the Services or the underlying blockchain network.</p>
<h3>Risk of Weaknesses or Exploits in the Field of Cryptography</h3>
<p>You acknowledge and understand that Cryptography is a progressing field. Advances in code cracking or technical advances such as the development of quantum computers may present risks to cryptocurrencies and Services of Content, which could result in the theft or loss of your cryptographic tokens or property. To the extent possible, SmartFi intends to update the protocol underlying Services to account for any advances in cryptography and to incorporate additional security measures, but does not guarantee or otherwise represent full security of the system. By using the Services or accessing Content, you acknowledge these inherent risks.</p>
<h3>Volatility of Cryptocurrencies</h3>
<p>You understand that Ethereum and other blockchain technologies and associated cryptographic tokens are highly volatile due to many factors including but not limited to adoption, speculation, technology and security risks. You also acknowledge that the cost of transacting on such technologies is variable and may increase at any time causing impact to any activities taking place on the blockchain network. You acknowledge these risks and agree that SmartFi cannot be held liable for such fluctuations or increased costs.</p>
<h3>Application Security</h3>
<p>You further acknowledge that blockchain applications are code subject to flaws and acknowledge that you are solely responsible for evaluating any code provided by the Services or Content and the trustworthiness of any third-party websites, products, smart-contracts, or Content you access or use through the Services. You further expressly acknowledge and represent that blockchain applications can be written maliciously or negligently, that SmartFi cannot be held liable for your interaction with such applications and that such applications may cause the loss of property or even identity. This warning and others later provided by SmartFi in no way evidence or represent an on-going duty to alert you to all of the potential risks of utilizing the Services or Content.</p>
<h2>Other Affiliated Services and Third Party Services</h2>
<p>Software and services provided by our affiliates ('<b>Affiliated Services</b>') and third party software and services ('<b>Third Party Services</b>' and, together with Affiliated Services, '<b>Additional Services</b>') included in, integrated into, or made accessible through, the Services, including through the Snap System, are made available to you under the terms of use of such service providers (collectively, '<b>Service Providers</b>') (for example, Komodo). Please review the applicable terms of use on their websites prior to using or accessing their services or see appendix A hereto.</p>
<p>Service Providers may charge you a fee for use of, or access to, such Additional Services. You acknowledge that SmartFi may earn fees from Service Providers in connection with your use of such Additional Services.</p>
<p>You agree that SmartFi and its affiliates are not in any way associated with the owner or operator of any Third Party Services or responsible or liable for the software and services offered by them or for anything in connection with such Third Party Services. SmartFi does not endorse or approve and makes no warranties, representations or undertakings relating to the software, service or content of any Third Party Services.</p>
<p>In addition, SmartFi disclaims liability for any loss, damage and any other consequence resulting directly or indirectly from or relating to your use or access of Third Party Services or any information that you may provide or any transaction conducted with or through the Third Party Services or the failure of any information, software or services posted or offered by such Service Providers or any error, omission or misrepresentation by such Service Providers or any computer virus arising from or system failure associated with the Third Party Services.</p>
<p>In the event of any inconsistency between the terms herein and the terms of the Additional Services, the terms herein will prevail.</p>
<h2>Indemnity</h2>
<p>You will indemnify and hold harmless SmartFi and its officers, directors, employees and agents, from and against any claims, disputes, demands, liabilities, damages, losses, and costs and expenses, including, without limitation, reasonable legal and accounting fees arising out of or in any way connected with (i) your access to or use of the Services or Content, (ii) your User Content, (iii) Third Party Materials, or (iv) your violation of these Terms.</p>
<h2>Limitation of Liability</h2>
<p>TO THE MAXIMUM EXTENT NOT PROHIBITED BY LAW, SMARTFI SHALL NOT BE LIABLE FOR DAMAGES OF ANY TYPE, WHETHER DIRECT OR INDIRECT, ARISING OUT OF OR IN ANY WAY RELATED TO YOUR USE OR INABILITY TO USE THE SERVICES, INCLUDING BUT NOT LIMITED TO DAMAGES ALLEGEDLY ARISING FROM THE COMPROMISE OR LOSS OF YOUR LOGIN CREDENTIALS OR FUNDS, OR LOSS OF OR INABILITY TO RESTORE ACCESS FROM YOUR BACKUP PHRASE, OR FOR MISTAKES, OMISSIONS, INTERRUPTIONS, DELAYS, DEFECTS AND/OR ERRORS IN THE TRANSMISSION OF TRANSACTIONS OR MESSAGES TO THE ETHEREUM NETWORK, OR THE FAILURE OF ANY MESSAGE TO SEND OR BE RECEIVED BY THE INTENDED RECIPIENT IN THE INTENDED FORM, OR FOR DIMINUTION OF VALUE OF ETHER OR ANY OTHER DIGITAL TOKEN OR DIGITAL ASSET ON THE ETHEREUM NETWORK. SMARTFI SHALL NOT BE LIABLE UNDER ANY CIRCUMSTANCES FOR ANY LOST PROFITS OR ANY SPECIAL, INCIDENTAL, INDIRECT, INTANGIBLE, OR CONSEQUENTIAL DAMAGES, WHETHER BASED IN CONTRACT, TORT, NEGLIGENCE, STRICT LIABILITY, OR OTHERWISE, ARISING OUT OF OR IN CONNECTION WITH AUTHORIZED OR UNAUTHORIZED USE OF THE SERVICES, EVEN IF AN AUTHORIZED REPRESENTATIVE OF SMARTFI HAS BEEN ADVISED OF OR KNEW OR SHOULD HAVE KNOWN OF THE POSSIBILITY OF SUCH DAMAGES. SMARTFI SHALL NOT BE LIABLE UNDER ANY CIRCUMSTANCES FOR DAMAGES ARISING OUT OF OR IN ANY WAY RELATED TO SOFTWARE, PRODUCTS, SERVICES, AND/OR INFORMATION OFFERED OR PROVIDED BY THIRD-PARTIES AND ACCESSED THROUGH THE APP, SITE OR SERVICES.</p>
<p>SOME JURISDICTIONS DO NOT ALLOW THE LIMITATION OF LIABILITY FOR PERSONAL INJURY, OR OF INCIDENTAL OR CONSEQUENTIAL DAMAGES, SO THIS LIMITATION MAY NOT APPLY TO YOU. IN NO EVENT SHALL SMARTFI' TOTAL LIABILITY TO YOU FOR ALL DAMAGES (OTHER THAN AS MAY BE REQUIRED BY APPLICABLE LAW IN CASES INVOLVING PERSONAL INJURY) EXCEED THE AMOUNT OF ONE HUNDRED U.S. DOLLARS (\\$USD100.00) OR ITS EQUIVALENT IN THE LOCAL CURRENCY OF THE APPLICABLE JURISDICTION.</p>
<h2>Dispute Resolution</h2>
<h3>Governing Law, Forum and Venue</h3>
<p>These Terms and any action related thereto will be governed by the laws of the state of Delaware in the United States, without regard to its conflict of laws provisions, If you are a user located in the United States, the terms in the 'Special Arbitration Provision for United States' section below apply to you.</p>
<p>If you are not located in the United States, you agree that you will resolve any claim you have with us relating to, arising out of, or in any way in connection with our Terms, us, or our Services (each, a 'Dispute,' and together, 'Disputes') exclusively in the state courts located in Delaware, or federal court for Delaware and you agree to submit to the personal jurisdiction of such courts for the purpose of litigating all such Disputes.</p>
<h3>Special Arbitration Provision for United States Users</h3>
<p>If you are a user located in the United States, you and SmartFi agree that any Dispute <b>shall be finally settled in binding arbitration, on an individual basis, in accordance with the American Arbitration Association's rules for arbitration of consumer-related disputes (accessible at <a href='https://www.adr.org/aaa/faces/rules'>https://www.adr.org/aaa/faces/rules</a>) and you and SmartFi hereby expressly waive trial by jury and right to participate in a class action lawsuit, private attorney general actions, or class-wide arbitration,</b> except that each party retains the right: (i) to bring an individual action in small claims court and (ii) to seek injunctive or other equitable relief in a court of competent jurisdiction to prevent the actual or threatened infringement, misappropriation or violation of a party's copyrights, trademarks, trade secrets, patents or other intellectual property rights (the action described in the foregoing clause (ii), an 'IP Protection Action'). The exclusive jurisdiction of an IP Protection Action shall be the courts of Delaware and you agree to submit to the personal jurisdiction of such courts for the purpose of litigating IP Protection Actions.</p>
<p>The Federal Arbitration Act, 9 U.S.C. §§ 1-16, fully applies to the arbitration. The arbitration will be conducted by a single, neutral arbitrator and shall take place in the county or parish in which you reside, or another mutually agreeable location, in the English language. The arbitrator may award any relief that a court of competent jurisdiction could award, including attorneys' fees when authorized by law, and the arbitral decision may be entered as a judgement and enforced in any court of law. At your request, hearings may be conducted in person or by telephone and the arbitrator may provide for submitting and determining motions on briefs, without oral hearings. The prevailing party in any action or proceeding to enforce this agreement shall be entitled to costs and attorneys' fees.</p>
<p>If the arbitrator(s) or arbitration administrator would impose filing fees or other administrative costs on you, we will reimburse you, upon request, to the extent such fees or costs would exceed those that you would otherwise have to pay if you were proceeding instead in a court. We will also pay additional fees or costs if required to do so by the arbitration administrator's rules or applicable law. Apart from the foregoing, each Party will be responsible for any other fees or costs, such as attorney fees that the Party may incur. If a court decides that any provision of this Special Arbitration Provision is invalid or unenforceable, that provision shall be severed and the other parts of this Special Arbitration Provision shall still apply. In any case, the remainder of this User Agreement, will continue to apply.</p>
<h2>General Terms</h2>
<p>These Terms constitute the entire and exclusive understanding and agreement between SmartFi and you regarding the Services and Content, and these Terms supersede and replace any and all prior oral or written understandings or agreements between SmartFi and you regarding the Services and Content. If any provision of these Terms is held invalid or unenforceable (either by an arbitrator appointed pursuant to the terms of the 'Special Arbitration Provision' section above or by a court of competent jurisdiction, that provision will be enforced to the maximum extent permissible and the other provisions of these Terms will remain in full force and effect. You may not assign or transfer these Terms, by operation of law or otherwise, without our prior written consent. Any attempt by you to assign or transfer these Terms, without such consent, will be null. We may freely assign or transfer these Terms without restriction. Subject to the foregoing, these Terms will bind and inure to the benefit of the parties, their successors and permitted assigns.</p>
<p>Any notices or other communications provided by us under these Terms, including those regarding modifications to these Terms, will be given by posting to the Services and/or through other electronic communication. You agree and consent to receive electronically all communications, agreements, documents, notices and disclosures (collectively, 'Communications') that we provide in connection with your Account and your use of the Services.</p>
<p><b>Our failure to enforce any right or provision of these Terms will not be considered a waiver of such right or provision. The waiver of any such right or provision will be effective only if in writing and signed by a duly authorized representative of SmartFi. Except as expressly set forth in these Terms, the exercise by either party of any of its remedies under these Terms will be without prejudice to its other remedies under these Terms or otherwise.</b></p>
<p><b>These Terms are written in English (U.S.). Any translated version is provided solely for your convenience. To the extent any translated version of our Terms conflicts with the English version, the English version controls.</b></p>
<h2>Contact Information</h2>
<p>If you have any questions about these Terms or the Services, please contact us at <a href='mailto:support@smartfi.zendesk.com'>support@smartfi.zendesk.com</a></p>"
    }
}
