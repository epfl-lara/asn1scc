; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54090 () Bool)

(assert start!54090)

(declare-fun b!252166 () Bool)

(declare-fun res!211240 () Bool)

(declare-fun e!174736 () Bool)

(assert (=> b!252166 (=> (not res!211240) (not e!174736))))

(declare-datatypes ((array!13714 0))(
  ( (array!13715 (arr!7003 (Array (_ BitVec 32) (_ BitVec 8))) (size!6016 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10954 0))(
  ( (BitStream!10955 (buf!6518 array!13714) (currentByte!11973 (_ BitVec 32)) (currentBit!11968 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10954)

(declare-datatypes ((Unit!18180 0))(
  ( (Unit!18181) )
))
(declare-datatypes ((tuple2!21666 0))(
  ( (tuple2!21667 (_1!11761 Unit!18180) (_2!11761 BitStream!10954)) )
))
(declare-fun lt!391722 () tuple2!21666)

(declare-fun isPrefixOf!0 (BitStream!10954 BitStream!10954) Bool)

(assert (=> b!252166 (= res!211240 (isPrefixOf!0 thiss!1005 (_2!11761 lt!391722)))))

(declare-fun b!252167 () Bool)

(declare-fun e!174740 () Bool)

(assert (=> b!252167 (= e!174740 e!174736)))

(declare-fun res!211248 () Bool)

(assert (=> b!252167 (=> (not res!211248) (not e!174736))))

(declare-fun lt!391725 () (_ BitVec 64))

(declare-fun lt!391724 () (_ BitVec 64))

(assert (=> b!252167 (= res!211248 (= lt!391725 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!391724)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!252167 (= lt!391725 (bitIndex!0 (size!6016 (buf!6518 (_2!11761 lt!391722))) (currentByte!11973 (_2!11761 lt!391722)) (currentBit!11968 (_2!11761 lt!391722))))))

(assert (=> b!252167 (= lt!391724 (bitIndex!0 (size!6016 (buf!6518 thiss!1005)) (currentByte!11973 thiss!1005) (currentBit!11968 thiss!1005)))))

(declare-fun b!252168 () Bool)

(declare-fun res!211251 () Bool)

(declare-fun e!174739 () Bool)

(assert (=> b!252168 (=> (not res!211251) (not e!174739))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!252168 (= res!211251 (invariant!0 (currentBit!11968 thiss!1005) (currentByte!11973 thiss!1005) (size!6016 (buf!6518 (_2!11761 lt!391722)))))))

(declare-fun b!252169 () Bool)

(declare-fun e!174737 () Bool)

(assert (=> b!252169 (= e!174736 e!174737)))

(declare-fun res!211247 () Bool)

(assert (=> b!252169 (=> (not res!211247) (not e!174737))))

(declare-datatypes ((tuple2!21668 0))(
  ( (tuple2!21669 (_1!11762 BitStream!10954) (_2!11762 Bool)) )
))
(declare-fun lt!391718 () tuple2!21668)

(declare-fun bit!26 () Bool)

(assert (=> b!252169 (= res!211247 (and (= (_2!11762 lt!391718) bit!26) (= (_1!11762 lt!391718) (_2!11761 lt!391722))))))

(declare-fun readBitPure!0 (BitStream!10954) tuple2!21668)

(declare-fun readerFrom!0 (BitStream!10954 (_ BitVec 32) (_ BitVec 32)) BitStream!10954)

(assert (=> b!252169 (= lt!391718 (readBitPure!0 (readerFrom!0 (_2!11761 lt!391722) (currentBit!11968 thiss!1005) (currentByte!11973 thiss!1005))))))

(declare-fun b!252170 () Bool)

(assert (=> b!252170 (= e!174737 (= (bitIndex!0 (size!6016 (buf!6518 (_1!11762 lt!391718))) (currentByte!11973 (_1!11762 lt!391718)) (currentBit!11968 (_1!11762 lt!391718))) lt!391725))))

(declare-fun b!252171 () Bool)

(declare-fun e!174731 () Bool)

(declare-fun lt!391714 () tuple2!21668)

(declare-fun lt!391709 () tuple2!21668)

(assert (=> b!252171 (= e!174731 (= (_2!11762 lt!391714) (_2!11762 lt!391709)))))

(declare-fun b!252172 () Bool)

(declare-fun e!174738 () Bool)

(declare-fun lt!391711 () tuple2!21668)

(declare-datatypes ((tuple2!21670 0))(
  ( (tuple2!21671 (_1!11763 BitStream!10954) (_2!11763 BitStream!10954)) )
))
(declare-fun lt!391717 () tuple2!21670)

(assert (=> b!252172 (= e!174738 (not (or (not (_2!11762 lt!391711)) (not (= (_1!11762 lt!391711) (_2!11763 lt!391717))))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!10954 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21668)

(assert (=> b!252172 (= lt!391711 (checkBitsLoopPure!0 (_1!11763 lt!391717) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!391715 () tuple2!21666)

(declare-fun lt!391716 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!252172 (validate_offset_bits!1 ((_ sign_extend 32) (size!6016 (buf!6518 (_2!11761 lt!391715)))) ((_ sign_extend 32) (currentByte!11973 (_2!11761 lt!391722))) ((_ sign_extend 32) (currentBit!11968 (_2!11761 lt!391722))) lt!391716)))

(declare-fun lt!391720 () Unit!18180)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10954 array!13714 (_ BitVec 64)) Unit!18180)

(assert (=> b!252172 (= lt!391720 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11761 lt!391722) (buf!6518 (_2!11761 lt!391715)) lt!391716))))

(declare-fun reader!0 (BitStream!10954 BitStream!10954) tuple2!21670)

(assert (=> b!252172 (= lt!391717 (reader!0 (_2!11761 lt!391722) (_2!11761 lt!391715)))))

(declare-fun b!252173 () Bool)

(declare-fun e!174732 () Bool)

(assert (=> b!252173 (= e!174732 e!174738)))

(declare-fun res!211246 () Bool)

(assert (=> b!252173 (=> (not res!211246) (not e!174738))))

(assert (=> b!252173 (= res!211246 (= (bitIndex!0 (size!6016 (buf!6518 (_2!11761 lt!391715))) (currentByte!11973 (_2!11761 lt!391715)) (currentBit!11968 (_2!11761 lt!391715))) (bvadd (bitIndex!0 (size!6016 (buf!6518 (_2!11761 lt!391722))) (currentByte!11973 (_2!11761 lt!391722)) (currentBit!11968 (_2!11761 lt!391722))) lt!391716)))))

(assert (=> b!252173 (= lt!391716 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun res!211249 () Bool)

(declare-fun e!174733 () Bool)

(assert (=> start!54090 (=> (not res!211249) (not e!174733))))

(assert (=> start!54090 (= res!211249 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54090 e!174733))

(assert (=> start!54090 true))

(declare-fun e!174735 () Bool)

(declare-fun inv!12 (BitStream!10954) Bool)

(assert (=> start!54090 (and (inv!12 thiss!1005) e!174735)))

(declare-fun b!252174 () Bool)

(declare-fun res!211241 () Bool)

(assert (=> b!252174 (=> (not res!211241) (not e!174733))))

(assert (=> b!252174 (= res!211241 (validate_offset_bits!1 ((_ sign_extend 32) (size!6016 (buf!6518 thiss!1005))) ((_ sign_extend 32) (currentByte!11973 thiss!1005)) ((_ sign_extend 32) (currentBit!11968 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!252175 () Bool)

(declare-fun res!211242 () Bool)

(assert (=> b!252175 (=> (not res!211242) (not e!174733))))

(assert (=> b!252175 (= res!211242 (bvslt from!289 nBits!297))))

(declare-fun b!252176 () Bool)

(declare-fun array_inv!5757 (array!13714) Bool)

(assert (=> b!252176 (= e!174735 (array_inv!5757 (buf!6518 thiss!1005)))))

(declare-fun b!252177 () Bool)

(assert (=> b!252177 (= e!174733 (not true))))

(declare-fun lt!391710 () tuple2!21668)

(declare-fun lt!391721 () tuple2!21670)

(assert (=> b!252177 (= lt!391710 (checkBitsLoopPure!0 (_1!11763 lt!391721) nBits!297 bit!26 from!289))))

(assert (=> b!252177 (validate_offset_bits!1 ((_ sign_extend 32) (size!6016 (buf!6518 (_2!11761 lt!391715)))) ((_ sign_extend 32) (currentByte!11973 thiss!1005)) ((_ sign_extend 32) (currentBit!11968 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!391712 () Unit!18180)

(assert (=> b!252177 (= lt!391712 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6518 (_2!11761 lt!391715)) (bvsub nBits!297 from!289)))))

(assert (=> b!252177 (= (_2!11762 (readBitPure!0 (_1!11763 lt!391721))) bit!26)))

(declare-fun lt!391707 () tuple2!21670)

(assert (=> b!252177 (= lt!391707 (reader!0 (_2!11761 lt!391722) (_2!11761 lt!391715)))))

(assert (=> b!252177 (= lt!391721 (reader!0 thiss!1005 (_2!11761 lt!391715)))))

(assert (=> b!252177 e!174731))

(declare-fun res!211239 () Bool)

(assert (=> b!252177 (=> (not res!211239) (not e!174731))))

(assert (=> b!252177 (= res!211239 (= (bitIndex!0 (size!6016 (buf!6518 (_1!11762 lt!391714))) (currentByte!11973 (_1!11762 lt!391714)) (currentBit!11968 (_1!11762 lt!391714))) (bitIndex!0 (size!6016 (buf!6518 (_1!11762 lt!391709))) (currentByte!11973 (_1!11762 lt!391709)) (currentBit!11968 (_1!11762 lt!391709)))))))

(declare-fun lt!391723 () Unit!18180)

(declare-fun lt!391708 () BitStream!10954)

(declare-fun readBitPrefixLemma!0 (BitStream!10954 BitStream!10954) Unit!18180)

(assert (=> b!252177 (= lt!391723 (readBitPrefixLemma!0 lt!391708 (_2!11761 lt!391715)))))

(assert (=> b!252177 (= lt!391709 (readBitPure!0 (BitStream!10955 (buf!6518 (_2!11761 lt!391715)) (currentByte!11973 thiss!1005) (currentBit!11968 thiss!1005))))))

(assert (=> b!252177 (= lt!391714 (readBitPure!0 lt!391708))))

(assert (=> b!252177 (= lt!391708 (BitStream!10955 (buf!6518 (_2!11761 lt!391722)) (currentByte!11973 thiss!1005) (currentBit!11968 thiss!1005)))))

(assert (=> b!252177 e!174739))

(declare-fun res!211250 () Bool)

(assert (=> b!252177 (=> (not res!211250) (not e!174739))))

(assert (=> b!252177 (= res!211250 (isPrefixOf!0 thiss!1005 (_2!11761 lt!391715)))))

(declare-fun lt!391719 () Unit!18180)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10954 BitStream!10954 BitStream!10954) Unit!18180)

(assert (=> b!252177 (= lt!391719 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11761 lt!391722) (_2!11761 lt!391715)))))

(assert (=> b!252177 e!174732))

(declare-fun res!211244 () Bool)

(assert (=> b!252177 (=> (not res!211244) (not e!174732))))

(assert (=> b!252177 (= res!211244 (= (size!6016 (buf!6518 (_2!11761 lt!391722))) (size!6016 (buf!6518 (_2!11761 lt!391715)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10954 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21666)

(assert (=> b!252177 (= lt!391715 (appendNBitsLoop!0 (_2!11761 lt!391722) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!252177 (validate_offset_bits!1 ((_ sign_extend 32) (size!6016 (buf!6518 (_2!11761 lt!391722)))) ((_ sign_extend 32) (currentByte!11973 (_2!11761 lt!391722))) ((_ sign_extend 32) (currentBit!11968 (_2!11761 lt!391722))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!391713 () Unit!18180)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10954 BitStream!10954 (_ BitVec 64) (_ BitVec 64)) Unit!18180)

(assert (=> b!252177 (= lt!391713 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11761 lt!391722) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!252177 e!174740))

(declare-fun res!211245 () Bool)

(assert (=> b!252177 (=> (not res!211245) (not e!174740))))

(assert (=> b!252177 (= res!211245 (= (size!6016 (buf!6518 thiss!1005)) (size!6016 (buf!6518 (_2!11761 lt!391722)))))))

(declare-fun appendBit!0 (BitStream!10954 Bool) tuple2!21666)

(assert (=> b!252177 (= lt!391722 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!252178 () Bool)

(assert (=> b!252178 (= e!174739 (invariant!0 (currentBit!11968 thiss!1005) (currentByte!11973 thiss!1005) (size!6016 (buf!6518 (_2!11761 lt!391715)))))))

(declare-fun b!252179 () Bool)

(declare-fun res!211243 () Bool)

(assert (=> b!252179 (=> (not res!211243) (not e!174738))))

(assert (=> b!252179 (= res!211243 (isPrefixOf!0 (_2!11761 lt!391722) (_2!11761 lt!391715)))))

(assert (= (and start!54090 res!211249) b!252174))

(assert (= (and b!252174 res!211241) b!252175))

(assert (= (and b!252175 res!211242) b!252177))

(assert (= (and b!252177 res!211245) b!252167))

(assert (= (and b!252167 res!211248) b!252166))

(assert (= (and b!252166 res!211240) b!252169))

(assert (= (and b!252169 res!211247) b!252170))

(assert (= (and b!252177 res!211244) b!252173))

(assert (= (and b!252173 res!211246) b!252179))

(assert (= (and b!252179 res!211243) b!252172))

(assert (= (and b!252177 res!211250) b!252168))

(assert (= (and b!252168 res!211251) b!252178))

(assert (= (and b!252177 res!211239) b!252171))

(assert (= start!54090 b!252176))

(declare-fun m!379383 () Bool)

(assert (=> b!252174 m!379383))

(declare-fun m!379385 () Bool)

(assert (=> b!252170 m!379385))

(declare-fun m!379387 () Bool)

(assert (=> b!252173 m!379387))

(declare-fun m!379389 () Bool)

(assert (=> b!252173 m!379389))

(declare-fun m!379391 () Bool)

(assert (=> start!54090 m!379391))

(assert (=> b!252167 m!379389))

(declare-fun m!379393 () Bool)

(assert (=> b!252167 m!379393))

(declare-fun m!379395 () Bool)

(assert (=> b!252169 m!379395))

(assert (=> b!252169 m!379395))

(declare-fun m!379397 () Bool)

(assert (=> b!252169 m!379397))

(declare-fun m!379399 () Bool)

(assert (=> b!252176 m!379399))

(declare-fun m!379401 () Bool)

(assert (=> b!252178 m!379401))

(declare-fun m!379403 () Bool)

(assert (=> b!252166 m!379403))

(declare-fun m!379405 () Bool)

(assert (=> b!252168 m!379405))

(declare-fun m!379407 () Bool)

(assert (=> b!252172 m!379407))

(declare-fun m!379409 () Bool)

(assert (=> b!252172 m!379409))

(declare-fun m!379411 () Bool)

(assert (=> b!252172 m!379411))

(declare-fun m!379413 () Bool)

(assert (=> b!252172 m!379413))

(declare-fun m!379415 () Bool)

(assert (=> b!252177 m!379415))

(declare-fun m!379417 () Bool)

(assert (=> b!252177 m!379417))

(declare-fun m!379419 () Bool)

(assert (=> b!252177 m!379419))

(declare-fun m!379421 () Bool)

(assert (=> b!252177 m!379421))

(declare-fun m!379423 () Bool)

(assert (=> b!252177 m!379423))

(declare-fun m!379425 () Bool)

(assert (=> b!252177 m!379425))

(declare-fun m!379427 () Bool)

(assert (=> b!252177 m!379427))

(assert (=> b!252177 m!379413))

(declare-fun m!379429 () Bool)

(assert (=> b!252177 m!379429))

(declare-fun m!379431 () Bool)

(assert (=> b!252177 m!379431))

(declare-fun m!379433 () Bool)

(assert (=> b!252177 m!379433))

(declare-fun m!379435 () Bool)

(assert (=> b!252177 m!379435))

(declare-fun m!379437 () Bool)

(assert (=> b!252177 m!379437))

(declare-fun m!379439 () Bool)

(assert (=> b!252177 m!379439))

(declare-fun m!379441 () Bool)

(assert (=> b!252177 m!379441))

(declare-fun m!379443 () Bool)

(assert (=> b!252177 m!379443))

(declare-fun m!379445 () Bool)

(assert (=> b!252177 m!379445))

(declare-fun m!379447 () Bool)

(assert (=> b!252179 m!379447))

(push 1)

(assert (not start!54090))

(assert (not b!252166))

(assert (not b!252176))

(assert (not b!252169))

(assert (not b!252167))

(assert (not b!252174))

(assert (not b!252170))

(assert (not b!252172))

(assert (not b!252177))

(assert (not b!252168))

(assert (not b!252179))

(assert (not b!252173))

(assert (not b!252178))

(check-sat)

