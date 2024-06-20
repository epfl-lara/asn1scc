; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52488 () Bool)

(assert start!52488)

(declare-fun b!242263 () Bool)

(declare-fun res!202301 () Bool)

(declare-fun e!167954 () Bool)

(assert (=> b!242263 (=> res!202301 e!167954)))

(declare-datatypes ((array!13299 0))(
  ( (array!13300 (arr!6816 (Array (_ BitVec 32) (_ BitVec 8))) (size!5829 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10580 0))(
  ( (BitStream!10581 (buf!6295 array!13299) (currentByte!11658 (_ BitVec 32)) (currentBit!11653 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17741 0))(
  ( (Unit!17742) )
))
(declare-datatypes ((tuple2!20724 0))(
  ( (tuple2!20725 (_1!11284 Unit!17741) (_2!11284 BitStream!10580)) )
))
(declare-fun lt!377681 () tuple2!20724)

(declare-fun lt!377670 () tuple2!20724)

(declare-fun thiss!1005 () BitStream!10580)

(declare-fun arrayBitRangesEq!0 (array!13299 array!13299 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!242263 (= res!202301 (not (arrayBitRangesEq!0 (buf!6295 (_2!11284 lt!377681)) (buf!6295 (_2!11284 lt!377670)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!5829 (buf!6295 (_2!11284 lt!377681))) (currentByte!11658 thiss!1005) (currentBit!11653 thiss!1005))))))))

(declare-fun b!242264 () Bool)

(declare-fun e!167958 () Bool)

(declare-datatypes ((tuple2!20726 0))(
  ( (tuple2!20727 (_1!11285 BitStream!10580) (_2!11285 Bool)) )
))
(declare-fun lt!377682 () tuple2!20726)

(declare-fun lt!377679 () (_ BitVec 64))

(assert (=> b!242264 (= e!167958 (= (bitIndex!0 (size!5829 (buf!6295 (_1!11285 lt!377682))) (currentByte!11658 (_1!11285 lt!377682)) (currentBit!11653 (_1!11285 lt!377682))) lt!377679))))

(declare-fun b!242266 () Bool)

(declare-fun e!167955 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!242266 (= e!167955 (invariant!0 (currentBit!11653 thiss!1005) (currentByte!11658 thiss!1005) (size!5829 (buf!6295 (_2!11284 lt!377681)))))))

(declare-fun b!242267 () Bool)

(assert (=> b!242267 (= e!167954 true)))

(declare-fun lt!377680 () tuple2!20726)

(declare-fun readBitPure!0 (BitStream!10580) tuple2!20726)

(assert (=> b!242267 (= lt!377680 (readBitPure!0 (BitStream!10581 (buf!6295 (_2!11284 lt!377670)) (currentByte!11658 thiss!1005) (currentBit!11653 thiss!1005))))))

(declare-fun lt!377676 () tuple2!20726)

(assert (=> b!242267 (= lt!377676 (readBitPure!0 (BitStream!10581 (buf!6295 (_2!11284 lt!377681)) (currentByte!11658 thiss!1005) (currentBit!11653 thiss!1005))))))

(assert (=> b!242267 (invariant!0 (currentBit!11653 thiss!1005) (currentByte!11658 thiss!1005) (size!5829 (buf!6295 (_2!11284 lt!377670))))))

(declare-fun b!242268 () Bool)

(declare-fun e!167959 () Bool)

(assert (=> b!242268 (= e!167959 e!167958)))

(declare-fun res!202308 () Bool)

(assert (=> b!242268 (=> (not res!202308) (not e!167958))))

(declare-fun bit!26 () Bool)

(assert (=> b!242268 (= res!202308 (and (= (_2!11285 lt!377682) bit!26) (= (_1!11285 lt!377682) (_2!11284 lt!377681))))))

(declare-fun readerFrom!0 (BitStream!10580 (_ BitVec 32) (_ BitVec 32)) BitStream!10580)

(assert (=> b!242268 (= lt!377682 (readBitPure!0 (readerFrom!0 (_2!11284 lt!377681) (currentBit!11653 thiss!1005) (currentByte!11658 thiss!1005))))))

(declare-fun b!242269 () Bool)

(declare-fun res!202296 () Bool)

(declare-fun e!167953 () Bool)

(assert (=> b!242269 (=> (not res!202296) (not e!167953))))

(declare-fun isPrefixOf!0 (BitStream!10580 BitStream!10580) Bool)

(assert (=> b!242269 (= res!202296 (isPrefixOf!0 (_2!11284 lt!377681) (_2!11284 lt!377670)))))

(declare-fun b!242270 () Bool)

(declare-fun e!167956 () Bool)

(declare-fun array_inv!5570 (array!13299) Bool)

(assert (=> b!242270 (= e!167956 (array_inv!5570 (buf!6295 thiss!1005)))))

(declare-fun b!242271 () Bool)

(declare-fun e!167952 () Bool)

(assert (=> b!242271 (= e!167952 (not e!167954))))

(declare-fun res!202304 () Bool)

(assert (=> b!242271 (=> res!202304 e!167954)))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!242271 (= res!202304 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!5829 (buf!6295 (_2!11284 lt!377681)))) ((_ sign_extend 32) (currentByte!11658 thiss!1005)) ((_ sign_extend 32) (currentBit!11653 thiss!1005)))))))

