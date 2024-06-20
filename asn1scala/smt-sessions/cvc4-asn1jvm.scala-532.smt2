; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15586 () Bool)

(assert start!15586)

(declare-fun b!78945 () Bool)

(declare-fun e!51796 () Bool)

(assert (=> b!78945 (= e!51796 true)))

(declare-datatypes ((array!3365 0))(
  ( (array!3366 (arr!2156 (Array (_ BitVec 32) (_ BitVec 8))) (size!1555 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2672 0))(
  ( (BitStream!2673 (buf!1945 array!3365) (currentByte!3807 (_ BitVec 32)) (currentBit!3802 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!7036 0))(
  ( (tuple2!7037 (_1!3655 BitStream!2672) (_2!3655 Bool)) )
))
(declare-fun lt!125837 () tuple2!7036)

(declare-datatypes ((Unit!5195 0))(
  ( (Unit!5196) )
))
(declare-datatypes ((tuple2!7038 0))(
  ( (tuple2!7039 (_1!3656 Unit!5195) (_2!3656 BitStream!2672)) )
))
(declare-fun lt!125833 () tuple2!7038)

(declare-fun thiss!1107 () BitStream!2672)

(declare-fun readBitPure!0 (BitStream!2672) tuple2!7036)

(declare-fun readerFrom!0 (BitStream!2672 (_ BitVec 32) (_ BitVec 32)) BitStream!2672)

(assert (=> b!78945 (= lt!125837 (readBitPure!0 (readerFrom!0 (_2!3656 lt!125833) (currentBit!3802 thiss!1107) (currentByte!3807 thiss!1107))))))

(declare-fun b!78946 () Bool)

(declare-fun res!65319 () Bool)

(declare-fun e!51797 () Bool)

(assert (=> b!78946 (=> (not res!65319) (not e!51797))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!78946 (= res!65319 (validate_offset_bit!0 ((_ sign_extend 32) (size!1555 (buf!1945 thiss!1107))) ((_ sign_extend 32) (currentByte!3807 thiss!1107)) ((_ sign_extend 32) (currentBit!3802 thiss!1107))))))

(declare-fun b!78947 () Bool)

(declare-fun e!51801 () Bool)

(declare-fun lt!125838 () tuple2!7036)

(declare-fun lt!125835 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!78947 (= e!51801 (= (bitIndex!0 (size!1555 (buf!1945 (_1!3655 lt!125838))) (currentByte!3807 (_1!3655 lt!125838)) (currentBit!3802 (_1!3655 lt!125838))) lt!125835))))

(declare-fun b!78949 () Bool)

(declare-fun res!65323 () Bool)

(assert (=> b!78949 (=> res!65323 e!51796)))

(assert (=> b!78949 (= res!65323 (not (= (bitIndex!0 (size!1555 (buf!1945 (_2!3656 lt!125833))) (currentByte!3807 (_2!3656 lt!125833)) (currentBit!3802 (_2!3656 lt!125833))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1555 (buf!1945 thiss!1107)) (currentByte!3807 thiss!1107) (currentBit!3802 thiss!1107))))))))

(declare-fun b!78950 () Bool)

(assert (=> b!78950 (= e!51797 (not e!51796))))

(declare-fun res!65324 () Bool)

(assert (=> b!78950 (=> res!65324 e!51796)))

(assert (=> b!78950 (= res!65324 (not (= (size!1555 (buf!1945 (_2!3656 lt!125833))) (size!1555 (buf!1945 thiss!1107)))))))

(declare-fun e!51800 () Bool)

(assert (=> b!78950 e!51800))

(declare-fun res!65322 () Bool)

(assert (=> b!78950 (=> (not res!65322) (not e!51800))))

(assert (=> b!78950 (= res!65322 (= (size!1555 (buf!1945 thiss!1107)) (size!1555 (buf!1945 (_2!3656 lt!125833)))))))

(declare-fun lt!125836 () Bool)

(declare-fun appendBit!0 (BitStream!2672 Bool) tuple2!7038)

(assert (=> b!78950 (= lt!125833 (appendBit!0 thiss!1107 lt!125836))))

(declare-fun b!215 () (_ BitVec 8))

(declare-fun bitNr!1 () (_ BitVec 32))

(assert (=> b!78950 (= lt!125836 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) b!215))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) bitNr!1))) #b00000000000000000000000000000000)))))

(declare-fun b!78951 () Bool)

(declare-fun e!51798 () Bool)

(assert (=> b!78951 (= e!51798 e!51801)))

(declare-fun res!65318 () Bool)

(assert (=> b!78951 (=> (not res!65318) (not e!51801))))

(assert (=> b!78951 (= res!65318 (and (= (_2!3655 lt!125838) lt!125836) (= (_1!3655 lt!125838) (_2!3656 lt!125833))))))

