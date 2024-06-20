; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28336 () Bool)

(assert start!28336)

(declare-fun b!146700 () Bool)

(declare-fun e!97825 () Bool)

(declare-fun e!97817 () Bool)

(assert (=> b!146700 (= e!97825 (not e!97817))))

(declare-fun res!122735 () Bool)

(assert (=> b!146700 (=> res!122735 e!97817)))

(declare-datatypes ((array!6638 0))(
  ( (array!6639 (arr!3758 (Array (_ BitVec 32) (_ BitVec 8))) (size!3004 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6638)

(declare-datatypes ((BitStream!5266 0))(
  ( (BitStream!5267 (buf!3459 array!6638) (currentByte!6361 (_ BitVec 32)) (currentBit!6356 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!13090 0))(
  ( (tuple2!13091 (_1!6899 BitStream!5266) (_2!6899 BitStream!5266)) )
))
(declare-fun lt!227900 () tuple2!13090)

(declare-datatypes ((tuple2!13092 0))(
  ( (tuple2!13093 (_1!6900 BitStream!5266) (_2!6900 array!6638)) )
))
(declare-fun lt!227881 () tuple2!13092)

(assert (=> b!146700 (= res!122735 (or (not (= (size!3004 (_2!6900 lt!227881)) (size!3004 arr!237))) (not (= (_1!6900 lt!227881) (_2!6899 lt!227900)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun readByteArrayLoopPure!0 (BitStream!5266 array!6638 (_ BitVec 32) (_ BitVec 32)) tuple2!13092)

(assert (=> b!146700 (= lt!227881 (readByteArrayLoopPure!0 (_1!6899 lt!227900) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((Unit!9193 0))(
  ( (Unit!9194) )
))
(declare-datatypes ((tuple2!13094 0))(
  ( (tuple2!13095 (_1!6901 Unit!9193) (_2!6901 BitStream!5266)) )
))
(declare-fun lt!227901 () tuple2!13094)

(declare-fun lt!227885 () tuple2!13094)

(declare-fun lt!227889 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!146700 (validate_offset_bits!1 ((_ sign_extend 32) (size!3004 (buf!3459 (_2!6901 lt!227901)))) ((_ sign_extend 32) (currentByte!6361 (_2!6901 lt!227885))) ((_ sign_extend 32) (currentBit!6356 (_2!6901 lt!227885))) lt!227889)))

(declare-fun lt!227899 () Unit!9193)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5266 array!6638 (_ BitVec 64)) Unit!9193)

(assert (=> b!146700 (= lt!227899 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6901 lt!227885) (buf!3459 (_2!6901 lt!227901)) lt!227889))))

(declare-fun reader!0 (BitStream!5266 BitStream!5266) tuple2!13090)

(assert (=> b!146700 (= lt!227900 (reader!0 (_2!6901 lt!227885) (_2!6901 lt!227901)))))

(declare-fun b!146701 () Bool)

(declare-fun e!97818 () Bool)

(declare-fun thiss!1634 () BitStream!5266)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!146701 (= e!97818 (invariant!0 (currentBit!6356 thiss!1634) (currentByte!6361 thiss!1634) (size!3004 (buf!3459 (_2!6901 lt!227885)))))))

(declare-fun b!146702 () Bool)

(declare-fun e!97821 () Bool)

(declare-fun e!97827 () Bool)

(assert (=> b!146702 (= e!97821 (not e!97827))))

(declare-fun res!122723 () Bool)

(assert (=> b!146702 (=> res!122723 e!97827)))

(declare-fun lt!227886 () tuple2!13092)

(declare-fun lt!227904 () tuple2!13092)

(declare-fun arrayRangesEq!320 (array!6638 array!6638 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!146702 (= res!122723 (not (arrayRangesEq!320 (_2!6900 lt!227904) (_2!6900 lt!227886) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!227898 () tuple2!13092)

(assert (=> b!146702 (arrayRangesEq!320 (_2!6900 lt!227904) (_2!6900 lt!227898) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!227882 () tuple2!13090)

(declare-fun lt!227895 () Unit!9193)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5266 array!6638 (_ BitVec 32) (_ BitVec 32)) Unit!9193)

(assert (=> b!146702 (= lt!227895 (readByteArrayLoopArrayPrefixLemma!0 (_1!6899 lt!227882) arr!237 from!447 to!404))))

(declare-fun lt!227883 () array!6638)

(declare-fun withMovedByteIndex!0 (BitStream!5266 (_ BitVec 32)) BitStream!5266)

(assert (=> b!146702 (= lt!227898 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6899 lt!227882) #b00000000000000000000000000000001) lt!227883 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!227890 () tuple2!13090)

(assert (=> b!146702 (= lt!227886 (readByteArrayLoopPure!0 (_1!6899 lt!227890) lt!227883 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((tuple2!13096 0))(
  ( (tuple2!13097 (_1!6902 BitStream!5266) (_2!6902 (_ BitVec 8))) )
))
(declare-fun lt!227897 () tuple2!13096)

(assert (=> b!146702 (= lt!227883 (array!6639 (store (arr!3758 arr!237) from!447 (_2!6902 lt!227897)) (size!3004 arr!237)))))

(declare-fun lt!227894 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!146702 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3004 (buf!3459 (_2!6901 lt!227901)))) ((_ sign_extend 32) (currentByte!6361 (_2!6901 lt!227885))) ((_ sign_extend 32) (currentBit!6356 (_2!6901 lt!227885))) lt!227894)))

(declare-fun lt!227902 () Unit!9193)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5266 array!6638 (_ BitVec 32)) Unit!9193)

(assert (=> b!146702 (= lt!227902 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6901 lt!227885) (buf!3459 (_2!6901 lt!227901)) lt!227894))))

(assert (=> b!146702 (= (_1!6900 lt!227904) (_2!6899 lt!227882))))

(assert (=> b!146702 (= lt!227904 (readByteArrayLoopPure!0 (_1!6899 lt!227882) arr!237 from!447 to!404))))

(assert (=> b!146702 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3004 (buf!3459 (_2!6901 lt!227901)))) ((_ sign_extend 32) (currentByte!6361 thiss!1634)) ((_ sign_extend 32) (currentBit!6356 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!227891 () Unit!9193)

(assert (=> b!146702 (= lt!227891 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3459 (_2!6901 lt!227901)) (bvsub to!404 from!447)))))

(assert (=> b!146702 (= (_2!6902 lt!227897) (select (arr!3758 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!5266) tuple2!13096)

(assert (=> b!146702 (= lt!227897 (readBytePure!0 (_1!6899 lt!227882)))))

(assert (=> b!146702 (= lt!227890 (reader!0 (_2!6901 lt!227885) (_2!6901 lt!227901)))))

(assert (=> b!146702 (= lt!227882 (reader!0 thiss!1634 (_2!6901 lt!227901)))))

(declare-fun e!97819 () Bool)

(assert (=> b!146702 e!97819))

(declare-fun res!122724 () Bool)

(assert (=> b!146702 (=> (not res!122724) (not e!97819))))

(declare-fun lt!227888 () tuple2!13096)

(declare-fun lt!227892 () tuple2!13096)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!146702 (= res!122724 (= (bitIndex!0 (size!3004 (buf!3459 (_1!6902 lt!227888))) (currentByte!6361 (_1!6902 lt!227888)) (currentBit!6356 (_1!6902 lt!227888))) (bitIndex!0 (size!3004 (buf!3459 (_1!6902 lt!227892))) (currentByte!6361 (_1!6902 lt!227892)) (currentBit!6356 (_1!6902 lt!227892)))))))

(declare-fun lt!227884 () Unit!9193)

(declare-fun lt!227903 () BitStream!5266)

(declare-fun readBytePrefixLemma!0 (BitStream!5266 BitStream!5266) Unit!9193)

(assert (=> b!146702 (= lt!227884 (readBytePrefixLemma!0 lt!227903 (_2!6901 lt!227901)))))

(assert (=> b!146702 (= lt!227892 (readBytePure!0 (BitStream!5267 (buf!3459 (_2!6901 lt!227901)) (currentByte!6361 thiss!1634) (currentBit!6356 thiss!1634))))))

(assert (=> b!146702 (= lt!227888 (readBytePure!0 lt!227903))))

(assert (=> b!146702 (= lt!227903 (BitStream!5267 (buf!3459 (_2!6901 lt!227885)) (currentByte!6361 thiss!1634) (currentBit!6356 thiss!1634)))))

(assert (=> b!146702 e!97818))

(declare-fun res!122730 () Bool)

(assert (=> b!146702 (=> (not res!122730) (not e!97818))))

(declare-fun isPrefixOf!0 (BitStream!5266 BitStream!5266) Bool)

(assert (=> b!146702 (= res!122730 (isPrefixOf!0 thiss!1634 (_2!6901 lt!227901)))))

(declare-fun lt!227905 () Unit!9193)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5266 BitStream!5266 BitStream!5266) Unit!9193)

(assert (=> b!146702 (= lt!227905 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6901 lt!227885) (_2!6901 lt!227901)))))

(declare-fun e!97823 () Bool)

(assert (=> b!146702 e!97823))

(declare-fun res!122728 () Bool)

(assert (=> b!146702 (=> (not res!122728) (not e!97823))))

(assert (=> b!146702 (= res!122728 (= (size!3004 (buf!3459 (_2!6901 lt!227885))) (size!3004 (buf!3459 (_2!6901 lt!227901)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5266 array!6638 (_ BitVec 32) (_ BitVec 32)) tuple2!13094)

(assert (=> b!146702 (= lt!227901 (appendByteArrayLoop!0 (_2!6901 lt!227885) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!146702 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3004 (buf!3459 (_2!6901 lt!227885)))) ((_ sign_extend 32) (currentByte!6361 (_2!6901 lt!227885))) ((_ sign_extend 32) (currentBit!6356 (_2!6901 lt!227885))) lt!227894)))

(assert (=> b!146702 (= lt!227894 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!227896 () Unit!9193)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5266 BitStream!5266 (_ BitVec 64) (_ BitVec 32)) Unit!9193)

(assert (=> b!146702 (= lt!227896 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6901 lt!227885) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!97824 () Bool)

(assert (=> b!146702 e!97824))

(declare-fun res!122733 () Bool)

(assert (=> b!146702 (=> (not res!122733) (not e!97824))))

(assert (=> b!146702 (= res!122733 (= (size!3004 (buf!3459 thiss!1634)) (size!3004 (buf!3459 (_2!6901 lt!227885)))))))

(declare-fun appendByte!0 (BitStream!5266 (_ BitVec 8)) tuple2!13094)

(assert (=> b!146702 (= lt!227885 (appendByte!0 thiss!1634 (select (arr!3758 arr!237) from!447)))))

(declare-fun b!146703 () Bool)

(declare-fun res!122734 () Bool)

(assert (=> b!146703 (=> (not res!122734) (not e!97821))))

(assert (=> b!146703 (= res!122734 (bvslt from!447 to!404))))

(declare-fun b!146704 () Bool)

(assert (=> b!146704 (= e!97817 (not (arrayRangesEq!320 arr!237 (_2!6900 lt!227881) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!146705 () Bool)

(declare-fun res!122736 () Bool)

(assert (=> b!146705 (=> (not res!122736) (not e!97821))))

(assert (=> b!146705 (= res!122736 (invariant!0 (currentBit!6356 thiss!1634) (currentByte!6361 thiss!1634) (size!3004 (buf!3459 thiss!1634))))))

(declare-fun b!146706 () Bool)

(declare-fun res!122729 () Bool)

(assert (=> b!146706 (=> (not res!122729) (not e!97824))))

(assert (=> b!146706 (= res!122729 (= (bitIndex!0 (size!3004 (buf!3459 (_2!6901 lt!227885))) (currentByte!6361 (_2!6901 lt!227885)) (currentBit!6356 (_2!6901 lt!227885))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3004 (buf!3459 thiss!1634)) (currentByte!6361 thiss!1634) (currentBit!6356 thiss!1634)))))))

(declare-fun res!122732 () Bool)

(assert (=> start!28336 (=> (not res!122732) (not e!97821))))

(assert (=> start!28336 (= res!122732 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3004 arr!237))))))

(assert (=> start!28336 e!97821))

(assert (=> start!28336 true))

(declare-fun array_inv!2793 (array!6638) Bool)

(assert (=> start!28336 (array_inv!2793 arr!237)))

(declare-fun e!97820 () Bool)

(declare-fun inv!12 (BitStream!5266) Bool)

(assert (=> start!28336 (and (inv!12 thiss!1634) e!97820)))

(declare-fun b!146707 () Bool)

(assert (=> b!146707 (= e!97819 (= (_2!6902 lt!227888) (_2!6902 lt!227892)))))

(declare-fun b!146708 () Bool)

(assert (=> b!146708 (= e!97820 (array_inv!2793 (buf!3459 thiss!1634)))))

(declare-fun lt!227893 () tuple2!13090)

(declare-fun b!146709 () Bool)

(declare-fun lt!227887 () tuple2!13096)

(assert (=> b!146709 (= e!97824 (and (= (_2!6902 lt!227887) (select (arr!3758 arr!237) from!447)) (= (_1!6902 lt!227887) (_2!6899 lt!227893))))))

(assert (=> b!146709 (= lt!227887 (readBytePure!0 (_1!6899 lt!227893)))))

(assert (=> b!146709 (= lt!227893 (reader!0 thiss!1634 (_2!6901 lt!227885)))))

(declare-fun b!146710 () Bool)

(declare-fun res!122727 () Bool)

(assert (=> b!146710 (=> (not res!122727) (not e!97821))))

(assert (=> b!146710 (= res!122727 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3004 (buf!3459 thiss!1634))) ((_ sign_extend 32) (currentByte!6361 thiss!1634)) ((_ sign_extend 32) (currentBit!6356 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!146711 () Bool)

(assert (=> b!146711 (= e!97823 e!97825)))

(declare-fun res!122726 () Bool)

(assert (=> b!146711 (=> (not res!122726) (not e!97825))))

(assert (=> b!146711 (= res!122726 (= (bitIndex!0 (size!3004 (buf!3459 (_2!6901 lt!227901))) (currentByte!6361 (_2!6901 lt!227901)) (currentBit!6356 (_2!6901 lt!227901))) (bvadd (bitIndex!0 (size!3004 (buf!3459 (_2!6901 lt!227885))) (currentByte!6361 (_2!6901 lt!227885)) (currentBit!6356 (_2!6901 lt!227885))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!227889))))))

(assert (=> b!146711 (= lt!227889 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!146712 () Bool)

(assert (=> b!146712 (= e!97827 (or (bvsgt #b00000000000000000000000000000000 to!404) (bvsgt to!404 (size!3004 (_2!6900 lt!227904))) (= (size!3004 (_2!6900 lt!227904)) (size!3004 (_2!6900 lt!227886)))))))

(declare-fun b!146713 () Bool)

(declare-fun res!122731 () Bool)

(assert (=> b!146713 (=> (not res!122731) (not e!97824))))

(assert (=> b!146713 (= res!122731 (isPrefixOf!0 thiss!1634 (_2!6901 lt!227885)))))

(declare-fun b!146714 () Bool)

(declare-fun res!122725 () Bool)

(assert (=> b!146714 (=> (not res!122725) (not e!97825))))

(assert (=> b!146714 (= res!122725 (isPrefixOf!0 (_2!6901 lt!227885) (_2!6901 lt!227901)))))

(assert (= (and start!28336 res!122732) b!146710))

(assert (= (and b!146710 res!122727) b!146703))

(assert (= (and b!146703 res!122734) b!146705))

(assert (= (and b!146705 res!122736) b!146702))

(assert (= (and b!146702 res!122733) b!146706))

(assert (= (and b!146706 res!122729) b!146713))

(assert (= (and b!146713 res!122731) b!146709))

(assert (= (and b!146702 res!122728) b!146711))

(assert (= (and b!146711 res!122726) b!146714))

(assert (= (and b!146714 res!122725) b!146700))

(assert (= (and b!146700 (not res!122735)) b!146704))

(assert (= (and b!146702 res!122730) b!146701))

(assert (= (and b!146702 res!122724) b!146707))

(assert (= (and b!146702 (not res!122723)) b!146712))

(assert (= start!28336 b!146708))

(declare-fun m!226495 () Bool)

(assert (=> b!146711 m!226495))

(declare-fun m!226497 () Bool)

(assert (=> b!146711 m!226497))

(declare-fun m!226499 () Bool)

(assert (=> b!146709 m!226499))

(declare-fun m!226501 () Bool)

(assert (=> b!146709 m!226501))

(declare-fun m!226503 () Bool)

(assert (=> b!146709 m!226503))

(declare-fun m!226505 () Bool)

(assert (=> b!146705 m!226505))

(declare-fun m!226507 () Bool)

(assert (=> start!28336 m!226507))

(declare-fun m!226509 () Bool)

(assert (=> start!28336 m!226509))

(declare-fun m!226511 () Bool)

(assert (=> b!146700 m!226511))

(declare-fun m!226513 () Bool)

(assert (=> b!146700 m!226513))

(declare-fun m!226515 () Bool)

(assert (=> b!146700 m!226515))

(declare-fun m!226517 () Bool)

(assert (=> b!146700 m!226517))

(declare-fun m!226519 () Bool)

(assert (=> b!146708 m!226519))

(declare-fun m!226521 () Bool)

(assert (=> b!146714 m!226521))

(assert (=> b!146706 m!226497))

(declare-fun m!226523 () Bool)

(assert (=> b!146706 m!226523))

(declare-fun m!226525 () Bool)

(assert (=> b!146701 m!226525))

(declare-fun m!226527 () Bool)

(assert (=> b!146713 m!226527))

(declare-fun m!226529 () Bool)

(assert (=> b!146710 m!226529))

(declare-fun m!226531 () Bool)

(assert (=> b!146702 m!226531))

(assert (=> b!146702 m!226517))

(declare-fun m!226533 () Bool)

(assert (=> b!146702 m!226533))

(declare-fun m!226535 () Bool)

(assert (=> b!146702 m!226535))

(declare-fun m!226537 () Bool)

(assert (=> b!146702 m!226537))

(declare-fun m!226539 () Bool)

(assert (=> b!146702 m!226539))

(declare-fun m!226541 () Bool)

(assert (=> b!146702 m!226541))

(declare-fun m!226543 () Bool)

(assert (=> b!146702 m!226543))

(declare-fun m!226545 () Bool)

(assert (=> b!146702 m!226545))

(declare-fun m!226547 () Bool)

(assert (=> b!146702 m!226547))

(declare-fun m!226549 () Bool)

(assert (=> b!146702 m!226549))

(declare-fun m!226551 () Bool)

(assert (=> b!146702 m!226551))

(declare-fun m!226553 () Bool)

(assert (=> b!146702 m!226553))

(declare-fun m!226555 () Bool)

(assert (=> b!146702 m!226555))

(declare-fun m!226557 () Bool)

(assert (=> b!146702 m!226557))

(declare-fun m!226559 () Bool)

(assert (=> b!146702 m!226559))

(declare-fun m!226561 () Bool)

(assert (=> b!146702 m!226561))

(assert (=> b!146702 m!226545))

(declare-fun m!226563 () Bool)

(assert (=> b!146702 m!226563))

(declare-fun m!226565 () Bool)

(assert (=> b!146702 m!226565))

(declare-fun m!226567 () Bool)

(assert (=> b!146702 m!226567))

(declare-fun m!226569 () Bool)

(assert (=> b!146702 m!226569))

(declare-fun m!226571 () Bool)

(assert (=> b!146702 m!226571))

(declare-fun m!226573 () Bool)

(assert (=> b!146702 m!226573))

(assert (=> b!146702 m!226499))

(declare-fun m!226575 () Bool)

(assert (=> b!146702 m!226575))

(declare-fun m!226577 () Bool)

(assert (=> b!146702 m!226577))

(declare-fun m!226579 () Bool)

(assert (=> b!146702 m!226579))

(assert (=> b!146702 m!226499))

(declare-fun m!226581 () Bool)

(assert (=> b!146704 m!226581))

(push 1)

(assert (not b!146701))

(assert (not b!146711))

(assert (not b!146706))

(assert (not b!146705))

(assert (not b!146710))

(assert (not b!146704))

(assert (not b!146709))

(assert (not start!28336))

(assert (not b!146702))

(assert (not b!146713))

(assert (not b!146700))

(assert (not b!146708))

(assert (not b!146714))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!47271 () Bool)

(declare-fun res!122825 () Bool)

(declare-fun e!97898 () Bool)

(assert (=> d!47271 (=> res!122825 e!97898)))

(assert (=> d!47271 (= res!122825 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!47271 (= (arrayRangesEq!320 arr!237 (_2!6900 lt!227881) #b00000000000000000000000000000000 to!404) e!97898)))

(declare-fun b!146809 () Bool)

(declare-fun e!97899 () Bool)

(assert (=> b!146809 (= e!97898 e!97899)))

(declare-fun res!122826 () Bool)

(assert (=> b!146809 (=> (not res!122826) (not e!97899))))

(assert (=> b!146809 (= res!122826 (= (select (arr!3758 arr!237) #b00000000000000000000000000000000) (select (arr!3758 (_2!6900 lt!227881)) #b00000000000000000000000000000000)))))

(declare-fun b!146810 () Bool)

(assert (=> b!146810 (= e!97899 (arrayRangesEq!320 arr!237 (_2!6900 lt!227881) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!47271 (not res!122825)) b!146809))

(assert (= (and b!146809 res!122826) b!146810))

(declare-fun m!226759 () Bool)

(assert (=> b!146809 m!226759))

(declare-fun m!226761 () Bool)

(assert (=> b!146809 m!226761))

(declare-fun m!226763 () Bool)

(assert (=> b!146810 m!226763))

(assert (=> b!146704 d!47271))

(declare-fun d!47273 () Bool)

(declare-fun e!97902 () Bool)

(assert (=> d!47273 e!97902))

(declare-fun res!122831 () Bool)

(assert (=> d!47273 (=> (not res!122831) (not e!97902))))

(declare-fun lt!228070 () (_ BitVec 64))

(declare-fun lt!228071 () (_ BitVec 64))

(declare-fun lt!228073 () (_ BitVec 64))

(assert (=> d!47273 (= res!122831 (= lt!228071 (bvsub lt!228070 lt!228073)))))

(assert (=> d!47273 (or (= (bvand lt!228070 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!228073 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!228070 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!228070 lt!228073) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!47273 (= lt!228073 (remainingBits!0 ((_ sign_extend 32) (size!3004 (buf!3459 (_2!6901 lt!227885)))) ((_ sign_extend 32) (currentByte!6361 (_2!6901 lt!227885))) ((_ sign_extend 32) (currentBit!6356 (_2!6901 lt!227885)))))))

(declare-fun lt!228072 () (_ BitVec 64))

(declare-fun lt!228068 () (_ BitVec 64))

(assert (=> d!47273 (= lt!228070 (bvmul lt!228072 lt!228068))))

(assert (=> d!47273 (or (= lt!228072 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!228068 (bvsdiv (bvmul lt!228072 lt!228068) lt!228072)))))

(assert (=> d!47273 (= lt!228068 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!47273 (= lt!228072 ((_ sign_extend 32) (size!3004 (buf!3459 (_2!6901 lt!227885)))))))

(assert (=> d!47273 (= lt!228071 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6361 (_2!6901 lt!227885))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6356 (_2!6901 lt!227885)))))))

(assert (=> d!47273 (invariant!0 (currentBit!6356 (_2!6901 lt!227885)) (currentByte!6361 (_2!6901 lt!227885)) (size!3004 (buf!3459 (_2!6901 lt!227885))))))

(assert (=> d!47273 (= (bitIndex!0 (size!3004 (buf!3459 (_2!6901 lt!227885))) (currentByte!6361 (_2!6901 lt!227885)) (currentBit!6356 (_2!6901 lt!227885))) lt!228071)))

(declare-fun b!146815 () Bool)

(declare-fun res!122832 () Bool)

(assert (=> b!146815 (=> (not res!122832) (not e!97902))))

(assert (=> b!146815 (= res!122832 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!228071))))

(declare-fun b!146816 () Bool)

(declare-fun lt!228069 () (_ BitVec 64))

(assert (=> b!146816 (= e!97902 (bvsle lt!228071 (bvmul lt!228069 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146816 (or (= lt!228069 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!228069 #b0000000000000000000000000000000000000000000000000000000000001000) lt!228069)))))

(assert (=> b!146816 (= lt!228069 ((_ sign_extend 32) (size!3004 (buf!3459 (_2!6901 lt!227885)))))))

(assert (= (and d!47273 res!122831) b!146815))

(assert (= (and b!146815 res!122832) b!146816))

(declare-fun m!226765 () Bool)

(assert (=> d!47273 m!226765))

(declare-fun m!226767 () Bool)

(assert (=> d!47273 m!226767))

(assert (=> b!146706 d!47273))

(declare-fun d!47275 () Bool)

(declare-fun e!97903 () Bool)

(assert (=> d!47275 e!97903))

(declare-fun res!122833 () Bool)

(assert (=> d!47275 (=> (not res!122833) (not e!97903))))

(declare-fun lt!228076 () (_ BitVec 64))

(declare-fun lt!228079 () (_ BitVec 64))

(declare-fun lt!228077 () (_ BitVec 64))

(assert (=> d!47275 (= res!122833 (= lt!228077 (bvsub lt!228076 lt!228079)))))

(assert (=> d!47275 (or (= (bvand lt!228076 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!228079 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!228076 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!228076 lt!228079) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!47275 (= lt!228079 (remainingBits!0 ((_ sign_extend 32) (size!3004 (buf!3459 thiss!1634))) ((_ sign_extend 32) (currentByte!6361 thiss!1634)) ((_ sign_extend 32) (currentBit!6356 thiss!1634))))))

(declare-fun lt!228078 () (_ BitVec 64))

(declare-fun lt!228074 () (_ BitVec 64))

(assert (=> d!47275 (= lt!228076 (bvmul lt!228078 lt!228074))))

(assert (=> d!47275 (or (= lt!228078 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!228074 (bvsdiv (bvmul lt!228078 lt!228074) lt!228078)))))

(assert (=> d!47275 (= lt!228074 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!47275 (= lt!228078 ((_ sign_extend 32) (size!3004 (buf!3459 thiss!1634))))))

(assert (=> d!47275 (= lt!228077 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6361 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6356 thiss!1634))))))

(assert (=> d!47275 (invariant!0 (currentBit!6356 thiss!1634) (currentByte!6361 thiss!1634) (size!3004 (buf!3459 thiss!1634)))))

(assert (=> d!47275 (= (bitIndex!0 (size!3004 (buf!3459 thiss!1634)) (currentByte!6361 thiss!1634) (currentBit!6356 thiss!1634)) lt!228077)))

(declare-fun b!146817 () Bool)

(declare-fun res!122834 () Bool)

(assert (=> b!146817 (=> (not res!122834) (not e!97903))))

(assert (=> b!146817 (= res!122834 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!228077))))

(declare-fun b!146818 () Bool)

(declare-fun lt!228075 () (_ BitVec 64))

(assert (=> b!146818 (= e!97903 (bvsle lt!228077 (bvmul lt!228075 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146818 (or (= lt!228075 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!228075 #b0000000000000000000000000000000000000000000000000000000000001000) lt!228075)))))

(assert (=> b!146818 (= lt!228075 ((_ sign_extend 32) (size!3004 (buf!3459 thiss!1634))))))

(assert (= (and d!47275 res!122833) b!146817))

(assert (= (and b!146817 res!122834) b!146818))

(declare-fun m!226769 () Bool)

(assert (=> d!47275 m!226769))

(assert (=> d!47275 m!226505))

(assert (=> b!146706 d!47275))

(declare-fun d!47277 () Bool)

(assert (=> d!47277 (= (invariant!0 (currentBit!6356 thiss!1634) (currentByte!6361 thiss!1634) (size!3004 (buf!3459 thiss!1634))) (and (bvsge (currentBit!6356 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6356 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6361 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6361 thiss!1634) (size!3004 (buf!3459 thiss!1634))) (and (= (currentBit!6356 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6361 thiss!1634) (size!3004 (buf!3459 thiss!1634)))))))))

(assert (=> b!146705 d!47277))

(declare-fun d!47279 () Bool)

(assert (=> d!47279 (= (array_inv!2793 (buf!3459 thiss!1634)) (bvsge (size!3004 (buf!3459 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!146708 d!47279))

(declare-fun d!47281 () Bool)

(assert (=> d!47281 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3004 (buf!3459 thiss!1634))) ((_ sign_extend 32) (currentByte!6361 thiss!1634)) ((_ sign_extend 32) (currentBit!6356 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3004 (buf!3459 thiss!1634))) ((_ sign_extend 32) (currentByte!6361 thiss!1634)) ((_ sign_extend 32) (currentBit!6356 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11571 () Bool)

(assert (= bs!11571 d!47281))

(assert (=> bs!11571 m!226769))

(assert (=> b!146710 d!47281))

(declare-fun d!47283 () Bool)

(assert (=> d!47283 (= (array_inv!2793 arr!237) (bvsge (size!3004 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!28336 d!47283))

(declare-fun d!47285 () Bool)

(assert (=> d!47285 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6356 thiss!1634) (currentByte!6361 thiss!1634) (size!3004 (buf!3459 thiss!1634))))))

(declare-fun bs!11572 () Bool)

(assert (= bs!11572 d!47285))

(assert (=> bs!11572 m!226505))

(assert (=> start!28336 d!47285))

(declare-fun d!47287 () Bool)

(declare-datatypes ((tuple2!13114 0))(
  ( (tuple2!13115 (_1!6911 (_ BitVec 8)) (_2!6911 BitStream!5266)) )
))
(declare-fun lt!228082 () tuple2!13114)

(declare-fun readByte!0 (BitStream!5266) tuple2!13114)

(assert (=> d!47287 (= lt!228082 (readByte!0 (_1!6899 lt!227893)))))

(assert (=> d!47287 (= (readBytePure!0 (_1!6899 lt!227893)) (tuple2!13097 (_2!6911 lt!228082) (_1!6911 lt!228082)))))

(declare-fun bs!11573 () Bool)

(assert (= bs!11573 d!47287))

(declare-fun m!226771 () Bool)

(assert (=> bs!11573 m!226771))

(assert (=> b!146709 d!47287))

(declare-fun b!146839 () Bool)

(declare-fun e!97914 () Unit!9193)

(declare-fun Unit!9199 () Unit!9193)

(assert (=> b!146839 (= e!97914 Unit!9199)))

(declare-fun lt!228129 () tuple2!13090)

(declare-fun lt!228124 () (_ BitVec 64))

(declare-fun e!97915 () Bool)

(declare-fun b!146840 () Bool)

(declare-fun lt!228133 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!5266 (_ BitVec 64)) BitStream!5266)

(assert (=> b!146840 (= e!97915 (= (_1!6899 lt!228129) (withMovedBitIndex!0 (_2!6899 lt!228129) (bvsub lt!228133 lt!228124))))))

(assert (=> b!146840 (or (= (bvand lt!228133 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!228124 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!228133 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!228133 lt!228124) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!146840 (= lt!228124 (bitIndex!0 (size!3004 (buf!3459 (_2!6901 lt!227885))) (currentByte!6361 (_2!6901 lt!227885)) (currentBit!6356 (_2!6901 lt!227885))))))

(assert (=> b!146840 (= lt!228133 (bitIndex!0 (size!3004 (buf!3459 thiss!1634)) (currentByte!6361 thiss!1634) (currentBit!6356 thiss!1634)))))

(declare-fun b!146841 () Bool)

(declare-fun res!122852 () Bool)

(assert (=> b!146841 (=> (not res!122852) (not e!97915))))

(assert (=> b!146841 (= res!122852 (isPrefixOf!0 (_1!6899 lt!228129) thiss!1634))))

(declare-fun b!146842 () Bool)

(declare-fun res!122851 () Bool)

(assert (=> b!146842 (=> (not res!122851) (not e!97915))))

(assert (=> b!146842 (= res!122851 (isPrefixOf!0 (_2!6899 lt!228129) (_2!6901 lt!227885)))))

(declare-fun b!146838 () Bool)

(declare-fun lt!228137 () Unit!9193)

(assert (=> b!146838 (= e!97914 lt!228137)))

(declare-fun lt!228123 () (_ BitVec 64))

(assert (=> b!146838 (= lt!228123 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!228126 () (_ BitVec 64))

(assert (=> b!146838 (= lt!228126 (bitIndex!0 (size!3004 (buf!3459 thiss!1634)) (currentByte!6361 thiss!1634) (currentBit!6356 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6638 array!6638 (_ BitVec 64) (_ BitVec 64)) Unit!9193)

(assert (=> b!146838 (= lt!228137 (arrayBitRangesEqSymmetric!0 (buf!3459 thiss!1634) (buf!3459 (_2!6901 lt!227885)) lt!228123 lt!228126))))

(declare-fun arrayBitRangesEq!0 (array!6638 array!6638 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!146838 (arrayBitRangesEq!0 (buf!3459 (_2!6901 lt!227885)) (buf!3459 thiss!1634) lt!228123 lt!228126)))

(declare-fun d!47289 () Bool)

(assert (=> d!47289 e!97915))

(declare-fun res!122850 () Bool)

(assert (=> d!47289 (=> (not res!122850) (not e!97915))))

(assert (=> d!47289 (= res!122850 (isPrefixOf!0 (_1!6899 lt!228129) (_2!6899 lt!228129)))))

(declare-fun lt!228135 () BitStream!5266)

(assert (=> d!47289 (= lt!228129 (tuple2!13091 lt!228135 (_2!6901 lt!227885)))))

(declare-fun lt!228134 () Unit!9193)

(declare-fun lt!228142 () Unit!9193)

(assert (=> d!47289 (= lt!228134 lt!228142)))

(assert (=> d!47289 (isPrefixOf!0 lt!228135 (_2!6901 lt!227885))))

(assert (=> d!47289 (= lt!228142 (lemmaIsPrefixTransitive!0 lt!228135 (_2!6901 lt!227885) (_2!6901 lt!227885)))))

(declare-fun lt!228139 () Unit!9193)

(declare-fun lt!228140 () Unit!9193)

(assert (=> d!47289 (= lt!228139 lt!228140)))

(assert (=> d!47289 (isPrefixOf!0 lt!228135 (_2!6901 lt!227885))))

(assert (=> d!47289 (= lt!228140 (lemmaIsPrefixTransitive!0 lt!228135 thiss!1634 (_2!6901 lt!227885)))))

(declare-fun lt!228141 () Unit!9193)

(assert (=> d!47289 (= lt!228141 e!97914)))

(declare-fun c!7950 () Bool)

(assert (=> d!47289 (= c!7950 (not (= (size!3004 (buf!3459 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!228131 () Unit!9193)

(declare-fun lt!228125 () Unit!9193)

(assert (=> d!47289 (= lt!228131 lt!228125)))

(assert (=> d!47289 (isPrefixOf!0 (_2!6901 lt!227885) (_2!6901 lt!227885))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5266) Unit!9193)

(assert (=> d!47289 (= lt!228125 (lemmaIsPrefixRefl!0 (_2!6901 lt!227885)))))

(declare-fun lt!228130 () Unit!9193)

(declare-fun lt!228132 () Unit!9193)

(assert (=> d!47289 (= lt!228130 lt!228132)))

(assert (=> d!47289 (= lt!228132 (lemmaIsPrefixRefl!0 (_2!6901 lt!227885)))))

(declare-fun lt!228128 () Unit!9193)

(declare-fun lt!228127 () Unit!9193)

(assert (=> d!47289 (= lt!228128 lt!228127)))

(assert (=> d!47289 (isPrefixOf!0 lt!228135 lt!228135)))

(assert (=> d!47289 (= lt!228127 (lemmaIsPrefixRefl!0 lt!228135))))

(declare-fun lt!228136 () Unit!9193)

(declare-fun lt!228138 () Unit!9193)

(assert (=> d!47289 (= lt!228136 lt!228138)))

(assert (=> d!47289 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!47289 (= lt!228138 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!47289 (= lt!228135 (BitStream!5267 (buf!3459 (_2!6901 lt!227885)) (currentByte!6361 thiss!1634) (currentBit!6356 thiss!1634)))))

(assert (=> d!47289 (isPrefixOf!0 thiss!1634 (_2!6901 lt!227885))))

(assert (=> d!47289 (= (reader!0 thiss!1634 (_2!6901 lt!227885)) lt!228129)))

(assert (= (and d!47289 c!7950) b!146838))

(assert (= (and d!47289 (not c!7950)) b!146839))

(assert (= (and d!47289 res!122850) b!146841))

(assert (= (and b!146841 res!122852) b!146842))

(assert (= (and b!146842 res!122851) b!146840))

(assert (=> b!146838 m!226523))

(declare-fun m!226775 () Bool)

(assert (=> b!146838 m!226775))

(declare-fun m!226777 () Bool)

(assert (=> b!146838 m!226777))

(declare-fun m!226779 () Bool)

(assert (=> b!146842 m!226779))

(declare-fun m!226781 () Bool)

(assert (=> b!146841 m!226781))

(declare-fun m!226783 () Bool)

(assert (=> d!47289 m!226783))

(declare-fun m!226785 () Bool)

(assert (=> d!47289 m!226785))

(declare-fun m!226787 () Bool)

(assert (=> d!47289 m!226787))

(declare-fun m!226789 () Bool)

(assert (=> d!47289 m!226789))

(declare-fun m!226791 () Bool)

(assert (=> d!47289 m!226791))

(declare-fun m!226793 () Bool)

(assert (=> d!47289 m!226793))

(declare-fun m!226795 () Bool)

(assert (=> d!47289 m!226795))

(declare-fun m!226797 () Bool)

(assert (=> d!47289 m!226797))

(declare-fun m!226799 () Bool)

(assert (=> d!47289 m!226799))

(assert (=> d!47289 m!226527))

(declare-fun m!226801 () Bool)

(assert (=> d!47289 m!226801))

(declare-fun m!226803 () Bool)

(assert (=> b!146840 m!226803))

(assert (=> b!146840 m!226497))

(assert (=> b!146840 m!226523))

(assert (=> b!146709 d!47289))

(declare-fun d!47297 () Bool)

(declare-fun e!97916 () Bool)

(assert (=> d!47297 e!97916))

(declare-fun res!122853 () Bool)

(assert (=> d!47297 (=> (not res!122853) (not e!97916))))

(declare-fun lt!228146 () (_ BitVec 64))

(declare-fun lt!228148 () (_ BitVec 64))

(declare-fun lt!228145 () (_ BitVec 64))

(assert (=> d!47297 (= res!122853 (= lt!228146 (bvsub lt!228145 lt!228148)))))

(assert (=> d!47297 (or (= (bvand lt!228145 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!228148 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!228145 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!228145 lt!228148) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!47297 (= lt!228148 (remainingBits!0 ((_ sign_extend 32) (size!3004 (buf!3459 (_2!6901 lt!227901)))) ((_ sign_extend 32) (currentByte!6361 (_2!6901 lt!227901))) ((_ sign_extend 32) (currentBit!6356 (_2!6901 lt!227901)))))))

(declare-fun lt!228147 () (_ BitVec 64))

(declare-fun lt!228143 () (_ BitVec 64))

(assert (=> d!47297 (= lt!228145 (bvmul lt!228147 lt!228143))))

(assert (=> d!47297 (or (= lt!228147 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!228143 (bvsdiv (bvmul lt!228147 lt!228143) lt!228147)))))

(assert (=> d!47297 (= lt!228143 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!47297 (= lt!228147 ((_ sign_extend 32) (size!3004 (buf!3459 (_2!6901 lt!227901)))))))

(assert (=> d!47297 (= lt!228146 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6361 (_2!6901 lt!227901))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6356 (_2!6901 lt!227901)))))))

(assert (=> d!47297 (invariant!0 (currentBit!6356 (_2!6901 lt!227901)) (currentByte!6361 (_2!6901 lt!227901)) (size!3004 (buf!3459 (_2!6901 lt!227901))))))

(assert (=> d!47297 (= (bitIndex!0 (size!3004 (buf!3459 (_2!6901 lt!227901))) (currentByte!6361 (_2!6901 lt!227901)) (currentBit!6356 (_2!6901 lt!227901))) lt!228146)))

(declare-fun b!146843 () Bool)

(declare-fun res!122854 () Bool)

(assert (=> b!146843 (=> (not res!122854) (not e!97916))))

(assert (=> b!146843 (= res!122854 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!228146))))

(declare-fun b!146844 () Bool)

(declare-fun lt!228144 () (_ BitVec 64))

(assert (=> b!146844 (= e!97916 (bvsle lt!228146 (bvmul lt!228144 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146844 (or (= lt!228144 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!228144 #b0000000000000000000000000000000000000000000000000000000000001000) lt!228144)))))

(assert (=> b!146844 (= lt!228144 ((_ sign_extend 32) (size!3004 (buf!3459 (_2!6901 lt!227901)))))))

(assert (= (and d!47297 res!122853) b!146843))

(assert (= (and b!146843 res!122854) b!146844))

(declare-fun m!226805 () Bool)

(assert (=> d!47297 m!226805))

(declare-fun m!226807 () Bool)

(assert (=> d!47297 m!226807))

(assert (=> b!146711 d!47297))

(assert (=> b!146711 d!47273))

(declare-datatypes ((tuple3!570 0))(
  ( (tuple3!571 (_1!6912 Unit!9193) (_2!6912 BitStream!5266) (_3!354 array!6638)) )
))
(declare-fun lt!228175 () tuple3!570)

(declare-fun d!47299 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!5266 array!6638 (_ BitVec 32) (_ BitVec 32)) tuple3!570)

(assert (=> d!47299 (= lt!228175 (readByteArrayLoop!0 (_1!6899 lt!227900) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!47299 (= (readByteArrayLoopPure!0 (_1!6899 lt!227900) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13093 (_2!6912 lt!228175) (_3!354 lt!228175)))))

(declare-fun bs!11574 () Bool)

(assert (= bs!11574 d!47299))

(declare-fun m!226813 () Bool)

(assert (=> bs!11574 m!226813))

(assert (=> b!146700 d!47299))

(declare-fun d!47303 () Bool)

(assert (=> d!47303 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3004 (buf!3459 (_2!6901 lt!227901)))) ((_ sign_extend 32) (currentByte!6361 (_2!6901 lt!227885))) ((_ sign_extend 32) (currentBit!6356 (_2!6901 lt!227885))) lt!227889) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3004 (buf!3459 (_2!6901 lt!227901)))) ((_ sign_extend 32) (currentByte!6361 (_2!6901 lt!227885))) ((_ sign_extend 32) (currentBit!6356 (_2!6901 lt!227885)))) lt!227889))))

(declare-fun bs!11575 () Bool)

(assert (= bs!11575 d!47303))

(declare-fun m!226819 () Bool)

(assert (=> bs!11575 m!226819))

(assert (=> b!146700 d!47303))

(declare-fun d!47307 () Bool)

(assert (=> d!47307 (validate_offset_bits!1 ((_ sign_extend 32) (size!3004 (buf!3459 (_2!6901 lt!227901)))) ((_ sign_extend 32) (currentByte!6361 (_2!6901 lt!227885))) ((_ sign_extend 32) (currentBit!6356 (_2!6901 lt!227885))) lt!227889)))

(declare-fun lt!228178 () Unit!9193)

(declare-fun choose!9 (BitStream!5266 array!6638 (_ BitVec 64) BitStream!5266) Unit!9193)

(assert (=> d!47307 (= lt!228178 (choose!9 (_2!6901 lt!227885) (buf!3459 (_2!6901 lt!227901)) lt!227889 (BitStream!5267 (buf!3459 (_2!6901 lt!227901)) (currentByte!6361 (_2!6901 lt!227885)) (currentBit!6356 (_2!6901 lt!227885)))))))

(assert (=> d!47307 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6901 lt!227885) (buf!3459 (_2!6901 lt!227901)) lt!227889) lt!228178)))

(declare-fun bs!11576 () Bool)

(assert (= bs!11576 d!47307))

(assert (=> bs!11576 m!226513))

(declare-fun m!226821 () Bool)

(assert (=> bs!11576 m!226821))

(assert (=> b!146700 d!47307))

(declare-fun b!146854 () Bool)

(declare-fun e!97921 () Unit!9193)

(declare-fun Unit!9200 () Unit!9193)

(assert (=> b!146854 (= e!97921 Unit!9200)))

(declare-fun lt!228189 () (_ BitVec 64))

(declare-fun lt!228185 () tuple2!13090)

(declare-fun e!97922 () Bool)

(declare-fun b!146855 () Bool)

(declare-fun lt!228180 () (_ BitVec 64))

(assert (=> b!146855 (= e!97922 (= (_1!6899 lt!228185) (withMovedBitIndex!0 (_2!6899 lt!228185) (bvsub lt!228189 lt!228180))))))

(assert (=> b!146855 (or (= (bvand lt!228189 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!228180 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!228189 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!228189 lt!228180) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!146855 (= lt!228180 (bitIndex!0 (size!3004 (buf!3459 (_2!6901 lt!227901))) (currentByte!6361 (_2!6901 lt!227901)) (currentBit!6356 (_2!6901 lt!227901))))))

(assert (=> b!146855 (= lt!228189 (bitIndex!0 (size!3004 (buf!3459 (_2!6901 lt!227885))) (currentByte!6361 (_2!6901 lt!227885)) (currentBit!6356 (_2!6901 lt!227885))))))

(declare-fun b!146856 () Bool)

(declare-fun res!122865 () Bool)

(assert (=> b!146856 (=> (not res!122865) (not e!97922))))

(assert (=> b!146856 (= res!122865 (isPrefixOf!0 (_1!6899 lt!228185) (_2!6901 lt!227885)))))

(declare-fun b!146857 () Bool)

(declare-fun res!122864 () Bool)

(assert (=> b!146857 (=> (not res!122864) (not e!97922))))

(assert (=> b!146857 (= res!122864 (isPrefixOf!0 (_2!6899 lt!228185) (_2!6901 lt!227901)))))

(declare-fun b!146853 () Bool)

(declare-fun lt!228193 () Unit!9193)

(assert (=> b!146853 (= e!97921 lt!228193)))

(declare-fun lt!228179 () (_ BitVec 64))

(assert (=> b!146853 (= lt!228179 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!228182 () (_ BitVec 64))

(assert (=> b!146853 (= lt!228182 (bitIndex!0 (size!3004 (buf!3459 (_2!6901 lt!227885))) (currentByte!6361 (_2!6901 lt!227885)) (currentBit!6356 (_2!6901 lt!227885))))))

(assert (=> b!146853 (= lt!228193 (arrayBitRangesEqSymmetric!0 (buf!3459 (_2!6901 lt!227885)) (buf!3459 (_2!6901 lt!227901)) lt!228179 lt!228182))))

(assert (=> b!146853 (arrayBitRangesEq!0 (buf!3459 (_2!6901 lt!227901)) (buf!3459 (_2!6901 lt!227885)) lt!228179 lt!228182)))

(declare-fun d!47309 () Bool)

(assert (=> d!47309 e!97922))

(declare-fun res!122863 () Bool)

(assert (=> d!47309 (=> (not res!122863) (not e!97922))))

(assert (=> d!47309 (= res!122863 (isPrefixOf!0 (_1!6899 lt!228185) (_2!6899 lt!228185)))))

(declare-fun lt!228191 () BitStream!5266)

(assert (=> d!47309 (= lt!228185 (tuple2!13091 lt!228191 (_2!6901 lt!227901)))))

(declare-fun lt!228190 () Unit!9193)

(declare-fun lt!228198 () Unit!9193)

(assert (=> d!47309 (= lt!228190 lt!228198)))

(assert (=> d!47309 (isPrefixOf!0 lt!228191 (_2!6901 lt!227901))))

(assert (=> d!47309 (= lt!228198 (lemmaIsPrefixTransitive!0 lt!228191 (_2!6901 lt!227901) (_2!6901 lt!227901)))))

(declare-fun lt!228195 () Unit!9193)

(declare-fun lt!228196 () Unit!9193)

(assert (=> d!47309 (= lt!228195 lt!228196)))

(assert (=> d!47309 (isPrefixOf!0 lt!228191 (_2!6901 lt!227901))))

(assert (=> d!47309 (= lt!228196 (lemmaIsPrefixTransitive!0 lt!228191 (_2!6901 lt!227885) (_2!6901 lt!227901)))))

(declare-fun lt!228197 () Unit!9193)

(assert (=> d!47309 (= lt!228197 e!97921)))

(declare-fun c!7951 () Bool)

(assert (=> d!47309 (= c!7951 (not (= (size!3004 (buf!3459 (_2!6901 lt!227885))) #b00000000000000000000000000000000)))))

(declare-fun lt!228187 () Unit!9193)

(declare-fun lt!228181 () Unit!9193)

(assert (=> d!47309 (= lt!228187 lt!228181)))

(assert (=> d!47309 (isPrefixOf!0 (_2!6901 lt!227901) (_2!6901 lt!227901))))

(assert (=> d!47309 (= lt!228181 (lemmaIsPrefixRefl!0 (_2!6901 lt!227901)))))

(declare-fun lt!228186 () Unit!9193)

(declare-fun lt!228188 () Unit!9193)

(assert (=> d!47309 (= lt!228186 lt!228188)))

(assert (=> d!47309 (= lt!228188 (lemmaIsPrefixRefl!0 (_2!6901 lt!227901)))))

(declare-fun lt!228184 () Unit!9193)

(declare-fun lt!228183 () Unit!9193)

(assert (=> d!47309 (= lt!228184 lt!228183)))

(assert (=> d!47309 (isPrefixOf!0 lt!228191 lt!228191)))

(assert (=> d!47309 (= lt!228183 (lemmaIsPrefixRefl!0 lt!228191))))

(declare-fun lt!228192 () Unit!9193)

(declare-fun lt!228194 () Unit!9193)

(assert (=> d!47309 (= lt!228192 lt!228194)))

(assert (=> d!47309 (isPrefixOf!0 (_2!6901 lt!227885) (_2!6901 lt!227885))))

(assert (=> d!47309 (= lt!228194 (lemmaIsPrefixRefl!0 (_2!6901 lt!227885)))))

(assert (=> d!47309 (= lt!228191 (BitStream!5267 (buf!3459 (_2!6901 lt!227901)) (currentByte!6361 (_2!6901 lt!227885)) (currentBit!6356 (_2!6901 lt!227885))))))

(assert (=> d!47309 (isPrefixOf!0 (_2!6901 lt!227885) (_2!6901 lt!227901))))

(assert (=> d!47309 (= (reader!0 (_2!6901 lt!227885) (_2!6901 lt!227901)) lt!228185)))

(assert (= (and d!47309 c!7951) b!146853))

(assert (= (and d!47309 (not c!7951)) b!146854))

(assert (= (and d!47309 res!122863) b!146856))

(assert (= (and b!146856 res!122865) b!146857))

(assert (= (and b!146857 res!122864) b!146855))

(assert (=> b!146853 m!226497))

(declare-fun m!226823 () Bool)

(assert (=> b!146853 m!226823))

(declare-fun m!226825 () Bool)

(assert (=> b!146853 m!226825))

(declare-fun m!226827 () Bool)

(assert (=> b!146857 m!226827))

(declare-fun m!226829 () Bool)

(assert (=> b!146856 m!226829))

(declare-fun m!226831 () Bool)

(assert (=> d!47309 m!226831))

(declare-fun m!226833 () Bool)

(assert (=> d!47309 m!226833))

(assert (=> d!47309 m!226795))

(assert (=> d!47309 m!226797))

(declare-fun m!226835 () Bool)

(assert (=> d!47309 m!226835))

(declare-fun m!226837 () Bool)

(assert (=> d!47309 m!226837))

(declare-fun m!226839 () Bool)

(assert (=> d!47309 m!226839))

(declare-fun m!226841 () Bool)

(assert (=> d!47309 m!226841))

(declare-fun m!226843 () Bool)

(assert (=> d!47309 m!226843))

(assert (=> d!47309 m!226521))

(declare-fun m!226845 () Bool)

(assert (=> d!47309 m!226845))

(declare-fun m!226847 () Bool)

(assert (=> b!146855 m!226847))

(assert (=> b!146855 m!226495))

(assert (=> b!146855 m!226497))

(assert (=> b!146700 d!47309))

(declare-fun d!47311 () Bool)

(declare-fun res!122873 () Bool)

(declare-fun e!97927 () Bool)

(assert (=> d!47311 (=> (not res!122873) (not e!97927))))

(assert (=> d!47311 (= res!122873 (= (size!3004 (buf!3459 thiss!1634)) (size!3004 (buf!3459 (_2!6901 lt!227901)))))))

(assert (=> d!47311 (= (isPrefixOf!0 thiss!1634 (_2!6901 lt!227901)) e!97927)))

(declare-fun b!146864 () Bool)

(declare-fun res!122872 () Bool)

(assert (=> b!146864 (=> (not res!122872) (not e!97927))))

(assert (=> b!146864 (= res!122872 (bvsle (bitIndex!0 (size!3004 (buf!3459 thiss!1634)) (currentByte!6361 thiss!1634) (currentBit!6356 thiss!1634)) (bitIndex!0 (size!3004 (buf!3459 (_2!6901 lt!227901))) (currentByte!6361 (_2!6901 lt!227901)) (currentBit!6356 (_2!6901 lt!227901)))))))

(declare-fun b!146865 () Bool)

(declare-fun e!97928 () Bool)

(assert (=> b!146865 (= e!97927 e!97928)))

(declare-fun res!122874 () Bool)

(assert (=> b!146865 (=> res!122874 e!97928)))

(assert (=> b!146865 (= res!122874 (= (size!3004 (buf!3459 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!146866 () Bool)

(assert (=> b!146866 (= e!97928 (arrayBitRangesEq!0 (buf!3459 thiss!1634) (buf!3459 (_2!6901 lt!227901)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3004 (buf!3459 thiss!1634)) (currentByte!6361 thiss!1634) (currentBit!6356 thiss!1634))))))

(assert (= (and d!47311 res!122873) b!146864))

(assert (= (and b!146864 res!122872) b!146865))

(assert (= (and b!146865 (not res!122874)) b!146866))

(assert (=> b!146864 m!226523))

(assert (=> b!146864 m!226495))

(assert (=> b!146866 m!226523))

(assert (=> b!146866 m!226523))

(declare-fun m!226855 () Bool)

(assert (=> b!146866 m!226855))

(assert (=> b!146702 d!47311))

(declare-fun d!47319 () Bool)

(assert (=> d!47319 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3004 (buf!3459 (_2!6901 lt!227885)))) ((_ sign_extend 32) (currentByte!6361 (_2!6901 lt!227885))) ((_ sign_extend 32) (currentBit!6356 (_2!6901 lt!227885))) lt!227894) (bvsle ((_ sign_extend 32) lt!227894) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3004 (buf!3459 (_2!6901 lt!227885)))) ((_ sign_extend 32) (currentByte!6361 (_2!6901 lt!227885))) ((_ sign_extend 32) (currentBit!6356 (_2!6901 lt!227885)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11580 () Bool)

(assert (= bs!11580 d!47319))

(assert (=> bs!11580 m!226765))

(assert (=> b!146702 d!47319))

(declare-fun d!47321 () Bool)

(declare-fun moveByteIndex!0 (BitStream!5266 (_ BitVec 32)) tuple2!13094)

(assert (=> d!47321 (= (withMovedByteIndex!0 (_1!6899 lt!227882) #b00000000000000000000000000000001) (_2!6901 (moveByteIndex!0 (_1!6899 lt!227882) #b00000000000000000000000000000001)))))

(declare-fun bs!11581 () Bool)

(assert (= bs!11581 d!47321))

(declare-fun m!226857 () Bool)

(assert (=> bs!11581 m!226857))

(assert (=> b!146702 d!47321))

(assert (=> b!146702 d!47309))

(declare-fun b!146915 () Bool)

(declare-fun e!97958 () Bool)

(declare-fun e!97959 () Bool)

(assert (=> b!146915 (= e!97958 e!97959)))

(declare-fun res!122918 () Bool)

(assert (=> b!146915 (=> (not res!122918) (not e!97959))))

(declare-fun lt!228336 () tuple2!13092)

(declare-fun lt!228334 () tuple2!13090)

(assert (=> b!146915 (= res!122918 (and (= (size!3004 (_2!6900 lt!228336)) (size!3004 arr!237)) (= (_1!6900 lt!228336) (_2!6899 lt!228334))))))

(assert (=> b!146915 (= lt!228336 (readByteArrayLoopPure!0 (_1!6899 lt!228334) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!228331 () Unit!9193)

(declare-fun lt!228337 () Unit!9193)

(assert (=> b!146915 (= lt!228331 lt!228337)))

(declare-fun lt!228338 () tuple2!13094)

(declare-fun lt!228332 () (_ BitVec 64))

(assert (=> b!146915 (validate_offset_bits!1 ((_ sign_extend 32) (size!3004 (buf!3459 (_2!6901 lt!228338)))) ((_ sign_extend 32) (currentByte!6361 (_2!6901 lt!227885))) ((_ sign_extend 32) (currentBit!6356 (_2!6901 lt!227885))) lt!228332)))

(assert (=> b!146915 (= lt!228337 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6901 lt!227885) (buf!3459 (_2!6901 lt!228338)) lt!228332))))

(declare-fun e!97960 () Bool)

(assert (=> b!146915 e!97960))

(declare-fun res!122916 () Bool)

(assert (=> b!146915 (=> (not res!122916) (not e!97960))))

(assert (=> b!146915 (= res!122916 (and (= (size!3004 (buf!3459 (_2!6901 lt!227885))) (size!3004 (buf!3459 (_2!6901 lt!228338)))) (bvsge lt!228332 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!146915 (= lt!228332 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!146915 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!146915 (= lt!228334 (reader!0 (_2!6901 lt!227885) (_2!6901 lt!228338)))))

(declare-fun d!47323 () Bool)

(assert (=> d!47323 e!97958))

(declare-fun res!122917 () Bool)

(assert (=> d!47323 (=> (not res!122917) (not e!97958))))

(assert (=> d!47323 (= res!122917 (= (size!3004 (buf!3459 (_2!6901 lt!227885))) (size!3004 (buf!3459 (_2!6901 lt!228338)))))))

(declare-fun choose!64 (BitStream!5266 array!6638 (_ BitVec 32) (_ BitVec 32)) tuple2!13094)

(assert (=> d!47323 (= lt!228338 (choose!64 (_2!6901 lt!227885) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!47323 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3004 arr!237)))))

(assert (=> d!47323 (= (appendByteArrayLoop!0 (_2!6901 lt!227885) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!228338)))

(declare-fun b!146916 () Bool)

(declare-fun res!122919 () Bool)

(assert (=> b!146916 (=> (not res!122919) (not e!97958))))

(assert (=> b!146916 (= res!122919 (isPrefixOf!0 (_2!6901 lt!227885) (_2!6901 lt!228338)))))

(declare-fun b!146917 () Bool)

(declare-fun res!122915 () Bool)

(assert (=> b!146917 (=> (not res!122915) (not e!97958))))

(declare-fun lt!228330 () (_ BitVec 64))

(declare-fun lt!228333 () (_ BitVec 64))

(assert (=> b!146917 (= res!122915 (= (bitIndex!0 (size!3004 (buf!3459 (_2!6901 lt!228338))) (currentByte!6361 (_2!6901 lt!228338)) (currentBit!6356 (_2!6901 lt!228338))) (bvadd lt!228330 lt!228333)))))

(assert (=> b!146917 (or (not (= (bvand lt!228330 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!228333 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!228330 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!228330 lt!228333) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!228335 () (_ BitVec 64))

(assert (=> b!146917 (= lt!228333 (bvmul lt!228335 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!146917 (or (= lt!228335 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!228335 #b0000000000000000000000000000000000000000000000000000000000001000) lt!228335)))))

(assert (=> b!146917 (= lt!228335 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!146917 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!146917 (= lt!228330 (bitIndex!0 (size!3004 (buf!3459 (_2!6901 lt!227885))) (currentByte!6361 (_2!6901 lt!227885)) (currentBit!6356 (_2!6901 lt!227885))))))

(declare-fun b!146918 () Bool)

(assert (=> b!146918 (= e!97960 (validate_offset_bits!1 ((_ sign_extend 32) (size!3004 (buf!3459 (_2!6901 lt!227885)))) ((_ sign_extend 32) (currentByte!6361 (_2!6901 lt!227885))) ((_ sign_extend 32) (currentBit!6356 (_2!6901 lt!227885))) lt!228332))))

(declare-fun b!146919 () Bool)

(assert (=> b!146919 (= e!97959 (arrayRangesEq!320 arr!237 (_2!6900 lt!228336) #b00000000000000000000000000000000 to!404))))

(assert (= (and d!47323 res!122917) b!146917))

(assert (= (and b!146917 res!122915) b!146916))

(assert (= (and b!146916 res!122919) b!146915))

(assert (= (and b!146915 res!122916) b!146918))

(assert (= (and b!146915 res!122918) b!146919))

(declare-fun m!226945 () Bool)

(assert (=> d!47323 m!226945))

(declare-fun m!226947 () Bool)

(assert (=> b!146916 m!226947))

(declare-fun m!226949 () Bool)

(assert (=> b!146917 m!226949))

(assert (=> b!146917 m!226497))

(declare-fun m!226951 () Bool)

(assert (=> b!146918 m!226951))

(declare-fun m!226953 () Bool)

(assert (=> b!146919 m!226953))

(declare-fun m!226955 () Bool)

(assert (=> b!146915 m!226955))

(declare-fun m!226957 () Bool)

(assert (=> b!146915 m!226957))

(declare-fun m!226959 () Bool)

(assert (=> b!146915 m!226959))

(declare-fun m!226961 () Bool)

(assert (=> b!146915 m!226961))

(assert (=> b!146702 d!47323))

(declare-fun d!47352 () Bool)

(declare-fun e!97961 () Bool)

(assert (=> d!47352 e!97961))

(declare-fun res!122920 () Bool)

(assert (=> d!47352 (=> (not res!122920) (not e!97961))))

(declare-fun lt!228342 () (_ BitVec 64))

(declare-fun lt!228341 () (_ BitVec 64))

(declare-fun lt!228344 () (_ BitVec 64))

(assert (=> d!47352 (= res!122920 (= lt!228342 (bvsub lt!228341 lt!228344)))))

(assert (=> d!47352 (or (= (bvand lt!228341 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!228344 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!228341 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!228341 lt!228344) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!47352 (= lt!228344 (remainingBits!0 ((_ sign_extend 32) (size!3004 (buf!3459 (_1!6902 lt!227892)))) ((_ sign_extend 32) (currentByte!6361 (_1!6902 lt!227892))) ((_ sign_extend 32) (currentBit!6356 (_1!6902 lt!227892)))))))

(declare-fun lt!228343 () (_ BitVec 64))

(declare-fun lt!228339 () (_ BitVec 64))

(assert (=> d!47352 (= lt!228341 (bvmul lt!228343 lt!228339))))

(assert (=> d!47352 (or (= lt!228343 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!228339 (bvsdiv (bvmul lt!228343 lt!228339) lt!228343)))))

(assert (=> d!47352 (= lt!228339 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!47352 (= lt!228343 ((_ sign_extend 32) (size!3004 (buf!3459 (_1!6902 lt!227892)))))))

(assert (=> d!47352 (= lt!228342 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6361 (_1!6902 lt!227892))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6356 (_1!6902 lt!227892)))))))

(assert (=> d!47352 (invariant!0 (currentBit!6356 (_1!6902 lt!227892)) (currentByte!6361 (_1!6902 lt!227892)) (size!3004 (buf!3459 (_1!6902 lt!227892))))))

(assert (=> d!47352 (= (bitIndex!0 (size!3004 (buf!3459 (_1!6902 lt!227892))) (currentByte!6361 (_1!6902 lt!227892)) (currentBit!6356 (_1!6902 lt!227892))) lt!228342)))

(declare-fun b!146920 () Bool)

(declare-fun res!122921 () Bool)

(assert (=> b!146920 (=> (not res!122921) (not e!97961))))

(assert (=> b!146920 (= res!122921 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!228342))))

(declare-fun b!146921 () Bool)

(declare-fun lt!228340 () (_ BitVec 64))

(assert (=> b!146921 (= e!97961 (bvsle lt!228342 (bvmul lt!228340 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146921 (or (= lt!228340 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!228340 #b0000000000000000000000000000000000000000000000000000000000001000) lt!228340)))))

(assert (=> b!146921 (= lt!228340 ((_ sign_extend 32) (size!3004 (buf!3459 (_1!6902 lt!227892)))))))

(assert (= (and d!47352 res!122920) b!146920))

(assert (= (and b!146920 res!122921) b!146921))

(declare-fun m!226963 () Bool)

(assert (=> d!47352 m!226963))

(declare-fun m!226965 () Bool)

(assert (=> d!47352 m!226965))

(assert (=> b!146702 d!47352))

(declare-fun d!47354 () Bool)

(declare-fun res!122922 () Bool)

(declare-fun e!97962 () Bool)

(assert (=> d!47354 (=> res!122922 e!97962)))

(assert (=> d!47354 (= res!122922 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!47354 (= (arrayRangesEq!320 (_2!6900 lt!227904) (_2!6900 lt!227886) #b00000000000000000000000000000000 to!404) e!97962)))

(declare-fun b!146922 () Bool)

(declare-fun e!97963 () Bool)

(assert (=> b!146922 (= e!97962 e!97963)))

(declare-fun res!122923 () Bool)

(assert (=> b!146922 (=> (not res!122923) (not e!97963))))

(assert (=> b!146922 (= res!122923 (= (select (arr!3758 (_2!6900 lt!227904)) #b00000000000000000000000000000000) (select (arr!3758 (_2!6900 lt!227886)) #b00000000000000000000000000000000)))))

(declare-fun b!146923 () Bool)

(assert (=> b!146923 (= e!97963 (arrayRangesEq!320 (_2!6900 lt!227904) (_2!6900 lt!227886) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!47354 (not res!122922)) b!146922))

(assert (= (and b!146922 res!122923) b!146923))

(declare-fun m!226967 () Bool)

(assert (=> b!146922 m!226967))

(declare-fun m!226969 () Bool)

(assert (=> b!146922 m!226969))

(declare-fun m!226971 () Bool)

(assert (=> b!146923 m!226971))

(assert (=> b!146702 d!47354))

(declare-fun d!47356 () Bool)

(declare-fun e!97971 () Bool)

(assert (=> d!47356 e!97971))

(declare-fun res!122932 () Bool)

(assert (=> d!47356 (=> (not res!122932) (not e!97971))))

(assert (=> d!47356 (= res!122932 (and (or (let ((rhs!3246 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3246 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3246) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!47357 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!47357 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!47357 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3245 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3245 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3245) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!228363 () Unit!9193)

(declare-fun choose!57 (BitStream!5266 BitStream!5266 (_ BitVec 64) (_ BitVec 32)) Unit!9193)

(assert (=> d!47356 (= lt!228363 (choose!57 thiss!1634 (_2!6901 lt!227885) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!47356 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6901 lt!227885) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!228363)))

(declare-fun lt!228364 () (_ BitVec 32))

(declare-fun b!146932 () Bool)

(assert (=> b!146932 (= e!97971 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3004 (buf!3459 (_2!6901 lt!227885)))) ((_ sign_extend 32) (currentByte!6361 (_2!6901 lt!227885))) ((_ sign_extend 32) (currentBit!6356 (_2!6901 lt!227885))) (bvsub (bvsub to!404 from!447) lt!228364)))))

(assert (=> b!146932 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!228364 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!228364) #b10000000000000000000000000000000)))))

(declare-fun lt!228365 () (_ BitVec 64))

(assert (=> b!146932 (= lt!228364 ((_ extract 31 0) lt!228365))))

(assert (=> b!146932 (and (bvslt lt!228365 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!228365 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!146932 (= lt!228365 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!47356 res!122932) b!146932))

(declare-fun m!226983 () Bool)

(assert (=> d!47356 m!226983))

(declare-fun m!226987 () Bool)

(assert (=> b!146932 m!226987))

(assert (=> b!146702 d!47356))

(declare-fun d!47369 () Bool)

(declare-fun e!97974 () Bool)

(assert (=> d!47369 e!97974))

(declare-fun res!122940 () Bool)

(assert (=> d!47369 (=> (not res!122940) (not e!97974))))

(declare-fun lt!228379 () tuple2!13094)

(assert (=> d!47369 (= res!122940 (= (size!3004 (buf!3459 thiss!1634)) (size!3004 (buf!3459 (_2!6901 lt!228379)))))))

(declare-fun choose!6 (BitStream!5266 (_ BitVec 8)) tuple2!13094)

(assert (=> d!47369 (= lt!228379 (choose!6 thiss!1634 (select (arr!3758 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!47369 (validate_offset_byte!0 ((_ sign_extend 32) (size!3004 (buf!3459 thiss!1634))) ((_ sign_extend 32) (currentByte!6361 thiss!1634)) ((_ sign_extend 32) (currentBit!6356 thiss!1634)))))

(assert (=> d!47369 (= (appendByte!0 thiss!1634 (select (arr!3758 arr!237) from!447)) lt!228379)))

(declare-fun b!146939 () Bool)

(declare-fun res!122941 () Bool)

(assert (=> b!146939 (=> (not res!122941) (not e!97974))))

(declare-fun lt!228378 () (_ BitVec 64))

(declare-fun lt!228380 () (_ BitVec 64))

(assert (=> b!146939 (= res!122941 (= (bitIndex!0 (size!3004 (buf!3459 (_2!6901 lt!228379))) (currentByte!6361 (_2!6901 lt!228379)) (currentBit!6356 (_2!6901 lt!228379))) (bvadd lt!228380 lt!228378)))))

(assert (=> b!146939 (or (not (= (bvand lt!228380 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!228378 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!228380 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!228380 lt!228378) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!146939 (= lt!228378 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!146939 (= lt!228380 (bitIndex!0 (size!3004 (buf!3459 thiss!1634)) (currentByte!6361 thiss!1634) (currentBit!6356 thiss!1634)))))

(declare-fun b!146940 () Bool)

(declare-fun res!122939 () Bool)

(assert (=> b!146940 (=> (not res!122939) (not e!97974))))

(assert (=> b!146940 (= res!122939 (isPrefixOf!0 thiss!1634 (_2!6901 lt!228379)))))

(declare-fun lt!228377 () tuple2!13096)

(declare-fun b!146941 () Bool)

(declare-fun lt!228376 () tuple2!13090)

(assert (=> b!146941 (= e!97974 (and (= (_2!6902 lt!228377) (select (arr!3758 arr!237) from!447)) (= (_1!6902 lt!228377) (_2!6899 lt!228376))))))

(assert (=> b!146941 (= lt!228377 (readBytePure!0 (_1!6899 lt!228376)))))

(assert (=> b!146941 (= lt!228376 (reader!0 thiss!1634 (_2!6901 lt!228379)))))

(assert (= (and d!47369 res!122940) b!146939))

(assert (= (and b!146939 res!122941) b!146940))

(assert (= (and b!146940 res!122939) b!146941))

(assert (=> d!47369 m!226499))

(declare-fun m!226989 () Bool)

(assert (=> d!47369 m!226989))

(declare-fun m!226991 () Bool)

(assert (=> d!47369 m!226991))

(declare-fun m!226993 () Bool)

(assert (=> b!146939 m!226993))

(assert (=> b!146939 m!226523))

(declare-fun m!226995 () Bool)

(assert (=> b!146940 m!226995))

(declare-fun m!226997 () Bool)

(assert (=> b!146941 m!226997))

(declare-fun m!226999 () Bool)

(assert (=> b!146941 m!226999))

(assert (=> b!146702 d!47369))

(declare-fun d!47371 () Bool)

(declare-fun lt!228381 () tuple3!570)

(assert (=> d!47371 (= lt!228381 (readByteArrayLoop!0 (_1!6899 lt!227882) arr!237 from!447 to!404))))

(assert (=> d!47371 (= (readByteArrayLoopPure!0 (_1!6899 lt!227882) arr!237 from!447 to!404) (tuple2!13093 (_2!6912 lt!228381) (_3!354 lt!228381)))))

(declare-fun bs!11588 () Bool)

(assert (= bs!11588 d!47371))

(declare-fun m!227001 () Bool)

(assert (=> bs!11588 m!227001))

(assert (=> b!146702 d!47371))

(declare-fun d!47373 () Bool)

(declare-fun lt!228382 () tuple2!13114)

(assert (=> d!47373 (= lt!228382 (readByte!0 (_1!6899 lt!227882)))))

(assert (=> d!47373 (= (readBytePure!0 (_1!6899 lt!227882)) (tuple2!13097 (_2!6911 lt!228382) (_1!6911 lt!228382)))))

(declare-fun bs!11589 () Bool)

(assert (= bs!11589 d!47373))

(declare-fun m!227003 () Bool)

(assert (=> bs!11589 m!227003))

(assert (=> b!146702 d!47373))

(declare-fun d!47375 () Bool)

(declare-fun lt!228383 () tuple3!570)

(assert (=> d!47375 (= lt!228383 (readByteArrayLoop!0 (_1!6899 lt!227890) lt!227883 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!47375 (= (readByteArrayLoopPure!0 (_1!6899 lt!227890) lt!227883 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13093 (_2!6912 lt!228383) (_3!354 lt!228383)))))

(declare-fun bs!11590 () Bool)

(assert (= bs!11590 d!47375))

(declare-fun m!227005 () Bool)

(assert (=> bs!11590 m!227005))

(assert (=> b!146702 d!47375))

(declare-fun d!47377 () Bool)

(declare-fun lt!228384 () tuple2!13114)

(assert (=> d!47377 (= lt!228384 (readByte!0 lt!227903))))

(assert (=> d!47377 (= (readBytePure!0 lt!227903) (tuple2!13097 (_2!6911 lt!228384) (_1!6911 lt!228384)))))

(declare-fun bs!11591 () Bool)

(assert (= bs!11591 d!47377))

(declare-fun m!227007 () Bool)

(assert (=> bs!11591 m!227007))

(assert (=> b!146702 d!47377))

(declare-fun d!47379 () Bool)

(assert (=> d!47379 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3004 (buf!3459 (_2!6901 lt!227901)))) ((_ sign_extend 32) (currentByte!6361 (_2!6901 lt!227885))) ((_ sign_extend 32) (currentBit!6356 (_2!6901 lt!227885))) lt!227894)))

(declare-fun lt!228387 () Unit!9193)

(declare-fun choose!26 (BitStream!5266 array!6638 (_ BitVec 32) BitStream!5266) Unit!9193)

(assert (=> d!47379 (= lt!228387 (choose!26 (_2!6901 lt!227885) (buf!3459 (_2!6901 lt!227901)) lt!227894 (BitStream!5267 (buf!3459 (_2!6901 lt!227901)) (currentByte!6361 (_2!6901 lt!227885)) (currentBit!6356 (_2!6901 lt!227885)))))))

(assert (=> d!47379 (= (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6901 lt!227885) (buf!3459 (_2!6901 lt!227901)) lt!227894) lt!228387)))

(declare-fun bs!11592 () Bool)

(assert (= bs!11592 d!47379))

(assert (=> bs!11592 m!226573))

(declare-fun m!227009 () Bool)

(assert (=> bs!11592 m!227009))

(assert (=> b!146702 d!47379))

(declare-fun d!47381 () Bool)

(declare-fun lt!228396 () tuple2!13092)

(declare-fun lt!228398 () tuple2!13092)

(assert (=> d!47381 (arrayRangesEq!320 (_2!6900 lt!228396) (_2!6900 lt!228398) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!228399 () Unit!9193)

(declare-fun lt!228397 () BitStream!5266)

(declare-fun choose!35 (BitStream!5266 array!6638 (_ BitVec 32) (_ BitVec 32) tuple2!13092 array!6638 BitStream!5266 tuple2!13092 array!6638) Unit!9193)

(assert (=> d!47381 (= lt!228399 (choose!35 (_1!6899 lt!227882) arr!237 from!447 to!404 lt!228396 (_2!6900 lt!228396) lt!228397 lt!228398 (_2!6900 lt!228398)))))

(assert (=> d!47381 (= lt!228398 (readByteArrayLoopPure!0 lt!228397 (array!6639 (store (arr!3758 arr!237) from!447 (_2!6902 (readBytePure!0 (_1!6899 lt!227882)))) (size!3004 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!47381 (= lt!228397 (withMovedByteIndex!0 (_1!6899 lt!227882) #b00000000000000000000000000000001))))

(assert (=> d!47381 (= lt!228396 (readByteArrayLoopPure!0 (_1!6899 lt!227882) arr!237 from!447 to!404))))

(assert (=> d!47381 (= (readByteArrayLoopArrayPrefixLemma!0 (_1!6899 lt!227882) arr!237 from!447 to!404) lt!228399)))

(declare-fun bs!11594 () Bool)

(assert (= bs!11594 d!47381))

(declare-fun m!227011 () Bool)

(assert (=> bs!11594 m!227011))

(assert (=> bs!11594 m!226579))

(declare-fun m!227013 () Bool)

(assert (=> bs!11594 m!227013))

(declare-fun m!227015 () Bool)

(assert (=> bs!11594 m!227015))

(assert (=> bs!11594 m!226545))

(assert (=> bs!11594 m!226569))

(declare-fun m!227017 () Bool)

(assert (=> bs!11594 m!227017))

(assert (=> b!146702 d!47381))

(declare-fun d!47383 () Bool)

(declare-fun e!97977 () Bool)

(assert (=> d!47383 e!97977))

(declare-fun res!122944 () Bool)

(assert (=> d!47383 (=> (not res!122944) (not e!97977))))

(declare-fun lt!228410 () tuple2!13096)

(declare-fun lt!228411 () tuple2!13096)

(assert (=> d!47383 (= res!122944 (= (bitIndex!0 (size!3004 (buf!3459 (_1!6902 lt!228410))) (currentByte!6361 (_1!6902 lt!228410)) (currentBit!6356 (_1!6902 lt!228410))) (bitIndex!0 (size!3004 (buf!3459 (_1!6902 lt!228411))) (currentByte!6361 (_1!6902 lt!228411)) (currentBit!6356 (_1!6902 lt!228411)))))))

(declare-fun lt!228408 () Unit!9193)

(declare-fun lt!228409 () BitStream!5266)

(declare-fun choose!14 (BitStream!5266 BitStream!5266 BitStream!5266 tuple2!13096 tuple2!13096 BitStream!5266 (_ BitVec 8) tuple2!13096 tuple2!13096 BitStream!5266 (_ BitVec 8)) Unit!9193)

(assert (=> d!47383 (= lt!228408 (choose!14 lt!227903 (_2!6901 lt!227901) lt!228409 lt!228410 (tuple2!13097 (_1!6902 lt!228410) (_2!6902 lt!228410)) (_1!6902 lt!228410) (_2!6902 lt!228410) lt!228411 (tuple2!13097 (_1!6902 lt!228411) (_2!6902 lt!228411)) (_1!6902 lt!228411) (_2!6902 lt!228411)))))

(assert (=> d!47383 (= lt!228411 (readBytePure!0 lt!228409))))

(assert (=> d!47383 (= lt!228410 (readBytePure!0 lt!227903))))

(assert (=> d!47383 (= lt!228409 (BitStream!5267 (buf!3459 (_2!6901 lt!227901)) (currentByte!6361 lt!227903) (currentBit!6356 lt!227903)))))

(assert (=> d!47383 (= (readBytePrefixLemma!0 lt!227903 (_2!6901 lt!227901)) lt!228408)))

(declare-fun b!146944 () Bool)

(assert (=> b!146944 (= e!97977 (= (_2!6902 lt!228410) (_2!6902 lt!228411)))))

(assert (= (and d!47383 res!122944) b!146944))

(declare-fun m!227019 () Bool)

(assert (=> d!47383 m!227019))

(declare-fun m!227021 () Bool)

(assert (=> d!47383 m!227021))

(declare-fun m!227023 () Bool)

(assert (=> d!47383 m!227023))

(declare-fun m!227025 () Bool)

(assert (=> d!47383 m!227025))

(assert (=> d!47383 m!226557))

(assert (=> b!146702 d!47383))

(declare-fun d!47385 () Bool)

(declare-fun lt!228412 () tuple2!13114)

(assert (=> d!47385 (= lt!228412 (readByte!0 (BitStream!5267 (buf!3459 (_2!6901 lt!227901)) (currentByte!6361 thiss!1634) (currentBit!6356 thiss!1634))))))

(assert (=> d!47385 (= (readBytePure!0 (BitStream!5267 (buf!3459 (_2!6901 lt!227901)) (currentByte!6361 thiss!1634) (currentBit!6356 thiss!1634))) (tuple2!13097 (_2!6911 lt!228412) (_1!6911 lt!228412)))))

(declare-fun bs!11595 () Bool)

(assert (= bs!11595 d!47385))

(declare-fun m!227027 () Bool)

(assert (=> bs!11595 m!227027))

(assert (=> b!146702 d!47385))

(declare-fun d!47387 () Bool)

(assert (=> d!47387 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3004 (buf!3459 (_2!6901 lt!227901)))) ((_ sign_extend 32) (currentByte!6361 (_2!6901 lt!227885))) ((_ sign_extend 32) (currentBit!6356 (_2!6901 lt!227885))) lt!227894) (bvsle ((_ sign_extend 32) lt!227894) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3004 (buf!3459 (_2!6901 lt!227901)))) ((_ sign_extend 32) (currentByte!6361 (_2!6901 lt!227885))) ((_ sign_extend 32) (currentBit!6356 (_2!6901 lt!227885)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11596 () Bool)

(assert (= bs!11596 d!47387))

(assert (=> bs!11596 m!226819))

(assert (=> b!146702 d!47387))

(declare-fun b!146946 () Bool)

(declare-fun e!97978 () Unit!9193)

(declare-fun Unit!9202 () Unit!9193)

(assert (=> b!146946 (= e!97978 Unit!9202)))

(declare-fun b!146947 () Bool)

(declare-fun lt!228414 () (_ BitVec 64))

(declare-fun lt!228423 () (_ BitVec 64))

(declare-fun e!97979 () Bool)

(declare-fun lt!228419 () tuple2!13090)

(assert (=> b!146947 (= e!97979 (= (_1!6899 lt!228419) (withMovedBitIndex!0 (_2!6899 lt!228419) (bvsub lt!228423 lt!228414))))))

(assert (=> b!146947 (or (= (bvand lt!228423 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!228414 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!228423 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!228423 lt!228414) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!146947 (= lt!228414 (bitIndex!0 (size!3004 (buf!3459 (_2!6901 lt!227901))) (currentByte!6361 (_2!6901 lt!227901)) (currentBit!6356 (_2!6901 lt!227901))))))

(assert (=> b!146947 (= lt!228423 (bitIndex!0 (size!3004 (buf!3459 thiss!1634)) (currentByte!6361 thiss!1634) (currentBit!6356 thiss!1634)))))

(declare-fun b!146948 () Bool)

(declare-fun res!122947 () Bool)

(assert (=> b!146948 (=> (not res!122947) (not e!97979))))

(assert (=> b!146948 (= res!122947 (isPrefixOf!0 (_1!6899 lt!228419) thiss!1634))))

(declare-fun b!146949 () Bool)

(declare-fun res!122946 () Bool)

(assert (=> b!146949 (=> (not res!122946) (not e!97979))))

(assert (=> b!146949 (= res!122946 (isPrefixOf!0 (_2!6899 lt!228419) (_2!6901 lt!227901)))))

(declare-fun b!146945 () Bool)

(declare-fun lt!228427 () Unit!9193)

(assert (=> b!146945 (= e!97978 lt!228427)))

(declare-fun lt!228413 () (_ BitVec 64))

(assert (=> b!146945 (= lt!228413 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!228416 () (_ BitVec 64))

(assert (=> b!146945 (= lt!228416 (bitIndex!0 (size!3004 (buf!3459 thiss!1634)) (currentByte!6361 thiss!1634) (currentBit!6356 thiss!1634)))))

(assert (=> b!146945 (= lt!228427 (arrayBitRangesEqSymmetric!0 (buf!3459 thiss!1634) (buf!3459 (_2!6901 lt!227901)) lt!228413 lt!228416))))

(assert (=> b!146945 (arrayBitRangesEq!0 (buf!3459 (_2!6901 lt!227901)) (buf!3459 thiss!1634) lt!228413 lt!228416)))

(declare-fun d!47389 () Bool)

(assert (=> d!47389 e!97979))

(declare-fun res!122945 () Bool)

(assert (=> d!47389 (=> (not res!122945) (not e!97979))))

(assert (=> d!47389 (= res!122945 (isPrefixOf!0 (_1!6899 lt!228419) (_2!6899 lt!228419)))))

(declare-fun lt!228425 () BitStream!5266)

(assert (=> d!47389 (= lt!228419 (tuple2!13091 lt!228425 (_2!6901 lt!227901)))))

(declare-fun lt!228424 () Unit!9193)

(declare-fun lt!228432 () Unit!9193)

(assert (=> d!47389 (= lt!228424 lt!228432)))

(assert (=> d!47389 (isPrefixOf!0 lt!228425 (_2!6901 lt!227901))))

(assert (=> d!47389 (= lt!228432 (lemmaIsPrefixTransitive!0 lt!228425 (_2!6901 lt!227901) (_2!6901 lt!227901)))))

(declare-fun lt!228429 () Unit!9193)

(declare-fun lt!228430 () Unit!9193)

(assert (=> d!47389 (= lt!228429 lt!228430)))

(assert (=> d!47389 (isPrefixOf!0 lt!228425 (_2!6901 lt!227901))))

(assert (=> d!47389 (= lt!228430 (lemmaIsPrefixTransitive!0 lt!228425 thiss!1634 (_2!6901 lt!227901)))))

(declare-fun lt!228431 () Unit!9193)

(assert (=> d!47389 (= lt!228431 e!97978)))

(declare-fun c!7956 () Bool)

(assert (=> d!47389 (= c!7956 (not (= (size!3004 (buf!3459 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!228421 () Unit!9193)

(declare-fun lt!228415 () Unit!9193)

(assert (=> d!47389 (= lt!228421 lt!228415)))

(assert (=> d!47389 (isPrefixOf!0 (_2!6901 lt!227901) (_2!6901 lt!227901))))

(assert (=> d!47389 (= lt!228415 (lemmaIsPrefixRefl!0 (_2!6901 lt!227901)))))

(declare-fun lt!228420 () Unit!9193)

(declare-fun lt!228422 () Unit!9193)

(assert (=> d!47389 (= lt!228420 lt!228422)))

(assert (=> d!47389 (= lt!228422 (lemmaIsPrefixRefl!0 (_2!6901 lt!227901)))))

(declare-fun lt!228418 () Unit!9193)

(declare-fun lt!228417 () Unit!9193)

(assert (=> d!47389 (= lt!228418 lt!228417)))

(assert (=> d!47389 (isPrefixOf!0 lt!228425 lt!228425)))

(assert (=> d!47389 (= lt!228417 (lemmaIsPrefixRefl!0 lt!228425))))

(declare-fun lt!228426 () Unit!9193)

(declare-fun lt!228428 () Unit!9193)

(assert (=> d!47389 (= lt!228426 lt!228428)))

(assert (=> d!47389 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!47389 (= lt!228428 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!47389 (= lt!228425 (BitStream!5267 (buf!3459 (_2!6901 lt!227901)) (currentByte!6361 thiss!1634) (currentBit!6356 thiss!1634)))))

(assert (=> d!47389 (isPrefixOf!0 thiss!1634 (_2!6901 lt!227901))))

(assert (=> d!47389 (= (reader!0 thiss!1634 (_2!6901 lt!227901)) lt!228419)))

(assert (= (and d!47389 c!7956) b!146945))

(assert (= (and d!47389 (not c!7956)) b!146946))

(assert (= (and d!47389 res!122945) b!146948))

(assert (= (and b!146948 res!122947) b!146949))

(assert (= (and b!146949 res!122946) b!146947))

(assert (=> b!146945 m!226523))

(declare-fun m!227029 () Bool)

(assert (=> b!146945 m!227029))

(declare-fun m!227031 () Bool)

(assert (=> b!146945 m!227031))

(declare-fun m!227033 () Bool)

(assert (=> b!146949 m!227033))

(declare-fun m!227035 () Bool)

(assert (=> b!146948 m!227035))

(declare-fun m!227037 () Bool)

(assert (=> d!47389 m!227037))

(declare-fun m!227039 () Bool)

(assert (=> d!47389 m!227039))

(assert (=> d!47389 m!226787))

(assert (=> d!47389 m!226789))

(declare-fun m!227041 () Bool)

(assert (=> d!47389 m!227041))

(declare-fun m!227043 () Bool)

(assert (=> d!47389 m!227043))

(assert (=> d!47389 m!226839))

(assert (=> d!47389 m!226841))

(declare-fun m!227045 () Bool)

(assert (=> d!47389 m!227045))

(assert (=> d!47389 m!226551))

(declare-fun m!227047 () Bool)

(assert (=> d!47389 m!227047))

(declare-fun m!227049 () Bool)

(assert (=> b!146947 m!227049))

(assert (=> b!146947 m!226495))

(assert (=> b!146947 m!226523))

(assert (=> b!146702 d!47389))

(declare-fun d!47391 () Bool)

(assert (=> d!47391 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3004 (buf!3459 (_2!6901 lt!227901)))) ((_ sign_extend 32) (currentByte!6361 thiss!1634)) ((_ sign_extend 32) (currentBit!6356 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!228433 () Unit!9193)

(assert (=> d!47391 (= lt!228433 (choose!26 thiss!1634 (buf!3459 (_2!6901 lt!227901)) (bvsub to!404 from!447) (BitStream!5267 (buf!3459 (_2!6901 lt!227901)) (currentByte!6361 thiss!1634) (currentBit!6356 thiss!1634))))))

(assert (=> d!47391 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3459 (_2!6901 lt!227901)) (bvsub to!404 from!447)) lt!228433)))

(declare-fun bs!11597 () Bool)

(assert (= bs!11597 d!47391))

(assert (=> bs!11597 m!226553))

(declare-fun m!227051 () Bool)

(assert (=> bs!11597 m!227051))

(assert (=> b!146702 d!47391))

(declare-fun d!47393 () Bool)

(assert (=> d!47393 (isPrefixOf!0 thiss!1634 (_2!6901 lt!227901))))

(declare-fun lt!228436 () Unit!9193)

(declare-fun choose!30 (BitStream!5266 BitStream!5266 BitStream!5266) Unit!9193)

(assert (=> d!47393 (= lt!228436 (choose!30 thiss!1634 (_2!6901 lt!227885) (_2!6901 lt!227901)))))

(assert (=> d!47393 (isPrefixOf!0 thiss!1634 (_2!6901 lt!227885))))

(assert (=> d!47393 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6901 lt!227885) (_2!6901 lt!227901)) lt!228436)))

(declare-fun bs!11598 () Bool)

(assert (= bs!11598 d!47393))

(assert (=> bs!11598 m!226551))

(declare-fun m!227053 () Bool)

(assert (=> bs!11598 m!227053))

(assert (=> bs!11598 m!226527))

(assert (=> b!146702 d!47393))

(declare-fun d!47395 () Bool)

(assert (=> d!47395 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3004 (buf!3459 (_2!6901 lt!227901)))) ((_ sign_extend 32) (currentByte!6361 thiss!1634)) ((_ sign_extend 32) (currentBit!6356 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3004 (buf!3459 (_2!6901 lt!227901)))) ((_ sign_extend 32) (currentByte!6361 thiss!1634)) ((_ sign_extend 32) (currentBit!6356 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11599 () Bool)

(assert (= bs!11599 d!47395))

(declare-fun m!227055 () Bool)

(assert (=> bs!11599 m!227055))

(assert (=> b!146702 d!47395))

(declare-fun d!47397 () Bool)

(declare-fun e!97980 () Bool)

(assert (=> d!47397 e!97980))

(declare-fun res!122948 () Bool)

(assert (=> d!47397 (=> (not res!122948) (not e!97980))))

(declare-fun lt!228442 () (_ BitVec 64))

(declare-fun lt!228440 () (_ BitVec 64))

(declare-fun lt!228439 () (_ BitVec 64))

(assert (=> d!47397 (= res!122948 (= lt!228440 (bvsub lt!228439 lt!228442)))))

(assert (=> d!47397 (or (= (bvand lt!228439 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!228442 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!228439 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!228439 lt!228442) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!47397 (= lt!228442 (remainingBits!0 ((_ sign_extend 32) (size!3004 (buf!3459 (_1!6902 lt!227888)))) ((_ sign_extend 32) (currentByte!6361 (_1!6902 lt!227888))) ((_ sign_extend 32) (currentBit!6356 (_1!6902 lt!227888)))))))

(declare-fun lt!228441 () (_ BitVec 64))

(declare-fun lt!228437 () (_ BitVec 64))

(assert (=> d!47397 (= lt!228439 (bvmul lt!228441 lt!228437))))

(assert (=> d!47397 (or (= lt!228441 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!228437 (bvsdiv (bvmul lt!228441 lt!228437) lt!228441)))))

(assert (=> d!47397 (= lt!228437 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!47397 (= lt!228441 ((_ sign_extend 32) (size!3004 (buf!3459 (_1!6902 lt!227888)))))))

(assert (=> d!47397 (= lt!228440 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6361 (_1!6902 lt!227888))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6356 (_1!6902 lt!227888)))))))

(assert (=> d!47397 (invariant!0 (currentBit!6356 (_1!6902 lt!227888)) (currentByte!6361 (_1!6902 lt!227888)) (size!3004 (buf!3459 (_1!6902 lt!227888))))))

(assert (=> d!47397 (= (bitIndex!0 (size!3004 (buf!3459 (_1!6902 lt!227888))) (currentByte!6361 (_1!6902 lt!227888)) (currentBit!6356 (_1!6902 lt!227888))) lt!228440)))

(declare-fun b!146950 () Bool)

(declare-fun res!122949 () Bool)

(assert (=> b!146950 (=> (not res!122949) (not e!97980))))

(assert (=> b!146950 (= res!122949 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!228440))))

(declare-fun b!146951 () Bool)

(declare-fun lt!228438 () (_ BitVec 64))

(assert (=> b!146951 (= e!97980 (bvsle lt!228440 (bvmul lt!228438 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!146951 (or (= lt!228438 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!228438 #b0000000000000000000000000000000000000000000000000000000000001000) lt!228438)))))

(assert (=> b!146951 (= lt!228438 ((_ sign_extend 32) (size!3004 (buf!3459 (_1!6902 lt!227888)))))))

(assert (= (and d!47397 res!122948) b!146950))

(assert (= (and b!146950 res!122949) b!146951))

(declare-fun m!227057 () Bool)

(assert (=> d!47397 m!227057))

(declare-fun m!227059 () Bool)

(assert (=> d!47397 m!227059))

(assert (=> b!146702 d!47397))

(declare-fun d!47399 () Bool)

(declare-fun res!122950 () Bool)

(declare-fun e!97981 () Bool)

(assert (=> d!47399 (=> res!122950 e!97981)))

(assert (=> d!47399 (= res!122950 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!47399 (= (arrayRangesEq!320 (_2!6900 lt!227904) (_2!6900 lt!227898) #b00000000000000000000000000000000 to!404) e!97981)))

(declare-fun b!146952 () Bool)

(declare-fun e!97982 () Bool)

(assert (=> b!146952 (= e!97981 e!97982)))

(declare-fun res!122951 () Bool)

(assert (=> b!146952 (=> (not res!122951) (not e!97982))))

(assert (=> b!146952 (= res!122951 (= (select (arr!3758 (_2!6900 lt!227904)) #b00000000000000000000000000000000) (select (arr!3758 (_2!6900 lt!227898)) #b00000000000000000000000000000000)))))

(declare-fun b!146953 () Bool)

(assert (=> b!146953 (= e!97982 (arrayRangesEq!320 (_2!6900 lt!227904) (_2!6900 lt!227898) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!47399 (not res!122950)) b!146952))

(assert (= (and b!146952 res!122951) b!146953))

(assert (=> b!146952 m!226967))

(declare-fun m!227061 () Bool)

(assert (=> b!146952 m!227061))

(declare-fun m!227063 () Bool)

(assert (=> b!146953 m!227063))

(assert (=> b!146702 d!47399))

(declare-fun lt!228445 () tuple3!570)

(declare-fun d!47401 () Bool)

(assert (=> d!47401 (= lt!228445 (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!6899 lt!227882) #b00000000000000000000000000000001) lt!227883 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!47401 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6899 lt!227882) #b00000000000000000000000000000001) lt!227883 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13093 (_2!6912 lt!228445) (_3!354 lt!228445)))))

(declare-fun bs!11600 () Bool)

(assert (= bs!11600 d!47401))

(assert (=> bs!11600 m!226545))

(declare-fun m!227065 () Bool)

(assert (=> bs!11600 m!227065))

(assert (=> b!146702 d!47401))

(declare-fun d!47403 () Bool)

(assert (=> d!47403 (= (invariant!0 (currentBit!6356 thiss!1634) (currentByte!6361 thiss!1634) (size!3004 (buf!3459 (_2!6901 lt!227885)))) (and (bvsge (currentBit!6356 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6356 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6361 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6361 thiss!1634) (size!3004 (buf!3459 (_2!6901 lt!227885)))) (and (= (currentBit!6356 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6361 thiss!1634) (size!3004 (buf!3459 (_2!6901 lt!227885))))))))))

(assert (=> b!146701 d!47403))

(declare-fun d!47405 () Bool)

(declare-fun res!122957 () Bool)

(declare-fun e!97985 () Bool)

(assert (=> d!47405 (=> (not res!122957) (not e!97985))))

(assert (=> d!47405 (= res!122957 (= (size!3004 (buf!3459 (_2!6901 lt!227885))) (size!3004 (buf!3459 (_2!6901 lt!227901)))))))

(assert (=> d!47405 (= (isPrefixOf!0 (_2!6901 lt!227885) (_2!6901 lt!227901)) e!97985)))

(declare-fun b!146956 () Bool)

(declare-fun res!122956 () Bool)

(assert (=> b!146956 (=> (not res!122956) (not e!97985))))

(assert (=> b!146956 (= res!122956 (bvsle (bitIndex!0 (size!3004 (buf!3459 (_2!6901 lt!227885))) (currentByte!6361 (_2!6901 lt!227885)) (currentBit!6356 (_2!6901 lt!227885))) (bitIndex!0 (size!3004 (buf!3459 (_2!6901 lt!227901))) (currentByte!6361 (_2!6901 lt!227901)) (currentBit!6356 (_2!6901 lt!227901)))))))

(declare-fun b!146957 () Bool)

(declare-fun e!97986 () Bool)

(assert (=> b!146957 (= e!97985 e!97986)))

(declare-fun res!122958 () Bool)

(assert (=> b!146957 (=> res!122958 e!97986)))

(assert (=> b!146957 (= res!122958 (= (size!3004 (buf!3459 (_2!6901 lt!227885))) #b00000000000000000000000000000000))))

(declare-fun b!146958 () Bool)

(assert (=> b!146958 (= e!97986 (arrayBitRangesEq!0 (buf!3459 (_2!6901 lt!227885)) (buf!3459 (_2!6901 lt!227901)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3004 (buf!3459 (_2!6901 lt!227885))) (currentByte!6361 (_2!6901 lt!227885)) (currentBit!6356 (_2!6901 lt!227885)))))))

(assert (= (and d!47405 res!122957) b!146956))

(assert (= (and b!146956 res!122956) b!146957))

(assert (= (and b!146957 (not res!122958)) b!146958))

(assert (=> b!146956 m!226497))

(assert (=> b!146956 m!226495))

(assert (=> b!146958 m!226497))

(assert (=> b!146958 m!226497))

(declare-fun m!227067 () Bool)

(assert (=> b!146958 m!227067))

(assert (=> b!146714 d!47405))

(declare-fun d!47407 () Bool)

(declare-fun res!122964 () Bool)

(declare-fun e!97989 () Bool)

(assert (=> d!47407 (=> (not res!122964) (not e!97989))))

(assert (=> d!47407 (= res!122964 (= (size!3004 (buf!3459 thiss!1634)) (size!3004 (buf!3459 (_2!6901 lt!227885)))))))

(assert (=> d!47407 (= (isPrefixOf!0 thiss!1634 (_2!6901 lt!227885)) e!97989)))

(declare-fun b!146963 () Bool)

(declare-fun res!122963 () Bool)

(assert (=> b!146963 (=> (not res!122963) (not e!97989))))

(assert (=> b!146963 (= res!122963 (bvsle (bitIndex!0 (size!3004 (buf!3459 thiss!1634)) (currentByte!6361 thiss!1634) (currentBit!6356 thiss!1634)) (bitIndex!0 (size!3004 (buf!3459 (_2!6901 lt!227885))) (currentByte!6361 (_2!6901 lt!227885)) (currentBit!6356 (_2!6901 lt!227885)))))))

(declare-fun b!146964 () Bool)

(declare-fun e!97990 () Bool)

(assert (=> b!146964 (= e!97989 e!97990)))

(declare-fun res!122965 () Bool)

(assert (=> b!146964 (=> res!122965 e!97990)))

(assert (=> b!146964 (= res!122965 (= (size!3004 (buf!3459 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!146965 () Bool)

(assert (=> b!146965 (= e!97990 (arrayBitRangesEq!0 (buf!3459 thiss!1634) (buf!3459 (_2!6901 lt!227885)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3004 (buf!3459 thiss!1634)) (currentByte!6361 thiss!1634) (currentBit!6356 thiss!1634))))))

(assert (= (and d!47407 res!122964) b!146963))

(assert (= (and b!146963 res!122963) b!146964))

(assert (= (and b!146964 (not res!122965)) b!146965))

(assert (=> b!146963 m!226523))

(assert (=> b!146963 m!226497))

(assert (=> b!146965 m!226523))

(assert (=> b!146965 m!226523))

(declare-fun m!227069 () Bool)

(assert (=> b!146965 m!227069))

(assert (=> b!146713 d!47407))

(push 1)

(assert (not d!47356))

(assert (not b!146842))

(assert (not d!47385))

(assert (not d!47289))

(assert (not d!47395))

(assert (not d!47297))

(assert (not b!146948))

(assert (not d!47401))

(assert (not d!47299))

(assert (not b!146915))

(assert (not b!146949))

(assert (not b!146864))

(assert (not b!146945))

(assert (not d!47275))

(assert (not d!47375))

(assert (not b!146918))

(assert (not d!47383))

(assert (not b!146838))

(assert (not b!146963))

(assert (not d!47371))

(assert (not d!47273))

(assert (not b!146965))

(assert (not d!47379))

(assert (not b!146810))

(assert (not d!47321))

(assert (not d!47303))

(assert (not b!146853))

(assert (not b!146956))

(assert (not d!47387))

(assert (not b!146841))

(assert (not d!47281))

(assert (not d!47309))

(assert (not b!146866))

(assert (not b!146855))

(assert (not b!146932))

(assert (not d!47352))

(assert (not b!146840))

(assert (not d!47389))

(assert (not b!146856))

(assert (not b!146919))

(assert (not b!146917))

(assert (not b!146941))

(assert (not d!47393))

(assert (not b!146947))

(assert (not d!47391))

(assert (not b!146940))

(assert (not b!146916))

(assert (not d!47397))

(assert (not b!146958))

(assert (not d!47287))

(assert (not d!47377))

(assert (not d!47307))

(assert (not b!146857))

(assert (not b!146953))

(assert (not b!146923))

(assert (not d!47319))

(assert (not d!47373))

(assert (not d!47369))

(assert (not d!47381))

(assert (not d!47285))

(assert (not d!47323))

(assert (not b!146939))

(check-sat)

(pop 1)

(push 1)

(check-sat)

