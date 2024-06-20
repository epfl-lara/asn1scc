; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52748 () Bool)

(assert start!52748)

(declare-fun b!244075 () Bool)

(declare-fun e!169165 () Bool)

(declare-datatypes ((array!13367 0))(
  ( (array!13368 (arr!6847 (Array (_ BitVec 32) (_ BitVec 8))) (size!5860 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10642 0))(
  ( (BitStream!10643 (buf!6332 array!13367) (currentByte!11710 (_ BitVec 32)) (currentBit!11705 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20922 0))(
  ( (tuple2!20923 (_1!11383 BitStream!10642) (_2!11383 Bool)) )
))
(declare-fun lt!380434 () tuple2!20922)

(declare-datatypes ((tuple2!20924 0))(
  ( (tuple2!20925 (_1!11384 BitStream!10642) (_2!11384 BitStream!10642)) )
))
(declare-fun lt!380449 () tuple2!20924)

(assert (=> b!244075 (= e!169165 (not (or (not (_2!11383 lt!380434)) (not (= (_1!11383 lt!380434) (_2!11384 lt!380449))))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun bit!26 () Bool)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!10642 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20922)

(assert (=> b!244075 (= lt!380434 (checkBitsLoopPure!0 (_1!11384 lt!380449) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-datatypes ((Unit!17815 0))(
  ( (Unit!17816) )
))
(declare-datatypes ((tuple2!20926 0))(
  ( (tuple2!20927 (_1!11385 Unit!17815) (_2!11385 BitStream!10642)) )
))
(declare-fun lt!380444 () tuple2!20926)

(declare-fun lt!380448 () tuple2!20926)

(declare-fun lt!380451 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!244075 (validate_offset_bits!1 ((_ sign_extend 32) (size!5860 (buf!6332 (_2!11385 lt!380444)))) ((_ sign_extend 32) (currentByte!11710 (_2!11385 lt!380448))) ((_ sign_extend 32) (currentBit!11705 (_2!11385 lt!380448))) lt!380451)))

(declare-fun lt!380441 () Unit!17815)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10642 array!13367 (_ BitVec 64)) Unit!17815)

(assert (=> b!244075 (= lt!380441 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11385 lt!380448) (buf!6332 (_2!11385 lt!380444)) lt!380451))))

(declare-fun reader!0 (BitStream!10642 BitStream!10642) tuple2!20924)

(assert (=> b!244075 (= lt!380449 (reader!0 (_2!11385 lt!380448) (_2!11385 lt!380444)))))

(declare-fun b!244076 () Bool)

(declare-fun e!169163 () Bool)

(declare-fun lt!380439 () tuple2!20922)

(declare-fun lt!380435 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!244076 (= e!169163 (= (bitIndex!0 (size!5860 (buf!6332 (_1!11383 lt!380439))) (currentByte!11710 (_1!11383 lt!380439)) (currentBit!11705 (_1!11383 lt!380439))) lt!380435))))

(declare-fun b!244077 () Bool)

(declare-fun res!203977 () Bool)

(assert (=> b!244077 (=> (not res!203977) (not e!169165))))

(declare-fun isPrefixOf!0 (BitStream!10642 BitStream!10642) Bool)

(assert (=> b!244077 (= res!203977 (isPrefixOf!0 (_2!11385 lt!380448) (_2!11385 lt!380444)))))

(declare-fun b!244078 () Bool)

(declare-fun res!203971 () Bool)

(declare-fun e!169169 () Bool)

(assert (=> b!244078 (=> (not res!203971) (not e!169169))))

(declare-fun thiss!1005 () BitStream!10642)

(assert (=> b!244078 (= res!203971 (isPrefixOf!0 thiss!1005 (_2!11385 lt!380448)))))

(declare-fun b!244079 () Bool)

(declare-fun e!169164 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!244079 (= e!169164 (invariant!0 (currentBit!11705 thiss!1005) (currentByte!11710 thiss!1005) (size!5860 (buf!6332 (_2!11385 lt!380444)))))))

(declare-fun b!244080 () Bool)

(declare-fun e!169166 () Bool)

(declare-fun array_inv!5601 (array!13367) Bool)

(assert (=> b!244080 (= e!169166 (array_inv!5601 (buf!6332 thiss!1005)))))

(declare-fun b!244081 () Bool)

(assert (=> b!244081 (= e!169169 e!169163)))

(declare-fun res!203969 () Bool)

(assert (=> b!244081 (=> (not res!203969) (not e!169163))))

(assert (=> b!244081 (= res!203969 (and (= (_2!11383 lt!380439) bit!26) (= (_1!11383 lt!380439) (_2!11385 lt!380448))))))

(declare-fun readBitPure!0 (BitStream!10642) tuple2!20922)

(declare-fun readerFrom!0 (BitStream!10642 (_ BitVec 32) (_ BitVec 32)) BitStream!10642)

(assert (=> b!244081 (= lt!380439 (readBitPure!0 (readerFrom!0 (_2!11385 lt!380448) (currentBit!11705 thiss!1005) (currentByte!11710 thiss!1005))))))

(declare-fun b!244082 () Bool)

(declare-fun res!203972 () Bool)

(declare-fun e!169170 () Bool)

(assert (=> b!244082 (=> (not res!203972) (not e!169170))))

(assert (=> b!244082 (= res!203972 (validate_offset_bits!1 ((_ sign_extend 32) (size!5860 (buf!6332 thiss!1005))) ((_ sign_extend 32) (currentByte!11710 thiss!1005)) ((_ sign_extend 32) (currentBit!11705 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!244083 () Bool)

(declare-fun e!169167 () Bool)

(declare-fun lt!380442 () tuple2!20922)

(declare-fun lt!380436 () tuple2!20922)

(assert (=> b!244083 (= e!169167 (= (_2!11383 lt!380442) (_2!11383 lt!380436)))))

(declare-fun b!244084 () Bool)

(assert (=> b!244084 (= e!169170 (not true))))

(declare-fun lt!380447 () tuple2!20922)

(declare-fun lt!380443 () tuple2!20924)

(assert (=> b!244084 (= lt!380447 (checkBitsLoopPure!0 (_1!11384 lt!380443) nBits!297 bit!26 from!289))))

(assert (=> b!244084 (validate_offset_bits!1 ((_ sign_extend 32) (size!5860 (buf!6332 (_2!11385 lt!380444)))) ((_ sign_extend 32) (currentByte!11710 thiss!1005)) ((_ sign_extend 32) (currentBit!11705 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!380437 () Unit!17815)

(assert (=> b!244084 (= lt!380437 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6332 (_2!11385 lt!380444)) (bvsub nBits!297 from!289)))))

(assert (=> b!244084 (= (_2!11383 (readBitPure!0 (_1!11384 lt!380443))) bit!26)))

(declare-fun lt!380438 () tuple2!20924)

(assert (=> b!244084 (= lt!380438 (reader!0 (_2!11385 lt!380448) (_2!11385 lt!380444)))))

(assert (=> b!244084 (= lt!380443 (reader!0 thiss!1005 (_2!11385 lt!380444)))))

(assert (=> b!244084 e!169167))

(declare-fun res!203978 () Bool)

(assert (=> b!244084 (=> (not res!203978) (not e!169167))))

(assert (=> b!244084 (= res!203978 (= (bitIndex!0 (size!5860 (buf!6332 (_1!11383 lt!380442))) (currentByte!11710 (_1!11383 lt!380442)) (currentBit!11705 (_1!11383 lt!380442))) (bitIndex!0 (size!5860 (buf!6332 (_1!11383 lt!380436))) (currentByte!11710 (_1!11383 lt!380436)) (currentBit!11705 (_1!11383 lt!380436)))))))

(declare-fun lt!380445 () Unit!17815)

(declare-fun lt!380446 () BitStream!10642)

(declare-fun readBitPrefixLemma!0 (BitStream!10642 BitStream!10642) Unit!17815)

(assert (=> b!244084 (= lt!380445 (readBitPrefixLemma!0 lt!380446 (_2!11385 lt!380444)))))

(assert (=> b!244084 (= lt!380436 (readBitPure!0 (BitStream!10643 (buf!6332 (_2!11385 lt!380444)) (currentByte!11710 thiss!1005) (currentBit!11705 thiss!1005))))))

(assert (=> b!244084 (= lt!380442 (readBitPure!0 lt!380446))))

(assert (=> b!244084 (= lt!380446 (BitStream!10643 (buf!6332 (_2!11385 lt!380448)) (currentByte!11710 thiss!1005) (currentBit!11705 thiss!1005)))))

(assert (=> b!244084 e!169164))

(declare-fun res!203975 () Bool)

(assert (=> b!244084 (=> (not res!203975) (not e!169164))))

(assert (=> b!244084 (= res!203975 (isPrefixOf!0 thiss!1005 (_2!11385 lt!380444)))))

(declare-fun lt!380440 () Unit!17815)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10642 BitStream!10642 BitStream!10642) Unit!17815)

(assert (=> b!244084 (= lt!380440 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11385 lt!380448) (_2!11385 lt!380444)))))

(declare-fun e!169172 () Bool)

(assert (=> b!244084 e!169172))

(declare-fun res!203967 () Bool)

(assert (=> b!244084 (=> (not res!203967) (not e!169172))))

(assert (=> b!244084 (= res!203967 (= (size!5860 (buf!6332 (_2!11385 lt!380448))) (size!5860 (buf!6332 (_2!11385 lt!380444)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10642 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20926)

(assert (=> b!244084 (= lt!380444 (appendNBitsLoop!0 (_2!11385 lt!380448) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!244084 (validate_offset_bits!1 ((_ sign_extend 32) (size!5860 (buf!6332 (_2!11385 lt!380448)))) ((_ sign_extend 32) (currentByte!11710 (_2!11385 lt!380448))) ((_ sign_extend 32) (currentBit!11705 (_2!11385 lt!380448))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!380433 () Unit!17815)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10642 BitStream!10642 (_ BitVec 64) (_ BitVec 64)) Unit!17815)

(assert (=> b!244084 (= lt!380433 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11385 lt!380448) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!169168 () Bool)

(assert (=> b!244084 e!169168))

(declare-fun res!203979 () Bool)

(assert (=> b!244084 (=> (not res!203979) (not e!169168))))

(assert (=> b!244084 (= res!203979 (= (size!5860 (buf!6332 thiss!1005)) (size!5860 (buf!6332 (_2!11385 lt!380448)))))))

(declare-fun appendBit!0 (BitStream!10642 Bool) tuple2!20926)

(assert (=> b!244084 (= lt!380448 (appendBit!0 thiss!1005 bit!26))))

(declare-fun res!203974 () Bool)

(assert (=> start!52748 (=> (not res!203974) (not e!169170))))

(assert (=> start!52748 (= res!203974 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52748 e!169170))

(assert (=> start!52748 true))

(declare-fun inv!12 (BitStream!10642) Bool)

(assert (=> start!52748 (and (inv!12 thiss!1005) e!169166)))

(declare-fun b!244085 () Bool)

(assert (=> b!244085 (= e!169172 e!169165)))

(declare-fun res!203976 () Bool)

(assert (=> b!244085 (=> (not res!203976) (not e!169165))))

(assert (=> b!244085 (= res!203976 (= (bitIndex!0 (size!5860 (buf!6332 (_2!11385 lt!380444))) (currentByte!11710 (_2!11385 lt!380444)) (currentBit!11705 (_2!11385 lt!380444))) (bvadd (bitIndex!0 (size!5860 (buf!6332 (_2!11385 lt!380448))) (currentByte!11710 (_2!11385 lt!380448)) (currentBit!11705 (_2!11385 lt!380448))) lt!380451)))))

(assert (=> b!244085 (= lt!380451 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!244086 () Bool)

(declare-fun res!203968 () Bool)

(assert (=> b!244086 (=> (not res!203968) (not e!169164))))

(assert (=> b!244086 (= res!203968 (invariant!0 (currentBit!11705 thiss!1005) (currentByte!11710 thiss!1005) (size!5860 (buf!6332 (_2!11385 lt!380448)))))))

(declare-fun b!244087 () Bool)

(declare-fun res!203970 () Bool)

(assert (=> b!244087 (=> (not res!203970) (not e!169170))))

(assert (=> b!244087 (= res!203970 (bvslt from!289 nBits!297))))

(declare-fun b!244088 () Bool)

(assert (=> b!244088 (= e!169168 e!169169)))

(declare-fun res!203973 () Bool)

(assert (=> b!244088 (=> (not res!203973) (not e!169169))))

(declare-fun lt!380450 () (_ BitVec 64))

(assert (=> b!244088 (= res!203973 (= lt!380435 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!380450)))))

(assert (=> b!244088 (= lt!380435 (bitIndex!0 (size!5860 (buf!6332 (_2!11385 lt!380448))) (currentByte!11710 (_2!11385 lt!380448)) (currentBit!11705 (_2!11385 lt!380448))))))

(assert (=> b!244088 (= lt!380450 (bitIndex!0 (size!5860 (buf!6332 thiss!1005)) (currentByte!11710 thiss!1005) (currentBit!11705 thiss!1005)))))

(assert (= (and start!52748 res!203974) b!244082))

(assert (= (and b!244082 res!203972) b!244087))

(assert (= (and b!244087 res!203970) b!244084))

(assert (= (and b!244084 res!203979) b!244088))

(assert (= (and b!244088 res!203973) b!244078))

(assert (= (and b!244078 res!203971) b!244081))

(assert (= (and b!244081 res!203969) b!244076))

(assert (= (and b!244084 res!203967) b!244085))

(assert (= (and b!244085 res!203976) b!244077))

(assert (= (and b!244077 res!203977) b!244075))

(assert (= (and b!244084 res!203975) b!244086))

(assert (= (and b!244086 res!203968) b!244079))

(assert (= (and b!244084 res!203978) b!244083))

(assert (= start!52748 b!244080))

(declare-fun m!367823 () Bool)

(assert (=> b!244085 m!367823))

(declare-fun m!367825 () Bool)

(assert (=> b!244085 m!367825))

(declare-fun m!367827 () Bool)

(assert (=> b!244082 m!367827))

(assert (=> b!244088 m!367825))

(declare-fun m!367829 () Bool)

(assert (=> b!244088 m!367829))

(declare-fun m!367831 () Bool)

(assert (=> b!244076 m!367831))

(declare-fun m!367833 () Bool)

(assert (=> b!244084 m!367833))

(declare-fun m!367835 () Bool)

(assert (=> b!244084 m!367835))

(declare-fun m!367837 () Bool)

(assert (=> b!244084 m!367837))

(declare-fun m!367839 () Bool)

(assert (=> b!244084 m!367839))

(declare-fun m!367841 () Bool)

(assert (=> b!244084 m!367841))

(declare-fun m!367843 () Bool)

(assert (=> b!244084 m!367843))

(declare-fun m!367845 () Bool)

(assert (=> b!244084 m!367845))

(declare-fun m!367847 () Bool)

(assert (=> b!244084 m!367847))

(declare-fun m!367849 () Bool)

(assert (=> b!244084 m!367849))

(declare-fun m!367851 () Bool)

(assert (=> b!244084 m!367851))

(declare-fun m!367853 () Bool)

(assert (=> b!244084 m!367853))

(declare-fun m!367855 () Bool)

(assert (=> b!244084 m!367855))

(declare-fun m!367857 () Bool)

(assert (=> b!244084 m!367857))

(declare-fun m!367859 () Bool)

(assert (=> b!244084 m!367859))

(declare-fun m!367861 () Bool)

(assert (=> b!244084 m!367861))

(declare-fun m!367863 () Bool)

(assert (=> b!244084 m!367863))

(declare-fun m!367865 () Bool)

(assert (=> b!244084 m!367865))

(declare-fun m!367867 () Bool)

(assert (=> b!244080 m!367867))

(declare-fun m!367869 () Bool)

(assert (=> b!244079 m!367869))

(declare-fun m!367871 () Bool)

(assert (=> b!244086 m!367871))

(declare-fun m!367873 () Bool)

(assert (=> b!244081 m!367873))

(assert (=> b!244081 m!367873))

(declare-fun m!367875 () Bool)

(assert (=> b!244081 m!367875))

(declare-fun m!367877 () Bool)

(assert (=> b!244075 m!367877))

(declare-fun m!367879 () Bool)

(assert (=> b!244075 m!367879))

(declare-fun m!367881 () Bool)

(assert (=> b!244075 m!367881))

(assert (=> b!244075 m!367857))

(declare-fun m!367883 () Bool)

(assert (=> start!52748 m!367883))

(declare-fun m!367885 () Bool)

(assert (=> b!244078 m!367885))

(declare-fun m!367887 () Bool)

(assert (=> b!244077 m!367887))

(push 1)

(assert (not start!52748))

(assert (not b!244086))

(assert (not b!244081))

(assert (not b!244076))

(assert (not b!244084))

(assert (not b!244079))

(assert (not b!244077))

(assert (not b!244075))

(assert (not b!244078))

(assert (not b!244085))

(assert (not b!244080))

(assert (not b!244088))

(assert (not b!244082))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