(assert (=> b!78951 (= lt!125838 (readBitPure!0 (readerFrom!0 (_2!3656 lt!125833) (currentBit!3802 thiss!1107) (currentByte!3807 thiss!1107))))))

(declare-fun b!78952 () Bool)

(assert (=> b!78952 (= e!51800 e!51798)))

(declare-fun res!65325 () Bool)

(assert (=> b!78952 (=> (not res!65325) (not e!51798))))

(declare-fun lt!125834 () (_ BitVec 64))

(assert (=> b!78952 (= res!65325 (= lt!125835 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!125834)))))

(assert (=> b!78952 (= lt!125835 (bitIndex!0 (size!1555 (buf!1945 (_2!3656 lt!125833))) (currentByte!3807 (_2!3656 lt!125833)) (currentBit!3802 (_2!3656 lt!125833))))))

(assert (=> b!78952 (= lt!125834 (bitIndex!0 (size!1555 (buf!1945 thiss!1107)) (currentByte!3807 thiss!1107) (currentBit!3802 thiss!1107)))))

(declare-fun b!78953 () Bool)

(declare-fun res!65321 () Bool)

(assert (=> b!78953 (=> res!65321 e!51796)))

(declare-fun isPrefixOf!0 (BitStream!2672 BitStream!2672) Bool)

(assert (=> b!78953 (= res!65321 (not (isPrefixOf!0 thiss!1107 (_2!3656 lt!125833))))))

(declare-fun b!78954 () Bool)

(declare-fun e!51795 () Bool)

(declare-fun array_inv!1401 (array!3365) Bool)

(assert (=> b!78954 (= e!51795 (array_inv!1401 (buf!1945 thiss!1107)))))

(declare-fun res!65326 () Bool)

(assert (=> start!15586 (=> (not res!65326) (not e!51797))))

(assert (=> start!15586 (= res!65326 (and (bvsge bitNr!1 #b00000000000000000000000000000000) (bvslt bitNr!1 #b00000000000000000000000000001000)))))

(assert (=> start!15586 e!51797))

(assert (=> start!15586 true))

(declare-fun inv!12 (BitStream!2672) Bool)

(assert (=> start!15586 (and (inv!12 thiss!1107) e!51795)))

(declare-fun b!78948 () Bool)

(declare-fun res!65320 () Bool)

(assert (=> b!78948 (=> (not res!65320) (not e!51798))))

(assert (=> b!78948 (= res!65320 (isPrefixOf!0 thiss!1107 (_2!3656 lt!125833)))))

(assert (= (and start!15586 res!65326) b!78946))

(assert (= (and b!78946 res!65319) b!78950))

(assert (= (and b!78950 res!65322) b!78952))

(assert (= (and b!78952 res!65325) b!78948))

(assert (= (and b!78948 res!65320) b!78951))

(assert (= (and b!78951 res!65318) b!78947))

(assert (= (and b!78950 (not res!65324)) b!78949))

(assert (= (and b!78949 (not res!65323)) b!78953))

(assert (= (and b!78953 (not res!65321)) b!78945))

(assert (= start!15586 b!78954))

(declare-fun m!124391 () Bool)

(assert (=> b!78952 m!124391))

(declare-fun m!124393 () Bool)

(assert (=> b!78952 m!124393))

(assert (=> b!78949 m!124391))

(assert (=> b!78949 m!124393))

(declare-fun m!124395 () Bool)

(assert (=> b!78951 m!124395))

(assert (=> b!78951 m!124395))

(declare-fun m!124397 () Bool)

(assert (=> b!78951 m!124397))

(declare-fun m!124399 () Bool)

(assert (=> b!78953 m!124399))

(declare-fun m!124401 () Bool)

(assert (=> b!78950 m!124401))

(declare-fun m!124403 () Bool)

(assert (=> b!78950 m!124403))

(declare-fun m!124405 () Bool)

(assert (=> b!78947 m!124405))

(declare-fun m!124407 () Bool)

(assert (=> start!15586 m!124407))

(assert (=> b!78948 m!124399))

(declare-fun m!124409 () Bool)

(assert (=> b!78946 m!124409))

(assert (=> b!78945 m!124395))

(assert (=> b!78945 m!124395))

(assert (=> b!78945 m!124397))

(declare-fun m!124411 () Bool)

(assert (=> b!78954 m!124411))

(push 1)

(assert (not b!78954))

(assert (not b!78949))

(assert (not b!78951))

(assert (not b!78946))

(assert (not b!78950))

(assert (not b!78948))

(assert (not b!78953))

(assert (not b!78952))

(assert (not start!15586))

(assert (not b!78947))

(assert (not b!78945))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

