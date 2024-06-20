; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52426 () Bool)

(assert start!52426)

(declare-fun b!241291 () Bool)

(declare-fun res!201421 () Bool)

(declare-fun e!167235 () Bool)

(assert (=> b!241291 (=> (not res!201421) (not e!167235))))

(declare-datatypes ((array!13237 0))(
  ( (array!13238 (arr!6785 (Array (_ BitVec 32) (_ BitVec 8))) (size!5798 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10518 0))(
  ( (BitStream!10519 (buf!6264 array!13237) (currentByte!11627 (_ BitVec 32)) (currentBit!11622 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10518)

(declare-datatypes ((Unit!17679 0))(
  ( (Unit!17680) )
))
(declare-datatypes ((tuple2!20572 0))(
  ( (tuple2!20573 (_1!11208 Unit!17679) (_2!11208 BitStream!10518)) )
))
(declare-fun lt!376869 () tuple2!20572)

(declare-fun isPrefixOf!0 (BitStream!10518 BitStream!10518) Bool)

(assert (=> b!241291 (= res!201421 (isPrefixOf!0 thiss!1005 (_2!11208 lt!376869)))))

(declare-fun b!241292 () Bool)

(declare-fun res!201420 () Bool)

(declare-fun e!167237 () Bool)

(assert (=> b!241292 (=> (not res!201420) (not e!167237))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!241292 (= res!201420 (validate_offset_bits!1 ((_ sign_extend 32) (size!5798 (buf!6264 thiss!1005))) ((_ sign_extend 32) (currentByte!11627 thiss!1005)) ((_ sign_extend 32) (currentBit!11622 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!241293 () Bool)

(declare-fun e!167238 () Bool)

(assert (=> b!241293 (= e!167238 e!167235)))

(declare-fun res!201422 () Bool)

(assert (=> b!241293 (=> (not res!201422) (not e!167235))))

(declare-fun lt!376870 () (_ BitVec 64))

(declare-fun lt!376871 () (_ BitVec 64))

(assert (=> b!241293 (= res!201422 (= lt!376870 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!376871)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!241293 (= lt!376870 (bitIndex!0 (size!5798 (buf!6264 (_2!11208 lt!376869))) (currentByte!11627 (_2!11208 lt!376869)) (currentBit!11622 (_2!11208 lt!376869))))))

(assert (=> b!241293 (= lt!376871 (bitIndex!0 (size!5798 (buf!6264 thiss!1005)) (currentByte!11627 thiss!1005) (currentBit!11622 thiss!1005)))))

(declare-fun b!241294 () Bool)

(declare-fun e!167236 () Bool)

(declare-fun array_inv!5539 (array!13237) Bool)

(assert (=> b!241294 (= e!167236 (array_inv!5539 (buf!6264 thiss!1005)))))

(declare-fun b!241295 () Bool)

(declare-fun e!167240 () Bool)

(assert (=> b!241295 (= e!167235 e!167240)))

(declare-fun res!201417 () Bool)

(assert (=> b!241295 (=> (not res!201417) (not e!167240))))

(declare-datatypes ((tuple2!20574 0))(
  ( (tuple2!20575 (_1!11209 BitStream!10518) (_2!11209 Bool)) )
))
(declare-fun lt!376867 () tuple2!20574)

(declare-fun bit!26 () Bool)

(assert (=> b!241295 (= res!201417 (and (= (_2!11209 lt!376867) bit!26) (= (_1!11209 lt!376867) (_2!11208 lt!376869))))))

(declare-fun readBitPure!0 (BitStream!10518) tuple2!20574)

(declare-fun readerFrom!0 (BitStream!10518 (_ BitVec 32) (_ BitVec 32)) BitStream!10518)

(assert (=> b!241295 (= lt!376867 (readBitPure!0 (readerFrom!0 (_2!11208 lt!376869) (currentBit!11622 thiss!1005) (currentByte!11627 thiss!1005))))))

(declare-fun b!241296 () Bool)

(assert (=> b!241296 (= e!167237 (not true))))

(declare-fun lt!376868 () (_ BitVec 64))

(assert (=> b!241296 (= lt!376868 (bitIndex!0 (size!5798 (buf!6264 (_2!11208 lt!376869))) (currentByte!11627 (_2!11208 lt!376869)) (currentBit!11622 (_2!11208 lt!376869))))))

(declare-fun lt!376872 () (_ BitVec 64))

(assert (=> b!241296 (= lt!376872 (bitIndex!0 (size!5798 (buf!6264 thiss!1005)) (currentByte!11627 thiss!1005) (currentBit!11622 thiss!1005)))))

(assert (=> b!241296 e!167238))

(declare-fun res!201418 () Bool)

(assert (=> b!241296 (=> (not res!201418) (not e!167238))))

(assert (=> b!241296 (= res!201418 (= (size!5798 (buf!6264 thiss!1005)) (size!5798 (buf!6264 (_2!11208 lt!376869)))))))

(declare-fun appendBit!0 (BitStream!10518 Bool) tuple2!20572)

(assert (=> b!241296 (= lt!376869 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!241297 () Bool)

(assert (=> b!241297 (= e!167240 (= (bitIndex!0 (size!5798 (buf!6264 (_1!11209 lt!376867))) (currentByte!11627 (_1!11209 lt!376867)) (currentBit!11622 (_1!11209 lt!376867))) lt!376870))))

(declare-fun b!241298 () Bool)

(declare-fun res!201419 () Bool)

(assert (=> b!241298 (=> (not res!201419) (not e!167237))))

(assert (=> b!241298 (= res!201419 (bvslt from!289 nBits!297))))

(declare-fun res!201423 () Bool)

(assert (=> start!52426 (=> (not res!201423) (not e!167237))))

(assert (=> start!52426 (= res!201423 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52426 e!167237))

(assert (=> start!52426 true))

(declare-fun inv!12 (BitStream!10518) Bool)

(assert (=> start!52426 (and (inv!12 thiss!1005) e!167236)))

(assert (= (and start!52426 res!201423) b!241292))

(assert (= (and b!241292 res!201420) b!241298))

(assert (= (and b!241298 res!201419) b!241296))

(assert (= (and b!241296 res!201418) b!241293))

(assert (= (and b!241293 res!201422) b!241291))

(assert (= (and b!241291 res!201421) b!241295))

(assert (= (and b!241295 res!201417) b!241297))

(assert (= start!52426 b!241294))

(declare-fun m!363991 () Bool)

(assert (=> b!241291 m!363991))

(declare-fun m!363993 () Bool)

(assert (=> b!241293 m!363993))

(declare-fun m!363995 () Bool)

(assert (=> b!241293 m!363995))

(declare-fun m!363997 () Bool)

(assert (=> b!241294 m!363997))

(declare-fun m!363999 () Bool)

(assert (=> b!241297 m!363999))

(assert (=> b!241296 m!363993))

(assert (=> b!241296 m!363995))

(declare-fun m!364001 () Bool)

(assert (=> b!241296 m!364001))

(declare-fun m!364003 () Bool)

(assert (=> start!52426 m!364003))

(declare-fun m!364005 () Bool)

(assert (=> b!241295 m!364005))

(assert (=> b!241295 m!364005))

(declare-fun m!364007 () Bool)

(assert (=> b!241295 m!364007))

(declare-fun m!364009 () Bool)

(assert (=> b!241292 m!364009))

(check-sat (not b!241294) (not b!241293) (not b!241292) (not start!52426) (not b!241295) (not b!241296) (not b!241291) (not b!241297))
