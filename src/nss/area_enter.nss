#include "inc_debug"
#include "inc_horse"

void main()
{
       object oPC = GetEnteringObject();

// only trigger this for PCs
       if (!GetIsPC(oPC)) return;

       WriteTimestampedLogEntry(PlayerDetailedName(oPC)+" has entered "+GetName(OBJECT_SELF)+".");

       SetStandardFactionReputation(STANDARD_FACTION_COMMONER, 50, oPC);
       SetStandardFactionReputation(STANDARD_FACTION_MERCHANT, 50, oPC);
       SetStandardFactionReputation(STANDARD_FACTION_DEFENDER, 100, oPC);

       ValidateMount(oPC);

       if (GetLocalInt(OBJECT_SELF, "explored") == 1) ExploreAreaForPlayer(OBJECT_SELF, GetEnteringObject());

       string sScript = GetLocalString(OBJECT_SELF, "enter_script");
       if (sScript != "") ExecuteScript(sScript, OBJECT_SELF);

       if (GetLocalInt(OBJECT_SELF, "instance") == 1)
       {
           string sResRef = GetResRef(OBJECT_SELF);

           object oCounter = GetObjectByTag(sResRef+"_counter");
           int nRefresh = GetLocalInt(oCounter, "refresh");
           if (nRefresh == 0)
           {
                SendDebugMessage(sResRef+" refresh started", TRUE);
                SetLocalInt(oCounter, "refresh", 1);
           }
       }
}

