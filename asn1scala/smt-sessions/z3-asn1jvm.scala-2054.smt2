; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52362 () Bool)

(assert start!52362)

(declare-fun b!241011 () Bool)

(declare-fun res!201202 () Bool)

(declare-fun e!167002 () Bool)

(assert (=> b!241011 (=> (not res!201202) (not e!167002))))

(declare-datatypes ((array!13191 0))(
  ( (array!13192 (arr!6764 (Array (_ BitVec 32) (_ BitVec 8))) (size!5777 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10476 0))(
  ( (BitStream!10477 (buf!6243 array!13191) (currentByte!11603 (_ BitVec 32)) (currentBit!11598 (_ BitVec 32))) )
))
(declare-fun thiss!982 () BitStream!10476)

(declare-fun nBits!288 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!241011 (= res!201202 (validate_offset_bits!1 ((_ sign_extend 32) (size!5777 (buf!6243 thiss!982))) ((_ sign_extend 32) (currentByte!11603 thiss!982)) ((_ sign_extend 32) (currentBit!11598 thiss!982)) nBits!288))))

(declare-fun res!201200 () Bool)

(assert (=> start!52362 (=> (not res!201200) (not e!167002))))

(assert (=> start!52362 (= res!201200 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52362 e!167002))

(assert (=> start!52362 true))

(declare-fun e!167000 () Bool)

(declare-fun inv!12 (BitStream!10476) Bool)

(assert (=> start!52362 (and (inv!12 thiss!982) e!167000)))

(declare-fun b!241012 () Bool)

(declare-fun array_inv!5518 (array!13191) Bool)

(assert (=> b!241012 (= e!167000 (array_inv!5518 (buf!6243 thiss!982)))))

(declare-fun b!241013 () Bool)

(assert (=> b!241013 (= e!167002 (not true))))

(declare-datatypes ((tuple2!20508 0))(
  ( (tuple2!20509 (_1!11176 BitStream!10476) (_2!11176 BitStream!10476)) )
))
(declare-fun lt!376593 () tuple2!20508)

(declare-datatypes ((Unit!17655 0))(
  ( (Unit!17656) )
))
(declare-datatypes ((tuple2!20510 0))(
  ( (tuple2!20511 (_1!11177 Unit!17655) (_2!11177 BitStream!10476)) )
))
(declare-fun lt!376589 () tuple2!20510)

(declare-fun reader!0 (BitStream!10476 BitStream!10476) tuple2!20508)

(assert (=> b!241013 (= lt!376593 (reader!0 thiss!982 (_2!11177 lt!376589)))))

(declare-fun lt!376590 () Bool)

(declare-fun isPrefixOf!0 (BitStream!10476 BitStream!10476) Bool)

(assert (=> b!241013 (= lt!376590 (isPrefixOf!0 thiss!982 (_2!11177 lt!376589)))))

(declare-fun lt!376591 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!241013 (= lt!376591 (bitIndex!0 (size!5777 (buf!6243 (_2!11177 lt!376589))) (currentByte!11603 (_2!11177 lt!376589)) (currentBit!11598 (_2!11177 lt!376589))))))

(declare-fun lt!376595 () (_ BitVec 64))

(assert (=> b!241013 (= lt!376595 (bitIndex!0 (size!5777 (buf!6243 thiss!982)) (currentByte!11603 thiss!982) (currentBit!11598 thiss!982)))))

(declare-fun e!167003 () Bool)

(assert (=> b!241013 e!167003))

(declare-fun res!201201 () Bool)

(assert (=> b!241013 (=> (not res!201201) (not e!167003))))

(assert (=> b!241013 (= res!201201 (= (size!5777 (buf!6243 thiss!982)) (size!5777 (buf!6243 (_2!11177 lt!376589)))))))

(declare-fun bit!21 () Bool)

(declare-fun appendNBitsLoop!0 (BitStream!10476 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20510)

(assert (=> b!241013 (= lt!376589 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!241014 () Bool)

(declare-fun res!201204 () Bool)

(assert (=> b!241014 (=> (not res!201204) (not e!167003))))

(assert (=> b!241014 (= res!201204 (isPrefixOf!0 thiss!982 (_2!11177 lt!376589)))))

(declare-fun b!241015 () Bool)

(declare-datatypes ((tuple2!20512 0))(
  ( (tuple2!20513 (_1!11178 BitStream!10476) (_2!11178 Bool)) )
))
(declare-fun lt!376596 () tuple2!20512)

(declare-fun lt!376592 () tuple2!20508)

(assert (=> b!241015 (= e!167003 (not (or (not (_2!11178 lt!376596)) (not (= (_1!11178 lt!376596) (_2!11176 lt!376592))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10476 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20512)

(assert (=> b!241015 (= lt!376596 (checkBitsLoopPure!0 (_1!11176 lt!376592) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!241015 (validate_offset_bits!1 ((_ sign_extend 32) (size!5777 (buf!6243 (_2!11177 lt!376589)))) ((_ sign_extend 32) (currentByte!11603 thiss!982)) ((_ sign_extend 32) (currentBit!11598 thiss!982)) nBits!288)))

(declare-fun lt!376594 () Unit!17655)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10476 array!13191 (_ BitVec 64)) Unit!17655)

(assert (=> b!241015 (= lt!376594 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6243 (_2!11177 lt!376589)) nBits!288))))

(assert (=> b!241015 (= lt!376592 (reader!0 thiss!982 (_2!11177 lt!376589)))))

(declare-fun b!241016 () Bool)

(declare-fun res!201203 () Bool)

(assert (=> b!241016 (=> (not res!201203) (not e!167003))))

(assert (=> b!241016 (= res!201203 (= (bitIndex!0 (size!5777 (buf!6243 (_2!11177 lt!376589))) (currentByte!11603 (_2!11177 lt!376589)) (currentBit!11598 (_2!11177 lt!376589))) (bvadd (bitIndex!0 (size!5777 (buf!6243 thiss!982)) (currentByte!11603 thiss!982) (currentBit!11598 thiss!982)) nBits!288)))))

(assert (= (and start!52362 res!201200) b!241011))

(assert (= (and b!241011 res!201202) b!241013))

(assert (= (and b!241013 res!201201) b!241016))

(assert (= (and b!241016 res!201203) b!241014))

(assert (= (and b!241014 res!201204) b!241015))

(assert (= start!52362 b!241012))

(declare-fun m!363679 () Bool)

(assert (=> b!241014 m!363679))

(declare-fun m!363681 () Bool)

(assert (=> b!241013 m!363681))

(declare-fun m!363683 () Bool)

(assert (=> b!241013 m!363683))

(declare-fun m!363685 () Bool)

(assert (=> b!241013 m!363685))

(assert (=> b!241013 m!363679))

(declare-fun m!363687 () Bool)

(assert (=> b!241013 m!363687))

(declare-fun m!363689 () Bool)

(assert (=> b!241012 m!363689))

(declare-fun m!363691 () Bool)

(assert (=> b!241015 m!363691))

(declare-fun m!363693 () Bool)

(assert (=> b!241015 m!363693))

(declare-fun m!363695 () Bool)

(assert (=> b!241015 m!363695))

(assert (=> b!241015 m!363681))

(declare-fun m!363697 () Bool)

(assert (=> start!52362 m!363697))

(assert (=> b!241016 m!363687))

(assert (=> b!241016 m!363683))

(declare-fun m!363699 () Bool)

(assert (=> b!241011 m!363699))

(check-sat (not b!241013) (not b!241015) (not b!241012) (not b!241011) (not start!52362) (not b!241014) (not b!241016))