(assert (=> b!242271 e!167955))

(declare-fun res!202303 () Bool)

(assert (=> b!242271 (=> (not res!202303) (not e!167955))))

(assert (=> b!242271 (= res!202303 (isPrefixOf!0 thiss!1005 (_2!11284 lt!377670)))))

(declare-fun lt!377675 () Unit!17741)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10580 BitStream!10580 BitStream!10580) Unit!17741)

(assert (=> b!242271 (= lt!377675 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11284 lt!377681) (_2!11284 lt!377670)))))

(declare-fun e!167960 () Bool)

(assert (=> b!242271 e!167960))

(declare-fun res!202300 () Bool)

(assert (=> b!242271 (=> (not res!202300) (not e!167960))))

(assert (=> b!242271 (= res!202300 (= (size!5829 (buf!6295 (_2!11284 lt!377681))) (size!5829 (buf!6295 (_2!11284 lt!377670)))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun appendNBitsLoop!0 (BitStream!10580 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20724)

(assert (=> b!242271 (= lt!377670 (appendNBitsLoop!0 (_2!11284 lt!377681) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!242271 (validate_offset_bits!1 ((_ sign_extend 32) (size!5829 (buf!6295 (_2!11284 lt!377681)))) ((_ sign_extend 32) (currentByte!11658 (_2!11284 lt!377681))) ((_ sign_extend 32) (currentBit!11653 (_2!11284 lt!377681))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!377673 () Unit!17741)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10580 BitStream!10580 (_ BitVec 64) (_ BitVec 64)) Unit!17741)

(assert (=> b!242271 (= lt!377673 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11284 lt!377681) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!167957 () Bool)

(assert (=> b!242271 e!167957))

(declare-fun res!202305 () Bool)

(assert (=> b!242271 (=> (not res!202305) (not e!167957))))

(assert (=> b!242271 (= res!202305 (= (size!5829 (buf!6295 thiss!1005)) (size!5829 (buf!6295 (_2!11284 lt!377681)))))))

(declare-fun appendBit!0 (BitStream!10580 Bool) tuple2!20724)

(assert (=> b!242271 (= lt!377681 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!242272 () Bool)

(declare-fun res!202307 () Bool)

(assert (=> b!242272 (=> (not res!202307) (not e!167952))))

(assert (=> b!242272 (= res!202307 (bvslt from!289 nBits!297))))

(declare-fun b!242273 () Bool)

(declare-fun lt!377674 () tuple2!20726)

(declare-datatypes ((tuple2!20728 0))(
  ( (tuple2!20729 (_1!11286 BitStream!10580) (_2!11286 BitStream!10580)) )
))
(declare-fun lt!377671 () tuple2!20728)

(assert (=> b!242273 (= e!167953 (not (or (not (_2!11285 lt!377674)) (not (= (_1!11285 lt!377674) (_2!11286 lt!377671))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10580 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20726)

(assert (=> b!242273 (= lt!377674 (checkBitsLoopPure!0 (_1!11286 lt!377671) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!377677 () (_ BitVec 64))

(assert (=> b!242273 (validate_offset_bits!1 ((_ sign_extend 32) (size!5829 (buf!6295 (_2!11284 lt!377670)))) ((_ sign_extend 32) (currentByte!11658 (_2!11284 lt!377681))) ((_ sign_extend 32) (currentBit!11653 (_2!11284 lt!377681))) lt!377677)))

(declare-fun lt!377672 () Unit!17741)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10580 array!13299 (_ BitVec 64)) Unit!17741)

(assert (=> b!242273 (= lt!377672 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11284 lt!377681) (buf!6295 (_2!11284 lt!377670)) lt!377677))))

(declare-fun reader!0 (BitStream!10580 BitStream!10580) tuple2!20728)

(assert (=> b!242273 (= lt!377671 (reader!0 (_2!11284 lt!377681) (_2!11284 lt!377670)))))

(declare-fun b!242274 () Bool)

(declare-fun res!202298 () Bool)

(assert (=> b!242274 (=> (not res!202298) (not e!167952))))

(assert (=> b!242274 (= res!202298 (validate_offset_bits!1 ((_ sign_extend 32) (size!5829 (buf!6295 thiss!1005))) ((_ sign_extend 32) (currentByte!11658 thiss!1005)) ((_ sign_extend 32) (currentBit!11653 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!242275 () Bool)

(declare-fun res!202302 () Bool)

(assert (=> b!242275 (=> (not res!202302) (not e!167959))))

(assert (=> b!242275 (= res!202302 (isPrefixOf!0 thiss!1005 (_2!11284 lt!377681)))))

(declare-fun b!242276 () Bool)

(assert (=> b!242276 (= e!167960 e!167953)))

(declare-fun res!202297 () Bool)

(assert (=> b!242276 (=> (not res!202297) (not e!167953))))

(assert (=> b!242276 (= res!202297 (= (bitIndex!0 (size!5829 (buf!6295 (_2!11284 lt!377670))) (currentByte!11658 (_2!11284 lt!377670)) (currentBit!11653 (_2!11284 lt!377670))) (bvadd (bitIndex!0 (size!5829 (buf!6295 (_2!11284 lt!377681))) (currentByte!11658 (_2!11284 lt!377681)) (currentBit!11653 (_2!11284 lt!377681))) lt!377677)))))

(assert (=> b!242276 (= lt!377677 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!242265 () Bool)

(assert (=> b!242265 (= e!167957 e!167959)))

(declare-fun res!202306 () Bool)

(assert (=> b!242265 (=> (not res!202306) (not e!167959))))

(declare-fun lt!377678 () (_ BitVec 64))

(assert (=> b!242265 (= res!202306 (= lt!377679 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!377678)))))

(assert (=> b!242265 (= lt!377679 (bitIndex!0 (size!5829 (buf!6295 (_2!11284 lt!377681))) (currentByte!11658 (_2!11284 lt!377681)) (currentBit!11653 (_2!11284 lt!377681))))))

(assert (=> b!242265 (= lt!377678 (bitIndex!0 (size!5829 (buf!6295 thiss!1005)) (currentByte!11658 thiss!1005) (currentBit!11653 thiss!1005)))))

(declare-fun res!202299 () Bool)

(assert (=> start!52488 (=> (not res!202299) (not e!167952))))

(assert (=> start!52488 (= res!202299 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52488 e!167952))

(assert (=> start!52488 true))

(declare-fun inv!12 (BitStream!10580) Bool)

(assert (=> start!52488 (and (inv!12 thiss!1005) e!167956)))

(assert (= (and start!52488 res!202299) b!242274))

(assert (= (and b!242274 res!202298) b!242272))

(assert (= (and b!242272 res!202307) b!242271))

(assert (= (and b!242271 res!202305) b!242265))

(assert (= (and b!242265 res!202306) b!242275))

(assert (= (and b!242275 res!202302) b!242268))

(assert (= (and b!242268 res!202308) b!242264))

(assert (= (and b!242271 res!202300) b!242276))

(assert (= (and b!242276 res!202297) b!242269))

(assert (= (and b!242269 res!202296) b!242273))

(assert (= (and b!242271 res!202303) b!242266))

(assert (= (and b!242271 (not res!202304)) b!242263))

(assert (= (and b!242263 (not res!202301)) b!242267))

(assert (= start!52488 b!242270))

(declare-fun m!365043 () Bool)

(assert (=> b!242273 m!365043))

(declare-fun m!365045 () Bool)

(assert (=> b!242273 m!365045))

(declare-fun m!365047 () Bool)

(assert (=> b!242273 m!365047))

(declare-fun m!365049 () Bool)

(assert (=> b!242273 m!365049))

(declare-fun m!365051 () Bool)

(assert (=> start!52488 m!365051))

(declare-fun m!365053 () Bool)

(assert (=> b!242268 m!365053))

(assert (=> b!242268 m!365053))

(declare-fun m!365055 () Bool)

(assert (=> b!242268 m!365055))

(declare-fun m!365057 () Bool)

(assert (=> b!242263 m!365057))

(declare-fun m!365059 () Bool)

(assert (=> b!242263 m!365059))

(declare-fun m!365061 () Bool)

(assert (=> b!242264 m!365061))

(declare-fun m!365063 () Bool)

(assert (=> b!242271 m!365063))

(declare-fun m!365065 () Bool)

(assert (=> b!242271 m!365065))

(declare-fun m!365067 () Bool)

(assert (=> b!242271 m!365067))

(declare-fun m!365069 () Bool)

(assert (=> b!242271 m!365069))

(declare-fun m!365071 () Bool)

(assert (=> b!242271 m!365071))

(declare-fun m!365073 () Bool)

(assert (=> b!242271 m!365073))

(declare-fun m!365075 () Bool)

(assert (=> b!242271 m!365075))

(declare-fun m!365077 () Bool)

(assert (=> b!242276 m!365077))

(declare-fun m!365079 () Bool)

(assert (=> b!242276 m!365079))

(declare-fun m!365081 () Bool)

(assert (=> b!242270 m!365081))

(declare-fun m!365083 () Bool)

(assert (=> b!242274 m!365083))

(declare-fun m!365085 () Bool)

(assert (=> b!242275 m!365085))

(declare-fun m!365087 () Bool)

(assert (=> b!242266 m!365087))

(declare-fun m!365089 () Bool)

(assert (=> b!242269 m!365089))

(declare-fun m!365091 () Bool)

(assert (=> b!242267 m!365091))

(declare-fun m!365093 () Bool)

(assert (=> b!242267 m!365093))

(declare-fun m!365095 () Bool)

(assert (=> b!242267 m!365095))

(assert (=> b!242265 m!365079))

(declare-fun m!365097 () Bool)

(assert (=> b!242265 m!365097))

(push 1)

(assert (not b!242264))

(assert (not b!242268))

(assert (not start!52488))

(assert (not b!242266))

(assert (not b!242267))

(assert (not b!242270))

(assert (not b!242263))

(assert (not b!242271))

(assert (not b!242269))

(assert (not b!242265))

(assert (not b!242275))

(assert (not b!242273))

(assert (not b!242274))

(assert (not b!242276))

(check-sat)

