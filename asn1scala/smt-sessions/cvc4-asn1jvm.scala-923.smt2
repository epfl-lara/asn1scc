; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25940 () Bool)

(assert start!25940)

(declare-fun res!110120 () Bool)

(declare-fun e!87925 () Bool)

(assert (=> start!25940 (=> (not res!110120) (not e!87925))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6110 0))(
  ( (array!6111 (arr!3401 (Array (_ BitVec 32) (_ BitVec 8))) (size!2766 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6110)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!25940 (= res!110120 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2766 arr!237))))))

(assert (=> start!25940 e!87925))

(assert (=> start!25940 true))

(declare-fun array_inv!2555 (array!6110) Bool)

(assert (=> start!25940 (array_inv!2555 arr!237)))

(declare-datatypes ((BitStream!4796 0))(
  ( (BitStream!4797 (buf!3139 array!6110) (currentByte!5924 (_ BitVec 32)) (currentBit!5919 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4796)

(declare-fun e!87920 () Bool)

(declare-fun inv!12 (BitStream!4796) Bool)

(assert (=> start!25940 (and (inv!12 thiss!1634) e!87920)))

(declare-fun b!132599 () Bool)

(declare-datatypes ((tuple2!11504 0))(
  ( (tuple2!11505 (_1!6058 BitStream!4796) (_2!6058 BitStream!4796)) )
))
(declare-fun lt!204703 () tuple2!11504)

(declare-fun e!87918 () Bool)

(declare-datatypes ((tuple2!11506 0))(
  ( (tuple2!11507 (_1!6059 BitStream!4796) (_2!6059 array!6110)) )
))
(declare-fun readByteArrayLoopPure!0 (BitStream!4796 array!6110 (_ BitVec 32) (_ BitVec 32)) tuple2!11506)

(assert (=> b!132599 (= e!87918 (= (_1!6059 (readByteArrayLoopPure!0 (_1!6058 lt!204703) arr!237 from!447 to!404)) (_2!6058 lt!204703)))))

(declare-fun b!132600 () Bool)

(declare-fun e!87919 () Bool)

(declare-datatypes ((Unit!8164 0))(
  ( (Unit!8165) )
))
(declare-datatypes ((tuple2!11508 0))(
  ( (tuple2!11509 (_1!6060 Unit!8164) (_2!6060 BitStream!4796)) )
))
(declare-fun lt!204719 () tuple2!11508)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!132600 (= e!87919 (invariant!0 (currentBit!5919 thiss!1634) (currentByte!5924 thiss!1634) (size!2766 (buf!3139 (_2!6060 lt!204719)))))))

(declare-fun b!132601 () Bool)

(declare-fun res!110116 () Bool)

(declare-fun e!87922 () Bool)

(assert (=> b!132601 (=> (not res!110116) (not e!87922))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!132601 (= res!110116 (= (bitIndex!0 (size!2766 (buf!3139 (_2!6060 lt!204719))) (currentByte!5924 (_2!6060 lt!204719)) (currentBit!5919 (_2!6060 lt!204719))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2766 (buf!3139 thiss!1634)) (currentByte!5924 thiss!1634) (currentBit!5919 thiss!1634)))))))

(declare-fun b!132602 () Bool)

(declare-fun res!110122 () Bool)

(assert (=> b!132602 (=> (not res!110122) (not e!87922))))

(declare-fun isPrefixOf!0 (BitStream!4796 BitStream!4796) Bool)

(assert (=> b!132602 (= res!110122 (isPrefixOf!0 thiss!1634 (_2!6060 lt!204719)))))

(declare-fun b!132603 () Bool)

(declare-fun res!110118 () Bool)

(declare-fun e!87926 () Bool)

(assert (=> b!132603 (=> (not res!110118) (not e!87926))))

(declare-fun lt!204706 () tuple2!11508)

(assert (=> b!132603 (= res!110118 (isPrefixOf!0 (_2!6060 lt!204719) (_2!6060 lt!204706)))))

(declare-datatypes ((tuple2!11510 0))(
  ( (tuple2!11511 (_1!6061 BitStream!4796) (_2!6061 (_ BitVec 8))) )
))
(declare-fun lt!204714 () tuple2!11510)

