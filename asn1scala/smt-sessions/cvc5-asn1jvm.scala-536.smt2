; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15708 () Bool)

(assert start!15708)

(declare-fun b!79412 () Bool)

(declare-fun e!52124 () Bool)

(declare-fun e!52123 () Bool)

(assert (=> b!79412 (= e!52124 e!52123)))

(declare-fun res!65760 () Bool)

(assert (=> b!79412 (=> (not res!65760) (not e!52123))))

(declare-fun lt!126307 () (_ BitVec 64))

(declare-fun lt!126310 () (_ BitVec 64))

(assert (=> b!79412 (= res!65760 (= lt!126307 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!126310)))))

(declare-datatypes ((array!3391 0))(
  ( (array!3392 (arr!2166 (Array (_ BitVec 32) (_ BitVec 8))) (size!1565 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2692 0))(
  ( (BitStream!2693 (buf!1955 array!3391) (currentByte!3832 (_ BitVec 32)) (currentBit!3827 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5215 0))(
  ( (Unit!5216) )
))
(declare-datatypes ((tuple2!7088 0))(
  ( (tuple2!7089 (_1!3681 Unit!5215) (_2!3681 BitStream!2692)) )
))
(declare-fun lt!126308 () tuple2!7088)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!79412 (= lt!126307 (bitIndex!0 (size!1565 (buf!1955 (_2!3681 lt!126308))) (currentByte!3832 (_2!3681 lt!126308)) (currentBit!3827 (_2!3681 lt!126308))))))

(declare-fun thiss!1107 () BitStream!2692)

(assert (=> b!79412 (= lt!126310 (bitIndex!0 (size!1565 (buf!1955 thiss!1107)) (currentByte!3832 thiss!1107) (currentBit!3827 thiss!1107)))))

(declare-fun b!79413 () Bool)

(declare-fun e!52121 () Bool)

(declare-datatypes ((tuple2!7090 0))(
  ( (tuple2!7091 (_1!3682 BitStream!2692) (_2!3682 Bool)) )
))
(declare-fun lt!126312 () tuple2!7090)

(declare-fun lt!126311 () (_ BitVec 64))

(assert (=> b!79413 (= e!52121 (= (bitIndex!0 (size!1565 (buf!1955 (_1!3682 lt!126312))) (currentByte!3832 (_1!3682 lt!126312)) (currentBit!3827 (_1!3682 lt!126312))) lt!126311))))

(declare-fun b!79414 () Bool)

(declare-fun res!65759 () Bool)

(declare-fun e!52122 () Bool)

(assert (=> b!79414 (=> (not res!65759) (not e!52122))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!79414 (= res!65759 (validate_offset_bit!0 ((_ sign_extend 32) (size!1565 (buf!1955 thiss!1107))) ((_ sign_extend 32) (currentByte!3832 thiss!1107)) ((_ sign_extend 32) (currentBit!3827 thiss!1107))))))

(declare-fun res!65763 () Bool)

(assert (=> start!15708 (=> (not res!65763) (not e!52122))))

(declare-fun bitNr!1 () (_ BitVec 32))

(assert (=> start!15708 (= res!65763 (and (bvsge bitNr!1 #b00000000000000000000000000000000) (bvslt bitNr!1 #b00000000000000000000000000001000)))))

(assert (=> start!15708 e!52122))

(assert (=> start!15708 true))

(declare-fun e!52128 () Bool)

(declare-fun inv!12 (BitStream!2692) Bool)

(assert (=> start!15708 (and (inv!12 thiss!1107) e!52128)))

(declare-fun b!79415 () Bool)

(declare-fun res!65764 () Bool)

(declare-fun e!52120 () Bool)

(assert (=> b!79415 (=> (not res!65764) (not e!52120))))

(declare-fun isPrefixOf!0 (BitStream!2692 BitStream!2692) Bool)

(assert (=> b!79415 (= res!65764 (isPrefixOf!0 thiss!1107 (_2!3681 lt!126308)))))

(declare-fun b!79416 () Bool)

(declare-fun e!52126 () Bool)

(declare-fun lt!126309 () tuple2!7090)

(assert (=> b!79416 (= e!52126 (= (bitIndex!0 (size!1565 (buf!1955 (_1!3682 lt!126309))) (currentByte!3832 (_1!3682 lt!126309)) (currentBit!3827 (_1!3682 lt!126309))) lt!126307))))

(declare-fun b!79417 () Bool)

(assert (=> b!79417 (= e!52123 e!52126)))

(declare-fun res!65755 () Bool)

(assert (=> b!79417 (=> (not res!65755) (not e!52126))))

(declare-fun lt!126306 () Bool)

(assert (=> b!79417 (= res!65755 (and (= (_2!3682 lt!126309) lt!126306) (= (_1!3682 lt!126309) (_2!3681 lt!126308))))))

(declare-fun readBitPure!0 (BitStream!2692) tuple2!7090)

(declare-fun readerFrom!0 (BitStream!2692 (_ BitVec 32) (_ BitVec 32)) BitStream!2692)

(assert (=> b!79417 (= lt!126309 (readBitPure!0 (readerFrom!0 (_2!3681 lt!126308) (currentBit!3827 thiss!1107) (currentByte!3832 thiss!1107))))))

(declare-fun b!79418 () Bool)

(declare-fun array_inv!1411 (array!3391) Bool)

(assert (=> b!79418 (= e!52128 (array_inv!1411 (buf!1955 thiss!1107)))))

(declare-fun b!79419 () Bool)

(declare-fun e!52125 () Bool)

(assert (=> b!79419 (= e!52125 e!52120)))

(declare-fun res!65761 () Bool)

(assert (=> b!79419 (=> (not res!65761) (not e!52120))))

(declare-fun lt!126304 () (_ BitVec 64))

(assert (=> b!79419 (= res!65761 (= lt!126311 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!126304)))))

(assert (=> b!79419 (= lt!126311 (bitIndex!0 (size!1565 (buf!1955 (_2!3681 lt!126308))) (currentByte!3832 (_2!3681 lt!126308)) (currentBit!3827 (_2!3681 lt!126308))))))

(assert (=> b!79419 (= lt!126304 (bitIndex!0 (size!1565 (buf!1955 thiss!1107)) (currentByte!3832 thiss!1107) (currentBit!3827 thiss!1107)))))

(declare-fun b!79420 () Bool)

(assert (=> b!79420 (= e!52122 (not e!52125))))

(declare-fun res!65756 () Bool)

(assert (=> b!79420 (=> (not res!65756) (not e!52125))))

(assert (=> b!79420 (= res!65756 (= (size!1565 (buf!1955 (_2!3681 lt!126308))) (size!1565 (buf!1955 thiss!1107))))))

(assert (=> b!79420 e!52124))

(declare-fun res!65757 () Bool)

(assert (=> b!79420 (=> (not res!65757) (not e!52124))))

(assert (=> b!79420 (= res!65757 (= (size!1565 (buf!1955 thiss!1107)) (size!1565 (buf!1955 (_2!3681 lt!126308)))))))

(declare-fun appendBit!0 (BitStream!2692 Bool) tuple2!7088)

(assert (=> b!79420 (= lt!126308 (appendBit!0 thiss!1107 lt!126306))))

(declare-fun b!215 () (_ BitVec 8))

(assert (=> b!79420 (= lt!126306 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) b!215))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) bitNr!1))) #b00000000000000000000000000000000)))))

(declare-fun b!79421 () Bool)

(declare-fun res!65762 () Bool)

(assert (=> b!79421 (=> (not res!65762) (not e!52123))))

(assert (=> b!79421 (= res!65762 (isPrefixOf!0 thiss!1107 (_2!3681 lt!126308)))))

(declare-fun b!79422 () Bool)

(assert (=> b!79422 (= e!52120 e!52121)))

(declare-fun res!65758 () Bool)

(assert (=> b!79422 (=> (not res!65758) (not e!52121))))

(assert (=> b!79422 (= res!65758 (and (= (_2!3682 lt!126312) lt!126306) (= (_1!3682 lt!126312) (_2!3681 lt!126308))))))

(declare-datatypes ((tuple2!7092 0))(
  ( (tuple2!7093 (_1!3683 array!3391) (_2!3683 BitStream!2692)) )
))
(declare-fun lt!126305 () tuple2!7092)

(declare-fun lt!126303 () BitStream!2692)

(declare-fun readBits!0 (BitStream!2692 (_ BitVec 64)) tuple2!7092)

(assert (=> b!79422 (= lt!126305 (readBits!0 lt!126303 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!79422 (= lt!126312 (readBitPure!0 lt!126303))))

(assert (=> b!79422 (= lt!126303 (readerFrom!0 (_2!3681 lt!126308) (currentBit!3827 thiss!1107) (currentByte!3832 thiss!1107)))))

(assert (= (and start!15708 res!65763) b!79414))

(assert (= (and b!79414 res!65759) b!79420))

(assert (= (and b!79420 res!65757) b!79412))

(assert (= (and b!79412 res!65760) b!79421))

(assert (= (and b!79421 res!65762) b!79417))

(assert (= (and b!79417 res!65755) b!79416))

(assert (= (and b!79420 res!65756) b!79419))

(assert (= (and b!79419 res!65761) b!79415))

(assert (= (and b!79415 res!65764) b!79422))

(assert (= (and b!79422 res!65758) b!79413))

(assert (= start!15708 b!79418))

(declare-fun m!124815 () Bool)

(assert (=> b!79419 m!124815))

(declare-fun m!124817 () Bool)

(assert (=> b!79419 m!124817))

(declare-fun m!124819 () Bool)

(assert (=> b!79417 m!124819))

(assert (=> b!79417 m!124819))

(declare-fun m!124821 () Bool)

(assert (=> b!79417 m!124821))

(declare-fun m!124823 () Bool)

(assert (=> b!79413 m!124823))

(declare-fun m!124825 () Bool)

(assert (=> b!79415 m!124825))

(declare-fun m!124827 () Bool)

(assert (=> b!79420 m!124827))

(declare-fun m!124829 () Bool)

(assert (=> b!79420 m!124829))

(declare-fun m!124831 () Bool)

(assert (=> b!79416 m!124831))

(declare-fun m!124833 () Bool)

(assert (=> b!79422 m!124833))

(declare-fun m!124835 () Bool)

(assert (=> b!79422 m!124835))

(assert (=> b!79422 m!124819))

(declare-fun m!124837 () Bool)

(assert (=> b!79418 m!124837))

(declare-fun m!124839 () Bool)

(assert (=> start!15708 m!124839))

(assert (=> b!79412 m!124815))

(assert (=> b!79412 m!124817))

(assert (=> b!79421 m!124825))

(declare-fun m!124841 () Bool)

(assert (=> b!79414 m!124841))

(push 1)

(assert (not b!79419))

(assert (not b!79416))

(assert (not b!79418))

(assert (not b!79415))

(assert (not start!15708))

(assert (not b!79421))

(assert (not b!79413))

(assert (not b!79420))

(assert (not b!79414))

(assert (not b!79412))

(assert (not b!79422))

(assert (not b!79417))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

