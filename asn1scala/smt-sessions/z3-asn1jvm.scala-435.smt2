; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11804 () Bool)

(assert start!11804)

(declare-fun b!58488 () Bool)

(declare-fun e!38798 () Bool)

(assert (=> b!58488 (= e!38798 true)))

(declare-datatypes ((array!2661 0))(
  ( (array!2662 (arr!1770 (Array (_ BitVec 32) (_ BitVec 8))) (size!1206 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2100 0))(
  ( (BitStream!2101 (buf!1587 array!2661) (currentByte!3205 (_ BitVec 32)) (currentBit!3200 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!5322 0))(
  ( (tuple2!5323 (_1!2772 BitStream!2100) (_2!2772 BitStream!2100)) )
))
(declare-fun lt!92379 () tuple2!5322)

(declare-fun thiss!1379 () BitStream!2100)

(declare-datatypes ((Unit!4035 0))(
  ( (Unit!4036) )
))
(declare-datatypes ((tuple2!5324 0))(
  ( (tuple2!5325 (_1!2773 Unit!4035) (_2!2773 BitStream!2100)) )
))
(declare-fun lt!92378 () tuple2!5324)

(declare-fun reader!0 (BitStream!2100 BitStream!2100) tuple2!5322)

(assert (=> b!58488 (= lt!92379 (reader!0 thiss!1379 (_2!2773 lt!92378)))))

(declare-fun b!58489 () Bool)

(declare-fun e!38801 () Bool)

(declare-fun e!38799 () Bool)

(assert (=> b!58489 (= e!38801 (not e!38799))))

(declare-fun res!48583 () Bool)

(assert (=> b!58489 (=> res!48583 e!38799)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!58489 (= res!48583 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2100 BitStream!2100) Bool)

(assert (=> b!58489 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!92375 () Unit!4035)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2100) Unit!4035)

(assert (=> b!58489 (= lt!92375 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!92380 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!58489 (= lt!92380 (bitIndex!0 (size!1206 (buf!1587 thiss!1379)) (currentByte!3205 thiss!1379) (currentBit!3200 thiss!1379)))))

(declare-fun b!58490 () Bool)

(declare-fun e!38802 () Bool)

(declare-fun array_inv!1109 (array!2661) Bool)

(assert (=> b!58490 (= e!38802 (array_inv!1109 (buf!1587 thiss!1379)))))

(declare-fun b!58491 () Bool)

(declare-fun e!38804 () Bool)

(declare-fun e!38807 () Bool)

(assert (=> b!58491 (= e!38804 e!38807)))

(declare-fun res!48593 () Bool)

(assert (=> b!58491 (=> res!48593 e!38807)))

(declare-fun lt!92372 () tuple2!5324)

(assert (=> b!58491 (= res!48593 (not (isPrefixOf!0 (_2!2773 lt!92372) (_2!2773 lt!92378))))))

(assert (=> b!58491 (isPrefixOf!0 thiss!1379 (_2!2773 lt!92378))))

(declare-fun lt!92376 () Unit!4035)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2100 BitStream!2100 BitStream!2100) Unit!4035)

(assert (=> b!58491 (= lt!92376 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2773 lt!92372) (_2!2773 lt!92378)))))

(declare-fun srcBuffer!2 () array!2661)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2100 array!2661 (_ BitVec 64) (_ BitVec 64)) tuple2!5324)