(declare-fun b!132604 () Bool)

(declare-fun lt!204724 () tuple2!11504)

(assert (=> b!132604 (= e!87922 (and (= (_2!6061 lt!204714) (select (arr!3401 arr!237) from!447)) (= (_1!6061 lt!204714) (_2!6058 lt!204724))))))

(declare-fun readBytePure!0 (BitStream!4796) tuple2!11510)

(assert (=> b!132604 (= lt!204714 (readBytePure!0 (_1!6058 lt!204724)))))

(declare-fun reader!0 (BitStream!4796 BitStream!4796) tuple2!11504)

(assert (=> b!132604 (= lt!204724 (reader!0 thiss!1634 (_2!6060 lt!204719)))))

(declare-fun b!132605 () Bool)

(declare-fun e!87928 () Bool)

(assert (=> b!132605 (= e!87928 true)))

(declare-fun lt!204705 () array!6110)

(declare-fun lt!204712 () tuple2!11506)

(declare-fun withMovedByteIndex!0 (BitStream!4796 (_ BitVec 32)) BitStream!4796)

(assert (=> b!132605 (= lt!204712 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6058 lt!204703) #b00000000000000000000000000000001) lt!204705 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun b!132606 () Bool)

(declare-fun res!110109 () Bool)

(assert (=> b!132606 (=> (not res!110109) (not e!87925))))

(assert (=> b!132606 (= res!110109 (bvslt from!447 to!404))))

(declare-fun b!132607 () Bool)

(declare-fun e!87921 () Bool)

(declare-fun lt!204707 () tuple2!11510)

(declare-fun lt!204722 () tuple2!11510)

(assert (=> b!132607 (= e!87921 (= (_2!6061 lt!204707) (_2!6061 lt!204722)))))

(declare-fun b!132608 () Bool)

(declare-fun res!110110 () Bool)

(assert (=> b!132608 (=> (not res!110110) (not e!87925))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!132608 (= res!110110 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2766 (buf!3139 thiss!1634))) ((_ sign_extend 32) (currentByte!5924 thiss!1634)) ((_ sign_extend 32) (currentBit!5919 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!132609 () Bool)

(assert (=> b!132609 (= e!87920 (array_inv!2555 (buf!3139 thiss!1634)))))

(declare-fun b!132610 () Bool)

(declare-fun res!110121 () Bool)

(assert (=> b!132610 (=> (not res!110121) (not e!87925))))

(assert (=> b!132610 (= res!110121 (invariant!0 (currentBit!5919 thiss!1634) (currentByte!5924 thiss!1634) (size!2766 (buf!3139 thiss!1634))))))

(declare-fun b!132611 () Bool)

(declare-fun e!87923 () Bool)

(assert (=> b!132611 (= e!87926 (not e!87923))))

(declare-fun res!110114 () Bool)

(assert (=> b!132611 (=> res!110114 e!87923)))

(declare-fun lt!204711 () tuple2!11504)

(declare-fun lt!204716 () tuple2!11506)

(assert (=> b!132611 (= res!110114 (or (not (= (size!2766 (_2!6059 lt!204716)) (size!2766 arr!237))) (not (= (_1!6059 lt!204716) (_2!6058 lt!204711)))))))

(assert (=> b!132611 (= lt!204716 (readByteArrayLoopPure!0 (_1!6058 lt!204711) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!204709 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!132611 (validate_offset_bits!1 ((_ sign_extend 32) (size!2766 (buf!3139 (_2!6060 lt!204706)))) ((_ sign_extend 32) (currentByte!5924 (_2!6060 lt!204719))) ((_ sign_extend 32) (currentBit!5919 (_2!6060 lt!204719))) lt!204709)))

(declare-fun lt!204710 () Unit!8164)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4796 array!6110 (_ BitVec 64)) Unit!8164)

(assert (=> b!132611 (= lt!204710 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6060 lt!204719) (buf!3139 (_2!6060 lt!204706)) lt!204709))))

(assert (=> b!132611 (= lt!204711 (reader!0 (_2!6060 lt!204719) (_2!6060 lt!204706)))))

(declare-fun b!132612 () Bool)

(declare-fun e!87924 () Bool)

(assert (=> b!132612 (= e!87924 e!87926)))

(declare-fun res!110115 () Bool)

(assert (=> b!132612 (=> (not res!110115) (not e!87926))))

(assert (=> b!132612 (= res!110115 (= (bitIndex!0 (size!2766 (buf!3139 (_2!6060 lt!204706))) (currentByte!5924 (_2!6060 lt!204706)) (currentBit!5919 (_2!6060 lt!204706))) (bvadd (bitIndex!0 (size!2766 (buf!3139 (_2!6060 lt!204719))) (currentByte!5924 (_2!6060 lt!204719)) (currentBit!5919 (_2!6060 lt!204719))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!204709))))))

(assert (=> b!132612 (= lt!204709 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!132613 () Bool)

(declare-fun arrayRangesEq!169 (array!6110 array!6110 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!132613 (= e!87923 (not (arrayRangesEq!169 arr!237 (_2!6059 lt!204716) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!132614 () Bool)

(assert (=> b!132614 (= e!87925 (not e!87928))))

(declare-fun res!110117 () Bool)

(assert (=> b!132614 (=> res!110117 e!87928)))

(assert (=> b!132614 (= res!110117 (not (validate_offset_bytes!0 ((_ sign_extend 32) (size!2766 (buf!3139 (_1!6058 lt!204703)))) ((_ sign_extend 32) (currentByte!5924 (_1!6058 lt!204703))) ((_ sign_extend 32) (currentBit!5919 (_1!6058 lt!204703))) (bvsub to!404 from!447))))))

(declare-fun lt!204704 () tuple2!11506)

(declare-fun lt!204721 () tuple2!11504)

(assert (=> b!132614 (= lt!204704 (readByteArrayLoopPure!0 (_1!6058 lt!204721) lt!204705 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!204718 () tuple2!11510)

(assert (=> b!132614 (= lt!204705 (array!6111 (store (arr!3401 arr!237) from!447 (_2!6061 lt!204718)) (size!2766 arr!237)))))

(declare-fun lt!204715 () (_ BitVec 32))

(assert (=> b!132614 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2766 (buf!3139 (_2!6060 lt!204706)))) ((_ sign_extend 32) (currentByte!5924 (_2!6060 lt!204719))) ((_ sign_extend 32) (currentBit!5919 (_2!6060 lt!204719))) lt!204715)))

(declare-fun lt!204720 () Unit!8164)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4796 array!6110 (_ BitVec 32)) Unit!8164)

(assert (=> b!132614 (= lt!204720 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6060 lt!204719) (buf!3139 (_2!6060 lt!204706)) lt!204715))))

(assert (=> b!132614 e!87918))

(declare-fun res!110113 () Bool)

(assert (=> b!132614 (=> (not res!110113) (not e!87918))))

(assert (=> b!132614 (= res!110113 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2766 (buf!3139 (_2!6060 lt!204706)))) ((_ sign_extend 32) (currentByte!5924 thiss!1634)) ((_ sign_extend 32) (currentBit!5919 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!204713 () Unit!8164)

(assert (=> b!132614 (= lt!204713 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3139 (_2!6060 lt!204706)) (bvsub to!404 from!447)))))

(assert (=> b!132614 (= (_2!6061 lt!204718) (select (arr!3401 arr!237) from!447))))

(assert (=> b!132614 (= lt!204718 (readBytePure!0 (_1!6058 lt!204703)))))

(assert (=> b!132614 (= lt!204721 (reader!0 (_2!6060 lt!204719) (_2!6060 lt!204706)))))

(assert (=> b!132614 (= lt!204703 (reader!0 thiss!1634 (_2!6060 lt!204706)))))

(assert (=> b!132614 e!87921))

(declare-fun res!110108 () Bool)

(assert (=> b!132614 (=> (not res!110108) (not e!87921))))

(assert (=> b!132614 (= res!110108 (= (bitIndex!0 (size!2766 (buf!3139 (_1!6061 lt!204707))) (currentByte!5924 (_1!6061 lt!204707)) (currentBit!5919 (_1!6061 lt!204707))) (bitIndex!0 (size!2766 (buf!3139 (_1!6061 lt!204722))) (currentByte!5924 (_1!6061 lt!204722)) (currentBit!5919 (_1!6061 lt!204722)))))))

(declare-fun lt!204725 () Unit!8164)

(declare-fun lt!204708 () BitStream!4796)

(declare-fun readBytePrefixLemma!0 (BitStream!4796 BitStream!4796) Unit!8164)

(assert (=> b!132614 (= lt!204725 (readBytePrefixLemma!0 lt!204708 (_2!6060 lt!204706)))))

(assert (=> b!132614 (= lt!204722 (readBytePure!0 (BitStream!4797 (buf!3139 (_2!6060 lt!204706)) (currentByte!5924 thiss!1634) (currentBit!5919 thiss!1634))))))

(assert (=> b!132614 (= lt!204707 (readBytePure!0 lt!204708))))

(assert (=> b!132614 (= lt!204708 (BitStream!4797 (buf!3139 (_2!6060 lt!204719)) (currentByte!5924 thiss!1634) (currentBit!5919 thiss!1634)))))

(assert (=> b!132614 e!87919))

(declare-fun res!110119 () Bool)

(assert (=> b!132614 (=> (not res!110119) (not e!87919))))

(assert (=> b!132614 (= res!110119 (isPrefixOf!0 thiss!1634 (_2!6060 lt!204706)))))

(declare-fun lt!204723 () Unit!8164)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4796 BitStream!4796 BitStream!4796) Unit!8164)

(assert (=> b!132614 (= lt!204723 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6060 lt!204719) (_2!6060 lt!204706)))))

