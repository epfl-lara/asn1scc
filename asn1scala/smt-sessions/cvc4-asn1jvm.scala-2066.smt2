; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52458 () Bool)

(assert start!52458)

(declare-fun b!241675 () Bool)

(declare-fun res!201753 () Bool)

(declare-fun e!167527 () Bool)

(assert (=> b!241675 (=> (not res!201753) (not e!167527))))

(declare-datatypes ((array!13269 0))(
  ( (array!13270 (arr!6801 (Array (_ BitVec 32) (_ BitVec 8))) (size!5814 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10550 0))(
  ( (BitStream!10551 (buf!6280 array!13269) (currentByte!11643 (_ BitVec 32)) (currentBit!11638 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10550)

(declare-datatypes ((Unit!17711 0))(
  ( (Unit!17712) )
))
(declare-datatypes ((tuple2!20636 0))(
  ( (tuple2!20637 (_1!11240 Unit!17711) (_2!11240 BitStream!10550)) )
))
(declare-fun lt!377130 () tuple2!20636)

(declare-fun isPrefixOf!0 (BitStream!10550 BitStream!10550) Bool)

(assert (=> b!241675 (= res!201753 (isPrefixOf!0 thiss!1005 (_2!11240 lt!377130)))))

(declare-fun b!241677 () Bool)

(declare-fun res!201759 () Bool)

(declare-fun e!167524 () Bool)

(assert (=> b!241677 (=> (not res!201759) (not e!167524))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!241677 (= res!201759 (validate_offset_bits!1 ((_ sign_extend 32) (size!5814 (buf!6280 thiss!1005))) ((_ sign_extend 32) (currentByte!11643 thiss!1005)) ((_ sign_extend 32) (currentBit!11638 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!241678 () Bool)

(declare-fun e!167523 () Bool)

(declare-fun array_inv!5555 (array!13269) Bool)

(assert (=> b!241678 (= e!167523 (array_inv!5555 (buf!6280 thiss!1005)))))

(declare-fun b!241679 () Bool)

(declare-fun e!167525 () Bool)

(assert (=> b!241679 (= e!167525 e!167527)))

(declare-fun res!201758 () Bool)

(assert (=> b!241679 (=> (not res!201758) (not e!167527))))

(declare-fun lt!377131 () (_ BitVec 64))

(declare-fun lt!377129 () (_ BitVec 64))

(assert (=> b!241679 (= res!201758 (= lt!377131 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!377129)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!241679 (= lt!377131 (bitIndex!0 (size!5814 (buf!6280 (_2!11240 lt!377130))) (currentByte!11643 (_2!11240 lt!377130)) (currentBit!11638 (_2!11240 lt!377130))))))

(assert (=> b!241679 (= lt!377129 (bitIndex!0 (size!5814 (buf!6280 thiss!1005)) (currentByte!11643 thiss!1005) (currentBit!11638 thiss!1005)))))

(declare-fun b!241680 () Bool)

(declare-fun e!167528 () Bool)

(declare-datatypes ((tuple2!20638 0))(
  ( (tuple2!20639 (_1!11241 BitStream!10550) (_2!11241 Bool)) )
))
(declare-fun lt!377132 () tuple2!20638)

(assert (=> b!241680 (= e!167528 (= (bitIndex!0 (size!5814 (buf!6280 (_1!11241 lt!377132))) (currentByte!11643 (_1!11241 lt!377132)) (currentBit!11638 (_1!11241 lt!377132))) lt!377131))))

(declare-fun b!241676 () Bool)

(assert (=> b!241676 (= e!167524 (not true))))

(assert (=> b!241676 (validate_offset_bits!1 ((_ sign_extend 32) (size!5814 (buf!6280 (_2!11240 lt!377130)))) ((_ sign_extend 32) (currentByte!11643 (_2!11240 lt!377130))) ((_ sign_extend 32) (currentBit!11638 (_2!11240 lt!377130))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!377133 () Unit!17711)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10550 BitStream!10550 (_ BitVec 64) (_ BitVec 64)) Unit!17711)

(assert (=> b!241676 (= lt!377133 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11240 lt!377130) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!241676 e!167525))

(declare-fun res!201756 () Bool)

(assert (=> b!241676 (=> (not res!201756) (not e!167525))))

(assert (=> b!241676 (= res!201756 (= (size!5814 (buf!6280 thiss!1005)) (size!5814 (buf!6280 (_2!11240 lt!377130)))))))

(declare-fun bit!26 () Bool)

(declare-fun appendBit!0 (BitStream!10550 Bool) tuple2!20636)

(assert (=> b!241676 (= lt!377130 (appendBit!0 thiss!1005 bit!26))))

(declare-fun res!201757 () Bool)

(assert (=> start!52458 (=> (not res!201757) (not e!167524))))

(assert (=> start!52458 (= res!201757 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52458 e!167524))

(assert (=> start!52458 true))

(declare-fun inv!12 (BitStream!10550) Bool)

(assert (=> start!52458 (and (inv!12 thiss!1005) e!167523)))

(declare-fun b!241681 () Bool)

(declare-fun res!201755 () Bool)

(assert (=> b!241681 (=> (not res!201755) (not e!167524))))

(assert (=> b!241681 (= res!201755 (bvslt from!289 nBits!297))))

(declare-fun b!241682 () Bool)

(assert (=> b!241682 (= e!167527 e!167528)))

(declare-fun res!201754 () Bool)

(assert (=> b!241682 (=> (not res!201754) (not e!167528))))

(assert (=> b!241682 (= res!201754 (and (= (_2!11241 lt!377132) bit!26) (= (_1!11241 lt!377132) (_2!11240 lt!377130))))))

(declare-fun readBitPure!0 (BitStream!10550) tuple2!20638)

(declare-fun readerFrom!0 (BitStream!10550 (_ BitVec 32) (_ BitVec 32)) BitStream!10550)

(assert (=> b!241682 (= lt!377132 (readBitPure!0 (readerFrom!0 (_2!11240 lt!377130) (currentBit!11638 thiss!1005) (currentByte!11643 thiss!1005))))))

(assert (= (and start!52458 res!201757) b!241677))

(assert (= (and b!241677 res!201759) b!241681))

(assert (= (and b!241681 res!201755) b!241676))

(assert (= (and b!241676 res!201756) b!241679))

(assert (= (and b!241679 res!201758) b!241675))

(assert (= (and b!241675 res!201753) b!241682))

(assert (= (and b!241682 res!201754) b!241680))

(assert (= start!52458 b!241678))

(declare-fun m!364343 () Bool)

(assert (=> b!241678 m!364343))

(declare-fun m!364345 () Bool)

(assert (=> start!52458 m!364345))

(declare-fun m!364347 () Bool)

(assert (=> b!241679 m!364347))

(declare-fun m!364349 () Bool)

(assert (=> b!241679 m!364349))

(declare-fun m!364351 () Bool)

(assert (=> b!241682 m!364351))

(assert (=> b!241682 m!364351))

(declare-fun m!364353 () Bool)

(assert (=> b!241682 m!364353))

(declare-fun m!364355 () Bool)

(assert (=> b!241680 m!364355))

(declare-fun m!364357 () Bool)

(assert (=> b!241675 m!364357))

(declare-fun m!364359 () Bool)

(assert (=> b!241676 m!364359))

(declare-fun m!364361 () Bool)

(assert (=> b!241676 m!364361))

(declare-fun m!364363 () Bool)

(assert (=> b!241676 m!364363))

(declare-fun m!364365 () Bool)

(assert (=> b!241677 m!364365))

(push 1)

