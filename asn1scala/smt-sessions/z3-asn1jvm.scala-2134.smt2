; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54086 () Bool)

(assert start!54086)

(declare-fun b!252082 () Bool)

(declare-fun e!174679 () Bool)

(declare-fun e!174676 () Bool)

(assert (=> b!252082 (= e!174679 e!174676)))

(declare-fun res!211168 () Bool)

(assert (=> b!252082 (=> (not res!211168) (not e!174676))))

(declare-datatypes ((array!13710 0))(
  ( (array!13711 (arr!7001 (Array (_ BitVec 32) (_ BitVec 8))) (size!6014 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10950 0))(
  ( (BitStream!10951 (buf!6516 array!13710) (currentByte!11971 (_ BitVec 32)) (currentBit!11966 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!18176 0))(
  ( (Unit!18177) )
))
(declare-datatypes ((tuple2!21654 0))(
  ( (tuple2!21655 (_1!11755 Unit!18176) (_2!11755 BitStream!10950)) )
))
(declare-fun lt!391605 () tuple2!21654)

(declare-fun lt!391594 () tuple2!21654)

(declare-fun lt!391586 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!252082 (= res!211168 (= (bitIndex!0 (size!6014 (buf!6516 (_2!11755 lt!391605))) (currentByte!11971 (_2!11755 lt!391605)) (currentBit!11966 (_2!11755 lt!391605))) (bvadd (bitIndex!0 (size!6014 (buf!6516 (_2!11755 lt!391594))) (currentByte!11971 (_2!11755 lt!391594)) (currentBit!11966 (_2!11755 lt!391594))) lt!391586)))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!252082 (= lt!391586 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!252083 () Bool)

(declare-fun e!174672 () Bool)

(declare-fun thiss!1005 () BitStream!10950)

(declare-fun array_inv!5755 (array!13710) Bool)

(assert (=> b!252083 (= e!174672 (array_inv!5755 (buf!6516 thiss!1005)))))

(declare-fun res!211173 () Bool)

(declare-fun e!174671 () Bool)

(assert (=> start!54086 (=> (not res!211173) (not e!174671))))

(assert (=> start!54086 (= res!211173 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54086 e!174671))

(assert (=> start!54086 true))

(declare-fun inv!12 (BitStream!10950) Bool)

(assert (=> start!54086 (and (inv!12 thiss!1005) e!174672)))

(declare-fun b!252084 () Bool)

(declare-fun res!211163 () Bool)

(declare-fun e!174673 () Bool)

(assert (=> b!252084 (=> (not res!211163) (not e!174673))))

(declare-fun isPrefixOf!0 (BitStream!10950 BitStream!10950) Bool)

(assert (=> b!252084 (= res!211163 (isPrefixOf!0 thiss!1005 (_2!11755 lt!391594)))))

(declare-fun b!252085 () Bool)

(declare-fun res!211164 () Bool)

(declare-fun e!174678 () Bool)

(assert (=> b!252085 (=> (not res!211164) (not e!174678))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!252085 (= res!211164 (invariant!0 (currentBit!11966 thiss!1005) (currentByte!11971 thiss!1005) (size!6014 (buf!6516 (_2!11755 lt!391594)))))))

(declare-fun b!252086 () Bool)

(declare-fun e!174677 () Bool)

(assert (=> b!252086 (= e!174677 e!174673)))

(declare-fun res!211167 () Bool)

(assert (=> b!252086 (=> (not res!211167) (not e!174673))))

(declare-fun lt!391599 () (_ BitVec 64))

(declare-fun lt!391593 () (_ BitVec 64))

(assert (=> b!252086 (= res!211167 (= lt!391599 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!391593)))))

(assert (=> b!252086 (= lt!391599 (bitIndex!0 (size!6014 (buf!6516 (_2!11755 lt!391594))) (currentByte!11971 (_2!11755 lt!391594)) (currentBit!11966 (_2!11755 lt!391594))))))

(assert (=> b!252086 (= lt!391593 (bitIndex!0 (size!6014 (buf!6516 thiss!1005)) (currentByte!11971 thiss!1005) (currentBit!11966 thiss!1005)))))

(declare-fun b!252087 () Bool)

(declare-fun res!211172 () Bool)

(assert (=> b!252087 (=> (not res!211172) (not e!174671))))

(assert (=> b!252087 (= res!211172 (bvslt from!289 nBits!297))))

(declare-fun b!252088 () Bool)

(declare-fun res!211166 () Bool)

(assert (=> b!252088 (=> (not res!211166) (not e!174676))))

(assert (=> b!252088 (= res!211166 (isPrefixOf!0 (_2!11755 lt!391594) (_2!11755 lt!391605)))))

(declare-fun b!252089 () Bool)

(declare-fun e!174680 () Bool)

(declare-datatypes ((tuple2!21656 0))(
  ( (tuple2!21657 (_1!11756 BitStream!10950) (_2!11756 Bool)) )
))
(declare-fun lt!391587 () tuple2!21656)

(declare-fun lt!391603 () tuple2!21656)

(assert (=> b!252089 (= e!174680 (= (_2!11756 lt!391587) (_2!11756 lt!391603)))))

(declare-fun b!252090 () Bool)

(declare-fun lt!391596 () tuple2!21656)

(declare-datatypes ((tuple2!21658 0))(
  ( (tuple2!21659 (_1!11757 BitStream!10950) (_2!11757 BitStream!10950)) )
))
(declare-fun lt!391604 () tuple2!21658)

(assert (=> b!252090 (= e!174676 (not (or (not (_2!11756 lt!391596)) (not (= (_1!11756 lt!391596) (_2!11757 lt!391604))))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10950 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21656)

(assert (=> b!252090 (= lt!391596 (checkBitsLoopPure!0 (_1!11757 lt!391604) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!252090 (validate_offset_bits!1 ((_ sign_extend 32) (size!6014 (buf!6516 (_2!11755 lt!391605)))) ((_ sign_extend 32) (currentByte!11971 (_2!11755 lt!391594))) ((_ sign_extend 32) (currentBit!11966 (_2!11755 lt!391594))) lt!391586)))

(declare-fun lt!391601 () Unit!18176)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10950 array!13710 (_ BitVec 64)) Unit!18176)

(assert (=> b!252090 (= lt!391601 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11755 lt!391594) (buf!6516 (_2!11755 lt!391605)) lt!391586))))

(declare-fun reader!0 (BitStream!10950 BitStream!10950) tuple2!21658)

(assert (=> b!252090 (= lt!391604 (reader!0 (_2!11755 lt!391594) (_2!11755 lt!391605)))))

(declare-fun b!252091 () Bool)

(declare-fun e!174674 () Bool)

(declare-fun lt!391595 () tuple2!21656)

(assert (=> b!252091 (= e!174674 (= (bitIndex!0 (size!6014 (buf!6516 (_1!11756 lt!391595))) (currentByte!11971 (_1!11756 lt!391595)) (currentBit!11966 (_1!11756 lt!391595))) lt!391599))))

(declare-fun b!252092 () Bool)

(assert (=> b!252092 (= e!174678 (invariant!0 (currentBit!11966 thiss!1005) (currentByte!11971 thiss!1005) (size!6014 (buf!6516 (_2!11755 lt!391605)))))))

(declare-fun b!252093 () Bool)

(declare-fun res!211165 () Bool)

(assert (=> b!252093 (=> (not res!211165) (not e!174671))))

(assert (=> b!252093 (= res!211165 (validate_offset_bits!1 ((_ sign_extend 32) (size!6014 (buf!6516 thiss!1005))) ((_ sign_extend 32) (currentByte!11971 thiss!1005)) ((_ sign_extend 32) (currentBit!11966 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!252094 () Bool)

(assert (=> b!252094 (= e!174673 e!174674)))

(declare-fun res!211161 () Bool)

(assert (=> b!252094 (=> (not res!211161) (not e!174674))))

(assert (=> b!252094 (= res!211161 (and (= (_2!11756 lt!391595) bit!26) (= (_1!11756 lt!391595) (_2!11755 lt!391594))))))

(declare-fun readBitPure!0 (BitStream!10950) tuple2!21656)

(declare-fun readerFrom!0 (BitStream!10950 (_ BitVec 32) (_ BitVec 32)) BitStream!10950)

(assert (=> b!252094 (= lt!391595 (readBitPure!0 (readerFrom!0 (_2!11755 lt!391594) (currentBit!11966 thiss!1005) (currentByte!11971 thiss!1005))))))

(declare-fun b!252095 () Bool)

(declare-fun lt!391589 () (_ BitVec 64))

(declare-fun lt!391598 () (_ BitVec 64))

(assert (=> b!252095 (= e!174671 (not (or (= lt!391589 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!391589 (bvand lt!391598 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!252095 (= lt!391589 (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!391585 () tuple2!21658)

(declare-fun lt!391588 () tuple2!21656)

(assert (=> b!252095 (= lt!391588 (checkBitsLoopPure!0 (_1!11757 lt!391585) nBits!297 bit!26 from!289))))

(assert (=> b!252095 (validate_offset_bits!1 ((_ sign_extend 32) (size!6014 (buf!6516 (_2!11755 lt!391605)))) ((_ sign_extend 32) (currentByte!11971 thiss!1005)) ((_ sign_extend 32) (currentBit!11966 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!391602 () Unit!18176)

(assert (=> b!252095 (= lt!391602 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6516 (_2!11755 lt!391605)) (bvsub nBits!297 from!289)))))

(assert (=> b!252095 (= (_2!11756 (readBitPure!0 (_1!11757 lt!391585))) bit!26)))

(declare-fun lt!391590 () tuple2!21658)

(assert (=> b!252095 (= lt!391590 (reader!0 (_2!11755 lt!391594) (_2!11755 lt!391605)))))

(assert (=> b!252095 (= lt!391585 (reader!0 thiss!1005 (_2!11755 lt!391605)))))

(assert (=> b!252095 e!174680))

(declare-fun res!211169 () Bool)

(assert (=> b!252095 (=> (not res!211169) (not e!174680))))

(assert (=> b!252095 (= res!211169 (= (bitIndex!0 (size!6014 (buf!6516 (_1!11756 lt!391587))) (currentByte!11971 (_1!11756 lt!391587)) (currentBit!11966 (_1!11756 lt!391587))) (bitIndex!0 (size!6014 (buf!6516 (_1!11756 lt!391603))) (currentByte!11971 (_1!11756 lt!391603)) (currentBit!11966 (_1!11756 lt!391603)))))))

(declare-fun lt!391600 () Unit!18176)

(declare-fun lt!391597 () BitStream!10950)

(declare-fun readBitPrefixLemma!0 (BitStream!10950 BitStream!10950) Unit!18176)

(assert (=> b!252095 (= lt!391600 (readBitPrefixLemma!0 lt!391597 (_2!11755 lt!391605)))))

(assert (=> b!252095 (= lt!391603 (readBitPure!0 (BitStream!10951 (buf!6516 (_2!11755 lt!391605)) (currentByte!11971 thiss!1005) (currentBit!11966 thiss!1005))))))

(assert (=> b!252095 (= lt!391587 (readBitPure!0 lt!391597))))

(assert (=> b!252095 (= lt!391597 (BitStream!10951 (buf!6516 (_2!11755 lt!391594)) (currentByte!11971 thiss!1005) (currentBit!11966 thiss!1005)))))

(assert (=> b!252095 e!174678))

(declare-fun res!211170 () Bool)

(assert (=> b!252095 (=> (not res!211170) (not e!174678))))

(assert (=> b!252095 (= res!211170 (isPrefixOf!0 thiss!1005 (_2!11755 lt!391605)))))

(declare-fun lt!391591 () Unit!18176)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10950 BitStream!10950 BitStream!10950) Unit!18176)

(assert (=> b!252095 (= lt!391591 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11755 lt!391594) (_2!11755 lt!391605)))))

(assert (=> b!252095 e!174679))

(declare-fun res!211162 () Bool)

(assert (=> b!252095 (=> (not res!211162) (not e!174679))))

(assert (=> b!252095 (= res!211162 (= (size!6014 (buf!6516 (_2!11755 lt!391594))) (size!6014 (buf!6516 (_2!11755 lt!391605)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10950 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21654)

(assert (=> b!252095 (= lt!391605 (appendNBitsLoop!0 (_2!11755 lt!391594) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!252095 (validate_offset_bits!1 ((_ sign_extend 32) (size!6014 (buf!6516 (_2!11755 lt!391594)))) ((_ sign_extend 32) (currentByte!11971 (_2!11755 lt!391594))) ((_ sign_extend 32) (currentBit!11966 (_2!11755 lt!391594))) lt!391598)))

(assert (=> b!252095 (= lt!391598 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!391592 () Unit!18176)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10950 BitStream!10950 (_ BitVec 64) (_ BitVec 64)) Unit!18176)

(assert (=> b!252095 (= lt!391592 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11755 lt!391594) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!252095 e!174677))

(declare-fun res!211171 () Bool)

(assert (=> b!252095 (=> (not res!211171) (not e!174677))))

(assert (=> b!252095 (= res!211171 (= (size!6014 (buf!6516 thiss!1005)) (size!6014 (buf!6516 (_2!11755 lt!391594)))))))

(declare-fun appendBit!0 (BitStream!10950 Bool) tuple2!21654)

(assert (=> b!252095 (= lt!391594 (appendBit!0 thiss!1005 bit!26))))

(assert (= (and start!54086 res!211173) b!252093))

(assert (= (and b!252093 res!211165) b!252087))

(assert (= (and b!252087 res!211172) b!252095))

(assert (= (and b!252095 res!211171) b!252086))

(assert (= (and b!252086 res!211167) b!252084))

(assert (= (and b!252084 res!211163) b!252094))

(assert (= (and b!252094 res!211161) b!252091))

(assert (= (and b!252095 res!211162) b!252082))

(assert (= (and b!252082 res!211168) b!252088))

(assert (= (and b!252088 res!211166) b!252090))

(assert (= (and b!252095 res!211170) b!252085))

(assert (= (and b!252085 res!211164) b!252092))

(assert (= (and b!252095 res!211169) b!252089))

(assert (= start!54086 b!252083))

(declare-fun m!379251 () Bool)

(assert (=> b!252082 m!379251))

(declare-fun m!379253 () Bool)

(assert (=> b!252082 m!379253))

(declare-fun m!379255 () Bool)

(assert (=> start!54086 m!379255))

(declare-fun m!379257 () Bool)

(assert (=> b!252083 m!379257))

(declare-fun m!379259 () Bool)

(assert (=> b!252091 m!379259))

(declare-fun m!379261 () Bool)

(assert (=> b!252095 m!379261))

(declare-fun m!379263 () Bool)

(assert (=> b!252095 m!379263))

(declare-fun m!379265 () Bool)

(assert (=> b!252095 m!379265))

(declare-fun m!379267 () Bool)

(assert (=> b!252095 m!379267))

(declare-fun m!379269 () Bool)

(assert (=> b!252095 m!379269))

(declare-fun m!379271 () Bool)

(assert (=> b!252095 m!379271))

(declare-fun m!379273 () Bool)

(assert (=> b!252095 m!379273))

(declare-fun m!379275 () Bool)

(assert (=> b!252095 m!379275))

(declare-fun m!379277 () Bool)

(assert (=> b!252095 m!379277))

(declare-fun m!379279 () Bool)

(assert (=> b!252095 m!379279))

(declare-fun m!379281 () Bool)

(assert (=> b!252095 m!379281))

(declare-fun m!379283 () Bool)

(assert (=> b!252095 m!379283))

(declare-fun m!379285 () Bool)

(assert (=> b!252095 m!379285))

(declare-fun m!379287 () Bool)

(assert (=> b!252095 m!379287))

(declare-fun m!379289 () Bool)

(assert (=> b!252095 m!379289))

(declare-fun m!379291 () Bool)

(assert (=> b!252095 m!379291))

(declare-fun m!379293 () Bool)

(assert (=> b!252095 m!379293))

(declare-fun m!379295 () Bool)

(assert (=> b!252092 m!379295))

(declare-fun m!379297 () Bool)

(assert (=> b!252094 m!379297))

(assert (=> b!252094 m!379297))

(declare-fun m!379299 () Bool)

(assert (=> b!252094 m!379299))

(assert (=> b!252086 m!379253))

(declare-fun m!379301 () Bool)

(assert (=> b!252086 m!379301))

(declare-fun m!379303 () Bool)

(assert (=> b!252084 m!379303))

(declare-fun m!379305 () Bool)

(assert (=> b!252090 m!379305))

(declare-fun m!379307 () Bool)

(assert (=> b!252090 m!379307))

(declare-fun m!379309 () Bool)

(assert (=> b!252090 m!379309))

(assert (=> b!252090 m!379291))

(declare-fun m!379311 () Bool)

(assert (=> b!252088 m!379311))

(declare-fun m!379313 () Bool)

(assert (=> b!252085 m!379313))

(declare-fun m!379315 () Bool)

(assert (=> b!252093 m!379315))

(check-sat (not b!252088) (not b!252090) (not b!252084) (not b!252082) (not b!252083) (not b!252091) (not b!252092) (not start!54086) (not b!252085) (not b!252086) (not b!252093) (not b!252095) (not b!252094))
(check-sat)