(assert (=> b!132614 e!87924))

(declare-fun res!110112 () Bool)

(assert (=> b!132614 (=> (not res!110112) (not e!87924))))

(assert (=> b!132614 (= res!110112 (= (size!2766 (buf!3139 (_2!6060 lt!204719))) (size!2766 (buf!3139 (_2!6060 lt!204706)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4796 array!6110 (_ BitVec 32) (_ BitVec 32)) tuple2!11508)

(assert (=> b!132614 (= lt!204706 (appendByteArrayLoop!0 (_2!6060 lt!204719) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!132614 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2766 (buf!3139 (_2!6060 lt!204719)))) ((_ sign_extend 32) (currentByte!5924 (_2!6060 lt!204719))) ((_ sign_extend 32) (currentBit!5919 (_2!6060 lt!204719))) lt!204715)))

(assert (=> b!132614 (= lt!204715 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!204717 () Unit!8164)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4796 BitStream!4796 (_ BitVec 64) (_ BitVec 32)) Unit!8164)

(assert (=> b!132614 (= lt!204717 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6060 lt!204719) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!132614 e!87922))

(declare-fun res!110111 () Bool)

(assert (=> b!132614 (=> (not res!110111) (not e!87922))))

(assert (=> b!132614 (= res!110111 (= (size!2766 (buf!3139 thiss!1634)) (size!2766 (buf!3139 (_2!6060 lt!204719)))))))

(declare-fun appendByte!0 (BitStream!4796 (_ BitVec 8)) tuple2!11508)

(assert (=> b!132614 (= lt!204719 (appendByte!0 thiss!1634 (select (arr!3401 arr!237) from!447)))))

(assert (= (and start!25940 res!110120) b!132608))

(assert (= (and b!132608 res!110110) b!132606))

(assert (= (and b!132606 res!110109) b!132610))

(assert (= (and b!132610 res!110121) b!132614))

(assert (= (and b!132614 res!110111) b!132601))

(assert (= (and b!132601 res!110116) b!132602))

(assert (= (and b!132602 res!110122) b!132604))

(assert (= (and b!132614 res!110112) b!132612))

(assert (= (and b!132612 res!110115) b!132603))

(assert (= (and b!132603 res!110118) b!132611))

(assert (= (and b!132611 (not res!110114)) b!132613))

(assert (= (and b!132614 res!110119) b!132600))

(assert (= (and b!132614 res!110108) b!132607))

(assert (= (and b!132614 res!110113) b!132599))

(assert (= (and b!132614 (not res!110117)) b!132605))

(assert (= start!25940 b!132609))

(declare-fun m!200371 () Bool)

(assert (=> b!132602 m!200371))

(declare-fun m!200373 () Bool)

(assert (=> b!132603 m!200373))

(declare-fun m!200375 () Bool)

(assert (=> b!132611 m!200375))

(declare-fun m!200377 () Bool)

(assert (=> b!132611 m!200377))

(declare-fun m!200379 () Bool)

(assert (=> b!132611 m!200379))

(declare-fun m!200381 () Bool)

(assert (=> b!132611 m!200381))

(declare-fun m!200383 () Bool)

(assert (=> b!132600 m!200383))

(declare-fun m!200385 () Bool)

(assert (=> b!132614 m!200385))

(declare-fun m!200387 () Bool)

(assert (=> b!132614 m!200387))

(declare-fun m!200389 () Bool)

(assert (=> b!132614 m!200389))

(declare-fun m!200391 () Bool)

(assert (=> b!132614 m!200391))

(declare-fun m!200393 () Bool)

(assert (=> b!132614 m!200393))

(declare-fun m!200395 () Bool)

(assert (=> b!132614 m!200395))

(declare-fun m!200397 () Bool)

(assert (=> b!132614 m!200397))

(declare-fun m!200399 () Bool)

(assert (=> b!132614 m!200399))

(declare-fun m!200401 () Bool)

(assert (=> b!132614 m!200401))

(declare-fun m!200403 () Bool)

(assert (=> b!132614 m!200403))

(declare-fun m!200405 () Bool)

(assert (=> b!132614 m!200405))

(declare-fun m!200407 () Bool)

(assert (=> b!132614 m!200407))

(declare-fun m!200409 () Bool)

(assert (=> b!132614 m!200409))

(declare-fun m!200411 () Bool)

(assert (=> b!132614 m!200411))

(declare-fun m!200413 () Bool)

(assert (=> b!132614 m!200413))

(declare-fun m!200415 () Bool)

(assert (=> b!132614 m!200415))

(declare-fun m!200417 () Bool)

(assert (=> b!132614 m!200417))

(declare-fun m!200419 () Bool)

(assert (=> b!132614 m!200419))

(declare-fun m!200421 () Bool)

(assert (=> b!132614 m!200421))

(declare-fun m!200423 () Bool)

(assert (=> b!132614 m!200423))

(assert (=> b!132614 m!200381))

(declare-fun m!200425 () Bool)

(assert (=> b!132614 m!200425))

(assert (=> b!132614 m!200399))

(declare-fun m!200427 () Bool)

(assert (=> b!132599 m!200427))

(declare-fun m!200429 () Bool)

(assert (=> b!132605 m!200429))

(assert (=> b!132605 m!200429))

(declare-fun m!200431 () Bool)

(assert (=> b!132605 m!200431))

(assert (=> b!132604 m!200399))

(declare-fun m!200433 () Bool)

(assert (=> b!132604 m!200433))

(declare-fun m!200435 () Bool)

(assert (=> b!132604 m!200435))

(declare-fun m!200437 () Bool)

(assert (=> b!132601 m!200437))

(declare-fun m!200439 () Bool)

(assert (=> b!132601 m!200439))

(declare-fun m!200441 () Bool)

(assert (=> b!132608 m!200441))

(declare-fun m!200443 () Bool)

(assert (=> b!132610 m!200443))

(declare-fun m!200445 () Bool)

(assert (=> b!132612 m!200445))

(assert (=> b!132612 m!200437))

(declare-fun m!200447 () Bool)

(assert (=> b!132613 m!200447))

(declare-fun m!200449 () Bool)

(assert (=> b!132609 m!200449))

(declare-fun m!200451 () Bool)

(assert (=> start!25940 m!200451))

(declare-fun m!200453 () Bool)

(assert (=> start!25940 m!200453))

(push 1)

(assert (not b!132603))

(assert (not b!132608))

(assert (not b!132599))

(assert (not b!132604))

(assert (not b!132614))

(assert (not b!132612))

(assert (not b!132611))

(assert (not b!132600))

(assert (not b!132610))

(assert (not b!132609))

(assert (not b!132613))

(assert (not b!132602))

(assert (not b!132605))

(assert (not b!132601))

(assert (not start!25940))

(check-sat)

(pop 1)

