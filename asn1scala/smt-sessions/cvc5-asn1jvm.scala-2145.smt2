; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54636 () Bool)

(assert start!54636)

(declare-fun b!255625 () Bool)

(declare-fun e!177087 () Bool)

(declare-datatypes ((array!13783 0))(
  ( (array!13784 (arr!7033 (Array (_ BitVec 32) (_ BitVec 8))) (size!6046 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11014 0))(
  ( (BitStream!11015 (buf!6563 array!13783) (currentByte!12042 (_ BitVec 32)) (currentBit!12037 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!21864 0))(
  ( (tuple2!21865 (_1!11866 BitStream!11014) (_2!11866 Bool)) )
))
(declare-fun lt!397002 () tuple2!21864)

(declare-datatypes ((tuple2!21866 0))(
  ( (tuple2!21867 (_1!11867 BitStream!11014) (_2!11867 BitStream!11014)) )
))
(declare-fun lt!397001 () tuple2!21866)

(assert (=> b!255625 (= e!177087 (not (or (not (_2!11866 lt!397002)) (not (= (_1!11866 lt!397002) (_2!11867 lt!397001))))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun bit!26 () Bool)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!11014 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21864)

(assert (=> b!255625 (= lt!397002 (checkBitsLoopPure!0 (_1!11867 lt!397001) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-datatypes ((Unit!18300 0))(
  ( (Unit!18301) )
))
(declare-datatypes ((tuple2!21868 0))(
  ( (tuple2!21869 (_1!11868 Unit!18300) (_2!11868 BitStream!11014)) )
))
(declare-fun lt!396999 () tuple2!21868)

(declare-fun lt!397006 () tuple2!21868)

(declare-fun lt!397000 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!255625 (validate_offset_bits!1 ((_ sign_extend 32) (size!6046 (buf!6563 (_2!11868 lt!396999)))) ((_ sign_extend 32) (currentByte!12042 (_2!11868 lt!397006))) ((_ sign_extend 32) (currentBit!12037 (_2!11868 lt!397006))) lt!397000)))

(declare-fun lt!397004 () Unit!18300)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!11014 array!13783 (_ BitVec 64)) Unit!18300)

(assert (=> b!255625 (= lt!397004 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11868 lt!397006) (buf!6563 (_2!11868 lt!396999)) lt!397000))))

(declare-fun reader!0 (BitStream!11014 BitStream!11014) tuple2!21866)

(assert (=> b!255625 (= lt!397001 (reader!0 (_2!11868 lt!397006) (_2!11868 lt!396999)))))

(declare-fun res!214272 () Bool)

(declare-fun e!177093 () Bool)

(assert (=> start!54636 (=> (not res!214272) (not e!177093))))

(assert (=> start!54636 (= res!214272 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54636 e!177093))

(assert (=> start!54636 true))

(declare-fun thiss!1005 () BitStream!11014)

(declare-fun e!177090 () Bool)

(declare-fun inv!12 (BitStream!11014) Bool)

(assert (=> start!54636 (and (inv!12 thiss!1005) e!177090)))

(declare-fun b!255626 () Bool)

(declare-fun e!177092 () Bool)

(assert (=> b!255626 (= e!177092 e!177087)))

(declare-fun res!214275 () Bool)

(assert (=> b!255626 (=> (not res!214275) (not e!177087))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!255626 (= res!214275 (= (bitIndex!0 (size!6046 (buf!6563 (_2!11868 lt!396999))) (currentByte!12042 (_2!11868 lt!396999)) (currentBit!12037 (_2!11868 lt!396999))) (bvadd (bitIndex!0 (size!6046 (buf!6563 (_2!11868 lt!397006))) (currentByte!12042 (_2!11868 lt!397006)) (currentBit!12037 (_2!11868 lt!397006))) lt!397000)))))

(assert (=> b!255626 (= lt!397000 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!255627 () Bool)

(declare-fun res!214278 () Bool)

(declare-fun e!177089 () Bool)

(assert (=> b!255627 (=> (not res!214278) (not e!177089))))

(declare-fun isPrefixOf!0 (BitStream!11014 BitStream!11014) Bool)

(assert (=> b!255627 (= res!214278 (isPrefixOf!0 thiss!1005 (_2!11868 lt!397006)))))

(declare-fun b!255628 () Bool)

(declare-fun res!214283 () Bool)

(assert (=> b!255628 (=> (not res!214283) (not e!177093))))

(assert (=> b!255628 (= res!214283 (bvslt from!289 nBits!297))))

(declare-fun b!255629 () Bool)

(declare-fun res!214280 () Bool)

(assert (=> b!255629 (=> (not res!214280) (not e!177093))))

(assert (=> b!255629 (= res!214280 (validate_offset_bits!1 ((_ sign_extend 32) (size!6046 (buf!6563 thiss!1005))) ((_ sign_extend 32) (currentByte!12042 thiss!1005)) ((_ sign_extend 32) (currentBit!12037 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!255630 () Bool)

(declare-fun e!177088 () Bool)

(assert (=> b!255630 (= e!177089 e!177088)))

(declare-fun res!214287 () Bool)

(assert (=> b!255630 (=> (not res!214287) (not e!177088))))

(declare-fun lt!397003 () tuple2!21864)

(assert (=> b!255630 (= res!214287 (and (= (_2!11866 lt!397003) bit!26) (= (_1!11866 lt!397003) (_2!11868 lt!397006))))))

(declare-fun readBitPure!0 (BitStream!11014) tuple2!21864)

(declare-fun readerFrom!0 (BitStream!11014 (_ BitVec 32) (_ BitVec 32)) BitStream!11014)

(assert (=> b!255630 (= lt!397003 (readBitPure!0 (readerFrom!0 (_2!11868 lt!397006) (currentBit!12037 thiss!1005) (currentByte!12042 thiss!1005))))))

(declare-fun b!255631 () Bool)

(declare-fun e!177097 () Bool)

(declare-fun lt!396995 () tuple2!21864)

(declare-fun lt!397010 () tuple2!21864)

(assert (=> b!255631 (= e!177097 (= (_2!11866 lt!396995) (_2!11866 lt!397010)))))

(declare-fun b!255632 () Bool)

(declare-fun e!177095 () Bool)

(assert (=> b!255632 (= e!177095 true)))

(declare-fun lt!396998 () (_ BitVec 64))

(assert (=> b!255632 (= lt!396998 (bitIndex!0 (size!6046 (buf!6563 (_2!11868 lt!396999))) (currentByte!12042 (_2!11868 lt!396999)) (currentBit!12037 (_2!11868 lt!396999))))))

(declare-fun lt!397017 () (_ BitVec 64))

(assert (=> b!255632 (= lt!397017 (bitIndex!0 (size!6046 (buf!6563 thiss!1005)) (currentByte!12042 thiss!1005) (currentBit!12037 thiss!1005)))))

(declare-fun b!255633 () Bool)

(declare-fun e!177096 () Bool)

(assert (=> b!255633 (= e!177096 e!177095)))

(declare-fun res!214282 () Bool)

(assert (=> b!255633 (=> res!214282 e!177095)))

(assert (=> b!255633 (= res!214282 (not (= (size!6046 (buf!6563 thiss!1005)) (size!6046 (buf!6563 (_2!11868 lt!396999))))))))

(declare-fun lt!397007 () tuple2!21864)

(declare-fun lt!397008 () tuple2!21864)

(declare-fun lt!397005 () tuple2!21866)

(assert (=> b!255633 (and (= (_2!11866 lt!397007) (_2!11866 lt!397008)) (= (_1!11866 lt!397007) (_2!11867 lt!397005)))))

(declare-fun b!255634 () Bool)

(declare-fun array_inv!5787 (array!13783) Bool)

(assert (=> b!255634 (= e!177090 (array_inv!5787 (buf!6563 thiss!1005)))))

(declare-fun b!255635 () Bool)

(declare-fun e!177094 () Bool)

(assert (=> b!255635 (= e!177094 e!177089)))

(declare-fun res!214273 () Bool)

(assert (=> b!255635 (=> (not res!214273) (not e!177089))))

(declare-fun lt!396996 () (_ BitVec 64))

(declare-fun lt!397009 () (_ BitVec 64))

(assert (=> b!255635 (= res!214273 (= lt!396996 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!397009)))))

(assert (=> b!255635 (= lt!396996 (bitIndex!0 (size!6046 (buf!6563 (_2!11868 lt!397006))) (currentByte!12042 (_2!11868 lt!397006)) (currentBit!12037 (_2!11868 lt!397006))))))

(assert (=> b!255635 (= lt!397009 (bitIndex!0 (size!6046 (buf!6563 thiss!1005)) (currentByte!12042 thiss!1005) (currentBit!12037 thiss!1005)))))

(declare-fun b!255636 () Bool)

(assert (=> b!255636 (= e!177088 (= (bitIndex!0 (size!6046 (buf!6563 (_1!11866 lt!397003))) (currentByte!12042 (_1!11866 lt!397003)) (currentBit!12037 (_1!11866 lt!397003))) lt!396996))))

(declare-fun b!255637 () Bool)

(assert (=> b!255637 (= e!177093 (not e!177096))))

(declare-fun res!214279 () Bool)

(assert (=> b!255637 (=> res!214279 e!177096)))

(declare-fun lt!396994 () tuple2!21866)

(assert (=> b!255637 (= res!214279 (not (= (_1!11866 lt!397008) (_2!11867 lt!396994))))))

(assert (=> b!255637 (= lt!397008 (checkBitsLoopPure!0 (_1!11867 lt!396994) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!397014 () (_ BitVec 64))

(assert (=> b!255637 (validate_offset_bits!1 ((_ sign_extend 32) (size!6046 (buf!6563 (_2!11868 lt!396999)))) ((_ sign_extend 32) (currentByte!12042 (_2!11868 lt!397006))) ((_ sign_extend 32) (currentBit!12037 (_2!11868 lt!397006))) lt!397014)))

(declare-fun lt!396997 () Unit!18300)

(assert (=> b!255637 (= lt!396997 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11868 lt!397006) (buf!6563 (_2!11868 lt!396999)) lt!397014))))

(assert (=> b!255637 (= lt!397007 (checkBitsLoopPure!0 (_1!11867 lt!397005) nBits!297 bit!26 from!289))))

(assert (=> b!255637 (validate_offset_bits!1 ((_ sign_extend 32) (size!6046 (buf!6563 (_2!11868 lt!396999)))) ((_ sign_extend 32) (currentByte!12042 thiss!1005)) ((_ sign_extend 32) (currentBit!12037 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!397016 () Unit!18300)

(assert (=> b!255637 (= lt!397016 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6563 (_2!11868 lt!396999)) (bvsub nBits!297 from!289)))))

(assert (=> b!255637 (= (_2!11866 (readBitPure!0 (_1!11867 lt!397005))) bit!26)))

(assert (=> b!255637 (= lt!396994 (reader!0 (_2!11868 lt!397006) (_2!11868 lt!396999)))))

(assert (=> b!255637 (= lt!397005 (reader!0 thiss!1005 (_2!11868 lt!396999)))))

(assert (=> b!255637 e!177097))

(declare-fun res!214284 () Bool)

(assert (=> b!255637 (=> (not res!214284) (not e!177097))))

(assert (=> b!255637 (= res!214284 (= (bitIndex!0 (size!6046 (buf!6563 (_1!11866 lt!396995))) (currentByte!12042 (_1!11866 lt!396995)) (currentBit!12037 (_1!11866 lt!396995))) (bitIndex!0 (size!6046 (buf!6563 (_1!11866 lt!397010))) (currentByte!12042 (_1!11866 lt!397010)) (currentBit!12037 (_1!11866 lt!397010)))))))

(declare-fun lt!397015 () Unit!18300)

(declare-fun lt!397012 () BitStream!11014)

(declare-fun readBitPrefixLemma!0 (BitStream!11014 BitStream!11014) Unit!18300)

(assert (=> b!255637 (= lt!397015 (readBitPrefixLemma!0 lt!397012 (_2!11868 lt!396999)))))

(assert (=> b!255637 (= lt!397010 (readBitPure!0 (BitStream!11015 (buf!6563 (_2!11868 lt!396999)) (currentByte!12042 thiss!1005) (currentBit!12037 thiss!1005))))))

(assert (=> b!255637 (= lt!396995 (readBitPure!0 lt!397012))))

(assert (=> b!255637 (= lt!397012 (BitStream!11015 (buf!6563 (_2!11868 lt!397006)) (currentByte!12042 thiss!1005) (currentBit!12037 thiss!1005)))))

(declare-fun e!177098 () Bool)

(assert (=> b!255637 e!177098))

(declare-fun res!214277 () Bool)

(assert (=> b!255637 (=> (not res!214277) (not e!177098))))

(assert (=> b!255637 (= res!214277 (isPrefixOf!0 thiss!1005 (_2!11868 lt!396999)))))

(declare-fun lt!397011 () Unit!18300)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!11014 BitStream!11014 BitStream!11014) Unit!18300)

(assert (=> b!255637 (= lt!397011 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11868 lt!397006) (_2!11868 lt!396999)))))

(assert (=> b!255637 e!177092))

(declare-fun res!214285 () Bool)

(assert (=> b!255637 (=> (not res!214285) (not e!177092))))

(assert (=> b!255637 (= res!214285 (= (size!6046 (buf!6563 (_2!11868 lt!397006))) (size!6046 (buf!6563 (_2!11868 lt!396999)))))))

(declare-fun appendNBitsLoop!0 (BitStream!11014 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21868)

(assert (=> b!255637 (= lt!396999 (appendNBitsLoop!0 (_2!11868 lt!397006) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!255637 (validate_offset_bits!1 ((_ sign_extend 32) (size!6046 (buf!6563 (_2!11868 lt!397006)))) ((_ sign_extend 32) (currentByte!12042 (_2!11868 lt!397006))) ((_ sign_extend 32) (currentBit!12037 (_2!11868 lt!397006))) lt!397014)))

(assert (=> b!255637 (= lt!397014 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!397013 () Unit!18300)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!11014 BitStream!11014 (_ BitVec 64) (_ BitVec 64)) Unit!18300)

(assert (=> b!255637 (= lt!397013 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11868 lt!397006) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!255637 e!177094))

(declare-fun res!214281 () Bool)

(assert (=> b!255637 (=> (not res!214281) (not e!177094))))

(assert (=> b!255637 (= res!214281 (= (size!6046 (buf!6563 thiss!1005)) (size!6046 (buf!6563 (_2!11868 lt!397006)))))))

(declare-fun appendBit!0 (BitStream!11014 Bool) tuple2!21868)

(assert (=> b!255637 (= lt!397006 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!255638 () Bool)

(declare-fun res!214286 () Bool)

(assert (=> b!255638 (=> (not res!214286) (not e!177098))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!255638 (= res!214286 (invariant!0 (currentBit!12037 thiss!1005) (currentByte!12042 thiss!1005) (size!6046 (buf!6563 (_2!11868 lt!397006)))))))

(declare-fun b!255639 () Bool)

(declare-fun res!214274 () Bool)

(assert (=> b!255639 (=> (not res!214274) (not e!177087))))

(assert (=> b!255639 (= res!214274 (isPrefixOf!0 (_2!11868 lt!397006) (_2!11868 lt!396999)))))

(declare-fun b!255640 () Bool)

(assert (=> b!255640 (= e!177098 (invariant!0 (currentBit!12037 thiss!1005) (currentByte!12042 thiss!1005) (size!6046 (buf!6563 (_2!11868 lt!396999)))))))

(declare-fun b!255641 () Bool)

(declare-fun res!214276 () Bool)

(assert (=> b!255641 (=> res!214276 e!177096)))

(declare-fun withMovedBitIndex!0 (BitStream!11014 (_ BitVec 64)) BitStream!11014)

(assert (=> b!255641 (= res!214276 (not (= (_1!11867 lt!396994) (withMovedBitIndex!0 (_1!11867 lt!397005) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!54636 res!214272) b!255629))

(assert (= (and b!255629 res!214280) b!255628))

(assert (= (and b!255628 res!214283) b!255637))

(assert (= (and b!255637 res!214281) b!255635))

(assert (= (and b!255635 res!214273) b!255627))

(assert (= (and b!255627 res!214278) b!255630))

(assert (= (and b!255630 res!214287) b!255636))

(assert (= (and b!255637 res!214285) b!255626))

(assert (= (and b!255626 res!214275) b!255639))

(assert (= (and b!255639 res!214274) b!255625))

(assert (= (and b!255637 res!214277) b!255638))

(assert (= (and b!255638 res!214286) b!255640))

(assert (= (and b!255637 res!214284) b!255631))

(assert (= (and b!255637 (not res!214279)) b!255641))

(assert (= (and b!255641 (not res!214276)) b!255633))

(assert (= (and b!255633 (not res!214282)) b!255632))

(assert (= start!54636 b!255634))

(declare-fun m!385059 () Bool)

(assert (=> b!255639 m!385059))

(declare-fun m!385061 () Bool)

(assert (=> b!255638 m!385061))

(declare-fun m!385063 () Bool)

(assert (=> b!255626 m!385063))

(declare-fun m!385065 () Bool)

(assert (=> b!255626 m!385065))

(declare-fun m!385067 () Bool)

(assert (=> b!255640 m!385067))

(declare-fun m!385069 () Bool)

(assert (=> b!255637 m!385069))

(declare-fun m!385071 () Bool)

(assert (=> b!255637 m!385071))

(declare-fun m!385073 () Bool)

(assert (=> b!255637 m!385073))

(declare-fun m!385075 () Bool)

(assert (=> b!255637 m!385075))

(declare-fun m!385077 () Bool)

(assert (=> b!255637 m!385077))

(declare-fun m!385079 () Bool)

(assert (=> b!255637 m!385079))

(declare-fun m!385081 () Bool)

(assert (=> b!255637 m!385081))

(declare-fun m!385083 () Bool)

(assert (=> b!255637 m!385083))

(declare-fun m!385085 () Bool)

(assert (=> b!255637 m!385085))

(declare-fun m!385087 () Bool)

(assert (=> b!255637 m!385087))

(declare-fun m!385089 () Bool)

(assert (=> b!255637 m!385089))

(declare-fun m!385091 () Bool)

(assert (=> b!255637 m!385091))

(declare-fun m!385093 () Bool)

(assert (=> b!255637 m!385093))

(declare-fun m!385095 () Bool)

(assert (=> b!255637 m!385095))

(declare-fun m!385097 () Bool)

(assert (=> b!255637 m!385097))

(declare-fun m!385099 () Bool)

(assert (=> b!255637 m!385099))

(declare-fun m!385101 () Bool)

(assert (=> b!255637 m!385101))

(declare-fun m!385103 () Bool)

(assert (=> b!255637 m!385103))

(declare-fun m!385105 () Bool)

(assert (=> b!255637 m!385105))

(declare-fun m!385107 () Bool)

(assert (=> b!255637 m!385107))

(declare-fun m!385109 () Bool)

(assert (=> b!255629 m!385109))

(declare-fun m!385111 () Bool)

(assert (=> b!255630 m!385111))

(assert (=> b!255630 m!385111))

(declare-fun m!385113 () Bool)

(assert (=> b!255630 m!385113))

(declare-fun m!385115 () Bool)

(assert (=> start!54636 m!385115))

(declare-fun m!385117 () Bool)

(assert (=> b!255636 m!385117))

(declare-fun m!385119 () Bool)

(assert (=> b!255641 m!385119))

(assert (=> b!255635 m!385065))

(declare-fun m!385121 () Bool)

(assert (=> b!255635 m!385121))

(declare-fun m!385123 () Bool)

(assert (=> b!255627 m!385123))

(declare-fun m!385125 () Bool)

(assert (=> b!255634 m!385125))

(declare-fun m!385127 () Bool)

(assert (=> b!255625 m!385127))

(declare-fun m!385129 () Bool)

(assert (=> b!255625 m!385129))

(declare-fun m!385131 () Bool)

(assert (=> b!255625 m!385131))

(assert (=> b!255625 m!385095))

(assert (=> b!255632 m!385063))

(assert (=> b!255632 m!385121))

(push 1)

(assert (not b!255632))

(assert (not b!255635))

(assert (not b!255626))

(assert (not b!255638))

(assert (not b!255625))

(assert (not b!255640))

(assert (not b!255636))

(assert (not b!255630))

(assert (not start!54636))

