; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5706 () Bool)

(assert start!5706)

(declare-fun b!24462 () Bool)

(declare-fun res!21117 () Bool)

(declare-fun e!16672 () Bool)

(assert (=> b!24462 (=> (not res!21117) (not e!16672))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((array!1629 0))(
  ( (array!1630 (arr!1156 (Array (_ BitVec 32) (_ BitVec 8))) (size!700 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1232 0))(
  ( (BitStream!1233 (buf!1021 array!1629) (currentByte!2334 (_ BitVec 32)) (currentBit!2329 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1232)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!24462 (= res!21117 (validate_offset_bits!1 ((_ sign_extend 32) (size!700 (buf!1021 thiss!1379))) ((_ sign_extend 32) (currentByte!2334 thiss!1379)) ((_ sign_extend 32) (currentBit!2329 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!24463 () Bool)

(declare-fun e!16675 () Bool)

(assert (=> b!24463 (= e!16675 (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!2043 0))(
  ( (Unit!2044) )
))
(declare-datatypes ((tuple2!2782 0))(
  ( (tuple2!2783 (_1!1478 Unit!2043) (_2!1478 BitStream!1232)) )
))
(declare-fun lt!34942 () tuple2!2782)

(declare-fun lt!34938 () tuple2!2782)

(declare-fun lt!34941 () (_ BitVec 64))

(assert (=> b!24463 (validate_offset_bits!1 ((_ sign_extend 32) (size!700 (buf!1021 (_2!1478 lt!34942)))) ((_ sign_extend 32) (currentByte!2334 (_2!1478 lt!34938))) ((_ sign_extend 32) (currentBit!2329 (_2!1478 lt!34938))) lt!34941)))

(declare-fun lt!34939 () Unit!2043)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1232 array!1629 (_ BitVec 64)) Unit!2043)

(assert (=> b!24463 (= lt!34939 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1478 lt!34938) (buf!1021 (_2!1478 lt!34942)) lt!34941))))

(declare-datatypes ((tuple2!2784 0))(
  ( (tuple2!2785 (_1!1479 BitStream!1232) (_2!1479 BitStream!1232)) )
))
(declare-fun lt!34943 () tuple2!2784)

(declare-fun reader!0 (BitStream!1232 BitStream!1232) tuple2!2784)

(assert (=> b!24463 (= lt!34943 (reader!0 (_2!1478 lt!34938) (_2!1478 lt!34942)))))

(assert (=> b!24463 (validate_offset_bits!1 ((_ sign_extend 32) (size!700 (buf!1021 (_2!1478 lt!34942)))) ((_ sign_extend 32) (currentByte!2334 thiss!1379)) ((_ sign_extend 32) (currentBit!2329 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!34949 () Unit!2043)

(assert (=> b!24463 (= lt!34949 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1021 (_2!1478 lt!34942)) (bvsub to!314 i!635)))))

(declare-fun lt!34950 () tuple2!2784)

(assert (=> b!24463 (= lt!34950 (reader!0 thiss!1379 (_2!1478 lt!34942)))))

(declare-fun srcBuffer!2 () array!1629)

(declare-fun b!24464 () Bool)

(declare-fun lt!34948 () tuple2!2784)

(declare-fun e!16678 () Bool)

(declare-datatypes ((List!317 0))(
  ( (Nil!314) (Cons!313 (h!432 Bool) (t!1067 List!317)) )
))
(declare-fun head!154 (List!317) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1232 array!1629 (_ BitVec 64) (_ BitVec 64)) List!317)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1232 BitStream!1232 (_ BitVec 64)) List!317)

(assert (=> b!24464 (= e!16678 (= (head!154 (byteArrayBitContentToList!0 (_2!1478 lt!34938) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!154 (bitStreamReadBitsIntoList!0 (_2!1478 lt!34938) (_1!1479 lt!34948) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun res!21122 () Bool)

(assert (=> start!5706 (=> (not res!21122) (not e!16672))))

(assert (=> start!5706 (= res!21122 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!700 srcBuffer!2))))))))

(assert (=> start!5706 e!16672))

(assert (=> start!5706 true))

(declare-fun array_inv!669 (array!1629) Bool)

(assert (=> start!5706 (array_inv!669 srcBuffer!2)))

(declare-fun e!16676 () Bool)

(declare-fun inv!12 (BitStream!1232) Bool)

(assert (=> start!5706 (and (inv!12 thiss!1379) e!16676)))

(declare-fun b!24465 () Bool)

(declare-fun res!21118 () Bool)

(assert (=> b!24465 (=> res!21118 e!16675)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!24465 (= res!21118 (not (invariant!0 (currentBit!2329 (_2!1478 lt!34938)) (currentByte!2334 (_2!1478 lt!34938)) (size!700 (buf!1021 (_2!1478 lt!34942))))))))

(declare-fun b!24466 () Bool)

(declare-fun e!16681 () Bool)

(assert (=> b!24466 (= e!16672 (not e!16681))))

(declare-fun res!21120 () Bool)

(assert (=> b!24466 (=> res!21120 e!16681)))

(assert (=> b!24466 (= res!21120 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1232 BitStream!1232) Bool)

(assert (=> b!24466 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!34945 () Unit!2043)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1232) Unit!2043)

(assert (=> b!24466 (= lt!34945 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!34946 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!24466 (= lt!34946 (bitIndex!0 (size!700 (buf!1021 thiss!1379)) (currentByte!2334 thiss!1379) (currentBit!2329 thiss!1379)))))

(declare-fun b!24467 () Bool)

(declare-fun res!21119 () Bool)

(assert (=> b!24467 (=> res!21119 e!16675)))

(assert (=> b!24467 (= res!21119 (not (invariant!0 (currentBit!2329 (_2!1478 lt!34938)) (currentByte!2334 (_2!1478 lt!34938)) (size!700 (buf!1021 (_2!1478 lt!34938))))))))

(declare-fun b!24468 () Bool)

(declare-fun e!16674 () Bool)

(declare-fun e!16671 () Bool)

(assert (=> b!24468 (= e!16674 e!16671)))

(declare-fun res!21121 () Bool)

(assert (=> b!24468 (=> res!21121 e!16671)))

(assert (=> b!24468 (= res!21121 (not (isPrefixOf!0 (_2!1478 lt!34938) (_2!1478 lt!34942))))))

(assert (=> b!24468 (isPrefixOf!0 thiss!1379 (_2!1478 lt!34942))))

(declare-fun lt!34944 () Unit!2043)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1232 BitStream!1232 BitStream!1232) Unit!2043)

(assert (=> b!24468 (= lt!34944 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1478 lt!34938) (_2!1478 lt!34942)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1232 array!1629 (_ BitVec 64) (_ BitVec 64)) tuple2!2782)

(assert (=> b!24468 (= lt!34942 (appendBitsMSBFirstLoop!0 (_2!1478 lt!34938) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!24468 e!16678))

(declare-fun res!21116 () Bool)

(assert (=> b!24468 (=> (not res!21116) (not e!16678))))

(assert (=> b!24468 (= res!21116 (validate_offset_bits!1 ((_ sign_extend 32) (size!700 (buf!1021 (_2!1478 lt!34938)))) ((_ sign_extend 32) (currentByte!2334 thiss!1379)) ((_ sign_extend 32) (currentBit!2329 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34947 () Unit!2043)

(assert (=> b!24468 (= lt!34947 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1021 (_2!1478 lt!34938)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!24468 (= lt!34948 (reader!0 thiss!1379 (_2!1478 lt!34938)))))

(declare-fun b!24469 () Bool)

(declare-fun res!21115 () Bool)

(declare-fun e!16673 () Bool)

(assert (=> b!24469 (=> res!21115 e!16673)))

(assert (=> b!24469 (= res!21115 (not (invariant!0 (currentBit!2329 (_2!1478 lt!34942)) (currentByte!2334 (_2!1478 lt!34942)) (size!700 (buf!1021 (_2!1478 lt!34942))))))))

(declare-fun b!24470 () Bool)

(assert (=> b!24470 (= e!16673 e!16675)))

(declare-fun res!21111 () Bool)

(assert (=> b!24470 (=> res!21111 e!16675)))

(assert (=> b!24470 (= res!21111 (not (= (size!700 (buf!1021 (_2!1478 lt!34938))) (size!700 (buf!1021 (_2!1478 lt!34942))))))))

(declare-fun e!16677 () Bool)

(assert (=> b!24470 e!16677))

(declare-fun res!21114 () Bool)

(assert (=> b!24470 (=> (not res!21114) (not e!16677))))

(assert (=> b!24470 (= res!21114 (= (size!700 (buf!1021 (_2!1478 lt!34942))) (size!700 (buf!1021 thiss!1379))))))

(declare-fun b!24471 () Bool)

(assert (=> b!24471 (= e!16681 e!16674)))

(declare-fun res!21123 () Bool)

(assert (=> b!24471 (=> res!21123 e!16674)))

(assert (=> b!24471 (= res!21123 (not (isPrefixOf!0 thiss!1379 (_2!1478 lt!34938))))))

(assert (=> b!24471 (validate_offset_bits!1 ((_ sign_extend 32) (size!700 (buf!1021 (_2!1478 lt!34938)))) ((_ sign_extend 32) (currentByte!2334 (_2!1478 lt!34938))) ((_ sign_extend 32) (currentBit!2329 (_2!1478 lt!34938))) lt!34941)))

(assert (=> b!24471 (= lt!34941 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34940 () Unit!2043)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1232 BitStream!1232 (_ BitVec 64) (_ BitVec 64)) Unit!2043)

(assert (=> b!24471 (= lt!34940 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1478 lt!34938) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1232 (_ BitVec 8) (_ BitVec 32)) tuple2!2782)

(assert (=> b!24471 (= lt!34938 (appendBitFromByte!0 thiss!1379 (select (arr!1156 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!24472 () Bool)

(assert (=> b!24472 (= e!16676 (array_inv!669 (buf!1021 thiss!1379)))))

(declare-fun b!24473 () Bool)

(declare-fun lt!34951 () (_ BitVec 64))

(assert (=> b!24473 (= e!16677 (= lt!34951 (bvsub (bvsub (bvadd (bitIndex!0 (size!700 (buf!1021 (_2!1478 lt!34938))) (currentByte!2334 (_2!1478 lt!34938)) (currentBit!2329 (_2!1478 lt!34938))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!24474 () Bool)

(declare-fun res!21112 () Bool)

(assert (=> b!24474 (=> res!21112 e!16673)))

(assert (=> b!24474 (= res!21112 (not (= (size!700 (buf!1021 thiss!1379)) (size!700 (buf!1021 (_2!1478 lt!34942))))))))

(declare-fun b!24475 () Bool)

(assert (=> b!24475 (= e!16671 e!16673)))

(declare-fun res!21113 () Bool)

(assert (=> b!24475 (=> res!21113 e!16673)))

(assert (=> b!24475 (= res!21113 (not (= lt!34951 (bvsub (bvadd lt!34946 to!314) i!635))))))

(assert (=> b!24475 (= lt!34951 (bitIndex!0 (size!700 (buf!1021 (_2!1478 lt!34942))) (currentByte!2334 (_2!1478 lt!34942)) (currentBit!2329 (_2!1478 lt!34942))))))

(assert (= (and start!5706 res!21122) b!24462))

(assert (= (and b!24462 res!21117) b!24466))

(assert (= (and b!24466 (not res!21120)) b!24471))

(assert (= (and b!24471 (not res!21123)) b!24468))

(assert (= (and b!24468 res!21116) b!24464))

(assert (= (and b!24468 (not res!21121)) b!24475))

(assert (= (and b!24475 (not res!21113)) b!24469))

(assert (= (and b!24469 (not res!21115)) b!24474))

(assert (= (and b!24474 (not res!21112)) b!24470))

(assert (= (and b!24470 res!21114) b!24473))

(assert (= (and b!24470 (not res!21111)) b!24467))

(assert (= (and b!24467 (not res!21119)) b!24465))

(assert (= (and b!24465 (not res!21118)) b!24463))

(assert (= start!5706 b!24472))

(declare-fun m!34549 () Bool)

(assert (=> b!24467 m!34549))

(declare-fun m!34551 () Bool)

(assert (=> b!24475 m!34551))

(declare-fun m!34553 () Bool)

(assert (=> b!24472 m!34553))

(declare-fun m!34555 () Bool)

(assert (=> b!24469 m!34555))

(declare-fun m!34557 () Bool)

(assert (=> b!24465 m!34557))

(declare-fun m!34559 () Bool)

(assert (=> b!24473 m!34559))

(declare-fun m!34561 () Bool)

(assert (=> b!24463 m!34561))

(declare-fun m!34563 () Bool)

(assert (=> b!24463 m!34563))

(declare-fun m!34565 () Bool)

(assert (=> b!24463 m!34565))

(declare-fun m!34567 () Bool)

(assert (=> b!24463 m!34567))

(declare-fun m!34569 () Bool)

(assert (=> b!24463 m!34569))

(declare-fun m!34571 () Bool)

(assert (=> b!24463 m!34571))

(declare-fun m!34573 () Bool)

(assert (=> b!24464 m!34573))

(assert (=> b!24464 m!34573))

(declare-fun m!34575 () Bool)

(assert (=> b!24464 m!34575))

(declare-fun m!34577 () Bool)

(assert (=> b!24464 m!34577))

(assert (=> b!24464 m!34577))

(declare-fun m!34579 () Bool)

(assert (=> b!24464 m!34579))

(declare-fun m!34581 () Bool)

(assert (=> b!24462 m!34581))

(declare-fun m!34583 () Bool)

(assert (=> b!24468 m!34583))

(declare-fun m!34585 () Bool)

(assert (=> b!24468 m!34585))

(declare-fun m!34587 () Bool)

(assert (=> b!24468 m!34587))

(declare-fun m!34589 () Bool)

(assert (=> b!24468 m!34589))

(declare-fun m!34591 () Bool)

(assert (=> b!24468 m!34591))

(declare-fun m!34593 () Bool)

(assert (=> b!24468 m!34593))

(declare-fun m!34595 () Bool)

(assert (=> b!24468 m!34595))

(declare-fun m!34597 () Bool)

(assert (=> start!5706 m!34597))

(declare-fun m!34599 () Bool)

(assert (=> start!5706 m!34599))

(declare-fun m!34601 () Bool)

(assert (=> b!24466 m!34601))

(declare-fun m!34603 () Bool)

(assert (=> b!24466 m!34603))

(declare-fun m!34605 () Bool)

(assert (=> b!24466 m!34605))

(declare-fun m!34607 () Bool)

(assert (=> b!24471 m!34607))

(declare-fun m!34609 () Bool)

(assert (=> b!24471 m!34609))

(declare-fun m!34611 () Bool)

(assert (=> b!24471 m!34611))

(declare-fun m!34613 () Bool)

(assert (=> b!24471 m!34613))

(assert (=> b!24471 m!34611))

(declare-fun m!34615 () Bool)

(assert (=> b!24471 m!34615))

(push 1)

(assert (not b!24463))

(assert (not b!24473))

(assert (not b!24472))

(assert (not b!24469))

(assert (not b!24468))

(assert (not b!24465))

(assert (not b!24475))

(assert (not start!5706))

(assert (not b!24464))

(assert (not b!24462))

(assert (not b!24466))

(assert (not b!24471))

(assert (not b!24467))

(check-sat)

(pop 1)

(push 1)

(check-sat)

