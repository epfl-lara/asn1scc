; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52224 () Bool)

(assert start!52224)

(declare-fun b!240504 () Bool)

(declare-fun e!166699 () Bool)

(assert (=> b!240504 (= e!166699 (not true))))

(declare-datatypes ((array!13155 0))(
  ( (array!13156 (arr!6749 (Array (_ BitVec 32) (_ BitVec 8))) (size!5762 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10446 0))(
  ( (BitStream!10447 (buf!6222 array!13155) (currentByte!11576 (_ BitVec 32)) (currentBit!11571 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17625 0))(
  ( (Unit!17626) )
))
(declare-datatypes ((tuple2!20424 0))(
  ( (tuple2!20425 (_1!11134 Unit!17625) (_2!11134 BitStream!10446)) )
))
(declare-fun lt!375623 () tuple2!20424)

(declare-fun thiss!982 () BitStream!10446)

(declare-fun nBits!288 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240504 (validate_offset_bits!1 ((_ sign_extend 32) (size!5762 (buf!6222 (_2!11134 lt!375623)))) ((_ sign_extend 32) (currentByte!11576 thiss!982)) ((_ sign_extend 32) (currentBit!11571 thiss!982)) nBits!288)))

(declare-fun lt!375626 () Unit!17625)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10446 array!13155 (_ BitVec 64)) Unit!17625)

(assert (=> b!240504 (= lt!375626 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6222 (_2!11134 lt!375623)) nBits!288))))

(declare-datatypes ((tuple2!20426 0))(
  ( (tuple2!20427 (_1!11135 BitStream!10446) (_2!11135 BitStream!10446)) )
))
(declare-fun lt!375625 () tuple2!20426)

(declare-fun reader!0 (BitStream!10446 BitStream!10446) tuple2!20426)

(assert (=> b!240504 (= lt!375625 (reader!0 thiss!982 (_2!11134 lt!375623)))))

(declare-fun lt!375624 () Bool)

(declare-fun isPrefixOf!0 (BitStream!10446 BitStream!10446) Bool)

(assert (=> b!240504 (= lt!375624 (isPrefixOf!0 thiss!982 (_2!11134 lt!375623)))))

(declare-fun lt!375629 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!240504 (= lt!375629 (bitIndex!0 (size!5762 (buf!6222 (_2!11134 lt!375623))) (currentByte!11576 (_2!11134 lt!375623)) (currentBit!11571 (_2!11134 lt!375623))))))

(declare-fun lt!375628 () (_ BitVec 64))

(assert (=> b!240504 (= lt!375628 (bitIndex!0 (size!5762 (buf!6222 thiss!982)) (currentByte!11576 thiss!982) (currentBit!11571 thiss!982)))))

(declare-fun e!166700 () Bool)

(assert (=> b!240504 e!166700))

(declare-fun res!200774 () Bool)

(assert (=> b!240504 (=> (not res!200774) (not e!166700))))

(assert (=> b!240504 (= res!200774 (= (size!5762 (buf!6222 thiss!982)) (size!5762 (buf!6222 (_2!11134 lt!375623)))))))

(declare-fun bit!21 () Bool)

