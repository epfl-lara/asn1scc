; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53724 () Bool)

(assert start!53724)

(declare-fun b!249978 () Bool)

(declare-fun res!209247 () Bool)

(declare-fun e!173258 () Bool)

(assert (=> b!249978 (=> (not res!209247) (not e!173258))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!249978 (= res!209247 (bvslt from!289 nBits!297))))

(declare-fun b!249979 () Bool)

(declare-fun e!173260 () Bool)

(declare-datatypes ((array!13633 0))(
  ( (array!13634 (arr!6967 (Array (_ BitVec 32) (_ BitVec 8))) (size!5980 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10882 0))(
  ( (BitStream!10883 (buf!6473 array!13633) (currentByte!11904 (_ BitVec 32)) (currentBit!11899 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!21432 0))(
  ( (tuple2!21433 (_1!11641 BitStream!10882) (_2!11641 Bool)) )
))
(declare-fun lt!388572 () tuple2!21432)

(declare-fun lt!388578 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!249979 (= e!173260 (= (bitIndex!0 (size!5980 (buf!6473 (_1!11641 lt!388572))) (currentByte!11904 (_1!11641 lt!388572)) (currentBit!11899 (_1!11641 lt!388572))) lt!388578))))

(declare-fun b!249980 () Bool)

(declare-fun e!173256 () Bool)

(declare-fun lt!388569 () tuple2!21432)

(declare-datatypes ((tuple2!21434 0))(
  ( (tuple2!21435 (_1!11642 BitStream!10882) (_2!11642 BitStream!10882)) )
))
(declare-fun lt!388574 () tuple2!21434)

(assert (=> b!249980 (= e!173256 (not (or (not (_2!11641 lt!388569)) (not (= (_1!11641 lt!388569) (_2!11642 lt!388574))))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10882 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21432)

(assert (=> b!249980 (= lt!388569 (checkBitsLoopPure!0 (_1!11642 lt!388574) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-datatypes ((Unit!18096 0))(
  ( (Unit!18097) )
))
(declare-datatypes ((tuple2!21436 0))(
  ( (tuple2!21437 (_1!11643 Unit!18096) (_2!11643 BitStream!10882)) )
))
(declare-fun lt!388575 () tuple2!21436)

(declare-fun lt!388571 () tuple2!21436)

(declare-fun lt!388570 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249980 (validate_offset_bits!1 ((_ sign_extend 32) (size!5980 (buf!6473 (_2!11643 lt!388575)))) ((_ sign_extend 32) (currentByte!11904 (_2!11643 lt!388571))) ((_ sign_extend 32) (currentBit!11899 (_2!11643 lt!388571))) lt!388570)))

(declare-fun lt!388573 () Unit!18096)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10882 array!13633 (_ BitVec 64)) Unit!18096)

(assert (=> b!249980 (= lt!388573 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11643 lt!388571) (buf!6473 (_2!11643 lt!388575)) lt!388570))))

(declare-fun reader!0 (BitStream!10882 BitStream!10882) tuple2!21434)

(assert (=> b!249980 (= lt!388574 (reader!0 (_2!11643 lt!388571) (_2!11643 lt!388575)))))

(declare-fun b!249981 () Bool)

(declare-fun e!173257 () Bool)

(declare-fun e!173264 () Bool)

(assert (=> b!249981 (= e!173257 e!173264)))

(declare-fun res!209241 () Bool)

(assert (=> b!249981 (=> (not res!209241) (not e!173264))))

(declare-fun lt!388576 () (_ BitVec 64))

(assert (=> b!249981 (= res!209241 (= lt!388578 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388576)))))

(assert (=> b!249981 (= lt!388578 (bitIndex!0 (size!5980 (buf!6473 (_2!11643 lt!388571))) (currentByte!11904 (_2!11643 lt!388571)) (currentBit!11899 (_2!11643 lt!388571))))))

(declare-fun thiss!1005 () BitStream!10882)

(assert (=> b!249981 (= lt!388576 (bitIndex!0 (size!5980 (buf!6473 thiss!1005)) (currentByte!11904 thiss!1005) (currentBit!11899 thiss!1005)))))

(declare-fun b!249982 () Bool)

(declare-fun res!209246 () Bool)

(assert (=> b!249982 (=> (not res!209246) (not e!173264))))

(declare-fun isPrefixOf!0 (BitStream!10882 BitStream!10882) Bool)

(assert (=> b!249982 (= res!209246 (isPrefixOf!0 thiss!1005 (_2!11643 lt!388571)))))

(declare-fun b!249983 () Bool)

(declare-fun e!173263 () Bool)

(assert (=> b!249983 (= e!173258 (not e!173263))))

(declare-fun res!209243 () Bool)

(assert (=> b!249983 (=> res!209243 e!173263)))

(assert (=> b!249983 (= res!209243 (not (isPrefixOf!0 thiss!1005 (_2!11643 lt!388571))))))

(declare-fun e!173261 () Bool)

(assert (=> b!249983 e!173261))

(declare-fun res!209238 () Bool)

(assert (=> b!249983 (=> (not res!209238) (not e!173261))))

(assert (=> b!249983 (= res!209238 (= (size!5980 (buf!6473 (_2!11643 lt!388571))) (size!5980 (buf!6473 (_2!11643 lt!388575)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10882 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21436)

(assert (=> b!249983 (= lt!388575 (appendNBitsLoop!0 (_2!11643 lt!388571) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!249983 (validate_offset_bits!1 ((_ sign_extend 32) (size!5980 (buf!6473 (_2!11643 lt!388571)))) ((_ sign_extend 32) (currentByte!11904 (_2!11643 lt!388571))) ((_ sign_extend 32) (currentBit!11899 (_2!11643 lt!388571))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!388577 () Unit!18096)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10882 BitStream!10882 (_ BitVec 64) (_ BitVec 64)) Unit!18096)

(assert (=> b!249983 (= lt!388577 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11643 lt!388571) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!249983 e!173257))

(declare-fun res!209242 () Bool)

(assert (=> b!249983 (=> (not res!209242) (not e!173257))))

(assert (=> b!249983 (= res!209242 (= (size!5980 (buf!6473 thiss!1005)) (size!5980 (buf!6473 (_2!11643 lt!388571)))))))

(declare-fun appendBit!0 (BitStream!10882 Bool) tuple2!21436)

(assert (=> b!249983 (= lt!388571 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!249985 () Bool)

(assert (=> b!249985 (= e!173261 e!173256)))

(declare-fun res!209239 () Bool)

(assert (=> b!249985 (=> (not res!209239) (not e!173256))))

(assert (=> b!249985 (= res!209239 (= (bitIndex!0 (size!5980 (buf!6473 (_2!11643 lt!388575))) (currentByte!11904 (_2!11643 lt!388575)) (currentBit!11899 (_2!11643 lt!388575))) (bvadd (bitIndex!0 (size!5980 (buf!6473 (_2!11643 lt!388571))) (currentByte!11904 (_2!11643 lt!388571)) (currentBit!11899 (_2!11643 lt!388571))) lt!388570)))))

(assert (=> b!249985 (= lt!388570 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!249986 () Bool)

(declare-fun e!173259 () Bool)

(declare-fun array_inv!5721 (array!13633) Bool)

(assert (=> b!249986 (= e!173259 (array_inv!5721 (buf!6473 thiss!1005)))))

(declare-fun b!249987 () Bool)

(declare-fun res!209244 () Bool)

(assert (=> b!249987 (=> (not res!209244) (not e!173258))))

(assert (=> b!249987 (= res!209244 (validate_offset_bits!1 ((_ sign_extend 32) (size!5980 (buf!6473 thiss!1005))) ((_ sign_extend 32) (currentByte!11904 thiss!1005)) ((_ sign_extend 32) (currentBit!11899 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!249984 () Bool)

(assert (=> b!249984 (= e!173263 (isPrefixOf!0 (_2!11643 lt!388571) (_2!11643 lt!388575)))))

(declare-fun res!209245 () Bool)

(assert (=> start!53724 (=> (not res!209245) (not e!173258))))

(assert (=> start!53724 (= res!209245 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53724 e!173258))

(assert (=> start!53724 true))

(declare-fun inv!12 (BitStream!10882) Bool)

(assert (=> start!53724 (and (inv!12 thiss!1005) e!173259)))

(declare-fun b!249988 () Bool)

(declare-fun res!209237 () Bool)

(assert (=> b!249988 (=> (not res!209237) (not e!173256))))

(assert (=> b!249988 (= res!209237 (isPrefixOf!0 (_2!11643 lt!388571) (_2!11643 lt!388575)))))

(declare-fun b!249989 () Bool)

(assert (=> b!249989 (= e!173264 e!173260)))

(declare-fun res!209240 () Bool)

(assert (=> b!249989 (=> (not res!209240) (not e!173260))))

(assert (=> b!249989 (= res!209240 (and (= (_2!11641 lt!388572) bit!26) (= (_1!11641 lt!388572) (_2!11643 lt!388571))))))

(declare-fun readBitPure!0 (BitStream!10882) tuple2!21432)

(declare-fun readerFrom!0 (BitStream!10882 (_ BitVec 32) (_ BitVec 32)) BitStream!10882)

(assert (=> b!249989 (= lt!388572 (readBitPure!0 (readerFrom!0 (_2!11643 lt!388571) (currentBit!11899 thiss!1005) (currentByte!11904 thiss!1005))))))

(assert (= (and start!53724 res!209245) b!249987))

(assert (= (and b!249987 res!209244) b!249978))

(assert (= (and b!249978 res!209247) b!249983))

(assert (= (and b!249983 res!209242) b!249981))

(assert (= (and b!249981 res!209241) b!249982))

(assert (= (and b!249982 res!209246) b!249989))

(assert (= (and b!249989 res!209240) b!249979))

(assert (= (and b!249983 res!209238) b!249985))

(assert (= (and b!249985 res!209239) b!249988))

(assert (= (and b!249988 res!209237) b!249980))

(assert (= (and b!249983 (not res!209243)) b!249984))

(assert (= start!53724 b!249986))

(declare-fun m!376371 () Bool)

(assert (=> b!249986 m!376371))

(declare-fun m!376373 () Bool)

(assert (=> b!249981 m!376373))

(declare-fun m!376375 () Bool)

(assert (=> b!249981 m!376375))

(declare-fun m!376377 () Bool)

(assert (=> b!249982 m!376377))

(declare-fun m!376379 () Bool)

(assert (=> b!249983 m!376379))

(declare-fun m!376381 () Bool)

(assert (=> b!249983 m!376381))

(assert (=> b!249983 m!376377))

(declare-fun m!376383 () Bool)

(assert (=> b!249983 m!376383))

(declare-fun m!376385 () Bool)

(assert (=> b!249983 m!376385))

(declare-fun m!376387 () Bool)

(assert (=> b!249979 m!376387))

(declare-fun m!376389 () Bool)

(assert (=> b!249985 m!376389))

(assert (=> b!249985 m!376373))

(declare-fun m!376391 () Bool)

(assert (=> start!53724 m!376391))

(declare-fun m!376393 () Bool)

(assert (=> b!249984 m!376393))

(assert (=> b!249988 m!376393))

(declare-fun m!376395 () Bool)

(assert (=> b!249989 m!376395))

(assert (=> b!249989 m!376395))

(declare-fun m!376397 () Bool)

(assert (=> b!249989 m!376397))

(declare-fun m!376399 () Bool)

(assert (=> b!249980 m!376399))

(declare-fun m!376401 () Bool)

(assert (=> b!249980 m!376401))

(declare-fun m!376403 () Bool)

(assert (=> b!249980 m!376403))

(declare-fun m!376405 () Bool)

(assert (=> b!249980 m!376405))

(declare-fun m!376407 () Bool)

(assert (=> b!249987 m!376407))

(push 1)

(assert (not b!249987))

(assert (not b!249979))

(assert (not b!249984))

(assert (not b!249982))

(assert (not start!53724))

