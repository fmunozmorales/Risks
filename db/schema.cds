namespace risk_management;

using { BusinessPartnerA2X } from '../srv/external/BusinessPartnerA2X.cds';

entity Risks
{
    key ID : UUID;
    Title : String(100);
    Prio : String(5);
    Descr : String(100);
    Impact : Integer;
    Criticality : Integer;
    miti : Association to one Mitigations;
    Supplier : Association to one BusinessPartnerA2X.A_BusinessPartner;
}

entity Mitigations
{
    key ID : UUID;
    Description : String(100);
    Owner : String(100);
    timeline : String(100);
    risks : Association to many Risks on risks.miti = $self;
}
