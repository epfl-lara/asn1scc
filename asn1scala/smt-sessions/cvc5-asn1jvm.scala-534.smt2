; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15648 () Bool)

(assert start!15648)

(declare-fun b!79164 () Bool)

(declare-fun e!51939 () Bool)

(assert (=> b!79164 (= e!51939 (not true))))

(declare-fun e!51941 () Bool)

(assert (=> b!79164 e!51941))

(declare-fun res!65530 () Bool)

(assert (=> b!79164 (=> (not res!65530) (not e!51941))))

(declare-datatypes ((array!3376 0))(
  ( (array!3377 (arr!2160 (Array (_ BitVec 32) (_ BitVec 8))) (size!1559 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2680 0))(
  ( (BitStream!2681 (buf!1949 array!3376) (currentByte!3820 (_ BitVec 32)) (currentBit!3815 (_ BitVec 32))) )
))
(declare-fun thiss!1107 () BitStream!2680)

(declare-datatypes ((Unit!5203 0))(
  ( (Unit!5204) )
))
(declare-datatypes ((tuple2!7058 0))(
  ( (tuple2!7059 (_1!3666 Unit!5203) (_2!3666 BitStream!2680)) )
))
(declare-fun lt!126053 () tuple2!7058)

(assert (=> b!79164 (= res!65530 (= (size!1559 (buf!1949 thiss!1107)) (size!1559 (buf!1949 (_2!3666 lt!126053)))))))

(declare-fun lt!126050 () Bool)

(declare-fun appendBit!0 (BitStream!2680 Bool) tuple2!7058)

(assert (=> b!79164 (= lt!126053 (appendBit!0 thiss!1107 lt!126050))))

(declare-fun b!215 () (_ BitVec 8))

(declare-fun bitNr!1 () (_ BitVec 32))

(assert (=> b!79164 (= lt!126050 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) b!215))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) bitNr!1))) #b00000000000000000000000000000000)))))

(declare-fun res!65526 () Bool)

(assert (=> start!15648 (=> (not res!65526) (not e!51939))))

(assert (=> start!15648 (= res!65526 (and (bvsge bitNr!1 #b00000000000000000000000000000000) (bvslt bitNr!1 #b00000000000000000000000000001000)))))

(assert (=> start!15648 e!51939))

(assert (=> start!15648 true))

(declare-fun e!51942 () Bool)

(declare-fun inv!12 (BitStream!2680) Bool)

(assert (=> start!15648 (and (inv!12 thiss!1107) e!51942)))

(declare-fun b!79165 () Bool)

(declare-fun e!51940 () Bool)

(assert (=> b!79165 (= e!51941 e!51940)))

(declare-fun res!65529 () Bool)

(assert (=> b!79165 (=> (not res!65529) (not e!51940))))

(declare-fun lt!126052 () (_ BitVec 64))

(declare-fun lt!126054 () (_ BitVec 64))

(assert (=> b!79165 (= res!65529 (= lt!126052 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!126054)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!79165 (= lt!126052 (bitIndex!0 (size!1559 (buf!1949 (_2!3666 lt!126053))) (currentByte!3820 (_2!3666 lt!126053)) (currentBit!3815 (_2!3666 lt!126053))))))

(assert (=> b!79165 (= lt!126054 (bitIndex!0 (size!1559 (buf!1949 thiss!1107)) (currentByte!3820 thiss!1107) (currentBit!3815 thiss!1107)))))

(declare-fun b!79166 () Bool)

(declare-fun res!65528 () Bool)

(assert (=> b!79166 (=> (not res!65528) (not e!51939))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!79166 (= res!65528 (validate_offset_bit!0 ((_ sign_extend 32) (size!1559 (buf!1949 thiss!1107))) ((_ sign_extend 32) (currentByte!3820 thiss!1107)) ((_ sign_extend 32) (currentBit!3815 thiss!1107))))))

(declare-fun b!79167 () Bool)

(declare-fun e!51937 () Bool)

(assert (=> b!79167 (= e!51940 e!51937)))

(declare-fun res!65525 () Bool)

(assert (=> b!79167 (=> (not res!65525) (not e!51937))))

(declare-datatypes ((tuple2!7060 0))(
  ( (tuple2!7061 (_1!3667 BitStream!2680) (_2!3667 Bool)) )
))
(declare-fun lt!126051 () tuple2!7060)

(assert (=> b!79167 (= res!65525 (and (= (_2!3667 lt!126051) lt!126050) (= (_1!3667 lt!126051) (_2!3666 lt!126053))))))

(declare-fun readBitPure!0 (BitStream!2680) tuple2!7060)

(declare-fun readerFrom!0 (BitStream!2680 (_ BitVec 32) (_ BitVec 32)) BitStream!2680)

(assert (=> b!79167 (= lt!126051 (readBitPure!0 (readerFrom!0 (_2!3666 lt!126053) (currentBit!3815 thiss!1107) (currentByte!3820 thiss!1107))))))

(declare-fun b!79168 () Bool)

(declare-fun array_inv!1405 (array!3376) Bool)

(assert (=> b!79168 (= e!51942 (array_inv!1405 (buf!1949 thiss!1107)))))

(declare-fun b!79169 () Bool)

(declare-fun res!65527 () Bool)

(assert (=> b!79169 (=> (not res!65527) (not e!51940))))

(declare-fun isPrefixOf!0 (BitStream!2680 BitStream!2680) Bool)

(assert (=> b!79169 (= res!65527 (isPrefixOf!0 thiss!1107 (_2!3666 lt!126053)))))

(declare-fun b!79170 () Bool)

(assert (=> b!79170 (= e!51937 (= (bitIndex!0 (size!1559 (buf!1949 (_1!3667 lt!126051))) (currentByte!3820 (_1!3667 lt!126051)) (currentBit!3815 (_1!3667 lt!126051))) lt!126052))))

(assert (= (and start!15648 res!65526) b!79166))

(assert (= (and b!79166 res!65528) b!79164))

(assert (= (and b!79164 res!65530) b!79165))

(assert (= (and b!79165 res!65529) b!79169))

(assert (= (and b!79169 res!65527) b!79167))

(assert (= (and b!79167 res!65525) b!79170))

(assert (= start!15648 b!79168))

(declare-fun m!124593 () Bool)

(assert (=> b!79167 m!124593))

(assert (=> b!79167 m!124593))

(declare-fun m!124595 () Bool)

(assert (=> b!79167 m!124595))

(declare-fun m!124597 () Bool)

(assert (=> b!79166 m!124597))

(declare-fun m!124599 () Bool)

(assert (=> b!79170 m!124599))

(declare-fun m!124601 () Bool)

(assert (=> b!79165 m!124601))

(declare-fun m!124603 () Bool)

(assert (=> b!79165 m!124603))

(declare-fun m!124605 () Bool)

(assert (=> b!79169 m!124605))

(declare-fun m!124607 () Bool)

(assert (=> start!15648 m!124607))

(declare-fun m!124609 () Bool)

(assert (=> b!79164 m!124609))

(declare-fun m!124611 () Bool)

(assert (=> b!79164 m!124611))

(declare-fun m!124613 () Bool)

(assert (=> b!79168 m!124613))

(push 1)

(assert (not b!79167))

(assert (not b!79169))

(assert (not b!79164))

(assert (not b!79165))

(assert (not b!79170))

(assert (not b!79166))

(assert (not b!79168))

(assert (not start!15648))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

