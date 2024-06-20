; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15712 () Bool)

(assert start!15712)

(declare-fun b!79478 () Bool)

(declare-fun e!52175 () Bool)

(declare-datatypes ((array!3395 0))(
  ( (array!3396 (arr!2168 (Array (_ BitVec 32) (_ BitVec 8))) (size!1567 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2696 0))(
  ( (BitStream!2697 (buf!1957 array!3395) (currentByte!3834 (_ BitVec 32)) (currentBit!3829 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!7100 0))(
  ( (tuple2!7101 (_1!3687 BitStream!2696) (_2!3687 Bool)) )
))
(declare-fun lt!126363 () tuple2!7100)

(declare-fun lt!126366 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!79478 (= e!52175 (= (bitIndex!0 (size!1567 (buf!1957 (_1!3687 lt!126363))) (currentByte!3834 (_1!3687 lt!126363)) (currentBit!3829 (_1!3687 lt!126363))) lt!126366))))

(declare-fun res!65818 () Bool)

(declare-fun e!52178 () Bool)

(assert (=> start!15712 (=> (not res!65818) (not e!52178))))

(declare-fun bitNr!1 () (_ BitVec 32))

(assert (=> start!15712 (= res!65818 (and (bvsge bitNr!1 #b00000000000000000000000000000000) (bvslt bitNr!1 #b00000000000000000000000000001000)))))

(assert (=> start!15712 e!52178))

(assert (=> start!15712 true))

(declare-fun thiss!1107 () BitStream!2696)

(declare-fun e!52177 () Bool)

(declare-fun inv!12 (BitStream!2696) Bool)

(assert (=> start!15712 (and (inv!12 thiss!1107) e!52177)))

(declare-fun b!79479 () Bool)

(declare-fun res!65817 () Bool)

(declare-fun e!52182 () Bool)

(assert (=> b!79479 (=> (not res!65817) (not e!52182))))

(declare-datatypes ((Unit!5219 0))(
  ( (Unit!5220) )
))
(declare-datatypes ((tuple2!7102 0))(
  ( (tuple2!7103 (_1!3688 Unit!5219) (_2!3688 BitStream!2696)) )
))
(declare-fun lt!126365 () tuple2!7102)

(declare-fun isPrefixOf!0 (BitStream!2696 BitStream!2696) Bool)

(assert (=> b!79479 (= res!65817 (isPrefixOf!0 thiss!1107 (_2!3688 lt!126365)))))

(declare-fun b!79480 () Bool)

(declare-fun e!52180 () Bool)

(declare-fun e!52179 () Bool)

(assert (=> b!79480 (= e!52180 e!52179)))

(declare-fun res!65824 () Bool)

(assert (=> b!79480 (=> (not res!65824) (not e!52179))))

(declare-fun lt!126372 () (_ BitVec 64))

(assert (=> b!79480 (= res!65824 (= lt!126366 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!126372)))))

(assert (=> b!79480 (= lt!126366 (bitIndex!0 (size!1567 (buf!1957 (_2!3688 lt!126365))) (currentByte!3834 (_2!3688 lt!126365)) (currentBit!3829 (_2!3688 lt!126365))))))

(assert (=> b!79480 (= lt!126372 (bitIndex!0 (size!1567 (buf!1957 thiss!1107)) (currentByte!3834 thiss!1107) (currentBit!3829 thiss!1107)))))

(declare-fun b!79481 () Bool)

(assert (=> b!79481 (= e!52179 e!52175)))

(declare-fun res!65822 () Bool)

(assert (=> b!79481 (=> (not res!65822) (not e!52175))))

(declare-fun lt!126368 () Bool)

(assert (=> b!79481 (= res!65822 (and (= (_2!3687 lt!126363) lt!126368) (= (_1!3687 lt!126363) (_2!3688 lt!126365))))))

(declare-fun readBitPure!0 (BitStream!2696) tuple2!7100)

(declare-fun readerFrom!0 (BitStream!2696 (_ BitVec 32) (_ BitVec 32)) BitStream!2696)

(assert (=> b!79481 (= lt!126363 (readBitPure!0 (readerFrom!0 (_2!3688 lt!126365) (currentBit!3829 thiss!1107) (currentByte!3834 thiss!1107))))))

(declare-fun b!79482 () Bool)

(declare-fun res!65820 () Bool)

(assert (=> b!79482 (=> (not res!65820) (not e!52179))))

(assert (=> b!79482 (= res!65820 (isPrefixOf!0 thiss!1107 (_2!3688 lt!126365)))))

(declare-fun b!79483 () Bool)

(declare-fun res!65816 () Bool)

(assert (=> b!79483 (=> (not res!65816) (not e!52178))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!79483 (= res!65816 (validate_offset_bit!0 ((_ sign_extend 32) (size!1567 (buf!1957 thiss!1107))) ((_ sign_extend 32) (currentByte!3834 thiss!1107)) ((_ sign_extend 32) (currentBit!3829 thiss!1107))))))

(declare-fun b!79484 () Bool)

(declare-fun e!52174 () Bool)

(assert (=> b!79484 (= e!52174 e!52182)))

(declare-fun res!65815 () Bool)

(assert (=> b!79484 (=> (not res!65815) (not e!52182))))

(declare-fun lt!126369 () (_ BitVec 64))

(declare-fun lt!126367 () (_ BitVec 64))

(assert (=> b!79484 (= res!65815 (= lt!126369 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!126367)))))

(assert (=> b!79484 (= lt!126369 (bitIndex!0 (size!1567 (buf!1957 (_2!3688 lt!126365))) (currentByte!3834 (_2!3688 lt!126365)) (currentBit!3829 (_2!3688 lt!126365))))))

(assert (=> b!79484 (= lt!126367 (bitIndex!0 (size!1567 (buf!1957 thiss!1107)) (currentByte!3834 thiss!1107) (currentBit!3829 thiss!1107)))))

(declare-fun b!79485 () Bool)

(assert (=> b!79485 (= e!52178 (not e!52174))))

(declare-fun res!65821 () Bool)

(assert (=> b!79485 (=> (not res!65821) (not e!52174))))

(assert (=> b!79485 (= res!65821 (= (size!1567 (buf!1957 (_2!3688 lt!126365))) (size!1567 (buf!1957 thiss!1107))))))

(assert (=> b!79485 e!52180))

(declare-fun res!65823 () Bool)

(assert (=> b!79485 (=> (not res!65823) (not e!52180))))

(assert (=> b!79485 (= res!65823 (= (size!1567 (buf!1957 thiss!1107)) (size!1567 (buf!1957 (_2!3688 lt!126365)))))))

(declare-fun appendBit!0 (BitStream!2696 Bool) tuple2!7102)

(assert (=> b!79485 (= lt!126365 (appendBit!0 thiss!1107 lt!126368))))

(declare-fun b!215 () (_ BitVec 8))

(assert (=> b!79485 (= lt!126368 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) b!215))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) bitNr!1))) #b00000000000000000000000000000000)))))

(declare-fun b!79486 () Bool)

(declare-fun array_inv!1413 (array!3395) Bool)

(assert (=> b!79486 (= e!52177 (array_inv!1413 (buf!1957 thiss!1107)))))

(declare-fun b!79487 () Bool)

(declare-fun e!52176 () Bool)

(assert (=> b!79487 (= e!52182 e!52176)))

(declare-fun res!65819 () Bool)

(assert (=> b!79487 (=> (not res!65819) (not e!52176))))

(declare-fun lt!126370 () tuple2!7100)

(assert (=> b!79487 (= res!65819 (and (= (_2!3687 lt!126370) lt!126368) (= (_1!3687 lt!126370) (_2!3688 lt!126365))))))

(declare-datatypes ((tuple2!7104 0))(
  ( (tuple2!7105 (_1!3689 array!3395) (_2!3689 BitStream!2696)) )
))
(declare-fun lt!126364 () tuple2!7104)

(declare-fun lt!126371 () BitStream!2696)

(declare-fun readBits!0 (BitStream!2696 (_ BitVec 64)) tuple2!7104)

(assert (=> b!79487 (= lt!126364 (readBits!0 lt!126371 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!79487 (= lt!126370 (readBitPure!0 lt!126371))))

(assert (=> b!79487 (= lt!126371 (readerFrom!0 (_2!3688 lt!126365) (currentBit!3829 thiss!1107) (currentByte!3834 thiss!1107)))))

(declare-fun b!79488 () Bool)

(assert (=> b!79488 (= e!52176 (= (bitIndex!0 (size!1567 (buf!1957 (_1!3687 lt!126370))) (currentByte!3834 (_1!3687 lt!126370)) (currentBit!3829 (_1!3687 lt!126370))) lt!126369))))

(assert (= (and start!15712 res!65818) b!79483))

(assert (= (and b!79483 res!65816) b!79485))

(assert (= (and b!79485 res!65823) b!79480))

(assert (= (and b!79480 res!65824) b!79482))

(assert (= (and b!79482 res!65820) b!79481))

(assert (= (and b!79481 res!65822) b!79478))

(assert (= (and b!79485 res!65821) b!79484))

(assert (= (and b!79484 res!65815) b!79479))

(assert (= (and b!79479 res!65817) b!79487))

(assert (= (and b!79487 res!65819) b!79488))

(assert (= start!15712 b!79486))

(declare-fun m!124871 () Bool)

(assert (=> b!79483 m!124871))

(declare-fun m!124873 () Bool)

(assert (=> b!79478 m!124873))

(declare-fun m!124875 () Bool)

(assert (=> start!15712 m!124875))

(declare-fun m!124877 () Bool)

(assert (=> b!79488 m!124877))

(declare-fun m!124879 () Bool)

(assert (=> b!79485 m!124879))

(declare-fun m!124881 () Bool)

(assert (=> b!79485 m!124881))

(declare-fun m!124883 () Bool)

(assert (=> b!79482 m!124883))

(declare-fun m!124885 () Bool)

(assert (=> b!79484 m!124885))

(declare-fun m!124887 () Bool)

(assert (=> b!79484 m!124887))

(declare-fun m!124889 () Bool)

(assert (=> b!79481 m!124889))

(assert (=> b!79481 m!124889))

(declare-fun m!124891 () Bool)

(assert (=> b!79481 m!124891))

(assert (=> b!79480 m!124885))

(assert (=> b!79480 m!124887))

(assert (=> b!79479 m!124883))

(declare-fun m!124893 () Bool)

(assert (=> b!79487 m!124893))

(declare-fun m!124895 () Bool)

(assert (=> b!79487 m!124895))

(assert (=> b!79487 m!124889))

(declare-fun m!124897 () Bool)

(assert (=> b!79486 m!124897))

(push 1)

(assert (not b!79479))

(assert (not start!15712))

(assert (not b!79485))

(assert (not b!79484))

(assert (not b!79486))

(assert (not b!79487))

(assert (not b!79483))

(assert (not b!79480))

(assert (not b!79488))

(assert (not b!79478))

(assert (not b!79481))

(assert (not b!79482))

(check-sat)

(pop 1)

(push 1)

(check-sat)

