; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29076 () Bool)

(assert start!29076)

(declare-fun b!150886 () Bool)

(declare-fun e!100760 () Bool)

(declare-datatypes ((array!6740 0))(
  ( (array!6741 (arr!3851 (Array (_ BitVec 32) (_ BitVec 8))) (size!3049 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5356 0))(
  ( (BitStream!5357 (buf!3536 array!6740) (currentByte!6462 (_ BitVec 32)) (currentBit!6457 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5356)

(declare-fun array_inv!2838 (array!6740) Bool)

(assert (=> b!150886 (= e!100760 (array_inv!2838 (buf!3536 thiss!1634)))))

(declare-datatypes ((tuple2!13482 0))(
  ( (tuple2!13483 (_1!7111 BitStream!5356) (_2!7111 array!6740)) )
))
(declare-fun lt!236086 () tuple2!13482)

(declare-fun to!404 () (_ BitVec 32))

(declare-fun b!150887 () Bool)

(declare-fun arr!237 () array!6740)

(declare-fun e!100761 () Bool)

(declare-fun arrayRangesEq!365 (array!6740 array!6740 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!150887 (= e!100761 (not (arrayRangesEq!365 arr!237 (_2!7111 lt!236086) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!150888 () Bool)

(declare-fun res!126515 () Bool)

(declare-fun e!100753 () Bool)

(assert (=> b!150888 (=> (not res!126515) (not e!100753))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!150888 (= res!126515 (invariant!0 (currentBit!6457 thiss!1634) (currentByte!6462 thiss!1634) (size!3049 (buf!3536 thiss!1634))))))

(declare-fun b!150889 () Bool)

(declare-fun e!100756 () Bool)

(declare-fun e!100762 () Bool)

(assert (=> b!150889 (= e!100756 e!100762)))

(declare-fun res!126511 () Bool)

(assert (=> b!150889 (=> (not res!126511) (not e!100762))))

(declare-datatypes ((Unit!9507 0))(
  ( (Unit!9508) )
))
(declare-datatypes ((tuple2!13484 0))(
  ( (tuple2!13485 (_1!7112 Unit!9507) (_2!7112 BitStream!5356)) )
))
(declare-fun lt!236104 () tuple2!13484)

(declare-fun lt!236098 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!150889 (= res!126511 (= (bitIndex!0 (size!3049 (buf!3536 (_2!7112 lt!236104))) (currentByte!6462 (_2!7112 lt!236104)) (currentBit!6457 (_2!7112 lt!236104))) (bvadd (bitIndex!0 (size!3049 (buf!3536 thiss!1634)) (currentByte!6462 thiss!1634) (currentBit!6457 thiss!1634)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!236098))))))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!150889 (= lt!236098 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(declare-fun b!150890 () Bool)

(declare-fun res!126516 () Bool)

(declare-fun e!100765 () Bool)

(assert (=> b!150890 (=> (not res!126516) (not e!100765))))

(declare-fun lt!236100 () tuple2!13484)

(declare-fun isPrefixOf!0 (BitStream!5356 BitStream!5356) Bool)

(assert (=> b!150890 (= res!126516 (isPrefixOf!0 (_2!7112 lt!236100) (_2!7112 lt!236104)))))

(declare-fun res!126507 () Bool)

(assert (=> start!29076 (=> (not res!126507) (not e!100753))))

(assert (=> start!29076 (= res!126507 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3049 arr!237))))))

(assert (=> start!29076 e!100753))

(assert (=> start!29076 true))

(assert (=> start!29076 (array_inv!2838 arr!237)))

(declare-fun inv!12 (BitStream!5356) Bool)

(assert (=> start!29076 (and (inv!12 thiss!1634) e!100760)))

(declare-fun b!150891 () Bool)

(declare-fun e!100759 () Bool)

(assert (=> b!150891 (= e!100759 e!100765)))

(declare-fun res!126521 () Bool)

(assert (=> b!150891 (=> (not res!126521) (not e!100765))))

(declare-fun lt!236093 () (_ BitVec 64))

(assert (=> b!150891 (= res!126521 (= (bitIndex!0 (size!3049 (buf!3536 (_2!7112 lt!236104))) (currentByte!6462 (_2!7112 lt!236104)) (currentBit!6457 (_2!7112 lt!236104))) (bvadd (bitIndex!0 (size!3049 (buf!3536 (_2!7112 lt!236100))) (currentByte!6462 (_2!7112 lt!236100)) (currentBit!6457 (_2!7112 lt!236100))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!236093))))))

(assert (=> b!150891 (= lt!236093 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!150892 () Bool)

(declare-fun res!126513 () Bool)

(assert (=> b!150892 (=> (not res!126513) (not e!100753))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!150892 (= res!126513 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3049 (buf!3536 thiss!1634))) ((_ sign_extend 32) (currentByte!6462 thiss!1634)) ((_ sign_extend 32) (currentBit!6457 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!150893 () Bool)

(declare-datatypes ((tuple2!13486 0))(
  ( (tuple2!13487 (_1!7113 BitStream!5356) (_2!7113 BitStream!5356)) )
))
(declare-fun lt!236108 () tuple2!13486)

(declare-fun e!100764 () Bool)

(declare-datatypes ((tuple2!13488 0))(
  ( (tuple2!13489 (_1!7114 BitStream!5356) (_2!7114 (_ BitVec 8))) )
))
(declare-fun lt!236090 () tuple2!13488)

(assert (=> b!150893 (= e!100764 (and (= (_2!7114 lt!236090) (select (arr!3851 arr!237) from!447)) (= (_1!7114 lt!236090) (_2!7113 lt!236108))))))

(declare-fun readBytePure!0 (BitStream!5356) tuple2!13488)

(assert (=> b!150893 (= lt!236090 (readBytePure!0 (_1!7113 lt!236108)))))

(declare-fun reader!0 (BitStream!5356 BitStream!5356) tuple2!13486)

(assert (=> b!150893 (= lt!236108 (reader!0 thiss!1634 (_2!7112 lt!236100)))))

(declare-fun b!150894 () Bool)

(declare-fun res!126506 () Bool)

(assert (=> b!150894 (=> (not res!126506) (not e!100753))))

(assert (=> b!150894 (= res!126506 (bvslt from!447 to!404))))

(declare-fun b!150895 () Bool)

(declare-fun res!126519 () Bool)

(assert (=> b!150895 (=> (not res!126519) (not e!100764))))

(assert (=> b!150895 (= res!126519 (= (bitIndex!0 (size!3049 (buf!3536 (_2!7112 lt!236100))) (currentByte!6462 (_2!7112 lt!236100)) (currentBit!6457 (_2!7112 lt!236100))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3049 (buf!3536 thiss!1634)) (currentByte!6462 thiss!1634) (currentBit!6457 thiss!1634)))))))

(declare-fun b!150896 () Bool)

(declare-fun res!126518 () Bool)

(assert (=> b!150896 (=> (not res!126518) (not e!100764))))

(assert (=> b!150896 (= res!126518 (isPrefixOf!0 thiss!1634 (_2!7112 lt!236100)))))

(declare-fun b!150897 () Bool)

(declare-fun lt!236085 () tuple2!13482)

(assert (=> b!150897 (= e!100762 (not (not (= (size!3049 (_2!7111 lt!236085)) (size!3049 arr!237)))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!150897 (validate_offset_bits!1 ((_ sign_extend 32) (size!3049 (buf!3536 (_2!7112 lt!236104)))) ((_ sign_extend 32) (currentByte!6462 thiss!1634)) ((_ sign_extend 32) (currentBit!6457 thiss!1634)) lt!236098)))

(declare-fun lt!236084 () Unit!9507)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5356 array!6740 (_ BitVec 64)) Unit!9507)

(assert (=> b!150897 (= lt!236084 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3536 (_2!7112 lt!236104)) lt!236098))))

(declare-fun b!150898 () Bool)

(declare-fun e!100757 () Bool)

(assert (=> b!150898 (= e!100757 e!100756)))

(declare-fun res!126510 () Bool)

(assert (=> b!150898 (=> (not res!126510) (not e!100756))))

(assert (=> b!150898 (= res!126510 (= (size!3049 (buf!3536 thiss!1634)) (size!3049 (buf!3536 (_2!7112 lt!236104)))))))

(assert (=> b!150898 (arrayRangesEq!365 arr!237 (_2!7111 lt!236085) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!236097 () tuple2!13482)

(declare-fun lt!236109 () Unit!9507)

(declare-fun arrayRangesEqTransitive!80 (array!6740 array!6740 array!6740 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9507)

(assert (=> b!150898 (= lt!236109 (arrayRangesEqTransitive!80 arr!237 (_2!7111 lt!236097) (_2!7111 lt!236085) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> b!150898 (arrayRangesEq!365 (_2!7111 lt!236097) (_2!7111 lt!236085) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!236105 () Unit!9507)

(declare-fun arrayRangesEqSymmetricLemma!97 (array!6740 array!6740 (_ BitVec 32) (_ BitVec 32)) Unit!9507)

(assert (=> b!150898 (= lt!236105 (arrayRangesEqSymmetricLemma!97 (_2!7111 lt!236085) (_2!7111 lt!236097) #b00000000000000000000000000000000 to!404))))

(declare-fun b!150899 () Bool)

(assert (=> b!150899 (= e!100765 (not e!100761))))

(declare-fun res!126514 () Bool)

(assert (=> b!150899 (=> res!126514 e!100761)))

(declare-fun lt!236087 () tuple2!13486)

(assert (=> b!150899 (= res!126514 (or (not (= (size!3049 (_2!7111 lt!236086)) (size!3049 arr!237))) (not (= (_1!7111 lt!236086) (_2!7113 lt!236087)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5356 array!6740 (_ BitVec 32) (_ BitVec 32)) tuple2!13482)

(assert (=> b!150899 (= lt!236086 (readByteArrayLoopPure!0 (_1!7113 lt!236087) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!150899 (validate_offset_bits!1 ((_ sign_extend 32) (size!3049 (buf!3536 (_2!7112 lt!236104)))) ((_ sign_extend 32) (currentByte!6462 (_2!7112 lt!236100))) ((_ sign_extend 32) (currentBit!6457 (_2!7112 lt!236100))) lt!236093)))

(declare-fun lt!236089 () Unit!9507)

(assert (=> b!150899 (= lt!236089 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!7112 lt!236100) (buf!3536 (_2!7112 lt!236104)) lt!236093))))

(assert (=> b!150899 (= lt!236087 (reader!0 (_2!7112 lt!236100) (_2!7112 lt!236104)))))

(declare-fun b!150900 () Bool)

(declare-fun e!100754 () Bool)

(assert (=> b!150900 (= e!100754 (invariant!0 (currentBit!6457 thiss!1634) (currentByte!6462 thiss!1634) (size!3049 (buf!3536 (_2!7112 lt!236100)))))))

(declare-fun b!150901 () Bool)

(declare-fun e!100758 () Bool)

(declare-fun lt!236106 () tuple2!13488)

(declare-fun lt!236102 () tuple2!13488)

(assert (=> b!150901 (= e!100758 (= (_2!7114 lt!236106) (_2!7114 lt!236102)))))

(declare-fun b!150902 () Bool)

(assert (=> b!150902 (= e!100753 (not e!100757))))

(declare-fun res!126517 () Bool)

(assert (=> b!150902 (=> res!126517 e!100757)))

(assert (=> b!150902 (= res!126517 (not (arrayRangesEq!365 (_2!7111 lt!236085) (_2!7111 lt!236097) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!236092 () tuple2!13482)

(assert (=> b!150902 (arrayRangesEq!365 (_2!7111 lt!236085) (_2!7111 lt!236092) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!236107 () tuple2!13486)

(declare-fun lt!236112 () Unit!9507)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5356 array!6740 (_ BitVec 32) (_ BitVec 32)) Unit!9507)

(assert (=> b!150902 (= lt!236112 (readByteArrayLoopArrayPrefixLemma!0 (_1!7113 lt!236107) arr!237 from!447 to!404))))

(declare-fun lt!236091 () array!6740)

(declare-fun withMovedByteIndex!0 (BitStream!5356 (_ BitVec 32)) BitStream!5356)

(assert (=> b!150902 (= lt!236092 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!7113 lt!236107) #b00000000000000000000000000000001) lt!236091 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!236111 () tuple2!13486)

(assert (=> b!150902 (= lt!236097 (readByteArrayLoopPure!0 (_1!7113 lt!236111) lt!236091 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!236095 () tuple2!13488)

(assert (=> b!150902 (= lt!236091 (array!6741 (store (arr!3851 arr!237) from!447 (_2!7114 lt!236095)) (size!3049 arr!237)))))

(declare-fun lt!236110 () (_ BitVec 32))

(assert (=> b!150902 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3049 (buf!3536 (_2!7112 lt!236104)))) ((_ sign_extend 32) (currentByte!6462 (_2!7112 lt!236100))) ((_ sign_extend 32) (currentBit!6457 (_2!7112 lt!236100))) lt!236110)))

(declare-fun lt!236096 () Unit!9507)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5356 array!6740 (_ BitVec 32)) Unit!9507)

(assert (=> b!150902 (= lt!236096 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!7112 lt!236100) (buf!3536 (_2!7112 lt!236104)) lt!236110))))

(assert (=> b!150902 (= (_1!7111 lt!236085) (_2!7113 lt!236107))))

(assert (=> b!150902 (= lt!236085 (readByteArrayLoopPure!0 (_1!7113 lt!236107) arr!237 from!447 to!404))))

(assert (=> b!150902 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3049 (buf!3536 (_2!7112 lt!236104)))) ((_ sign_extend 32) (currentByte!6462 thiss!1634)) ((_ sign_extend 32) (currentBit!6457 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!236088 () Unit!9507)

(assert (=> b!150902 (= lt!236088 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3536 (_2!7112 lt!236104)) (bvsub to!404 from!447)))))

(assert (=> b!150902 (= (_2!7114 lt!236095) (select (arr!3851 arr!237) from!447))))

(assert (=> b!150902 (= lt!236095 (readBytePure!0 (_1!7113 lt!236107)))))

(assert (=> b!150902 (= lt!236111 (reader!0 (_2!7112 lt!236100) (_2!7112 lt!236104)))))

(assert (=> b!150902 (= lt!236107 (reader!0 thiss!1634 (_2!7112 lt!236104)))))

(assert (=> b!150902 e!100758))

(declare-fun res!126508 () Bool)

(assert (=> b!150902 (=> (not res!126508) (not e!100758))))

(assert (=> b!150902 (= res!126508 (= (bitIndex!0 (size!3049 (buf!3536 (_1!7114 lt!236106))) (currentByte!6462 (_1!7114 lt!236106)) (currentBit!6457 (_1!7114 lt!236106))) (bitIndex!0 (size!3049 (buf!3536 (_1!7114 lt!236102))) (currentByte!6462 (_1!7114 lt!236102)) (currentBit!6457 (_1!7114 lt!236102)))))))

(declare-fun lt!236101 () Unit!9507)

(declare-fun lt!236099 () BitStream!5356)

(declare-fun readBytePrefixLemma!0 (BitStream!5356 BitStream!5356) Unit!9507)

(assert (=> b!150902 (= lt!236101 (readBytePrefixLemma!0 lt!236099 (_2!7112 lt!236104)))))

(assert (=> b!150902 (= lt!236102 (readBytePure!0 (BitStream!5357 (buf!3536 (_2!7112 lt!236104)) (currentByte!6462 thiss!1634) (currentBit!6457 thiss!1634))))))

(assert (=> b!150902 (= lt!236106 (readBytePure!0 lt!236099))))

(assert (=> b!150902 (= lt!236099 (BitStream!5357 (buf!3536 (_2!7112 lt!236100)) (currentByte!6462 thiss!1634) (currentBit!6457 thiss!1634)))))

(assert (=> b!150902 e!100754))

(declare-fun res!126509 () Bool)

(assert (=> b!150902 (=> (not res!126509) (not e!100754))))

(assert (=> b!150902 (= res!126509 (isPrefixOf!0 thiss!1634 (_2!7112 lt!236104)))))

(declare-fun lt!236103 () Unit!9507)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5356 BitStream!5356 BitStream!5356) Unit!9507)

(assert (=> b!150902 (= lt!236103 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!7112 lt!236100) (_2!7112 lt!236104)))))

(assert (=> b!150902 e!100759))

(declare-fun res!126512 () Bool)

(assert (=> b!150902 (=> (not res!126512) (not e!100759))))

(assert (=> b!150902 (= res!126512 (= (size!3049 (buf!3536 (_2!7112 lt!236100))) (size!3049 (buf!3536 (_2!7112 lt!236104)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5356 array!6740 (_ BitVec 32) (_ BitVec 32)) tuple2!13484)

(assert (=> b!150902 (= lt!236104 (appendByteArrayLoop!0 (_2!7112 lt!236100) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!150902 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3049 (buf!3536 (_2!7112 lt!236100)))) ((_ sign_extend 32) (currentByte!6462 (_2!7112 lt!236100))) ((_ sign_extend 32) (currentBit!6457 (_2!7112 lt!236100))) lt!236110)))

(assert (=> b!150902 (= lt!236110 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!236094 () Unit!9507)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5356 BitStream!5356 (_ BitVec 64) (_ BitVec 32)) Unit!9507)

(assert (=> b!150902 (= lt!236094 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!7112 lt!236100) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!150902 e!100764))

(declare-fun res!126520 () Bool)

(assert (=> b!150902 (=> (not res!126520) (not e!100764))))

(assert (=> b!150902 (= res!126520 (= (size!3049 (buf!3536 thiss!1634)) (size!3049 (buf!3536 (_2!7112 lt!236100)))))))

(declare-fun appendByte!0 (BitStream!5356 (_ BitVec 8)) tuple2!13484)

(assert (=> b!150902 (= lt!236100 (appendByte!0 thiss!1634 (select (arr!3851 arr!237) from!447)))))

(assert (= (and start!29076 res!126507) b!150892))

(assert (= (and b!150892 res!126513) b!150894))

(assert (= (and b!150894 res!126506) b!150888))

(assert (= (and b!150888 res!126515) b!150902))

(assert (= (and b!150902 res!126520) b!150895))

(assert (= (and b!150895 res!126519) b!150896))

(assert (= (and b!150896 res!126518) b!150893))

(assert (= (and b!150902 res!126512) b!150891))

(assert (= (and b!150891 res!126521) b!150890))

(assert (= (and b!150890 res!126516) b!150899))

(assert (= (and b!150899 (not res!126514)) b!150887))

(assert (= (and b!150902 res!126509) b!150900))

(assert (= (and b!150902 res!126508) b!150901))

(assert (= (and b!150902 (not res!126517)) b!150898))

(assert (= (and b!150898 res!126510) b!150889))

(assert (= (and b!150889 res!126511) b!150897))

(assert (= start!29076 b!150886))

(declare-fun m!235401 () Bool)

(assert (=> b!150902 m!235401))

(declare-fun m!235403 () Bool)

(assert (=> b!150902 m!235403))

(declare-fun m!235405 () Bool)

(assert (=> b!150902 m!235405))

(declare-fun m!235407 () Bool)

(assert (=> b!150902 m!235407))

(declare-fun m!235409 () Bool)

(assert (=> b!150902 m!235409))

(declare-fun m!235411 () Bool)

(assert (=> b!150902 m!235411))

(declare-fun m!235413 () Bool)

(assert (=> b!150902 m!235413))

(declare-fun m!235415 () Bool)

(assert (=> b!150902 m!235415))

(declare-fun m!235417 () Bool)

(assert (=> b!150902 m!235417))

(declare-fun m!235419 () Bool)

(assert (=> b!150902 m!235419))

(declare-fun m!235421 () Bool)

(assert (=> b!150902 m!235421))

(declare-fun m!235423 () Bool)

(assert (=> b!150902 m!235423))

(declare-fun m!235425 () Bool)

(assert (=> b!150902 m!235425))

(declare-fun m!235427 () Bool)

(assert (=> b!150902 m!235427))

(declare-fun m!235429 () Bool)

(assert (=> b!150902 m!235429))

(declare-fun m!235431 () Bool)

(assert (=> b!150902 m!235431))

(declare-fun m!235433 () Bool)

(assert (=> b!150902 m!235433))

(declare-fun m!235435 () Bool)

(assert (=> b!150902 m!235435))

(declare-fun m!235437 () Bool)

(assert (=> b!150902 m!235437))

(declare-fun m!235439 () Bool)

(assert (=> b!150902 m!235439))

(declare-fun m!235441 () Bool)

(assert (=> b!150902 m!235441))

(assert (=> b!150902 m!235409))

(declare-fun m!235443 () Bool)

(assert (=> b!150902 m!235443))

(declare-fun m!235445 () Bool)

(assert (=> b!150902 m!235445))

(declare-fun m!235447 () Bool)

(assert (=> b!150902 m!235447))

(declare-fun m!235449 () Bool)

(assert (=> b!150902 m!235449))

(declare-fun m!235451 () Bool)

(assert (=> b!150902 m!235451))

(declare-fun m!235453 () Bool)

(assert (=> b!150902 m!235453))

(assert (=> b!150902 m!235447))

(declare-fun m!235455 () Bool)

(assert (=> b!150888 m!235455))

(declare-fun m!235457 () Bool)

(assert (=> b!150898 m!235457))

(declare-fun m!235459 () Bool)

(assert (=> b!150898 m!235459))

(declare-fun m!235461 () Bool)

(assert (=> b!150898 m!235461))

(declare-fun m!235463 () Bool)

(assert (=> b!150898 m!235463))

(declare-fun m!235465 () Bool)

(assert (=> b!150890 m!235465))

(declare-fun m!235467 () Bool)

(assert (=> b!150895 m!235467))

(declare-fun m!235469 () Bool)

(assert (=> b!150895 m!235469))

(declare-fun m!235471 () Bool)

(assert (=> b!150899 m!235471))

(declare-fun m!235473 () Bool)

(assert (=> b!150899 m!235473))

(declare-fun m!235475 () Bool)

(assert (=> b!150899 m!235475))

(assert (=> b!150899 m!235421))

(assert (=> b!150893 m!235447))

(declare-fun m!235477 () Bool)

(assert (=> b!150893 m!235477))

(declare-fun m!235479 () Bool)

(assert (=> b!150893 m!235479))

(declare-fun m!235481 () Bool)

(assert (=> b!150896 m!235481))

(declare-fun m!235483 () Bool)

(assert (=> b!150886 m!235483))

(declare-fun m!235485 () Bool)

(assert (=> b!150891 m!235485))

(assert (=> b!150891 m!235467))

(declare-fun m!235487 () Bool)

(assert (=> b!150892 m!235487))

(declare-fun m!235489 () Bool)

(assert (=> start!29076 m!235489))

(declare-fun m!235491 () Bool)

(assert (=> start!29076 m!235491))

(declare-fun m!235493 () Bool)

(assert (=> b!150897 m!235493))

(declare-fun m!235495 () Bool)

(assert (=> b!150897 m!235495))

(declare-fun m!235497 () Bool)

(assert (=> b!150900 m!235497))

(assert (=> b!150889 m!235485))

(assert (=> b!150889 m!235469))

(declare-fun m!235499 () Bool)

(assert (=> b!150887 m!235499))

(push 1)

(assert (not start!29076))

(assert (not b!150893))

(assert (not b!150886))

(assert (not b!150891))

(assert (not b!150897))

(assert (not b!150902))

(assert (not b!150892))

(assert (not b!150889))

(assert (not b!150896))

(assert (not b!150890))

(assert (not b!150898))

(assert (not b!150895))

(assert (not b!150887))

(assert (not b!150899))

(assert (not b!150888))

(assert (not b!150900))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!49139 () Bool)

(declare-fun e!100846 () Bool)

(assert (=> d!49139 e!100846))

(declare-fun res!126623 () Bool)

(assert (=> d!49139 (=> (not res!126623) (not e!100846))))

(declare-fun lt!236300 () (_ BitVec 64))

(declare-fun lt!236303 () (_ BitVec 64))

(declare-fun lt!236304 () (_ BitVec 64))

(assert (=> d!49139 (= res!126623 (= lt!236303 (bvsub lt!236304 lt!236300)))))

(assert (=> d!49139 (or (= (bvand lt!236304 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!236300 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!236304 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!236304 lt!236300) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!49139 (= lt!236300 (remainingBits!0 ((_ sign_extend 32) (size!3049 (buf!3536 (_2!7112 lt!236100)))) ((_ sign_extend 32) (currentByte!6462 (_2!7112 lt!236100))) ((_ sign_extend 32) (currentBit!6457 (_2!7112 lt!236100)))))))

(declare-fun lt!236302 () (_ BitVec 64))

(declare-fun lt!236301 () (_ BitVec 64))

(assert (=> d!49139 (= lt!236304 (bvmul lt!236302 lt!236301))))

(assert (=> d!49139 (or (= lt!236302 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!236301 (bvsdiv (bvmul lt!236302 lt!236301) lt!236302)))))

(assert (=> d!49139 (= lt!236301 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!49139 (= lt!236302 ((_ sign_extend 32) (size!3049 (buf!3536 (_2!7112 lt!236100)))))))

(assert (=> d!49139 (= lt!236303 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6462 (_2!7112 lt!236100))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6457 (_2!7112 lt!236100)))))))

(assert (=> d!49139 (invariant!0 (currentBit!6457 (_2!7112 lt!236100)) (currentByte!6462 (_2!7112 lt!236100)) (size!3049 (buf!3536 (_2!7112 lt!236100))))))

(assert (=> d!49139 (= (bitIndex!0 (size!3049 (buf!3536 (_2!7112 lt!236100))) (currentByte!6462 (_2!7112 lt!236100)) (currentBit!6457 (_2!7112 lt!236100))) lt!236303)))

(declare-fun b!151009 () Bool)

(declare-fun res!126622 () Bool)

(assert (=> b!151009 (=> (not res!126622) (not e!100846))))

(assert (=> b!151009 (= res!126622 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!236303))))

(declare-fun b!151010 () Bool)

(declare-fun lt!236299 () (_ BitVec 64))

(assert (=> b!151010 (= e!100846 (bvsle lt!236303 (bvmul lt!236299 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!151010 (or (= lt!236299 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!236299 #b0000000000000000000000000000000000000000000000000000000000001000) lt!236299)))))

(assert (=> b!151010 (= lt!236299 ((_ sign_extend 32) (size!3049 (buf!3536 (_2!7112 lt!236100)))))))

(assert (= (and d!49139 res!126623) b!151009))

(assert (= (and b!151009 res!126622) b!151010))

(declare-fun m!235701 () Bool)

(assert (=> d!49139 m!235701))

(declare-fun m!235703 () Bool)

(assert (=> d!49139 m!235703))

(assert (=> b!150895 d!49139))

(declare-fun d!49141 () Bool)

(declare-fun e!100847 () Bool)

(assert (=> d!49141 e!100847))

(declare-fun res!126625 () Bool)

(assert (=> d!49141 (=> (not res!126625) (not e!100847))))

(declare-fun lt!236309 () (_ BitVec 64))

(declare-fun lt!236310 () (_ BitVec 64))

(declare-fun lt!236306 () (_ BitVec 64))

(assert (=> d!49141 (= res!126625 (= lt!236309 (bvsub lt!236310 lt!236306)))))

(assert (=> d!49141 (or (= (bvand lt!236310 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!236306 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!236310 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!236310 lt!236306) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!49141 (= lt!236306 (remainingBits!0 ((_ sign_extend 32) (size!3049 (buf!3536 thiss!1634))) ((_ sign_extend 32) (currentByte!6462 thiss!1634)) ((_ sign_extend 32) (currentBit!6457 thiss!1634))))))

(declare-fun lt!236308 () (_ BitVec 64))

(declare-fun lt!236307 () (_ BitVec 64))

(assert (=> d!49141 (= lt!236310 (bvmul lt!236308 lt!236307))))

(assert (=> d!49141 (or (= lt!236308 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!236307 (bvsdiv (bvmul lt!236308 lt!236307) lt!236308)))))

(assert (=> d!49141 (= lt!236307 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!49141 (= lt!236308 ((_ sign_extend 32) (size!3049 (buf!3536 thiss!1634))))))

(assert (=> d!49141 (= lt!236309 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6462 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6457 thiss!1634))))))

(assert (=> d!49141 (invariant!0 (currentBit!6457 thiss!1634) (currentByte!6462 thiss!1634) (size!3049 (buf!3536 thiss!1634)))))

(assert (=> d!49141 (= (bitIndex!0 (size!3049 (buf!3536 thiss!1634)) (currentByte!6462 thiss!1634) (currentBit!6457 thiss!1634)) lt!236309)))

(declare-fun b!151011 () Bool)

(declare-fun res!126624 () Bool)

(assert (=> b!151011 (=> (not res!126624) (not e!100847))))

(assert (=> b!151011 (= res!126624 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!236309))))

(declare-fun b!151012 () Bool)

(declare-fun lt!236305 () (_ BitVec 64))

(assert (=> b!151012 (= e!100847 (bvsle lt!236309 (bvmul lt!236305 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!151012 (or (= lt!236305 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!236305 #b0000000000000000000000000000000000000000000000000000000000001000) lt!236305)))))

(assert (=> b!151012 (= lt!236305 ((_ sign_extend 32) (size!3049 (buf!3536 thiss!1634))))))

(assert (= (and d!49141 res!126625) b!151011))

(assert (= (and b!151011 res!126624) b!151012))

(declare-fun m!235705 () Bool)

(assert (=> d!49141 m!235705))

(assert (=> d!49141 m!235455))

(assert (=> b!150895 d!49141))

(declare-fun d!49143 () Bool)

(declare-datatypes ((tuple2!13506 0))(
  ( (tuple2!13507 (_1!7123 (_ BitVec 8)) (_2!7123 BitStream!5356)) )
))
(declare-fun lt!236313 () tuple2!13506)

(declare-fun readByte!0 (BitStream!5356) tuple2!13506)

(assert (=> d!49143 (= lt!236313 (readByte!0 (_1!7113 lt!236108)))))

(assert (=> d!49143 (= (readBytePure!0 (_1!7113 lt!236108)) (tuple2!13489 (_2!7123 lt!236313) (_1!7123 lt!236313)))))

(declare-fun bs!12016 () Bool)

(assert (= bs!12016 d!49143))

(declare-fun m!235707 () Bool)

(assert (=> bs!12016 m!235707))

(assert (=> b!150893 d!49143))

(declare-fun b!151023 () Bool)

(declare-fun res!126632 () Bool)

(declare-fun e!100852 () Bool)

(assert (=> b!151023 (=> (not res!126632) (not e!100852))))

(declare-fun lt!236371 () tuple2!13486)

(assert (=> b!151023 (= res!126632 (isPrefixOf!0 (_2!7113 lt!236371) (_2!7112 lt!236100)))))

(declare-fun d!49145 () Bool)

(assert (=> d!49145 e!100852))

(declare-fun res!126633 () Bool)

(assert (=> d!49145 (=> (not res!126633) (not e!100852))))

(assert (=> d!49145 (= res!126633 (isPrefixOf!0 (_1!7113 lt!236371) (_2!7113 lt!236371)))))

(declare-fun lt!236360 () BitStream!5356)

(assert (=> d!49145 (= lt!236371 (tuple2!13487 lt!236360 (_2!7112 lt!236100)))))

(declare-fun lt!236372 () Unit!9507)

(declare-fun lt!236361 () Unit!9507)

(assert (=> d!49145 (= lt!236372 lt!236361)))

(assert (=> d!49145 (isPrefixOf!0 lt!236360 (_2!7112 lt!236100))))

(assert (=> d!49145 (= lt!236361 (lemmaIsPrefixTransitive!0 lt!236360 (_2!7112 lt!236100) (_2!7112 lt!236100)))))

(declare-fun lt!236363 () Unit!9507)

(declare-fun lt!236357 () Unit!9507)

(assert (=> d!49145 (= lt!236363 lt!236357)))

(assert (=> d!49145 (isPrefixOf!0 lt!236360 (_2!7112 lt!236100))))

(assert (=> d!49145 (= lt!236357 (lemmaIsPrefixTransitive!0 lt!236360 thiss!1634 (_2!7112 lt!236100)))))

(declare-fun lt!236366 () Unit!9507)

(declare-fun e!100853 () Unit!9507)

(assert (=> d!49145 (= lt!236366 e!100853)))

(declare-fun c!8074 () Bool)

(assert (=> d!49145 (= c!8074 (not (= (size!3049 (buf!3536 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!236370 () Unit!9507)

(declare-fun lt!236355 () Unit!9507)

(assert (=> d!49145 (= lt!236370 lt!236355)))

(assert (=> d!49145 (isPrefixOf!0 (_2!7112 lt!236100) (_2!7112 lt!236100))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5356) Unit!9507)

(assert (=> d!49145 (= lt!236355 (lemmaIsPrefixRefl!0 (_2!7112 lt!236100)))))

(declare-fun lt!236373 () Unit!9507)

(declare-fun lt!236364 () Unit!9507)

(assert (=> d!49145 (= lt!236373 lt!236364)))

(assert (=> d!49145 (= lt!236364 (lemmaIsPrefixRefl!0 (_2!7112 lt!236100)))))

(declare-fun lt!236368 () Unit!9507)

(declare-fun lt!236354 () Unit!9507)

(assert (=> d!49145 (= lt!236368 lt!236354)))

(assert (=> d!49145 (isPrefixOf!0 lt!236360 lt!236360)))

(assert (=> d!49145 (= lt!236354 (lemmaIsPrefixRefl!0 lt!236360))))

(declare-fun lt!236359 () Unit!9507)

(declare-fun lt!236367 () Unit!9507)

(assert (=> d!49145 (= lt!236359 lt!236367)))

(assert (=> d!49145 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!49145 (= lt!236367 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!49145 (= lt!236360 (BitStream!5357 (buf!3536 (_2!7112 lt!236100)) (currentByte!6462 thiss!1634) (currentBit!6457 thiss!1634)))))

(assert (=> d!49145 (isPrefixOf!0 thiss!1634 (_2!7112 lt!236100))))

(assert (=> d!49145 (= (reader!0 thiss!1634 (_2!7112 lt!236100)) lt!236371)))

(declare-fun b!151024 () Bool)

(declare-fun res!126634 () Bool)

(assert (=> b!151024 (=> (not res!126634) (not e!100852))))

(assert (=> b!151024 (= res!126634 (isPrefixOf!0 (_1!7113 lt!236371) thiss!1634))))

(declare-fun lt!236369 () (_ BitVec 64))

(declare-fun b!151025 () Bool)

(declare-fun lt!236356 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!5356 (_ BitVec 64)) BitStream!5356)

(assert (=> b!151025 (= e!100852 (= (_1!7113 lt!236371) (withMovedBitIndex!0 (_2!7113 lt!236371) (bvsub lt!236369 lt!236356))))))

(assert (=> b!151025 (or (= (bvand lt!236369 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!236356 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!236369 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!236369 lt!236356) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!151025 (= lt!236356 (bitIndex!0 (size!3049 (buf!3536 (_2!7112 lt!236100))) (currentByte!6462 (_2!7112 lt!236100)) (currentBit!6457 (_2!7112 lt!236100))))))

(assert (=> b!151025 (= lt!236369 (bitIndex!0 (size!3049 (buf!3536 thiss!1634)) (currentByte!6462 thiss!1634) (currentBit!6457 thiss!1634)))))

(declare-fun b!151026 () Bool)

(declare-fun Unit!9513 () Unit!9507)

(assert (=> b!151026 (= e!100853 Unit!9513)))

(declare-fun b!151027 () Bool)

(declare-fun lt!236365 () Unit!9507)

(assert (=> b!151027 (= e!100853 lt!236365)))

(declare-fun lt!236362 () (_ BitVec 64))

(assert (=> b!151027 (= lt!236362 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!236358 () (_ BitVec 64))

(assert (=> b!151027 (= lt!236358 (bitIndex!0 (size!3049 (buf!3536 thiss!1634)) (currentByte!6462 thiss!1634) (currentBit!6457 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6740 array!6740 (_ BitVec 64) (_ BitVec 64)) Unit!9507)

(assert (=> b!151027 (= lt!236365 (arrayBitRangesEqSymmetric!0 (buf!3536 thiss!1634) (buf!3536 (_2!7112 lt!236100)) lt!236362 lt!236358))))

(declare-fun arrayBitRangesEq!0 (array!6740 array!6740 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!151027 (arrayBitRangesEq!0 (buf!3536 (_2!7112 lt!236100)) (buf!3536 thiss!1634) lt!236362 lt!236358)))

(assert (= (and d!49145 c!8074) b!151027))

(assert (= (and d!49145 (not c!8074)) b!151026))

(assert (= (and d!49145 res!126633) b!151024))

(assert (= (and b!151024 res!126634) b!151023))

(assert (= (and b!151023 res!126632) b!151025))

(assert (=> b!151027 m!235469))

(declare-fun m!235709 () Bool)

(assert (=> b!151027 m!235709))

(declare-fun m!235711 () Bool)

(assert (=> b!151027 m!235711))

(declare-fun m!235713 () Bool)

(assert (=> b!151024 m!235713))

(declare-fun m!235715 () Bool)

(assert (=> b!151023 m!235715))

(declare-fun m!235717 () Bool)

(assert (=> b!151025 m!235717))

(assert (=> b!151025 m!235467))

(assert (=> b!151025 m!235469))

(declare-fun m!235719 () Bool)

(assert (=> d!49145 m!235719))

(declare-fun m!235721 () Bool)

(assert (=> d!49145 m!235721))

(declare-fun m!235723 () Bool)

(assert (=> d!49145 m!235723))

(declare-fun m!235725 () Bool)

(assert (=> d!49145 m!235725))

(declare-fun m!235727 () Bool)

(assert (=> d!49145 m!235727))

(assert (=> d!49145 m!235481))

(declare-fun m!235729 () Bool)

(assert (=> d!49145 m!235729))

(declare-fun m!235731 () Bool)

(assert (=> d!49145 m!235731))

(declare-fun m!235733 () Bool)

(assert (=> d!49145 m!235733))

(declare-fun m!235735 () Bool)

(assert (=> d!49145 m!235735))

(declare-fun m!235737 () Bool)

(assert (=> d!49145 m!235737))

(assert (=> b!150893 d!49145))

(declare-fun d!49147 () Bool)

(assert (=> d!49147 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3049 (buf!3536 thiss!1634))) ((_ sign_extend 32) (currentByte!6462 thiss!1634)) ((_ sign_extend 32) (currentBit!6457 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3049 (buf!3536 thiss!1634))) ((_ sign_extend 32) (currentByte!6462 thiss!1634)) ((_ sign_extend 32) (currentBit!6457 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12017 () Bool)

(assert (= bs!12017 d!49147))

(assert (=> bs!12017 m!235705))

(assert (=> b!150892 d!49147))

(declare-fun d!49149 () Bool)

(declare-fun moveByteIndex!0 (BitStream!5356 (_ BitVec 32)) tuple2!13484)

(assert (=> d!49149 (= (withMovedByteIndex!0 (_1!7113 lt!236107) #b00000000000000000000000000000001) (_2!7112 (moveByteIndex!0 (_1!7113 lt!236107) #b00000000000000000000000000000001)))))

(declare-fun bs!12018 () Bool)

(assert (= bs!12018 d!49149))

(declare-fun m!235739 () Bool)

(assert (=> bs!12018 m!235739))

(assert (=> b!150902 d!49149))

(declare-fun b!151028 () Bool)

(declare-fun res!126635 () Bool)

(declare-fun e!100854 () Bool)

(assert (=> b!151028 (=> (not res!126635) (not e!100854))))

(declare-fun lt!236391 () tuple2!13486)

(assert (=> b!151028 (= res!126635 (isPrefixOf!0 (_2!7113 lt!236391) (_2!7112 lt!236104)))))

(declare-fun d!49151 () Bool)

(assert (=> d!49151 e!100854))

(declare-fun res!126636 () Bool)

(assert (=> d!49151 (=> (not res!126636) (not e!100854))))

(assert (=> d!49151 (= res!126636 (isPrefixOf!0 (_1!7113 lt!236391) (_2!7113 lt!236391)))))

(declare-fun lt!236380 () BitStream!5356)

(assert (=> d!49151 (= lt!236391 (tuple2!13487 lt!236380 (_2!7112 lt!236104)))))

(declare-fun lt!236392 () Unit!9507)

(declare-fun lt!236381 () Unit!9507)

(assert (=> d!49151 (= lt!236392 lt!236381)))

(assert (=> d!49151 (isPrefixOf!0 lt!236380 (_2!7112 lt!236104))))

(assert (=> d!49151 (= lt!236381 (lemmaIsPrefixTransitive!0 lt!236380 (_2!7112 lt!236104) (_2!7112 lt!236104)))))

(declare-fun lt!236383 () Unit!9507)

(declare-fun lt!236377 () Unit!9507)

(assert (=> d!49151 (= lt!236383 lt!236377)))

(assert (=> d!49151 (isPrefixOf!0 lt!236380 (_2!7112 lt!236104))))

(assert (=> d!49151 (= lt!236377 (lemmaIsPrefixTransitive!0 lt!236380 (_2!7112 lt!236100) (_2!7112 lt!236104)))))

(declare-fun lt!236386 () Unit!9507)

(declare-fun e!100855 () Unit!9507)

(assert (=> d!49151 (= lt!236386 e!100855)))

(declare-fun c!8075 () Bool)

(assert (=> d!49151 (= c!8075 (not (= (size!3049 (buf!3536 (_2!7112 lt!236100))) #b00000000000000000000000000000000)))))

(declare-fun lt!236390 () Unit!9507)

(declare-fun lt!236375 () Unit!9507)

(assert (=> d!49151 (= lt!236390 lt!236375)))

(assert (=> d!49151 (isPrefixOf!0 (_2!7112 lt!236104) (_2!7112 lt!236104))))

(assert (=> d!49151 (= lt!236375 (lemmaIsPrefixRefl!0 (_2!7112 lt!236104)))))

(declare-fun lt!236393 () Unit!9507)

(declare-fun lt!236384 () Unit!9507)

(assert (=> d!49151 (= lt!236393 lt!236384)))

(assert (=> d!49151 (= lt!236384 (lemmaIsPrefixRefl!0 (_2!7112 lt!236104)))))

(declare-fun lt!236388 () Unit!9507)

(declare-fun lt!236374 () Unit!9507)

(assert (=> d!49151 (= lt!236388 lt!236374)))

(assert (=> d!49151 (isPrefixOf!0 lt!236380 lt!236380)))

(assert (=> d!49151 (= lt!236374 (lemmaIsPrefixRefl!0 lt!236380))))

(declare-fun lt!236379 () Unit!9507)

(declare-fun lt!236387 () Unit!9507)

(assert (=> d!49151 (= lt!236379 lt!236387)))

(assert (=> d!49151 (isPrefixOf!0 (_2!7112 lt!236100) (_2!7112 lt!236100))))

(assert (=> d!49151 (= lt!236387 (lemmaIsPrefixRefl!0 (_2!7112 lt!236100)))))

(assert (=> d!49151 (= lt!236380 (BitStream!5357 (buf!3536 (_2!7112 lt!236104)) (currentByte!6462 (_2!7112 lt!236100)) (currentBit!6457 (_2!7112 lt!236100))))))

(assert (=> d!49151 (isPrefixOf!0 (_2!7112 lt!236100) (_2!7112 lt!236104))))

(assert (=> d!49151 (= (reader!0 (_2!7112 lt!236100) (_2!7112 lt!236104)) lt!236391)))

(declare-fun b!151029 () Bool)

(declare-fun res!126637 () Bool)

(assert (=> b!151029 (=> (not res!126637) (not e!100854))))

(assert (=> b!151029 (= res!126637 (isPrefixOf!0 (_1!7113 lt!236391) (_2!7112 lt!236100)))))

(declare-fun b!151030 () Bool)

(declare-fun lt!236376 () (_ BitVec 64))

(declare-fun lt!236389 () (_ BitVec 64))

(assert (=> b!151030 (= e!100854 (= (_1!7113 lt!236391) (withMovedBitIndex!0 (_2!7113 lt!236391) (bvsub lt!236389 lt!236376))))))

(assert (=> b!151030 (or (= (bvand lt!236389 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!236376 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!236389 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!236389 lt!236376) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!151030 (= lt!236376 (bitIndex!0 (size!3049 (buf!3536 (_2!7112 lt!236104))) (currentByte!6462 (_2!7112 lt!236104)) (currentBit!6457 (_2!7112 lt!236104))))))

(assert (=> b!151030 (= lt!236389 (bitIndex!0 (size!3049 (buf!3536 (_2!7112 lt!236100))) (currentByte!6462 (_2!7112 lt!236100)) (currentBit!6457 (_2!7112 lt!236100))))))

(declare-fun b!151031 () Bool)

(declare-fun Unit!9514 () Unit!9507)

(assert (=> b!151031 (= e!100855 Unit!9514)))

(declare-fun b!151032 () Bool)

(declare-fun lt!236385 () Unit!9507)

(assert (=> b!151032 (= e!100855 lt!236385)))

(declare-fun lt!236382 () (_ BitVec 64))

(assert (=> b!151032 (= lt!236382 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!236378 () (_ BitVec 64))

(assert (=> b!151032 (= lt!236378 (bitIndex!0 (size!3049 (buf!3536 (_2!7112 lt!236100))) (currentByte!6462 (_2!7112 lt!236100)) (currentBit!6457 (_2!7112 lt!236100))))))

(assert (=> b!151032 (= lt!236385 (arrayBitRangesEqSymmetric!0 (buf!3536 (_2!7112 lt!236100)) (buf!3536 (_2!7112 lt!236104)) lt!236382 lt!236378))))

(assert (=> b!151032 (arrayBitRangesEq!0 (buf!3536 (_2!7112 lt!236104)) (buf!3536 (_2!7112 lt!236100)) lt!236382 lt!236378)))

(assert (= (and d!49151 c!8075) b!151032))

(assert (= (and d!49151 (not c!8075)) b!151031))

(assert (= (and d!49151 res!126636) b!151029))

(assert (= (and b!151029 res!126637) b!151028))

(assert (= (and b!151028 res!126635) b!151030))

(assert (=> b!151032 m!235467))

(declare-fun m!235741 () Bool)

(assert (=> b!151032 m!235741))

(declare-fun m!235743 () Bool)

(assert (=> b!151032 m!235743))

(declare-fun m!235745 () Bool)

(assert (=> b!151029 m!235745))

(declare-fun m!235747 () Bool)

(assert (=> b!151028 m!235747))

(declare-fun m!235749 () Bool)

(assert (=> b!151030 m!235749))

(assert (=> b!151030 m!235485))

(assert (=> b!151030 m!235467))

(assert (=> d!49151 m!235723))

(declare-fun m!235751 () Bool)

(assert (=> d!49151 m!235751))

(declare-fun m!235753 () Bool)

(assert (=> d!49151 m!235753))

(assert (=> d!49151 m!235727))

(declare-fun m!235755 () Bool)

(assert (=> d!49151 m!235755))

(assert (=> d!49151 m!235465))

(declare-fun m!235757 () Bool)

(assert (=> d!49151 m!235757))

(declare-fun m!235759 () Bool)

(assert (=> d!49151 m!235759))

(declare-fun m!235761 () Bool)

(assert (=> d!49151 m!235761))

(declare-fun m!235763 () Bool)

(assert (=> d!49151 m!235763))

(declare-fun m!235765 () Bool)

(assert (=> d!49151 m!235765))

(assert (=> b!150902 d!49151))

(declare-fun d!49153 () Bool)

(declare-datatypes ((tuple3!594 0))(
  ( (tuple3!595 (_1!7124 Unit!9507) (_2!7124 BitStream!5356) (_3!370 array!6740)) )
))
(declare-fun lt!236396 () tuple3!594)

(declare-fun readByteArrayLoop!0 (BitStream!5356 array!6740 (_ BitVec 32) (_ BitVec 32)) tuple3!594)

(assert (=> d!49153 (= lt!236396 (readByteArrayLoop!0 (_1!7113 lt!236107) arr!237 from!447 to!404))))

(assert (=> d!49153 (= (readByteArrayLoopPure!0 (_1!7113 lt!236107) arr!237 from!447 to!404) (tuple2!13483 (_2!7124 lt!236396) (_3!370 lt!236396)))))

(declare-fun bs!12019 () Bool)

(assert (= bs!12019 d!49153))

(declare-fun m!235767 () Bool)

(assert (=> bs!12019 m!235767))

(assert (=> b!150902 d!49153))

(declare-fun d!49155 () Bool)

(declare-fun lt!236397 () tuple2!13506)

(assert (=> d!49155 (= lt!236397 (readByte!0 (_1!7113 lt!236107)))))

(assert (=> d!49155 (= (readBytePure!0 (_1!7113 lt!236107)) (tuple2!13489 (_2!7123 lt!236397) (_1!7123 lt!236397)))))

(declare-fun bs!12020 () Bool)

(assert (= bs!12020 d!49155))

(declare-fun m!235769 () Bool)

(assert (=> bs!12020 m!235769))

(assert (=> b!150902 d!49155))

(declare-fun d!49157 () Bool)

(declare-fun lt!236398 () tuple2!13506)

(assert (=> d!49157 (= lt!236398 (readByte!0 lt!236099))))

(assert (=> d!49157 (= (readBytePure!0 lt!236099) (tuple2!13489 (_2!7123 lt!236398) (_1!7123 lt!236398)))))

(declare-fun bs!12021 () Bool)

(assert (= bs!12021 d!49157))

(declare-fun m!235771 () Bool)

(assert (=> bs!12021 m!235771))

(assert (=> b!150902 d!49157))

(declare-fun d!49159 () Bool)

(assert (=> d!49159 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3049 (buf!3536 (_2!7112 lt!236104)))) ((_ sign_extend 32) (currentByte!6462 (_2!7112 lt!236100))) ((_ sign_extend 32) (currentBit!6457 (_2!7112 lt!236100))) lt!236110) (bvsle ((_ sign_extend 32) lt!236110) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3049 (buf!3536 (_2!7112 lt!236104)))) ((_ sign_extend 32) (currentByte!6462 (_2!7112 lt!236100))) ((_ sign_extend 32) (currentBit!6457 (_2!7112 lt!236100)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12022 () Bool)

(assert (= bs!12022 d!49159))

(declare-fun m!235773 () Bool)

(assert (=> bs!12022 m!235773))

(assert (=> b!150902 d!49159))

(declare-fun d!49161 () Bool)

(declare-fun e!100856 () Bool)

(assert (=> d!49161 e!100856))

(declare-fun res!126639 () Bool)

(assert (=> d!49161 (=> (not res!126639) (not e!100856))))

(declare-fun lt!236404 () (_ BitVec 64))

(declare-fun lt!236400 () (_ BitVec 64))

(declare-fun lt!236403 () (_ BitVec 64))

(assert (=> d!49161 (= res!126639 (= lt!236403 (bvsub lt!236404 lt!236400)))))

(assert (=> d!49161 (or (= (bvand lt!236404 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!236400 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!236404 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!236404 lt!236400) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!49161 (= lt!236400 (remainingBits!0 ((_ sign_extend 32) (size!3049 (buf!3536 (_1!7114 lt!236106)))) ((_ sign_extend 32) (currentByte!6462 (_1!7114 lt!236106))) ((_ sign_extend 32) (currentBit!6457 (_1!7114 lt!236106)))))))

(declare-fun lt!236402 () (_ BitVec 64))

(declare-fun lt!236401 () (_ BitVec 64))

(assert (=> d!49161 (= lt!236404 (bvmul lt!236402 lt!236401))))

(assert (=> d!49161 (or (= lt!236402 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!236401 (bvsdiv (bvmul lt!236402 lt!236401) lt!236402)))))

(assert (=> d!49161 (= lt!236401 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!49161 (= lt!236402 ((_ sign_extend 32) (size!3049 (buf!3536 (_1!7114 lt!236106)))))))

(assert (=> d!49161 (= lt!236403 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6462 (_1!7114 lt!236106))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6457 (_1!7114 lt!236106)))))))

(assert (=> d!49161 (invariant!0 (currentBit!6457 (_1!7114 lt!236106)) (currentByte!6462 (_1!7114 lt!236106)) (size!3049 (buf!3536 (_1!7114 lt!236106))))))

(assert (=> d!49161 (= (bitIndex!0 (size!3049 (buf!3536 (_1!7114 lt!236106))) (currentByte!6462 (_1!7114 lt!236106)) (currentBit!6457 (_1!7114 lt!236106))) lt!236403)))

(declare-fun b!151033 () Bool)

(declare-fun res!126638 () Bool)

(assert (=> b!151033 (=> (not res!126638) (not e!100856))))

(assert (=> b!151033 (= res!126638 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!236403))))

(declare-fun b!151034 () Bool)

(declare-fun lt!236399 () (_ BitVec 64))

(assert (=> b!151034 (= e!100856 (bvsle lt!236403 (bvmul lt!236399 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!151034 (or (= lt!236399 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!236399 #b0000000000000000000000000000000000000000000000000000000000001000) lt!236399)))))

(assert (=> b!151034 (= lt!236399 ((_ sign_extend 32) (size!3049 (buf!3536 (_1!7114 lt!236106)))))))

(assert (= (and d!49161 res!126639) b!151033))

(assert (= (and b!151033 res!126638) b!151034))

(declare-fun m!235775 () Bool)

(assert (=> d!49161 m!235775))

(declare-fun m!235777 () Bool)

(assert (=> d!49161 m!235777))

(assert (=> b!150902 d!49161))

(declare-fun d!49163 () Bool)

(assert (=> d!49163 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3049 (buf!3536 (_2!7112 lt!236104)))) ((_ sign_extend 32) (currentByte!6462 thiss!1634)) ((_ sign_extend 32) (currentBit!6457 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3049 (buf!3536 (_2!7112 lt!236104)))) ((_ sign_extend 32) (currentByte!6462 thiss!1634)) ((_ sign_extend 32) (currentBit!6457 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12023 () Bool)

(assert (= bs!12023 d!49163))

(declare-fun m!235779 () Bool)

(assert (=> bs!12023 m!235779))

(assert (=> b!150902 d!49163))

(declare-fun d!49165 () Bool)

(assert (=> d!49165 (isPrefixOf!0 thiss!1634 (_2!7112 lt!236104))))

(declare-fun lt!236407 () Unit!9507)

(declare-fun choose!30 (BitStream!5356 BitStream!5356 BitStream!5356) Unit!9507)

(assert (=> d!49165 (= lt!236407 (choose!30 thiss!1634 (_2!7112 lt!236100) (_2!7112 lt!236104)))))

(assert (=> d!49165 (isPrefixOf!0 thiss!1634 (_2!7112 lt!236100))))

(assert (=> d!49165 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!7112 lt!236100) (_2!7112 lt!236104)) lt!236407)))

(declare-fun bs!12024 () Bool)

(assert (= bs!12024 d!49165))

(assert (=> bs!12024 m!235431))

(declare-fun m!235781 () Bool)

(assert (=> bs!12024 m!235781))

(assert (=> bs!12024 m!235481))

(assert (=> b!150902 d!49165))

(declare-fun d!49167 () Bool)

(assert (=> d!49167 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3049 (buf!3536 (_2!7112 lt!236104)))) ((_ sign_extend 32) (currentByte!6462 thiss!1634)) ((_ sign_extend 32) (currentBit!6457 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!236410 () Unit!9507)

(declare-fun choose!26 (BitStream!5356 array!6740 (_ BitVec 32) BitStream!5356) Unit!9507)

(assert (=> d!49167 (= lt!236410 (choose!26 thiss!1634 (buf!3536 (_2!7112 lt!236104)) (bvsub to!404 from!447) (BitStream!5357 (buf!3536 (_2!7112 lt!236104)) (currentByte!6462 thiss!1634) (currentBit!6457 thiss!1634))))))

(assert (=> d!49167 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3536 (_2!7112 lt!236104)) (bvsub to!404 from!447)) lt!236410)))

(declare-fun bs!12025 () Bool)

(assert (= bs!12025 d!49167))

(assert (=> bs!12025 m!235407))

(declare-fun m!235783 () Bool)

(assert (=> bs!12025 m!235783))

(assert (=> b!150902 d!49167))

(declare-fun d!49173 () Bool)

(declare-fun res!126644 () Bool)

(declare-fun e!100861 () Bool)

(assert (=> d!49173 (=> res!126644 e!100861)))

(assert (=> d!49173 (= res!126644 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!49173 (= (arrayRangesEq!365 (_2!7111 lt!236085) (_2!7111 lt!236097) #b00000000000000000000000000000000 to!404) e!100861)))

(declare-fun b!151039 () Bool)

(declare-fun e!100862 () Bool)

(assert (=> b!151039 (= e!100861 e!100862)))

(declare-fun res!126645 () Bool)

(assert (=> b!151039 (=> (not res!126645) (not e!100862))))

(assert (=> b!151039 (= res!126645 (= (select (arr!3851 (_2!7111 lt!236085)) #b00000000000000000000000000000000) (select (arr!3851 (_2!7111 lt!236097)) #b00000000000000000000000000000000)))))

(declare-fun b!151040 () Bool)

(assert (=> b!151040 (= e!100862 (arrayRangesEq!365 (_2!7111 lt!236085) (_2!7111 lt!236097) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!49173 (not res!126644)) b!151039))

(assert (= (and b!151039 res!126645) b!151040))

(declare-fun m!235787 () Bool)

(assert (=> b!151039 m!235787))

(declare-fun m!235789 () Bool)

(assert (=> b!151039 m!235789))

(declare-fun m!235791 () Bool)

(assert (=> b!151040 m!235791))

(assert (=> b!150902 d!49173))

(declare-fun d!49177 () Bool)

(declare-fun lt!236414 () tuple3!594)

(assert (=> d!49177 (= lt!236414 (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!7113 lt!236107) #b00000000000000000000000000000001) lt!236091 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!49177 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!7113 lt!236107) #b00000000000000000000000000000001) lt!236091 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13483 (_2!7124 lt!236414) (_3!370 lt!236414)))))

(declare-fun bs!12028 () Bool)

(assert (= bs!12028 d!49177))

(assert (=> bs!12028 m!235409))

(declare-fun m!235795 () Bool)

(assert (=> bs!12028 m!235795))

(assert (=> b!150902 d!49177))

(declare-fun d!49181 () Bool)

(declare-fun e!100867 () Bool)

(assert (=> d!49181 e!100867))

(declare-fun res!126652 () Bool)

(assert (=> d!49181 (=> (not res!126652) (not e!100867))))

(assert (=> d!49181 (= res!126652 (and (or (let ((rhs!3295 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3295 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3295) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!49184 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!49184 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!49184 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3294 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3294 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3294) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!236433 () Unit!9507)

(declare-fun choose!57 (BitStream!5356 BitStream!5356 (_ BitVec 64) (_ BitVec 32)) Unit!9507)

(assert (=> d!49181 (= lt!236433 (choose!57 thiss!1634 (_2!7112 lt!236100) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!49181 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!7112 lt!236100) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!236433)))

(declare-fun b!151047 () Bool)

(declare-fun lt!236434 () (_ BitVec 32))

(assert (=> b!151047 (= e!100867 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3049 (buf!3536 (_2!7112 lt!236100)))) ((_ sign_extend 32) (currentByte!6462 (_2!7112 lt!236100))) ((_ sign_extend 32) (currentBit!6457 (_2!7112 lt!236100))) (bvsub (bvsub to!404 from!447) lt!236434)))))

(assert (=> b!151047 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!236434 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!236434) #b10000000000000000000000000000000)))))

(declare-fun lt!236435 () (_ BitVec 64))

(assert (=> b!151047 (= lt!236434 ((_ extract 31 0) lt!236435))))

(assert (=> b!151047 (and (bvslt lt!236435 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!236435 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!151047 (= lt!236435 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!49181 res!126652) b!151047))

(declare-fun m!235797 () Bool)

(assert (=> d!49181 m!235797))

(declare-fun m!235799 () Bool)

(assert (=> b!151047 m!235799))

(assert (=> b!150902 d!49181))

(declare-fun d!49186 () Bool)

(declare-fun lt!236464 () tuple2!13482)

(declare-fun lt!236466 () tuple2!13482)

(assert (=> d!49186 (arrayRangesEq!365 (_2!7111 lt!236464) (_2!7111 lt!236466) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!236467 () Unit!9507)

(declare-fun lt!236465 () BitStream!5356)

(declare-fun choose!35 (BitStream!5356 array!6740 (_ BitVec 32) (_ BitVec 32) tuple2!13482 array!6740 BitStream!5356 tuple2!13482 array!6740) Unit!9507)

(assert (=> d!49186 (= lt!236467 (choose!35 (_1!7113 lt!236107) arr!237 from!447 to!404 lt!236464 (_2!7111 lt!236464) lt!236465 lt!236466 (_2!7111 lt!236466)))))

(assert (=> d!49186 (= lt!236466 (readByteArrayLoopPure!0 lt!236465 (array!6741 (store (arr!3851 arr!237) from!447 (_2!7114 (readBytePure!0 (_1!7113 lt!236107)))) (size!3049 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!49186 (= lt!236465 (withMovedByteIndex!0 (_1!7113 lt!236107) #b00000000000000000000000000000001))))

(assert (=> d!49186 (= lt!236464 (readByteArrayLoopPure!0 (_1!7113 lt!236107) arr!237 from!447 to!404))))

(assert (=> d!49186 (= (readByteArrayLoopArrayPrefixLemma!0 (_1!7113 lt!236107) arr!237 from!447 to!404) lt!236467)))

(declare-fun bs!12030 () Bool)

(assert (= bs!12030 d!49186))

(declare-fun m!235817 () Bool)

(assert (=> bs!12030 m!235817))

(declare-fun m!235821 () Bool)

(assert (=> bs!12030 m!235821))

(declare-fun m!235823 () Bool)

(assert (=> bs!12030 m!235823))

(assert (=> bs!12030 m!235443))

(assert (=> bs!12030 m!235409))

(assert (=> bs!12030 m!235417))

(declare-fun m!235827 () Bool)

(assert (=> bs!12030 m!235827))

(assert (=> b!150902 d!49186))

(declare-fun d!49202 () Bool)

(assert (=> d!49202 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!3049 (buf!3536 (_2!7112 lt!236100)))) ((_ sign_extend 32) (currentByte!6462 (_2!7112 lt!236100))) ((_ sign_extend 32) (currentBit!6457 (_2!7112 lt!236100))) lt!236110) (bvsle ((_ sign_extend 32) lt!236110) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!3049 (buf!3536 (_2!7112 lt!236100)))) ((_ sign_extend 32) (currentByte!6462 (_2!7112 lt!236100))) ((_ sign_extend 32) (currentBit!6457 (_2!7112 lt!236100)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!12033 () Bool)

(assert (= bs!12033 d!49202))

(assert (=> bs!12033 m!235701))

(assert (=> b!150902 d!49202))

(declare-fun d!49204 () Bool)

(declare-fun e!100877 () Bool)

(assert (=> d!49204 e!100877))

(declare-fun res!126666 () Bool)

(assert (=> d!49204 (=> (not res!126666) (not e!100877))))

(declare-fun lt!236474 () (_ BitVec 64))

(declare-fun lt!236471 () (_ BitVec 64))

(declare-fun lt!236475 () (_ BitVec 64))

(assert (=> d!49204 (= res!126666 (= lt!236474 (bvsub lt!236475 lt!236471)))))

(assert (=> d!49204 (or (= (bvand lt!236475 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!236471 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!236475 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!236475 lt!236471) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!49204 (= lt!236471 (remainingBits!0 ((_ sign_extend 32) (size!3049 (buf!3536 (_1!7114 lt!236102)))) ((_ sign_extend 32) (currentByte!6462 (_1!7114 lt!236102))) ((_ sign_extend 32) (currentBit!6457 (_1!7114 lt!236102)))))))

(declare-fun lt!236473 () (_ BitVec 64))

(declare-fun lt!236472 () (_ BitVec 64))

(assert (=> d!49204 (= lt!236475 (bvmul lt!236473 lt!236472))))

(assert (=> d!49204 (or (= lt!236473 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!236472 (bvsdiv (bvmul lt!236473 lt!236472) lt!236473)))))

(assert (=> d!49204 (= lt!236472 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!49204 (= lt!236473 ((_ sign_extend 32) (size!3049 (buf!3536 (_1!7114 lt!236102)))))))

(assert (=> d!49204 (= lt!236474 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6462 (_1!7114 lt!236102))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6457 (_1!7114 lt!236102)))))))

(assert (=> d!49204 (invariant!0 (currentBit!6457 (_1!7114 lt!236102)) (currentByte!6462 (_1!7114 lt!236102)) (size!3049 (buf!3536 (_1!7114 lt!236102))))))

(assert (=> d!49204 (= (bitIndex!0 (size!3049 (buf!3536 (_1!7114 lt!236102))) (currentByte!6462 (_1!7114 lt!236102)) (currentBit!6457 (_1!7114 lt!236102))) lt!236474)))

(declare-fun b!151060 () Bool)

(declare-fun res!126665 () Bool)

(assert (=> b!151060 (=> (not res!126665) (not e!100877))))

(assert (=> b!151060 (= res!126665 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!236474))))

(declare-fun b!151061 () Bool)

(declare-fun lt!236470 () (_ BitVec 64))

(assert (=> b!151061 (= e!100877 (bvsle lt!236474 (bvmul lt!236470 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!151061 (or (= lt!236470 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!236470 #b0000000000000000000000000000000000000000000000000000000000001000) lt!236470)))))

(assert (=> b!151061 (= lt!236470 ((_ sign_extend 32) (size!3049 (buf!3536 (_1!7114 lt!236102)))))))

(assert (= (and d!49204 res!126666) b!151060))

(assert (= (and b!151060 res!126665) b!151061))

(declare-fun m!235831 () Bool)

(assert (=> d!49204 m!235831))

(declare-fun m!235833 () Bool)

(assert (=> d!49204 m!235833))

(assert (=> b!150902 d!49204))

(declare-fun d!49208 () Bool)

(declare-fun lt!236478 () tuple3!594)

(assert (=> d!49208 (= lt!236478 (readByteArrayLoop!0 (_1!7113 lt!236111) lt!236091 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!49208 (= (readByteArrayLoopPure!0 (_1!7113 lt!236111) lt!236091 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13483 (_2!7124 lt!236478) (_3!370 lt!236478)))))

(declare-fun bs!12035 () Bool)

(assert (= bs!12035 d!49208))

(declare-fun m!235835 () Bool)

(assert (=> bs!12035 m!235835))

(assert (=> b!150902 d!49208))

(declare-fun b!151062 () Bool)

(declare-fun res!126667 () Bool)

(declare-fun e!100878 () Bool)

(assert (=> b!151062 (=> (not res!126667) (not e!100878))))

(declare-fun lt!236496 () tuple2!13486)

(assert (=> b!151062 (= res!126667 (isPrefixOf!0 (_2!7113 lt!236496) (_2!7112 lt!236104)))))

(declare-fun d!49210 () Bool)

(assert (=> d!49210 e!100878))

(declare-fun res!126668 () Bool)

(assert (=> d!49210 (=> (not res!126668) (not e!100878))))

(assert (=> d!49210 (= res!126668 (isPrefixOf!0 (_1!7113 lt!236496) (_2!7113 lt!236496)))))

(declare-fun lt!236485 () BitStream!5356)

(assert (=> d!49210 (= lt!236496 (tuple2!13487 lt!236485 (_2!7112 lt!236104)))))

(declare-fun lt!236497 () Unit!9507)

(declare-fun lt!236486 () Unit!9507)

(assert (=> d!49210 (= lt!236497 lt!236486)))

(assert (=> d!49210 (isPrefixOf!0 lt!236485 (_2!7112 lt!236104))))

(assert (=> d!49210 (= lt!236486 (lemmaIsPrefixTransitive!0 lt!236485 (_2!7112 lt!236104) (_2!7112 lt!236104)))))

(declare-fun lt!236488 () Unit!9507)

(declare-fun lt!236482 () Unit!9507)

(assert (=> d!49210 (= lt!236488 lt!236482)))

(assert (=> d!49210 (isPrefixOf!0 lt!236485 (_2!7112 lt!236104))))

(assert (=> d!49210 (= lt!236482 (lemmaIsPrefixTransitive!0 lt!236485 thiss!1634 (_2!7112 lt!236104)))))

(declare-fun lt!236491 () Unit!9507)

(declare-fun e!100879 () Unit!9507)

(assert (=> d!49210 (= lt!236491 e!100879)))

(declare-fun c!8076 () Bool)

(assert (=> d!49210 (= c!8076 (not (= (size!3049 (buf!3536 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!236495 () Unit!9507)

(declare-fun lt!236480 () Unit!9507)

(assert (=> d!49210 (= lt!236495 lt!236480)))

(assert (=> d!49210 (isPrefixOf!0 (_2!7112 lt!236104) (_2!7112 lt!236104))))

(assert (=> d!49210 (= lt!236480 (lemmaIsPrefixRefl!0 (_2!7112 lt!236104)))))

(declare-fun lt!236498 () Unit!9507)

(declare-fun lt!236489 () Unit!9507)

(assert (=> d!49210 (= lt!236498 lt!236489)))

(assert (=> d!49210 (= lt!236489 (lemmaIsPrefixRefl!0 (_2!7112 lt!236104)))))

(declare-fun lt!236493 () Unit!9507)

(declare-fun lt!236479 () Unit!9507)

(assert (=> d!49210 (= lt!236493 lt!236479)))

(assert (=> d!49210 (isPrefixOf!0 lt!236485 lt!236485)))

(assert (=> d!49210 (= lt!236479 (lemmaIsPrefixRefl!0 lt!236485))))

(declare-fun lt!236484 () Unit!9507)

(declare-fun lt!236492 () Unit!9507)

(assert (=> d!49210 (= lt!236484 lt!236492)))

(assert (=> d!49210 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!49210 (= lt!236492 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!49210 (= lt!236485 (BitStream!5357 (buf!3536 (_2!7112 lt!236104)) (currentByte!6462 thiss!1634) (currentBit!6457 thiss!1634)))))

(assert (=> d!49210 (isPrefixOf!0 thiss!1634 (_2!7112 lt!236104))))

(assert (=> d!49210 (= (reader!0 thiss!1634 (_2!7112 lt!236104)) lt!236496)))

(declare-fun b!151063 () Bool)

(declare-fun res!126669 () Bool)

(assert (=> b!151063 (=> (not res!126669) (not e!100878))))

(assert (=> b!151063 (= res!126669 (isPrefixOf!0 (_1!7113 lt!236496) thiss!1634))))

(declare-fun lt!236481 () (_ BitVec 64))

(declare-fun b!151064 () Bool)

(declare-fun lt!236494 () (_ BitVec 64))

(assert (=> b!151064 (= e!100878 (= (_1!7113 lt!236496) (withMovedBitIndex!0 (_2!7113 lt!236496) (bvsub lt!236494 lt!236481))))))

(assert (=> b!151064 (or (= (bvand lt!236494 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!236481 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!236494 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!236494 lt!236481) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!151064 (= lt!236481 (bitIndex!0 (size!3049 (buf!3536 (_2!7112 lt!236104))) (currentByte!6462 (_2!7112 lt!236104)) (currentBit!6457 (_2!7112 lt!236104))))))

(assert (=> b!151064 (= lt!236494 (bitIndex!0 (size!3049 (buf!3536 thiss!1634)) (currentByte!6462 thiss!1634) (currentBit!6457 thiss!1634)))))

(declare-fun b!151065 () Bool)

(declare-fun Unit!9515 () Unit!9507)

(assert (=> b!151065 (= e!100879 Unit!9515)))

(declare-fun b!151066 () Bool)

(declare-fun lt!236490 () Unit!9507)

(assert (=> b!151066 (= e!100879 lt!236490)))

(declare-fun lt!236487 () (_ BitVec 64))

(assert (=> b!151066 (= lt!236487 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!236483 () (_ BitVec 64))

(assert (=> b!151066 (= lt!236483 (bitIndex!0 (size!3049 (buf!3536 thiss!1634)) (currentByte!6462 thiss!1634) (currentBit!6457 thiss!1634)))))

(assert (=> b!151066 (= lt!236490 (arrayBitRangesEqSymmetric!0 (buf!3536 thiss!1634) (buf!3536 (_2!7112 lt!236104)) lt!236487 lt!236483))))

(assert (=> b!151066 (arrayBitRangesEq!0 (buf!3536 (_2!7112 lt!236104)) (buf!3536 thiss!1634) lt!236487 lt!236483)))

(assert (= (and d!49210 c!8076) b!151066))

(assert (= (and d!49210 (not c!8076)) b!151065))

(assert (= (and d!49210 res!126668) b!151063))

(assert (= (and b!151063 res!126669) b!151062))

(assert (= (and b!151062 res!126667) b!151064))

(assert (=> b!151066 m!235469))

(declare-fun m!235839 () Bool)

(assert (=> b!151066 m!235839))

(declare-fun m!235841 () Bool)

(assert (=> b!151066 m!235841))

(declare-fun m!235843 () Bool)

(assert (=> b!151063 m!235843))

(declare-fun m!235845 () Bool)

(assert (=> b!151062 m!235845))

(declare-fun m!235847 () Bool)

(assert (=> b!151064 m!235847))

(assert (=> b!151064 m!235485))

(assert (=> b!151064 m!235469))

(assert (=> d!49210 m!235719))

(declare-fun m!235849 () Bool)

(assert (=> d!49210 m!235849))

(assert (=> d!49210 m!235753))

(assert (=> d!49210 m!235725))

(assert (=> d!49210 m!235755))

(assert (=> d!49210 m!235431))

(declare-fun m!235851 () Bool)

(assert (=> d!49210 m!235851))

(declare-fun m!235853 () Bool)

(assert (=> d!49210 m!235853))

(declare-fun m!235855 () Bool)

(assert (=> d!49210 m!235855))

(declare-fun m!235857 () Bool)

(assert (=> d!49210 m!235857))

(declare-fun m!235859 () Bool)

(assert (=> d!49210 m!235859))

(assert (=> b!150902 d!49210))

(declare-fun d!49214 () Bool)

(declare-fun res!126670 () Bool)

(declare-fun e!100880 () Bool)

(assert (=> d!49214 (=> res!126670 e!100880)))

(assert (=> d!49214 (= res!126670 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!49214 (= (arrayRangesEq!365 (_2!7111 lt!236085) (_2!7111 lt!236092) #b00000000000000000000000000000000 to!404) e!100880)))

(declare-fun b!151067 () Bool)

(declare-fun e!100881 () Bool)

(assert (=> b!151067 (= e!100880 e!100881)))

(declare-fun res!126671 () Bool)

(assert (=> b!151067 (=> (not res!126671) (not e!100881))))

(assert (=> b!151067 (= res!126671 (= (select (arr!3851 (_2!7111 lt!236085)) #b00000000000000000000000000000000) (select (arr!3851 (_2!7111 lt!236092)) #b00000000000000000000000000000000)))))

(declare-fun b!151068 () Bool)

(assert (=> b!151068 (= e!100881 (arrayRangesEq!365 (_2!7111 lt!236085) (_2!7111 lt!236092) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!49214 (not res!126670)) b!151067))

(assert (= (and b!151067 res!126671) b!151068))

(assert (=> b!151067 m!235787))

(declare-fun m!235861 () Bool)

(assert (=> b!151067 m!235861))

(declare-fun m!235863 () Bool)

(assert (=> b!151068 m!235863))

(assert (=> b!150902 d!49214))

(declare-fun d!49216 () Bool)

(declare-fun res!126678 () Bool)

(declare-fun e!100887 () Bool)

(assert (=> d!49216 (=> (not res!126678) (not e!100887))))

(assert (=> d!49216 (= res!126678 (= (size!3049 (buf!3536 thiss!1634)) (size!3049 (buf!3536 (_2!7112 lt!236104)))))))

(assert (=> d!49216 (= (isPrefixOf!0 thiss!1634 (_2!7112 lt!236104)) e!100887)))

(declare-fun b!151075 () Bool)

(declare-fun res!126680 () Bool)

(assert (=> b!151075 (=> (not res!126680) (not e!100887))))

(assert (=> b!151075 (= res!126680 (bvsle (bitIndex!0 (size!3049 (buf!3536 thiss!1634)) (currentByte!6462 thiss!1634) (currentBit!6457 thiss!1634)) (bitIndex!0 (size!3049 (buf!3536 (_2!7112 lt!236104))) (currentByte!6462 (_2!7112 lt!236104)) (currentBit!6457 (_2!7112 lt!236104)))))))

(declare-fun b!151076 () Bool)

(declare-fun e!100886 () Bool)

(assert (=> b!151076 (= e!100887 e!100886)))

(declare-fun res!126679 () Bool)

(assert (=> b!151076 (=> res!126679 e!100886)))

(assert (=> b!151076 (= res!126679 (= (size!3049 (buf!3536 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!151077 () Bool)

(assert (=> b!151077 (= e!100886 (arrayBitRangesEq!0 (buf!3536 thiss!1634) (buf!3536 (_2!7112 lt!236104)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3049 (buf!3536 thiss!1634)) (currentByte!6462 thiss!1634) (currentBit!6457 thiss!1634))))))

(assert (= (and d!49216 res!126678) b!151075))

(assert (= (and b!151075 res!126680) b!151076))

(assert (= (and b!151076 (not res!126679)) b!151077))

(assert (=> b!151075 m!235469))

(assert (=> b!151075 m!235485))

(assert (=> b!151077 m!235469))

(assert (=> b!151077 m!235469))

(declare-fun m!235867 () Bool)

(assert (=> b!151077 m!235867))

(assert (=> b!150902 d!49216))

(declare-fun d!49220 () Bool)

(declare-fun e!100890 () Bool)

(assert (=> d!49220 e!100890))

(declare-fun res!126683 () Bool)

(assert (=> d!49220 (=> (not res!126683) (not e!100890))))

(declare-fun lt!236512 () tuple2!13488)

(declare-fun lt!236514 () tuple2!13488)

(assert (=> d!49220 (= res!126683 (= (bitIndex!0 (size!3049 (buf!3536 (_1!7114 lt!236512))) (currentByte!6462 (_1!7114 lt!236512)) (currentBit!6457 (_1!7114 lt!236512))) (bitIndex!0 (size!3049 (buf!3536 (_1!7114 lt!236514))) (currentByte!6462 (_1!7114 lt!236514)) (currentBit!6457 (_1!7114 lt!236514)))))))

(declare-fun lt!236513 () Unit!9507)

(declare-fun lt!236511 () BitStream!5356)

(declare-fun choose!14 (BitStream!5356 BitStream!5356 BitStream!5356 tuple2!13488 tuple2!13488 BitStream!5356 (_ BitVec 8) tuple2!13488 tuple2!13488 BitStream!5356 (_ BitVec 8)) Unit!9507)

(assert (=> d!49220 (= lt!236513 (choose!14 lt!236099 (_2!7112 lt!236104) lt!236511 lt!236512 (tuple2!13489 (_1!7114 lt!236512) (_2!7114 lt!236512)) (_1!7114 lt!236512) (_2!7114 lt!236512) lt!236514 (tuple2!13489 (_1!7114 lt!236514) (_2!7114 lt!236514)) (_1!7114 lt!236514) (_2!7114 lt!236514)))))

(assert (=> d!49220 (= lt!236514 (readBytePure!0 lt!236511))))

(assert (=> d!49220 (= lt!236512 (readBytePure!0 lt!236099))))

(assert (=> d!49220 (= lt!236511 (BitStream!5357 (buf!3536 (_2!7112 lt!236104)) (currentByte!6462 lt!236099) (currentBit!6457 lt!236099)))))

(assert (=> d!49220 (= (readBytePrefixLemma!0 lt!236099 (_2!7112 lt!236104)) lt!236513)))

(declare-fun b!151080 () Bool)

(assert (=> b!151080 (= e!100890 (= (_2!7114 lt!236512) (_2!7114 lt!236514)))))

(assert (= (and d!49220 res!126683) b!151080))

(declare-fun m!235871 () Bool)

(assert (=> d!49220 m!235871))

(declare-fun m!235873 () Bool)

(assert (=> d!49220 m!235873))

(assert (=> d!49220 m!235413))

(declare-fun m!235875 () Bool)

(assert (=> d!49220 m!235875))

(declare-fun m!235877 () Bool)

(assert (=> d!49220 m!235877))

(assert (=> b!150902 d!49220))

(declare-fun d!49224 () Bool)

(assert (=> d!49224 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3049 (buf!3536 (_2!7112 lt!236104)))) ((_ sign_extend 32) (currentByte!6462 (_2!7112 lt!236100))) ((_ sign_extend 32) (currentBit!6457 (_2!7112 lt!236100))) lt!236110)))

(declare-fun lt!236515 () Unit!9507)

(assert (=> d!49224 (= lt!236515 (choose!26 (_2!7112 lt!236100) (buf!3536 (_2!7112 lt!236104)) lt!236110 (BitStream!5357 (buf!3536 (_2!7112 lt!236104)) (currentByte!6462 (_2!7112 lt!236100)) (currentBit!6457 (_2!7112 lt!236100)))))))

(assert (=> d!49224 (= (validateOffsetBytesContentIrrelevancyLemma!0 (_2!7112 lt!236100) (buf!3536 (_2!7112 lt!236104)) lt!236110) lt!236515)))

(declare-fun bs!12039 () Bool)

(assert (= bs!12039 d!49224))

(assert (=> bs!12039 m!235401))

(declare-fun m!235879 () Bool)

(assert (=> bs!12039 m!235879))

(assert (=> b!150902 d!49224))

(declare-fun b!151168 () Bool)

(declare-fun lt!236735 () tuple2!13482)

(declare-fun e!100943 () Bool)

(assert (=> b!151168 (= e!100943 (arrayRangesEq!365 arr!237 (_2!7111 lt!236735) #b00000000000000000000000000000000 to!404))))

(declare-fun b!151169 () Bool)

(declare-fun e!100942 () Bool)

(assert (=> b!151169 (= e!100942 e!100943)))

(declare-fun res!126759 () Bool)

(assert (=> b!151169 (=> (not res!126759) (not e!100943))))

(declare-fun lt!236734 () tuple2!13486)

(assert (=> b!151169 (= res!126759 (and (= (size!3049 (_2!7111 lt!236735)) (size!3049 arr!237)) (= (_1!7111 lt!236735) (_2!7113 lt!236734))))))

(assert (=> b!151169 (= lt!236735 (readByteArrayLoopPure!0 (_1!7113 lt!236734) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!236739 () Unit!9507)

(declare-fun lt!236737 () Unit!9507)

(assert (=> b!151169 (= lt!236739 lt!236737)))

(declare-fun lt!236736 () tuple2!13484)

(declare-fun lt!236740 () (_ BitVec 64))

(assert (=> b!151169 (validate_offset_bits!1 ((_ sign_extend 32) (size!3049 (buf!3536 (_2!7112 lt!236736)))) ((_ sign_extend 32) (currentByte!6462 (_2!7112 lt!236100))) ((_ sign_extend 32) (currentBit!6457 (_2!7112 lt!236100))) lt!236740)))

(assert (=> b!151169 (= lt!236737 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!7112 lt!236100) (buf!3536 (_2!7112 lt!236736)) lt!236740))))

(declare-fun e!100941 () Bool)

(assert (=> b!151169 e!100941))

(declare-fun res!126756 () Bool)

(assert (=> b!151169 (=> (not res!126756) (not e!100941))))

(assert (=> b!151169 (= res!126756 (and (= (size!3049 (buf!3536 (_2!7112 lt!236100))) (size!3049 (buf!3536 (_2!7112 lt!236736)))) (bvsge lt!236740 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!151169 (= lt!236740 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!151169 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!151169 (= lt!236734 (reader!0 (_2!7112 lt!236100) (_2!7112 lt!236736)))))

(declare-fun b!151170 () Bool)

(declare-fun res!126755 () Bool)

(assert (=> b!151170 (=> (not res!126755) (not e!100942))))

(declare-fun lt!236733 () (_ BitVec 64))

(declare-fun lt!236741 () (_ BitVec 64))

(assert (=> b!151170 (= res!126755 (= (bitIndex!0 (size!3049 (buf!3536 (_2!7112 lt!236736))) (currentByte!6462 (_2!7112 lt!236736)) (currentBit!6457 (_2!7112 lt!236736))) (bvadd lt!236733 lt!236741)))))

(assert (=> b!151170 (or (not (= (bvand lt!236733 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!236741 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!236733 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!236733 lt!236741) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!236738 () (_ BitVec 64))

(assert (=> b!151170 (= lt!236741 (bvmul lt!236738 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!151170 (or (= lt!236738 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!236738 #b0000000000000000000000000000000000000000000000000000000000001000) lt!236738)))))

(assert (=> b!151170 (= lt!236738 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!151170 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!151170 (= lt!236733 (bitIndex!0 (size!3049 (buf!3536 (_2!7112 lt!236100))) (currentByte!6462 (_2!7112 lt!236100)) (currentBit!6457 (_2!7112 lt!236100))))))

(declare-fun d!49226 () Bool)

(assert (=> d!49226 e!100942))

(declare-fun res!126757 () Bool)

(assert (=> d!49226 (=> (not res!126757) (not e!100942))))

(assert (=> d!49226 (= res!126757 (= (size!3049 (buf!3536 (_2!7112 lt!236100))) (size!3049 (buf!3536 (_2!7112 lt!236736)))))))

(declare-fun choose!64 (BitStream!5356 array!6740 (_ BitVec 32) (_ BitVec 32)) tuple2!13484)

(assert (=> d!49226 (= lt!236736 (choose!64 (_2!7112 lt!236100) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!49226 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!3049 arr!237)))))

(assert (=> d!49226 (= (appendByteArrayLoop!0 (_2!7112 lt!236100) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!236736)))

(declare-fun b!151171 () Bool)

(assert (=> b!151171 (= e!100941 (validate_offset_bits!1 ((_ sign_extend 32) (size!3049 (buf!3536 (_2!7112 lt!236100)))) ((_ sign_extend 32) (currentByte!6462 (_2!7112 lt!236100))) ((_ sign_extend 32) (currentBit!6457 (_2!7112 lt!236100))) lt!236740))))

(declare-fun b!151172 () Bool)

(declare-fun res!126758 () Bool)

(assert (=> b!151172 (=> (not res!126758) (not e!100942))))

(assert (=> b!151172 (= res!126758 (isPrefixOf!0 (_2!7112 lt!236100) (_2!7112 lt!236736)))))

(assert (= (and d!49226 res!126757) b!151170))

(assert (= (and b!151170 res!126755) b!151172))

(assert (= (and b!151172 res!126758) b!151169))

(assert (= (and b!151169 res!126756) b!151171))

(assert (= (and b!151169 res!126759) b!151168))

(declare-fun m!236043 () Bool)

(assert (=> d!49226 m!236043))

(declare-fun m!236045 () Bool)

(assert (=> b!151171 m!236045))

(declare-fun m!236047 () Bool)

(assert (=> b!151168 m!236047))

(declare-fun m!236049 () Bool)

(assert (=> b!151172 m!236049))

(declare-fun m!236051 () Bool)

(assert (=> b!151169 m!236051))

(declare-fun m!236053 () Bool)

(assert (=> b!151169 m!236053))

(declare-fun m!236055 () Bool)

(assert (=> b!151169 m!236055))

(declare-fun m!236057 () Bool)

(assert (=> b!151169 m!236057))

(declare-fun m!236059 () Bool)

(assert (=> b!151170 m!236059))

(assert (=> b!151170 m!235467))

(assert (=> b!150902 d!49226))

(declare-fun d!49290 () Bool)

(declare-fun e!100954 () Bool)

(assert (=> d!49290 e!100954))

(declare-fun res!126782 () Bool)

(assert (=> d!49290 (=> (not res!126782) (not e!100954))))

(declare-fun lt!236810 () tuple2!13484)

(assert (=> d!49290 (= res!126782 (= (size!3049 (buf!3536 thiss!1634)) (size!3049 (buf!3536 (_2!7112 lt!236810)))))))

(declare-fun choose!6 (BitStream!5356 (_ BitVec 8)) tuple2!13484)

(assert (=> d!49290 (= lt!236810 (choose!6 thiss!1634 (select (arr!3851 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!49290 (validate_offset_byte!0 ((_ sign_extend 32) (size!3049 (buf!3536 thiss!1634))) ((_ sign_extend 32) (currentByte!6462 thiss!1634)) ((_ sign_extend 32) (currentBit!6457 thiss!1634)))))

(assert (=> d!49290 (= (appendByte!0 thiss!1634 (select (arr!3851 arr!237) from!447)) lt!236810)))

(declare-fun b!151195 () Bool)

(declare-fun res!126781 () Bool)

(assert (=> b!151195 (=> (not res!126781) (not e!100954))))

(declare-fun lt!236813 () (_ BitVec 64))

(declare-fun lt!236812 () (_ BitVec 64))

(assert (=> b!151195 (= res!126781 (= (bitIndex!0 (size!3049 (buf!3536 (_2!7112 lt!236810))) (currentByte!6462 (_2!7112 lt!236810)) (currentBit!6457 (_2!7112 lt!236810))) (bvadd lt!236813 lt!236812)))))

(assert (=> b!151195 (or (not (= (bvand lt!236813 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!236812 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!236813 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!236813 lt!236812) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!151195 (= lt!236812 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!151195 (= lt!236813 (bitIndex!0 (size!3049 (buf!3536 thiss!1634)) (currentByte!6462 thiss!1634) (currentBit!6457 thiss!1634)))))

(declare-fun b!151196 () Bool)

(declare-fun res!126780 () Bool)

(assert (=> b!151196 (=> (not res!126780) (not e!100954))))

(assert (=> b!151196 (= res!126780 (isPrefixOf!0 thiss!1634 (_2!7112 lt!236810)))))

(declare-fun lt!236811 () tuple2!13488)

(declare-fun b!151197 () Bool)

(declare-fun lt!236809 () tuple2!13486)

(assert (=> b!151197 (= e!100954 (and (= (_2!7114 lt!236811) (select (arr!3851 arr!237) from!447)) (= (_1!7114 lt!236811) (_2!7113 lt!236809))))))

(assert (=> b!151197 (= lt!236811 (readBytePure!0 (_1!7113 lt!236809)))))

(assert (=> b!151197 (= lt!236809 (reader!0 thiss!1634 (_2!7112 lt!236810)))))

(assert (= (and d!49290 res!126782) b!151195))

(assert (= (and b!151195 res!126781) b!151196))

(assert (= (and b!151196 res!126780) b!151197))

(assert (=> d!49290 m!235447))

(declare-fun m!236105 () Bool)

(assert (=> d!49290 m!236105))

(declare-fun m!236107 () Bool)

(assert (=> d!49290 m!236107))

(declare-fun m!236109 () Bool)

(assert (=> b!151195 m!236109))

(assert (=> b!151195 m!235469))

(declare-fun m!236111 () Bool)

(assert (=> b!151196 m!236111))

(declare-fun m!236113 () Bool)

(assert (=> b!151197 m!236113))

(declare-fun m!236115 () Bool)

(assert (=> b!151197 m!236115))

(assert (=> b!150902 d!49290))

(declare-fun d!49314 () Bool)

(declare-fun lt!236816 () tuple2!13506)

(assert (=> d!49314 (= lt!236816 (readByte!0 (BitStream!5357 (buf!3536 (_2!7112 lt!236104)) (currentByte!6462 thiss!1634) (currentBit!6457 thiss!1634))))))

(assert (=> d!49314 (= (readBytePure!0 (BitStream!5357 (buf!3536 (_2!7112 lt!236104)) (currentByte!6462 thiss!1634) (currentBit!6457 thiss!1634))) (tuple2!13489 (_2!7123 lt!236816) (_1!7123 lt!236816)))))

(declare-fun bs!12060 () Bool)

(assert (= bs!12060 d!49314))

(declare-fun m!236117 () Bool)

(assert (=> bs!12060 m!236117))

(assert (=> b!150902 d!49314))

(declare-fun d!49316 () Bool)

(declare-fun e!100955 () Bool)

(assert (=> d!49316 e!100955))

(declare-fun res!126784 () Bool)

(assert (=> d!49316 (=> (not res!126784) (not e!100955))))

(declare-fun lt!236823 () (_ BitVec 64))

(declare-fun lt!236824 () (_ BitVec 64))

(declare-fun lt!236820 () (_ BitVec 64))

(assert (=> d!49316 (= res!126784 (= lt!236823 (bvsub lt!236824 lt!236820)))))

(assert (=> d!49316 (or (= (bvand lt!236824 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!236820 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!236824 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!236824 lt!236820) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!49316 (= lt!236820 (remainingBits!0 ((_ sign_extend 32) (size!3049 (buf!3536 (_2!7112 lt!236104)))) ((_ sign_extend 32) (currentByte!6462 (_2!7112 lt!236104))) ((_ sign_extend 32) (currentBit!6457 (_2!7112 lt!236104)))))))

(declare-fun lt!236822 () (_ BitVec 64))

(declare-fun lt!236821 () (_ BitVec 64))

(assert (=> d!49316 (= lt!236824 (bvmul lt!236822 lt!236821))))

(assert (=> d!49316 (or (= lt!236822 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!236821 (bvsdiv (bvmul lt!236822 lt!236821) lt!236822)))))

(assert (=> d!49316 (= lt!236821 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!49316 (= lt!236822 ((_ sign_extend 32) (size!3049 (buf!3536 (_2!7112 lt!236104)))))))

(assert (=> d!49316 (= lt!236823 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6462 (_2!7112 lt!236104))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6457 (_2!7112 lt!236104)))))))

(assert (=> d!49316 (invariant!0 (currentBit!6457 (_2!7112 lt!236104)) (currentByte!6462 (_2!7112 lt!236104)) (size!3049 (buf!3536 (_2!7112 lt!236104))))))

(assert (=> d!49316 (= (bitIndex!0 (size!3049 (buf!3536 (_2!7112 lt!236104))) (currentByte!6462 (_2!7112 lt!236104)) (currentBit!6457 (_2!7112 lt!236104))) lt!236823)))

(declare-fun b!151198 () Bool)

(declare-fun res!126783 () Bool)

(assert (=> b!151198 (=> (not res!126783) (not e!100955))))

(assert (=> b!151198 (= res!126783 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!236823))))

(declare-fun b!151199 () Bool)

(declare-fun lt!236819 () (_ BitVec 64))

(assert (=> b!151199 (= e!100955 (bvsle lt!236823 (bvmul lt!236819 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!151199 (or (= lt!236819 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!236819 #b0000000000000000000000000000000000000000000000000000000000001000) lt!236819)))))

(assert (=> b!151199 (= lt!236819 ((_ sign_extend 32) (size!3049 (buf!3536 (_2!7112 lt!236104)))))))

(assert (= (and d!49316 res!126784) b!151198))

(assert (= (and b!151198 res!126783) b!151199))

(declare-fun m!236119 () Bool)

(assert (=> d!49316 m!236119))

(declare-fun m!236121 () Bool)

(assert (=> d!49316 m!236121))

(assert (=> b!150891 d!49316))

(assert (=> b!150891 d!49139))

(declare-fun d!49318 () Bool)

(declare-fun res!126787 () Bool)

(declare-fun e!100959 () Bool)

(assert (=> d!49318 (=> (not res!126787) (not e!100959))))

(assert (=> d!49318 (= res!126787 (= (size!3049 (buf!3536 (_2!7112 lt!236100))) (size!3049 (buf!3536 (_2!7112 lt!236104)))))))

(assert (=> d!49318 (= (isPrefixOf!0 (_2!7112 lt!236100) (_2!7112 lt!236104)) e!100959)))

(declare-fun b!151202 () Bool)

(declare-fun res!126789 () Bool)

(assert (=> b!151202 (=> (not res!126789) (not e!100959))))

(assert (=> b!151202 (= res!126789 (bvsle (bitIndex!0 (size!3049 (buf!3536 (_2!7112 lt!236100))) (currentByte!6462 (_2!7112 lt!236100)) (currentBit!6457 (_2!7112 lt!236100))) (bitIndex!0 (size!3049 (buf!3536 (_2!7112 lt!236104))) (currentByte!6462 (_2!7112 lt!236104)) (currentBit!6457 (_2!7112 lt!236104)))))))

(declare-fun b!151203 () Bool)

(declare-fun e!100958 () Bool)

(assert (=> b!151203 (= e!100959 e!100958)))

(declare-fun res!126788 () Bool)

(assert (=> b!151203 (=> res!126788 e!100958)))

(assert (=> b!151203 (= res!126788 (= (size!3049 (buf!3536 (_2!7112 lt!236100))) #b00000000000000000000000000000000))))

(declare-fun b!151204 () Bool)

(assert (=> b!151204 (= e!100958 (arrayBitRangesEq!0 (buf!3536 (_2!7112 lt!236100)) (buf!3536 (_2!7112 lt!236104)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3049 (buf!3536 (_2!7112 lt!236100))) (currentByte!6462 (_2!7112 lt!236100)) (currentBit!6457 (_2!7112 lt!236100)))))))

(assert (= (and d!49318 res!126787) b!151202))

(assert (= (and b!151202 res!126789) b!151203))

(assert (= (and b!151203 (not res!126788)) b!151204))

(assert (=> b!151202 m!235467))

(assert (=> b!151202 m!235485))

(assert (=> b!151204 m!235467))

(assert (=> b!151204 m!235467))

(declare-fun m!236123 () Bool)

(assert (=> b!151204 m!236123))

(assert (=> b!150890 d!49318))

(declare-fun d!49320 () Bool)

(assert (=> d!49320 (= (invariant!0 (currentBit!6457 thiss!1634) (currentByte!6462 thiss!1634) (size!3049 (buf!3536 (_2!7112 lt!236100)))) (and (bvsge (currentBit!6457 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6457 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6462 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6462 thiss!1634) (size!3049 (buf!3536 (_2!7112 lt!236100)))) (and (= (currentBit!6457 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6462 thiss!1634) (size!3049 (buf!3536 (_2!7112 lt!236100))))))))))

(assert (=> b!150900 d!49320))

(declare-fun d!49322 () Bool)

(assert (=> d!49322 (= (array_inv!2838 arr!237) (bvsge (size!3049 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!29076 d!49322))

(declare-fun d!49324 () Bool)

(assert (=> d!49324 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6457 thiss!1634) (currentByte!6462 thiss!1634) (size!3049 (buf!3536 thiss!1634))))))

(declare-fun bs!12062 () Bool)

(assert (= bs!12062 d!49324))

(assert (=> bs!12062 m!235455))

(assert (=> start!29076 d!49324))

(assert (=> b!150889 d!49316))

(assert (=> b!150889 d!49141))

(declare-fun d!49330 () Bool)

(declare-fun lt!236835 () tuple3!594)

(assert (=> d!49330 (= lt!236835 (readByteArrayLoop!0 (_1!7113 lt!236087) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!49330 (= (readByteArrayLoopPure!0 (_1!7113 lt!236087) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!13483 (_2!7124 lt!236835) (_3!370 lt!236835)))))

(declare-fun bs!12064 () Bool)

(assert (= bs!12064 d!49330))

(declare-fun m!236137 () Bool)

(assert (=> bs!12064 m!236137))

(assert (=> b!150899 d!49330))

(declare-fun d!49334 () Bool)

(assert (=> d!49334 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3049 (buf!3536 (_2!7112 lt!236104)))) ((_ sign_extend 32) (currentByte!6462 (_2!7112 lt!236100))) ((_ sign_extend 32) (currentBit!6457 (_2!7112 lt!236100))) lt!236093) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3049 (buf!3536 (_2!7112 lt!236104)))) ((_ sign_extend 32) (currentByte!6462 (_2!7112 lt!236100))) ((_ sign_extend 32) (currentBit!6457 (_2!7112 lt!236100)))) lt!236093))))

(declare-fun bs!12065 () Bool)

(assert (= bs!12065 d!49334))

(assert (=> bs!12065 m!235773))

(assert (=> b!150899 d!49334))

(declare-fun d!49338 () Bool)

(assert (=> d!49338 (validate_offset_bits!1 ((_ sign_extend 32) (size!3049 (buf!3536 (_2!7112 lt!236104)))) ((_ sign_extend 32) (currentByte!6462 (_2!7112 lt!236100))) ((_ sign_extend 32) (currentBit!6457 (_2!7112 lt!236100))) lt!236093)))

(declare-fun lt!236838 () Unit!9507)

(declare-fun choose!9 (BitStream!5356 array!6740 (_ BitVec 64) BitStream!5356) Unit!9507)

(assert (=> d!49338 (= lt!236838 (choose!9 (_2!7112 lt!236100) (buf!3536 (_2!7112 lt!236104)) lt!236093 (BitStream!5357 (buf!3536 (_2!7112 lt!236104)) (currentByte!6462 (_2!7112 lt!236100)) (currentBit!6457 (_2!7112 lt!236100)))))))

(assert (=> d!49338 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!7112 lt!236100) (buf!3536 (_2!7112 lt!236104)) lt!236093) lt!236838)))

(declare-fun bs!12066 () Bool)

(assert (= bs!12066 d!49338))

(assert (=> bs!12066 m!235473))

(declare-fun m!236141 () Bool)

(assert (=> bs!12066 m!236141))

(assert (=> b!150899 d!49338))

(assert (=> b!150899 d!49151))

(declare-fun d!49340 () Bool)

(assert (=> d!49340 (= (invariant!0 (currentBit!6457 thiss!1634) (currentByte!6462 thiss!1634) (size!3049 (buf!3536 thiss!1634))) (and (bvsge (currentBit!6457 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6457 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6462 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6462 thiss!1634) (size!3049 (buf!3536 thiss!1634))) (and (= (currentBit!6457 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6462 thiss!1634) (size!3049 (buf!3536 thiss!1634)))))))))

(assert (=> b!150888 d!49340))

(declare-fun d!49342 () Bool)

(declare-fun res!126794 () Bool)

(declare-fun e!100963 () Bool)

(assert (=> d!49342 (=> res!126794 e!100963)))

(assert (=> d!49342 (= res!126794 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!49342 (= (arrayRangesEq!365 arr!237 (_2!7111 lt!236085) #b00000000000000000000000000000000 to!404) e!100963)))

(declare-fun b!151209 () Bool)

(declare-fun e!100964 () Bool)

(assert (=> b!151209 (= e!100963 e!100964)))

(declare-fun res!126795 () Bool)

(assert (=> b!151209 (=> (not res!126795) (not e!100964))))

(assert (=> b!151209 (= res!126795 (= (select (arr!3851 arr!237) #b00000000000000000000000000000000) (select (arr!3851 (_2!7111 lt!236085)) #b00000000000000000000000000000000)))))

(declare-fun b!151210 () Bool)

(assert (=> b!151210 (= e!100964 (arrayRangesEq!365 arr!237 (_2!7111 lt!236085) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!49342 (not res!126794)) b!151209))

(assert (= (and b!151209 res!126795) b!151210))

(declare-fun m!236143 () Bool)

(assert (=> b!151209 m!236143))

(assert (=> b!151209 m!235787))

(declare-fun m!236145 () Bool)

(assert (=> b!151210 m!236145))

(assert (=> b!150898 d!49342))

(declare-fun d!49344 () Bool)

(assert (=> d!49344 (arrayRangesEq!365 arr!237 (_2!7111 lt!236085) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!236841 () Unit!9507)

(declare-fun choose!100 (array!6740 array!6740 array!6740 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9507)

(assert (=> d!49344 (= lt!236841 (choose!100 arr!237 (_2!7111 lt!236097) (_2!7111 lt!236085) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> d!49344 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 to!404) (bvsle to!404 to!404))))

(assert (=> d!49344 (= (arrayRangesEqTransitive!80 arr!237 (_2!7111 lt!236097) (_2!7111 lt!236085) #b00000000000000000000000000000000 to!404 to!404) lt!236841)))

(declare-fun bs!12067 () Bool)

(assert (= bs!12067 d!49344))

(assert (=> bs!12067 m!235457))

(declare-fun m!236147 () Bool)

(assert (=> bs!12067 m!236147))

(assert (=> b!150898 d!49344))

(declare-fun d!49346 () Bool)

(declare-fun res!126796 () Bool)

(declare-fun e!100965 () Bool)

(assert (=> d!49346 (=> res!126796 e!100965)))

(assert (=> d!49346 (= res!126796 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!49346 (= (arrayRangesEq!365 (_2!7111 lt!236097) (_2!7111 lt!236085) #b00000000000000000000000000000000 to!404) e!100965)))

(declare-fun b!151211 () Bool)

(declare-fun e!100966 () Bool)

(assert (=> b!151211 (= e!100965 e!100966)))

(declare-fun res!126797 () Bool)

(assert (=> b!151211 (=> (not res!126797) (not e!100966))))

(assert (=> b!151211 (= res!126797 (= (select (arr!3851 (_2!7111 lt!236097)) #b00000000000000000000000000000000) (select (arr!3851 (_2!7111 lt!236085)) #b00000000000000000000000000000000)))))

(declare-fun b!151212 () Bool)

(assert (=> b!151212 (= e!100966 (arrayRangesEq!365 (_2!7111 lt!236097) (_2!7111 lt!236085) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!49346 (not res!126796)) b!151211))

(assert (= (and b!151211 res!126797) b!151212))

(assert (=> b!151211 m!235789))

(assert (=> b!151211 m!235787))

(declare-fun m!236149 () Bool)

(assert (=> b!151212 m!236149))

(assert (=> b!150898 d!49346))

(declare-fun d!49348 () Bool)

(assert (=> d!49348 (arrayRangesEq!365 (_2!7111 lt!236097) (_2!7111 lt!236085) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!236844 () Unit!9507)

(declare-fun choose!101 (array!6740 array!6740 (_ BitVec 32) (_ BitVec 32)) Unit!9507)

(assert (=> d!49348 (= lt!236844 (choose!101 (_2!7111 lt!236085) (_2!7111 lt!236097) #b00000000000000000000000000000000 to!404))))

(assert (=> d!49348 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 to!404) (bvsle to!404 (size!3049 (_2!7111 lt!236085))))))

(assert (=> d!49348 (= (arrayRangesEqSymmetricLemma!97 (_2!7111 lt!236085) (_2!7111 lt!236097) #b00000000000000000000000000000000 to!404) lt!236844)))

(declare-fun bs!12068 () Bool)

(assert (= bs!12068 d!49348))

(assert (=> bs!12068 m!235461))

(declare-fun m!236151 () Bool)

(assert (=> bs!12068 m!236151))

(assert (=> b!150898 d!49348))

(declare-fun d!49350 () Bool)

(declare-fun res!126798 () Bool)

(declare-fun e!100967 () Bool)

(assert (=> d!49350 (=> res!126798 e!100967)))

(assert (=> d!49350 (= res!126798 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!49350 (= (arrayRangesEq!365 arr!237 (_2!7111 lt!236086) #b00000000000000000000000000000000 to!404) e!100967)))

(declare-fun b!151213 () Bool)

(declare-fun e!100968 () Bool)

(assert (=> b!151213 (= e!100967 e!100968)))

(declare-fun res!126799 () Bool)

(assert (=> b!151213 (=> (not res!126799) (not e!100968))))

(assert (=> b!151213 (= res!126799 (= (select (arr!3851 arr!237) #b00000000000000000000000000000000) (select (arr!3851 (_2!7111 lt!236086)) #b00000000000000000000000000000000)))))

(declare-fun b!151214 () Bool)

(assert (=> b!151214 (= e!100968 (arrayRangesEq!365 arr!237 (_2!7111 lt!236086) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!49350 (not res!126798)) b!151213))

(assert (= (and b!151213 res!126799) b!151214))

(assert (=> b!151213 m!236143))

(declare-fun m!236153 () Bool)

(assert (=> b!151213 m!236153))

(declare-fun m!236155 () Bool)

(assert (=> b!151214 m!236155))

(assert (=> b!150887 d!49350))

(declare-fun d!49352 () Bool)

(assert (=> d!49352 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3049 (buf!3536 (_2!7112 lt!236104)))) ((_ sign_extend 32) (currentByte!6462 thiss!1634)) ((_ sign_extend 32) (currentBit!6457 thiss!1634)) lt!236098) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3049 (buf!3536 (_2!7112 lt!236104)))) ((_ sign_extend 32) (currentByte!6462 thiss!1634)) ((_ sign_extend 32) (currentBit!6457 thiss!1634))) lt!236098))))

(declare-fun bs!12069 () Bool)

(assert (= bs!12069 d!49352))

(assert (=> bs!12069 m!235779))

(assert (=> b!150897 d!49352))

(declare-fun d!49354 () Bool)

(assert (=> d!49354 (validate_offset_bits!1 ((_ sign_extend 32) (size!3049 (buf!3536 (_2!7112 lt!236104)))) ((_ sign_extend 32) (currentByte!6462 thiss!1634)) ((_ sign_extend 32) (currentBit!6457 thiss!1634)) lt!236098)))

(declare-fun lt!236845 () Unit!9507)

(assert (=> d!49354 (= lt!236845 (choose!9 thiss!1634 (buf!3536 (_2!7112 lt!236104)) lt!236098 (BitStream!5357 (buf!3536 (_2!7112 lt!236104)) (currentByte!6462 thiss!1634) (currentBit!6457 thiss!1634))))))

(assert (=> d!49354 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1634 (buf!3536 (_2!7112 lt!236104)) lt!236098) lt!236845)))

(declare-fun bs!12070 () Bool)

(assert (= bs!12070 d!49354))

(assert (=> bs!12070 m!235493))

(declare-fun m!236157 () Bool)

(assert (=> bs!12070 m!236157))

(assert (=> b!150897 d!49354))

(declare-fun d!49356 () Bool)

(assert (=> d!49356 (= (array_inv!2838 (buf!3536 thiss!1634)) (bvsge (size!3049 (buf!3536 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!150886 d!49356))

(declare-fun d!49358 () Bool)

(declare-fun res!126800 () Bool)

(declare-fun e!100970 () Bool)

(assert (=> d!49358 (=> (not res!126800) (not e!100970))))

(assert (=> d!49358 (= res!126800 (= (size!3049 (buf!3536 thiss!1634)) (size!3049 (buf!3536 (_2!7112 lt!236100)))))))

(assert (=> d!49358 (= (isPrefixOf!0 thiss!1634 (_2!7112 lt!236100)) e!100970)))

(declare-fun b!151215 () Bool)

(declare-fun res!126802 () Bool)

(assert (=> b!151215 (=> (not res!126802) (not e!100970))))

(assert (=> b!151215 (= res!126802 (bvsle (bitIndex!0 (size!3049 (buf!3536 thiss!1634)) (currentByte!6462 thiss!1634) (currentBit!6457 thiss!1634)) (bitIndex!0 (size!3049 (buf!3536 (_2!7112 lt!236100))) (currentByte!6462 (_2!7112 lt!236100)) (currentBit!6457 (_2!7112 lt!236100)))))))

(declare-fun b!151216 () Bool)

(declare-fun e!100969 () Bool)

(assert (=> b!151216 (= e!100970 e!100969)))

(declare-fun res!126801 () Bool)

(assert (=> b!151216 (=> res!126801 e!100969)))

(assert (=> b!151216 (= res!126801 (= (size!3049 (buf!3536 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!151217 () Bool)

(assert (=> b!151217 (= e!100969 (arrayBitRangesEq!0 (buf!3536 thiss!1634) (buf!3536 (_2!7112 lt!236100)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3049 (buf!3536 thiss!1634)) (currentByte!6462 thiss!1634) (currentBit!6457 thiss!1634))))))

(assert (= (and d!49358 res!126800) b!151215))

(assert (= (and b!151215 res!126802) b!151216))

(assert (= (and b!151216 (not res!126801)) b!151217))

(assert (=> b!151215 m!235469))

(assert (=> b!151215 m!235467))

(assert (=> b!151217 m!235469))

(assert (=> b!151217 m!235469))

(declare-fun m!236159 () Bool)

(assert (=> b!151217 m!236159))

(assert (=> b!150896 d!49358))

(push 1)

(assert (not d!49334))

(assert (not d!49338))

(assert (not b!151217))

(assert (not b!151202))

(assert (not b!151023))

(assert (not b!151063))

(assert (not d!49314))

(assert (not d!49159))

(assert (not b!151197))

(assert (not b!151066))

(assert (not d!49224))

(assert (not d!49220))

(assert (not b!151196))

(assert (not b!151028))

(assert (not d!49181))

(assert (not d!49151))

(assert (not d!49147))

(assert (not d!49139))

(assert (not d!49354))

(assert (not d!49161))

(assert (not d!49157))

(assert (not d!49143))

(assert (not b!151215))

(assert (not b!151168))

(assert (not b!151027))

(assert (not b!151047))

(assert (not b!151171))

(assert (not b!151025))

(assert (not b!151062))

(assert (not d!49324))

(assert (not d!49163))

(assert (not d!49344))

(assert (not b!151204))

(assert (not d!49149))

(assert (not b!151024))

(assert (not b!151212))

(assert (not b!151068))

(assert (not d!49226))

(assert (not d!49186))

(assert (not d!49165))

(assert (not d!49348))

(assert (not b!151195))

(assert (not d!49290))

(assert (not b!151040))

(assert (not d!49330))

(assert (not d!49153))

(assert (not b!151075))

(assert (not d!49177))

(assert (not b!151169))

(assert (not b!151172))

(assert (not d!49145))

(assert (not b!151210))

(assert (not b!151170))

(assert (not d!49316))

(assert (not d!49167))

(assert (not d!49208))

(assert (not d!49155))

(assert (not d!49352))

(assert (not b!151214))

(assert (not d!49210))

(assert (not d!49202))

(assert (not d!49204))

(assert (not b!151030))

(assert (not b!151032))

(assert (not d!49141))

(assert (not b!151064))

(assert (not b!151077))

(assert (not b!151029))

(check-sat)

(pop 1)

(push 1)

(check-sat)

