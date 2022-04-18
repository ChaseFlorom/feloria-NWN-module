#!/bin/bash

rm -d -RI modules
rm and_the_Wailing_Death.mod

git -C nwn-assets pull || git clone https://github.com/urothis/nwn-assets.git nwn-assets

$PWD/tools/linux/nasher/nasher install  --verbose --erfUtil:"$PWD/tools/linux/neverwinter/nwn_erf" --gffUtil:"$PWD/tools/linux/neverwinter/nwn_gff" --tlkUtil:"$PWD/tools/linux/neverwinter/nwn_tlk" --nssCompiler:"$PWD/tools/linux/nwnsc/nwnsc" --installDir:"$PWD" --nssFlags:"-oei $PWD/nwn-assets/nwscript" --no

rm and_the_Wailing_Death.mod