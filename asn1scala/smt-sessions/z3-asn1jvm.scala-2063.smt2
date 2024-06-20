; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52438 () Bool)

(assert start!52438)

(declare-fun b!241435 () Bool)

(declare-fun e!167347 () Bool)

(declare-datatypes ((array!13249 0))(
  ( (array!13250 (arr!6791 (Array (_ BitVec 32) (_ BitVec 8))) (size!5804 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10530 0))(
  ( (BitStream!10531 (buf!6270 array!13249) (currentByte!11633 (_ BitVec 32)) (currentBit!11628 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20596 0))(
  ( (tuple2!20597 (_1!11220 BitStream!10530) (_2!11220 Bool)) )
))
(declare-fun lt!376980 () tuple2!20596)

(declare-fun lt!376975 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!241435 (= e!167347 (= (bitIndex!0 (size!5804 (buf!6270 (_1!11220 lt!376980))) (currentByte!11633 (_1!11220 lt!376980)) (currentBit!11628 (_1!11220 lt!376980))) lt!376975))))

(declare-fun b!241436 () Bool)

(declare-fun e!167346 () Bool)

(declare-fun e!167348 () Bool)

(assert (=> b!241436 (= e!167346 e!167348)))

(declare-fun res!201545 () Bool)

(assert (=> b!241436 (=> (not res!201545) (not e!167348))))

(declare-fun lt!376979 () (_ BitVec 64))

(assert (=> b!241436 (= res!201545 (= lt!376975 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!376979)))))

(declare-datatypes ((Unit!17691 0))(
  ( (Unit!17692) )
))
(declare-datatypes ((tuple2!20598 0))(
  ( (tuple2!20599 (_1!11221 Unit!17691) (_2!11221 BitStream!10530)) )
))
(declare-fun lt!376976 () tuple2!20598)

(assert (=> b!241436 (= lt!376975 (bitIndex!0 (size!5804 (buf!6270 (_2!11221 lt!376976))) (currentByte!11633 (_2!11221 lt!376976)) (currentBit!11628 (_2!11221 lt!376976))))))

(declare-fun thiss!1005 () BitStream!10530)

(assert (=> b!241436 (= lt!376979 (bitIndex!0 (size!5804 (buf!6270 thiss!1005)) (currentByte!11633 thiss!1005) (currentBit!11628 thiss!1005)))))

(declare-fun b!241437 () Bool)

(declare-fun res!201544 () Bool)

(assert (=> b!241437 (=> (not res!201544) (not e!167348))))

(declare-fun isPrefixOf!0 (BitStream!10530 BitStream!10530) Bool)

(assert (=> b!241437 (= res!201544 (isPrefixOf!0 thiss!1005 (_2!11221 lt!376976)))))

(declare-fun b!241438 () Bool)

(declare-fun e!167344 () Bool)

(declare-fun array_inv!5545 (array!13249) Bool)

(assert (=> b!241438 (= e!167344 (array_inv!5545 (buf!6270 thiss!1005)))))

(declare-fun b!241439 () Bool)

(declare-fun res!201543 () Bool)

(declare-fun e!167345 () Bool)

(assert (=> b!241439 (=> (not res!201543) (not e!167345))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!241439 (= res!201543 (validate_offset_bits!1 ((_ sign_extend 32) (size!5804 (buf!6270 thiss!1005))) ((_ sign_extend 32) (currentByte!11633 thiss!1005)) ((_ sign_extend 32) (currentBit!11628 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun res!201546 () Bool)

(assert (=> start!52438 (=> (not res!201546) (not e!167345))))

(assert (=> start!52438 (= res!201546 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52438 e!167345))

(assert (=> start!52438 true))

(declare-fun inv!12 (BitStream!10530) Bool)

(assert (=> start!52438 (and (inv!12 thiss!1005) e!167344)))

(declare-fun b!241440 () Bool)

(assert (=> b!241440 (= e!167348 e!167347)))

(declare-fun res!201548 () Bool)

(assert (=> b!241440 (=> (not res!201548) (not e!167347))))

(declare-fun bit!26 () Bool)

(assert (=> b!241440 (= res!201548 (and (= (_2!11220 lt!376980) bit!26) (= (_1!11220 lt!376980) (_2!11221 lt!376976))))))

(declare-fun readBitPure!0 (BitStream!10530) tuple2!20596)

(declare-fun readerFrom!0 (BitStream!10530 (_ BitVec 32) (_ BitVec 32)) BitStream!10530)

(assert (=> b!241440 (= lt!376980 (readBitPure!0 (readerFrom!0 (_2!11221 lt!376976) (currentBit!11628 thiss!1005) (currentByte!11633 thiss!1005))))))

(declare-fun b!241441 () Bool)

(declare-fun res!201547 () Bool)

(assert (=> b!241441 (=> (not res!201547) (not e!167345))))

(assert (=> b!241441 (= res!201547 (bvslt from!289 nBits!297))))

(declare-fun b!241442 () Bool)

(assert (=> b!241442 (= e!167345 (not true))))

(declare-fun lt!376978 () (_ BitVec 64))

(assert (=> b!241442 (= lt!376978 (bitIndex!0 (size!5804 (buf!6270 (_2!11221 lt!376976))) (currentByte!11633 (_2!11221 lt!376976)) (currentBit!11628 (_2!11221 lt!376976))))))

(declare-fun lt!376977 () (_ BitVec 64))

(assert (=> b!241442 (= lt!376977 (bitIndex!0 (size!5804 (buf!6270 thiss!1005)) (currentByte!11633 thiss!1005) (currentBit!11628 thiss!1005)))))

(assert (=> b!241442 e!167346))

(declare-fun res!201549 () Bool)

(assert (=> b!241442 (=> (not res!201549) (not e!167346))))

(assert (=> b!241442 (= res!201549 (= (size!5804 (buf!6270 thiss!1005)) (size!5804 (buf!6270 (_2!11221 lt!376976)))))))

(declare-fun appendBit!0 (BitStream!10530 Bool) tuple2!20598)

(assert (=> b!241442 (= lt!376976 (appendBit!0 thiss!1005 bit!26))))

(assert (= (and start!52438 res!201546) b!241439))

(assert (= (and b!241439 res!201543) b!241441))

(assert (= (and b!241441 res!201547) b!241442))

(assert (= (and b!241442 res!201549) b!241436))

(assert (= (and b!241436 res!201545) b!241437))

(assert (= (and b!241437 res!201544) b!241440))

(assert (= (and b!241440 res!201548) b!241435))

(assert (= start!52438 b!241438))

(declare-fun m!364111 () Bool)

(assert (=> b!241437 m!364111))

(declare-fun m!364113 () Bool)

(assert (=> b!241440 m!364113))

(assert (=> b!241440 m!364113))

(declare-fun m!364115 () Bool)

(assert (=> b!241440 m!364115))

(declare-fun m!364117 () Bool)

(assert (=> b!241436 m!364117))

(declare-fun m!364119 () Bool)

(assert (=> b!241436 m!364119))

(assert (=> b!241442 m!364117))

(assert (=> b!241442 m!364119))

(declare-fun m!364121 () Bool)

(assert (=> b!241442 m!364121))

(declare-fun m!364123 () Bool)

(assert (=> start!52438 m!364123))

(declare-fun m!364125 () Bool)

(assert (=> b!241435 m!364125))

(declare-fun m!364127 () Bool)

(assert (=> b!241438 m!364127))

(declare-fun m!364129 () Bool)

(assert (=> b!241439 m!364129))

(check-sat (not b!241442) (not b!241437) (not b!241439) (not b!241438) (not b!241436) (not b!241435) (not b!241440) (not start!52438))
