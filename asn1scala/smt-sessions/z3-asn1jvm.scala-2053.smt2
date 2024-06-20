; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52356 () Bool)

(assert start!52356)

(declare-fun b!240957 () Bool)

(declare-fun res!201155 () Bool)

(declare-fun e!166964 () Bool)

(assert (=> b!240957 (=> (not res!201155) (not e!166964))))

(declare-datatypes ((array!13185 0))(
  ( (array!13186 (arr!6761 (Array (_ BitVec 32) (_ BitVec 8))) (size!5774 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10470 0))(
  ( (BitStream!10471 (buf!6240 array!13185) (currentByte!11600 (_ BitVec 32)) (currentBit!11595 (_ BitVec 32))) )
))
(declare-fun thiss!982 () BitStream!10470)

(declare-fun nBits!288 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240957 (= res!201155 (validate_offset_bits!1 ((_ sign_extend 32) (size!5774 (buf!6240 thiss!982))) ((_ sign_extend 32) (currentByte!11600 thiss!982)) ((_ sign_extend 32) (currentBit!11595 thiss!982)) nBits!288))))

(declare-fun b!240958 () Bool)

(assert (=> b!240958 (= e!166964 (not true))))

(declare-datatypes ((tuple2!20490 0))(
  ( (tuple2!20491 (_1!11167 BitStream!10470) (_2!11167 BitStream!10470)) )
))
(declare-fun lt!376523 () tuple2!20490)

(declare-datatypes ((Unit!17649 0))(
  ( (Unit!17650) )
))
(declare-datatypes ((tuple2!20492 0))(
  ( (tuple2!20493 (_1!11168 Unit!17649) (_2!11168 BitStream!10470)) )
))
(declare-fun lt!376522 () tuple2!20492)

(declare-fun reader!0 (BitStream!10470 BitStream!10470) tuple2!20490)

(assert (=> b!240958 (= lt!376523 (reader!0 thiss!982 (_2!11168 lt!376522)))))

(declare-fun lt!376517 () Bool)

(declare-fun isPrefixOf!0 (BitStream!10470 BitStream!10470) Bool)

(assert (=> b!240958 (= lt!376517 (isPrefixOf!0 thiss!982 (_2!11168 lt!376522)))))

(declare-fun lt!376524 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!240958 (= lt!376524 (bitIndex!0 (size!5774 (buf!6240 (_2!11168 lt!376522))) (currentByte!11600 (_2!11168 lt!376522)) (currentBit!11595 (_2!11168 lt!376522))))))

(declare-fun lt!376520 () (_ BitVec 64))

(assert (=> b!240958 (= lt!376520 (bitIndex!0 (size!5774 (buf!6240 thiss!982)) (currentByte!11600 thiss!982) (currentBit!11595 thiss!982)))))

(declare-fun e!166967 () Bool)

(assert (=> b!240958 e!166967))

(declare-fun res!201157 () Bool)

(assert (=> b!240958 (=> (not res!201157) (not e!166967))))

(assert (=> b!240958 (= res!201157 (= (size!5774 (buf!6240 thiss!982)) (size!5774 (buf!6240 (_2!11168 lt!376522)))))))

(declare-fun bit!21 () Bool)

(declare-fun appendNBitsLoop!0 (BitStream!10470 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20492)

(assert (=> b!240958 (= lt!376522 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!240960 () Bool)

(declare-datatypes ((tuple2!20494 0))(
  ( (tuple2!20495 (_1!11169 BitStream!10470) (_2!11169 Bool)) )
))
(declare-fun lt!376519 () tuple2!20494)

(declare-fun lt!376521 () tuple2!20490)

(assert (=> b!240960 (= e!166967 (not (or (not (_2!11169 lt!376519)) (not (= (_1!11169 lt!376519) (_2!11167 lt!376521))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10470 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20494)

(assert (=> b!240960 (= lt!376519 (checkBitsLoopPure!0 (_1!11167 lt!376521) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240960 (validate_offset_bits!1 ((_ sign_extend 32) (size!5774 (buf!6240 (_2!11168 lt!376522)))) ((_ sign_extend 32) (currentByte!11600 thiss!982)) ((_ sign_extend 32) (currentBit!11595 thiss!982)) nBits!288)))

(declare-fun lt!376518 () Unit!17649)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10470 array!13185 (_ BitVec 64)) Unit!17649)

(assert (=> b!240960 (= lt!376518 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6240 (_2!11168 lt!376522)) nBits!288))))

(assert (=> b!240960 (= lt!376521 (reader!0 thiss!982 (_2!11168 lt!376522)))))

(declare-fun b!240961 () Bool)

(declare-fun res!201156 () Bool)

(assert (=> b!240961 (=> (not res!201156) (not e!166967))))

(assert (=> b!240961 (= res!201156 (isPrefixOf!0 thiss!982 (_2!11168 lt!376522)))))

(declare-fun b!240962 () Bool)

(declare-fun e!166966 () Bool)

(declare-fun array_inv!5515 (array!13185) Bool)

(assert (=> b!240962 (= e!166966 (array_inv!5515 (buf!6240 thiss!982)))))

(declare-fun b!240959 () Bool)

(declare-fun res!201159 () Bool)

(assert (=> b!240959 (=> (not res!201159) (not e!166967))))

(assert (=> b!240959 (= res!201159 (= (bitIndex!0 (size!5774 (buf!6240 (_2!11168 lt!376522))) (currentByte!11600 (_2!11168 lt!376522)) (currentBit!11595 (_2!11168 lt!376522))) (bvadd (bitIndex!0 (size!5774 (buf!6240 thiss!982)) (currentByte!11600 thiss!982) (currentBit!11595 thiss!982)) nBits!288)))))

(declare-fun res!201158 () Bool)

(assert (=> start!52356 (=> (not res!201158) (not e!166964))))

(assert (=> start!52356 (= res!201158 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52356 e!166964))

(assert (=> start!52356 true))

(declare-fun inv!12 (BitStream!10470) Bool)

(assert (=> start!52356 (and (inv!12 thiss!982) e!166966)))

(assert (= (and start!52356 res!201158) b!240957))

(assert (= (and b!240957 res!201155) b!240958))

(assert (= (and b!240958 res!201157) b!240959))

(assert (= (and b!240959 res!201159) b!240961))

(assert (= (and b!240961 res!201156) b!240960))

(assert (= start!52356 b!240962))

(declare-fun m!363613 () Bool)

(assert (=> b!240959 m!363613))

(declare-fun m!363615 () Bool)

(assert (=> b!240959 m!363615))

(declare-fun m!363617 () Bool)

(assert (=> b!240957 m!363617))

(declare-fun m!363619 () Bool)

(assert (=> b!240962 m!363619))

(assert (=> b!240958 m!363613))

(assert (=> b!240958 m!363615))

(declare-fun m!363621 () Bool)

(assert (=> b!240958 m!363621))

(declare-fun m!363623 () Bool)

(assert (=> b!240958 m!363623))

(declare-fun m!363625 () Bool)

(assert (=> b!240958 m!363625))

(declare-fun m!363627 () Bool)

(assert (=> start!52356 m!363627))

(assert (=> b!240961 m!363621))

(declare-fun m!363629 () Bool)

(assert (=> b!240960 m!363629))

(declare-fun m!363631 () Bool)

(assert (=> b!240960 m!363631))

(declare-fun m!363633 () Bool)

(assert (=> b!240960 m!363633))

(assert (=> b!240960 m!363625))

(check-sat (not b!240957) (not b!240959) (not b!240960) (not b!240961) (not b!240962) (not b!240958) (not start!52356))