(declare-fun appendNBitsLoop!0 (BitStream!10446 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20424)

(assert (=> b!240504 (= lt!375623 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!240505 () Bool)

(declare-fun res!200776 () Bool)

(assert (=> b!240505 (=> (not res!200776) (not e!166700))))

(assert (=> b!240505 (= res!200776 (isPrefixOf!0 thiss!982 (_2!11134 lt!375623)))))

(declare-fun b!240506 () Bool)

(declare-fun res!200775 () Bool)

(assert (=> b!240506 (=> (not res!200775) (not e!166699))))

(assert (=> b!240506 (= res!200775 (validate_offset_bits!1 ((_ sign_extend 32) (size!5762 (buf!6222 thiss!982))) ((_ sign_extend 32) (currentByte!11576 thiss!982)) ((_ sign_extend 32) (currentBit!11571 thiss!982)) nBits!288))))

(declare-fun res!200777 () Bool)

(assert (=> start!52224 (=> (not res!200777) (not e!166699))))

(assert (=> start!52224 (= res!200777 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52224 e!166699))

(assert (=> start!52224 true))

(declare-fun e!166698 () Bool)

(declare-fun inv!12 (BitStream!10446) Bool)

(assert (=> start!52224 (and (inv!12 thiss!982) e!166698)))

(declare-fun b!240507 () Bool)

(declare-datatypes ((tuple2!20428 0))(
  ( (tuple2!20429 (_1!11136 BitStream!10446) (_2!11136 Bool)) )
))
(declare-fun lt!375622 () tuple2!20428)

(declare-fun lt!375630 () tuple2!20426)

(assert (=> b!240507 (= e!166700 (not (or (not (_2!11136 lt!375622)) (not (= (_1!11136 lt!375622) (_2!11135 lt!375630))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10446 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20428)

(assert (=> b!240507 (= lt!375622 (checkBitsLoopPure!0 (_1!11135 lt!375630) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!240507 (validate_offset_bits!1 ((_ sign_extend 32) (size!5762 (buf!6222 (_2!11134 lt!375623)))) ((_ sign_extend 32) (currentByte!11576 thiss!982)) ((_ sign_extend 32) (currentBit!11571 thiss!982)) nBits!288)))

(declare-fun lt!375627 () Unit!17625)

(assert (=> b!240507 (= lt!375627 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6222 (_2!11134 lt!375623)) nBits!288))))

(assert (=> b!240507 (= lt!375630 (reader!0 thiss!982 (_2!11134 lt!375623)))))

(declare-fun b!240508 () Bool)

(declare-fun array_inv!5503 (array!13155) Bool)

(assert (=> b!240508 (= e!166698 (array_inv!5503 (buf!6222 thiss!982)))))

(declare-fun b!240509 () Bool)

(declare-fun res!200778 () Bool)

(assert (=> b!240509 (=> (not res!200778) (not e!166700))))

(assert (=> b!240509 (= res!200778 (= (bitIndex!0 (size!5762 (buf!6222 (_2!11134 lt!375623))) (currentByte!11576 (_2!11134 lt!375623)) (currentBit!11571 (_2!11134 lt!375623))) (bvadd (bitIndex!0 (size!5762 (buf!6222 thiss!982)) (currentByte!11576 thiss!982) (currentBit!11571 thiss!982)) nBits!288)))))

(assert (= (and start!52224 res!200777) b!240506))

(assert (= (and b!240506 res!200775) b!240504))

(assert (= (and b!240504 res!200774) b!240509))

(assert (= (and b!240509 res!200778) b!240505))

(assert (= (and b!240505 res!200776) b!240507))

(assert (= start!52224 b!240508))

(declare-fun m!363013 () Bool)

(assert (=> b!240505 m!363013))

(declare-fun m!363015 () Bool)

(assert (=> start!52224 m!363015))

(declare-fun m!363017 () Bool)

(assert (=> b!240507 m!363017))

(declare-fun m!363019 () Bool)

(assert (=> b!240507 m!363019))

(declare-fun m!363021 () Bool)

(assert (=> b!240507 m!363021))

(declare-fun m!363023 () Bool)

(assert (=> b!240507 m!363023))

(declare-fun m!363025 () Bool)

(assert (=> b!240506 m!363025))

(declare-fun m!363027 () Bool)

(assert (=> b!240509 m!363027))

(declare-fun m!363029 () Bool)

(assert (=> b!240509 m!363029))

(assert (=> b!240504 m!363027))

(assert (=> b!240504 m!363013))

(assert (=> b!240504 m!363029))

(assert (=> b!240504 m!363023))

(declare-fun m!363031 () Bool)

(assert (=> b!240504 m!363031))

(assert (=> b!240504 m!363019))

(assert (=> b!240504 m!363021))

(declare-fun m!363033 () Bool)

(assert (=> b!240508 m!363033))

(check-sat (not b!240507) (not b!240504) (not b!240506) (not b!240509) (not start!52224) (not b!240508) (not b!240505))