(assert (=> b!58491 (= lt!92378 (appendBitsMSBFirstLoop!0 (_2!2773 lt!92372) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!38800 () Bool)

(assert (=> b!58491 e!38800))

(declare-fun res!48592 () Bool)

(assert (=> b!58491 (=> (not res!48592) (not e!38800))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!58491 (= res!48592 (validate_offset_bits!1 ((_ sign_extend 32) (size!1206 (buf!1587 (_2!2773 lt!92372)))) ((_ sign_extend 32) (currentByte!3205 thiss!1379)) ((_ sign_extend 32) (currentBit!3200 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92371 () Unit!4035)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2100 array!2661 (_ BitVec 64)) Unit!4035)

(assert (=> b!58491 (= lt!92371 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1587 (_2!2773 lt!92372)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92377 () tuple2!5322)

(assert (=> b!58491 (= lt!92377 (reader!0 thiss!1379 (_2!2773 lt!92372)))))

(declare-fun b!58493 () Bool)

(declare-fun res!48582 () Bool)

(assert (=> b!58493 (=> (not res!48582) (not e!38801))))

(assert (=> b!58493 (= res!48582 (validate_offset_bits!1 ((_ sign_extend 32) (size!1206 (buf!1587 thiss!1379))) ((_ sign_extend 32) (currentByte!3205 thiss!1379)) ((_ sign_extend 32) (currentBit!3200 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!58494 () Bool)

(declare-fun res!48594 () Bool)

(declare-fun e!38806 () Bool)

(assert (=> b!58494 (=> res!48594 e!38806)))

(assert (=> b!58494 (= res!48594 (not (= (size!1206 (buf!1587 thiss!1379)) (size!1206 (buf!1587 (_2!2773 lt!92378))))))))

(declare-fun b!58495 () Bool)

(assert (=> b!58495 (= e!38799 e!38804)))

(declare-fun res!48589 () Bool)

(assert (=> b!58495 (=> res!48589 e!38804)))

(assert (=> b!58495 (= res!48589 (not (isPrefixOf!0 thiss!1379 (_2!2773 lt!92372))))))

(assert (=> b!58495 (validate_offset_bits!1 ((_ sign_extend 32) (size!1206 (buf!1587 (_2!2773 lt!92372)))) ((_ sign_extend 32) (currentByte!3205 (_2!2773 lt!92372))) ((_ sign_extend 32) (currentBit!3200 (_2!2773 lt!92372))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92374 () Unit!4035)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2100 BitStream!2100 (_ BitVec 64) (_ BitVec 64)) Unit!4035)

(assert (=> b!58495 (= lt!92374 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2773 lt!92372) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2100 (_ BitVec 8) (_ BitVec 32)) tuple2!5324)

(assert (=> b!58495 (= lt!92372 (appendBitFromByte!0 thiss!1379 (select (arr!1770 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!58496 () Bool)

(declare-fun res!48591 () Bool)

(assert (=> b!58496 (=> res!48591 e!38798)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!58496 (= res!48591 (not (invariant!0 (currentBit!3200 (_2!2773 lt!92372)) (currentByte!3205 (_2!2773 lt!92372)) (size!1206 (buf!1587 (_2!2773 lt!92372))))))))

(declare-fun b!58497 () Bool)

(declare-fun res!48586 () Bool)

(assert (=> b!58497 (=> res!48586 e!38798)))

(assert (=> b!58497 (= res!48586 (not (invariant!0 (currentBit!3200 (_2!2773 lt!92372)) (currentByte!3205 (_2!2773 lt!92372)) (size!1206 (buf!1587 (_2!2773 lt!92378))))))))

(declare-fun lt!92373 () (_ BitVec 64))

(declare-fun e!38797 () Bool)

(declare-fun b!58498 () Bool)

(assert (=> b!58498 (= e!38797 (= lt!92373 (bvsub (bvsub (bvadd (bitIndex!0 (size!1206 (buf!1587 (_2!2773 lt!92372))) (currentByte!3205 (_2!2773 lt!92372)) (currentBit!3200 (_2!2773 lt!92372))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!58499 () Bool)

(declare-fun res!48585 () Bool)

(assert (=> b!58499 (=> res!48585 e!38806)))

(assert (=> b!58499 (= res!48585 (not (invariant!0 (currentBit!3200 (_2!2773 lt!92378)) (currentByte!3205 (_2!2773 lt!92378)) (size!1206 (buf!1587 (_2!2773 lt!92378))))))))

(declare-fun b!58492 () Bool)

(declare-datatypes ((List!625 0))(
  ( (Nil!622) (Cons!621 (h!740 Bool) (t!1375 List!625)) )
))
(declare-fun head!444 (List!625) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2100 array!2661 (_ BitVec 64) (_ BitVec 64)) List!625)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2100 BitStream!2100 (_ BitVec 64)) List!625)

(assert (=> b!58492 (= e!38800 (= (head!444 (byteArrayBitContentToList!0 (_2!2773 lt!92372) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!444 (bitStreamReadBitsIntoList!0 (_2!2773 lt!92372) (_1!2772 lt!92377) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun res!48584 () Bool)

(assert (=> start!11804 (=> (not res!48584) (not e!38801))))

(assert (=> start!11804 (= res!48584 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1206 srcBuffer!2))))))))

(assert (=> start!11804 e!38801))

(assert (=> start!11804 true))

(assert (=> start!11804 (array_inv!1109 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2100) Bool)

(assert (=> start!11804 (and (inv!12 thiss!1379) e!38802)))

(declare-fun b!58500 () Bool)

(assert (=> b!58500 (= e!38806 e!38798)))

(declare-fun res!48590 () Bool)

(assert (=> b!58500 (=> res!48590 e!38798)))

(assert (=> b!58500 (= res!48590 (not (= (size!1206 (buf!1587 (_2!2773 lt!92372))) (size!1206 (buf!1587 (_2!2773 lt!92378))))))))

(assert (=> b!58500 e!38797))

(declare-fun res!48588 () Bool)

(assert (=> b!58500 (=> (not res!48588) (not e!38797))))

(assert (=> b!58500 (= res!48588 (= (size!1206 (buf!1587 (_2!2773 lt!92378))) (size!1206 (buf!1587 thiss!1379))))))

(declare-fun b!58501 () Bool)

(assert (=> b!58501 (= e!38807 e!38806)))

(declare-fun res!48587 () Bool)

(assert (=> b!58501 (=> res!48587 e!38806)))

(assert (=> b!58501 (= res!48587 (not (= lt!92373 (bvsub (bvadd lt!92380 to!314) i!635))))))

(assert (=> b!58501 (= lt!92373 (bitIndex!0 (size!1206 (buf!1587 (_2!2773 lt!92378))) (currentByte!3205 (_2!2773 lt!92378)) (currentBit!3200 (_2!2773 lt!92378))))))

(assert (= (and start!11804 res!48584) b!58493))

(assert (= (and b!58493 res!48582) b!58489))

(assert (= (and b!58489 (not res!48583)) b!58495))

(assert (= (and b!58495 (not res!48589)) b!58491))

(assert (= (and b!58491 res!48592) b!58492))

(assert (= (and b!58491 (not res!48593)) b!58501))

(assert (= (and b!58501 (not res!48587)) b!58499))

(assert (= (and b!58499 (not res!48585)) b!58494))

(assert (= (and b!58494 (not res!48594)) b!58500))

(assert (= (and b!58500 res!48588) b!58498))

(assert (= (and b!58500 (not res!48590)) b!58496))

(assert (= (and b!58496 (not res!48591)) b!58497))

(assert (= (and b!58497 (not res!48586)) b!58488))

(assert (= start!11804 b!58490))

(declare-fun m!92141 () Bool)

(assert (=> b!58492 m!92141))

(assert (=> b!58492 m!92141))

(declare-fun m!92143 () Bool)

(assert (=> b!58492 m!92143))

(declare-fun m!92145 () Bool)

(assert (=> b!58492 m!92145))

(assert (=> b!58492 m!92145))

(declare-fun m!92147 () Bool)

(assert (=> b!58492 m!92147))

(declare-fun m!92149 () Bool)

(assert (=> b!58499 m!92149))

(declare-fun m!92151 () Bool)

(assert (=> b!58501 m!92151))

(declare-fun m!92153 () Bool)

(assert (=> b!58498 m!92153))

(declare-fun m!92155 () Bool)

(assert (=> start!11804 m!92155))

(declare-fun m!92157 () Bool)

(assert (=> start!11804 m!92157))

(declare-fun m!92159 () Bool)

(assert (=> b!58491 m!92159))

(declare-fun m!92161 () Bool)

(assert (=> b!58491 m!92161))

(declare-fun m!92163 () Bool)

(assert (=> b!58491 m!92163))

(declare-fun m!92165 () Bool)

(assert (=> b!58491 m!92165))

(declare-fun m!92167 () Bool)

(assert (=> b!58491 m!92167))

(declare-fun m!92169 () Bool)

(assert (=> b!58491 m!92169))

(declare-fun m!92171 () Bool)

(assert (=> b!58491 m!92171))

(declare-fun m!92173 () Bool)

(assert (=> b!58493 m!92173))

(declare-fun m!92175 () Bool)

(assert (=> b!58490 m!92175))

(declare-fun m!92177 () Bool)

(assert (=> b!58489 m!92177))

(declare-fun m!92179 () Bool)

(assert (=> b!58489 m!92179))

(declare-fun m!92181 () Bool)

(assert (=> b!58489 m!92181))

(declare-fun m!92183 () Bool)

(assert (=> b!58488 m!92183))

(declare-fun m!92185 () Bool)

(assert (=> b!58495 m!92185))

(declare-fun m!92187 () Bool)

(assert (=> b!58495 m!92187))

(declare-fun m!92189 () Bool)

(assert (=> b!58495 m!92189))

(declare-fun m!92191 () Bool)

(assert (=> b!58495 m!92191))

(assert (=> b!58495 m!92189))

(declare-fun m!92193 () Bool)

(assert (=> b!58495 m!92193))

(declare-fun m!92195 () Bool)

(assert (=> b!58496 m!92195))

(declare-fun m!92197 () Bool)

(assert (=> b!58497 m!92197))

(check-sat (not b!58489) (not b!58498) (not b!58492) (not b!58488) (not b!58495) (not b!58493) (not b!58490) (not b!58497) (not b!58491) (not b!58501) (not b!58499) (not start!11804) (not b!58496))
