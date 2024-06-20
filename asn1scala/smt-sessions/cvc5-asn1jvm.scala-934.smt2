; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26378 () Bool)

(assert start!26378)

(declare-datatypes ((array!6178 0))(
  ( (array!6179 (arr!3462 (Array (_ BitVec 32) (_ BitVec 8))) (size!2797 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6178)

(declare-datatypes ((BitStream!4858 0))(
  ( (BitStream!4859 (buf!3190 array!6178) (currentByte!5987 (_ BitVec 32)) (currentBit!5982 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!11772 0))(
  ( (tuple2!11773 (_1!6202 BitStream!4858) (_2!6202 (_ BitVec 8))) )
))
(declare-fun lt!210149 () tuple2!11772)

(declare-fun e!89875 () Bool)

(declare-datatypes ((tuple2!11774 0))(
  ( (tuple2!11775 (_1!6203 BitStream!4858) (_2!6203 BitStream!4858)) )
))
(declare-fun lt!210137 () tuple2!11774)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun b!135381 () Bool)

(assert (=> b!135381 (= e!89875 (and (= (_2!6202 lt!210149) (select (arr!3462 arr!237) from!447)) (= (_1!6202 lt!210149) (_2!6203 lt!210137))))))

(declare-fun readBytePure!0 (BitStream!4858) tuple2!11772)

(assert (=> b!135381 (= lt!210149 (readBytePure!0 (_1!6203 lt!210137)))))

(declare-fun thiss!1634 () BitStream!4858)

(declare-datatypes ((Unit!8432 0))(
  ( (Unit!8433) )
))
(declare-datatypes ((tuple2!11776 0))(
  ( (tuple2!11777 (_1!6204 Unit!8432) (_2!6204 BitStream!4858)) )
))
(declare-fun lt!210144 () tuple2!11776)

(declare-fun reader!0 (BitStream!4858 BitStream!4858) tuple2!11774)

(assert (=> b!135381 (= lt!210137 (reader!0 thiss!1634 (_2!6204 lt!210144)))))

(declare-fun b!135382 () Bool)

(declare-fun res!112596 () Bool)

(assert (=> b!135382 (=> (not res!112596) (not e!89875))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!135382 (= res!112596 (= (bitIndex!0 (size!2797 (buf!3190 (_2!6204 lt!210144))) (currentByte!5987 (_2!6204 lt!210144)) (currentBit!5982 (_2!6204 lt!210144))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2797 (buf!3190 thiss!1634)) (currentByte!5987 thiss!1634) (currentBit!5982 thiss!1634)))))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun b!135383 () Bool)

(declare-fun e!89873 () Bool)

(declare-datatypes ((tuple2!11778 0))(
  ( (tuple2!11779 (_1!6205 BitStream!4858) (_2!6205 array!6178)) )
))
(declare-fun lt!210132 () tuple2!11778)

(declare-fun arrayRangesEq!200 (array!6178 array!6178 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!135383 (= e!89873 (not (arrayRangesEq!200 arr!237 (_2!6205 lt!210132) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!135384 () Bool)

(declare-fun e!89880 () Bool)

(declare-fun array_inv!2586 (array!6178) Bool)

(assert (=> b!135384 (= e!89880 (array_inv!2586 (buf!3190 thiss!1634)))))

(declare-fun b!135385 () Bool)

(declare-fun res!112597 () Bool)

(declare-fun e!89871 () Bool)

(assert (=> b!135385 (=> (not res!112597) (not e!89871))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!135385 (= res!112597 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2797 (buf!3190 thiss!1634))) ((_ sign_extend 32) (currentByte!5987 thiss!1634)) ((_ sign_extend 32) (currentBit!5982 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!135386 () Bool)

(declare-fun res!112598 () Bool)

(assert (=> b!135386 (=> (not res!112598) (not e!89871))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!135386 (= res!112598 (invariant!0 (currentBit!5982 thiss!1634) (currentByte!5987 thiss!1634) (size!2797 (buf!3190 thiss!1634))))))

(declare-fun b!135387 () Bool)

(declare-fun e!89872 () Bool)

(assert (=> b!135387 (= e!89871 (not e!89872))))

(declare-fun res!112593 () Bool)

(assert (=> b!135387 (=> res!112593 e!89872)))

(declare-fun lt!210138 () tuple2!11778)

(declare-fun lt!210142 () tuple2!11778)

(assert (=> b!135387 (= res!112593 (not (arrayRangesEq!200 (_2!6205 lt!210138) (_2!6205 lt!210142) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!210140 () tuple2!11778)

(assert (=> b!135387 (arrayRangesEq!200 (_2!6205 lt!210138) (_2!6205 lt!210140) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!210128 () tuple2!11774)

(declare-fun lt!210131 () Unit!8432)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4858 array!6178 (_ BitVec 32) (_ BitVec 32)) Unit!8432)

(assert (=> b!135387 (= lt!210131 (readByteArrayLoopArrayPrefixLemma!0 (_1!6203 lt!210128) arr!237 from!447 to!404))))

(declare-fun lt!210127 () array!6178)

(declare-fun readByteArrayLoopPure!0 (BitStream!4858 array!6178 (_ BitVec 32) (_ BitVec 32)) tuple2!11778)

(declare-fun withMovedByteIndex!0 (BitStream!4858 (_ BitVec 32)) BitStream!4858)

(assert (=> b!135387 (= lt!210140 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6203 lt!210128) #b00000000000000000000000000000001) lt!210127 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!210147 () tuple2!11774)

(assert (=> b!135387 (= lt!210142 (readByteArrayLoopPure!0 (_1!6203 lt!210147) lt!210127 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!210143 () tuple2!11772)

(assert (=> b!135387 (= lt!210127 (array!6179 (store (arr!3462 arr!237) from!447 (_2!6202 lt!210143)) (size!2797 arr!237)))))

(declare-fun lt!210146 () tuple2!11776)

(declare-fun lt!210151 () (_ BitVec 32))

(assert (=> b!135387 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2797 (buf!3190 (_2!6204 lt!210146)))) ((_ sign_extend 32) (currentByte!5987 (_2!6204 lt!210144))) ((_ sign_extend 32) (currentBit!5982 (_2!6204 lt!210144))) lt!210151)))

(declare-fun lt!210139 () Unit!8432)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4858 array!6178 (_ BitVec 32)) Unit!8432)

(assert (=> b!135387 (= lt!210139 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6204 lt!210144) (buf!3190 (_2!6204 lt!210146)) lt!210151))))

(assert (=> b!135387 (= (_1!6205 lt!210138) (_2!6203 lt!210128))))

(assert (=> b!135387 (= lt!210138 (readByteArrayLoopPure!0 (_1!6203 lt!210128) arr!237 from!447 to!404))))

(assert (=> b!135387 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2797 (buf!3190 (_2!6204 lt!210146)))) ((_ sign_extend 32) (currentByte!5987 thiss!1634)) ((_ sign_extend 32) (currentBit!5982 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!210136 () Unit!8432)

(assert (=> b!135387 (= lt!210136 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3190 (_2!6204 lt!210146)) (bvsub to!404 from!447)))))

(assert (=> b!135387 (= (_2!6202 lt!210143) (select (arr!3462 arr!237) from!447))))

(assert (=> b!135387 (= lt!210143 (readBytePure!0 (_1!6203 lt!210128)))))

(assert (=> b!135387 (= lt!210147 (reader!0 (_2!6204 lt!210144) (_2!6204 lt!210146)))))

(assert (=> b!135387 (= lt!210128 (reader!0 thiss!1634 (_2!6204 lt!210146)))))

(declare-fun e!89878 () Bool)

(assert (=> b!135387 e!89878))

(declare-fun res!112589 () Bool)

(assert (=> b!135387 (=> (not res!112589) (not e!89878))))

(declare-fun lt!210145 () tuple2!11772)

(declare-fun lt!210129 () tuple2!11772)

(assert (=> b!135387 (= res!112589 (= (bitIndex!0 (size!2797 (buf!3190 (_1!6202 lt!210145))) (currentByte!5987 (_1!6202 lt!210145)) (currentBit!5982 (_1!6202 lt!210145))) (bitIndex!0 (size!2797 (buf!3190 (_1!6202 lt!210129))) (currentByte!5987 (_1!6202 lt!210129)) (currentBit!5982 (_1!6202 lt!210129)))))))

(declare-fun lt!210130 () Unit!8432)

(declare-fun lt!210133 () BitStream!4858)

(declare-fun readBytePrefixLemma!0 (BitStream!4858 BitStream!4858) Unit!8432)

(assert (=> b!135387 (= lt!210130 (readBytePrefixLemma!0 lt!210133 (_2!6204 lt!210146)))))

(assert (=> b!135387 (= lt!210129 (readBytePure!0 (BitStream!4859 (buf!3190 (_2!6204 lt!210146)) (currentByte!5987 thiss!1634) (currentBit!5982 thiss!1634))))))

(assert (=> b!135387 (= lt!210145 (readBytePure!0 lt!210133))))

(assert (=> b!135387 (= lt!210133 (BitStream!4859 (buf!3190 (_2!6204 lt!210144)) (currentByte!5987 thiss!1634) (currentBit!5982 thiss!1634)))))

(declare-fun e!89877 () Bool)

(assert (=> b!135387 e!89877))

(declare-fun res!112602 () Bool)

(assert (=> b!135387 (=> (not res!112602) (not e!89877))))

(declare-fun isPrefixOf!0 (BitStream!4858 BitStream!4858) Bool)

(assert (=> b!135387 (= res!112602 (isPrefixOf!0 thiss!1634 (_2!6204 lt!210146)))))

(declare-fun lt!210150 () Unit!8432)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4858 BitStream!4858 BitStream!4858) Unit!8432)

(assert (=> b!135387 (= lt!210150 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6204 lt!210144) (_2!6204 lt!210146)))))

(declare-fun e!89874 () Bool)

(assert (=> b!135387 e!89874))

(declare-fun res!112594 () Bool)

(assert (=> b!135387 (=> (not res!112594) (not e!89874))))

(assert (=> b!135387 (= res!112594 (= (size!2797 (buf!3190 (_2!6204 lt!210144))) (size!2797 (buf!3190 (_2!6204 lt!210146)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4858 array!6178 (_ BitVec 32) (_ BitVec 32)) tuple2!11776)

(assert (=> b!135387 (= lt!210146 (appendByteArrayLoop!0 (_2!6204 lt!210144) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!135387 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2797 (buf!3190 (_2!6204 lt!210144)))) ((_ sign_extend 32) (currentByte!5987 (_2!6204 lt!210144))) ((_ sign_extend 32) (currentBit!5982 (_2!6204 lt!210144))) lt!210151)))

(assert (=> b!135387 (= lt!210151 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!210134 () Unit!8432)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4858 BitStream!4858 (_ BitVec 64) (_ BitVec 32)) Unit!8432)

(assert (=> b!135387 (= lt!210134 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6204 lt!210144) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!135387 e!89875))

(declare-fun res!112599 () Bool)

(assert (=> b!135387 (=> (not res!112599) (not e!89875))))

(assert (=> b!135387 (= res!112599 (= (size!2797 (buf!3190 thiss!1634)) (size!2797 (buf!3190 (_2!6204 lt!210144)))))))

(declare-fun appendByte!0 (BitStream!4858 (_ BitVec 8)) tuple2!11776)

(assert (=> b!135387 (= lt!210144 (appendByte!0 thiss!1634 (select (arr!3462 arr!237) from!447)))))

(declare-fun b!135388 () Bool)

(assert (=> b!135388 (= e!89877 (invariant!0 (currentBit!5982 thiss!1634) (currentByte!5987 thiss!1634) (size!2797 (buf!3190 (_2!6204 lt!210144)))))))

(declare-fun b!135389 () Bool)

(declare-fun e!89879 () Bool)

(assert (=> b!135389 (= e!89879 (not e!89873))))

(declare-fun res!112600 () Bool)

(assert (=> b!135389 (=> res!112600 e!89873)))

(declare-fun lt!210148 () tuple2!11774)

(assert (=> b!135389 (= res!112600 (or (not (= (size!2797 (_2!6205 lt!210132)) (size!2797 arr!237))) (not (= (_1!6205 lt!210132) (_2!6203 lt!210148)))))))

(assert (=> b!135389 (= lt!210132 (readByteArrayLoopPure!0 (_1!6203 lt!210148) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!210126 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!135389 (validate_offset_bits!1 ((_ sign_extend 32) (size!2797 (buf!3190 (_2!6204 lt!210146)))) ((_ sign_extend 32) (currentByte!5987 (_2!6204 lt!210144))) ((_ sign_extend 32) (currentBit!5982 (_2!6204 lt!210144))) lt!210126)))

(declare-fun lt!210135 () Unit!8432)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4858 array!6178 (_ BitVec 64)) Unit!8432)

(assert (=> b!135389 (= lt!210135 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6204 lt!210144) (buf!3190 (_2!6204 lt!210146)) lt!210126))))

(assert (=> b!135389 (= lt!210148 (reader!0 (_2!6204 lt!210144) (_2!6204 lt!210146)))))

(declare-fun res!112590 () Bool)

(assert (=> start!26378 (=> (not res!112590) (not e!89871))))

(assert (=> start!26378 (= res!112590 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2797 arr!237))))))

(assert (=> start!26378 e!89871))

(assert (=> start!26378 true))

(assert (=> start!26378 (array_inv!2586 arr!237)))

(declare-fun inv!12 (BitStream!4858) Bool)

(assert (=> start!26378 (and (inv!12 thiss!1634) e!89880)))

(declare-fun b!135390 () Bool)

(assert (=> b!135390 (= e!89878 (= (_2!6202 lt!210145) (_2!6202 lt!210129)))))

(declare-fun b!135391 () Bool)

(assert (=> b!135391 (= e!89872 true)))

(assert (=> b!135391 (arrayRangesEq!200 (_2!6205 lt!210142) (_2!6205 lt!210138) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!210141 () Unit!8432)

(declare-fun arrayRangesEqSymmetricLemma!13 (array!6178 array!6178 (_ BitVec 32) (_ BitVec 32)) Unit!8432)

(assert (=> b!135391 (= lt!210141 (arrayRangesEqSymmetricLemma!13 (_2!6205 lt!210138) (_2!6205 lt!210142) #b00000000000000000000000000000000 to!404))))

(declare-fun b!135392 () Bool)

(declare-fun res!112592 () Bool)

(assert (=> b!135392 (=> (not res!112592) (not e!89879))))

(assert (=> b!135392 (= res!112592 (isPrefixOf!0 (_2!6204 lt!210144) (_2!6204 lt!210146)))))

(declare-fun b!135393 () Bool)

(assert (=> b!135393 (= e!89874 e!89879)))

(declare-fun res!112591 () Bool)

(assert (=> b!135393 (=> (not res!112591) (not e!89879))))

(assert (=> b!135393 (= res!112591 (= (bitIndex!0 (size!2797 (buf!3190 (_2!6204 lt!210146))) (currentByte!5987 (_2!6204 lt!210146)) (currentBit!5982 (_2!6204 lt!210146))) (bvadd (bitIndex!0 (size!2797 (buf!3190 (_2!6204 lt!210144))) (currentByte!5987 (_2!6204 lt!210144)) (currentBit!5982 (_2!6204 lt!210144))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!210126))))))

(assert (=> b!135393 (= lt!210126 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!135394 () Bool)

(declare-fun res!112595 () Bool)

(assert (=> b!135394 (=> (not res!112595) (not e!89875))))

(assert (=> b!135394 (= res!112595 (isPrefixOf!0 thiss!1634 (_2!6204 lt!210144)))))

(declare-fun b!135395 () Bool)

(declare-fun res!112601 () Bool)

(assert (=> b!135395 (=> (not res!112601) (not e!89871))))

(assert (=> b!135395 (= res!112601 (bvslt from!447 to!404))))

(assert (= (and start!26378 res!112590) b!135385))

(assert (= (and b!135385 res!112597) b!135395))

(assert (= (and b!135395 res!112601) b!135386))

(assert (= (and b!135386 res!112598) b!135387))

(assert (= (and b!135387 res!112599) b!135382))

(assert (= (and b!135382 res!112596) b!135394))

(assert (= (and b!135394 res!112595) b!135381))

(assert (= (and b!135387 res!112594) b!135393))

(assert (= (and b!135393 res!112591) b!135392))

(assert (= (and b!135392 res!112592) b!135389))

(assert (= (and b!135389 (not res!112600)) b!135383))

(assert (= (and b!135387 res!112602) b!135388))

(assert (= (and b!135387 res!112589) b!135390))

(assert (= (and b!135387 (not res!112593)) b!135391))

(assert (= start!26378 b!135384))

(declare-fun m!206503 () Bool)

(assert (=> b!135389 m!206503))

(declare-fun m!206505 () Bool)

(assert (=> b!135389 m!206505))

(declare-fun m!206507 () Bool)

(assert (=> b!135389 m!206507))

(declare-fun m!206509 () Bool)

(assert (=> b!135389 m!206509))

(declare-fun m!206511 () Bool)

(assert (=> b!135386 m!206511))

(declare-fun m!206513 () Bool)

(assert (=> b!135383 m!206513))

(declare-fun m!206515 () Bool)

(assert (=> b!135384 m!206515))

(declare-fun m!206517 () Bool)

(assert (=> b!135387 m!206517))

(declare-fun m!206519 () Bool)

(assert (=> b!135387 m!206519))

(declare-fun m!206521 () Bool)

(assert (=> b!135387 m!206521))

(declare-fun m!206523 () Bool)

(assert (=> b!135387 m!206523))

(declare-fun m!206525 () Bool)

(assert (=> b!135387 m!206525))

(declare-fun m!206527 () Bool)

(assert (=> b!135387 m!206527))

(declare-fun m!206529 () Bool)

(assert (=> b!135387 m!206529))

(declare-fun m!206531 () Bool)

(assert (=> b!135387 m!206531))

(declare-fun m!206533 () Bool)

(assert (=> b!135387 m!206533))

(declare-fun m!206535 () Bool)

(assert (=> b!135387 m!206535))

(declare-fun m!206537 () Bool)

(assert (=> b!135387 m!206537))

(declare-fun m!206539 () Bool)

(assert (=> b!135387 m!206539))

(declare-fun m!206541 () Bool)

(assert (=> b!135387 m!206541))

(declare-fun m!206543 () Bool)

(assert (=> b!135387 m!206543))

(declare-fun m!206545 () Bool)

(assert (=> b!135387 m!206545))

(declare-fun m!206547 () Bool)

(assert (=> b!135387 m!206547))

(declare-fun m!206549 () Bool)

(assert (=> b!135387 m!206549))

(declare-fun m!206551 () Bool)

(assert (=> b!135387 m!206551))

(declare-fun m!206553 () Bool)

(assert (=> b!135387 m!206553))

(declare-fun m!206555 () Bool)

(assert (=> b!135387 m!206555))

(declare-fun m!206557 () Bool)

(assert (=> b!135387 m!206557))

(declare-fun m!206559 () Bool)

(assert (=> b!135387 m!206559))

(assert (=> b!135387 m!206551))

(declare-fun m!206561 () Bool)

(assert (=> b!135387 m!206561))

(declare-fun m!206563 () Bool)

(assert (=> b!135387 m!206563))

(declare-fun m!206565 () Bool)

(assert (=> b!135387 m!206565))

(assert (=> b!135387 m!206541))

(declare-fun m!206567 () Bool)

(assert (=> b!135387 m!206567))

(assert (=> b!135387 m!206509))

(declare-fun m!206569 () Bool)

(assert (=> b!135392 m!206569))

(assert (=> b!135381 m!206541))

(declare-fun m!206571 () Bool)

(assert (=> b!135381 m!206571))

(declare-fun m!206573 () Bool)

(assert (=> b!135381 m!206573))

(declare-fun m!206575 () Bool)

(assert (=> b!135385 m!206575))

(declare-fun m!206577 () Bool)

(assert (=> start!26378 m!206577))

(declare-fun m!206579 () Bool)

(assert (=> start!26378 m!206579))

(declare-fun m!206581 () Bool)

(assert (=> b!135391 m!206581))

(declare-fun m!206583 () Bool)

(assert (=> b!135391 m!206583))

(declare-fun m!206585 () Bool)

(assert (=> b!135394 m!206585))

(declare-fun m!206587 () Bool)

(assert (=> b!135393 m!206587))

(declare-fun m!206589 () Bool)

(assert (=> b!135393 m!206589))

(declare-fun m!206591 () Bool)

(assert (=> b!135388 m!206591))

(assert (=> b!135382 m!206589))

(declare-fun m!206593 () Bool)

(assert (=> b!135382 m!206593))

(push 1)

(assert (not b!135393))

(assert (not b!135391))

(assert (not b!135382))

(assert (not b!135385))

(assert (not b!135389))

(assert (not b!135387))

(assert (not b!135384))

(assert (not start!26378))

(assert (not b!135386))

(assert (not b!135392))

(assert (not b!135394))

(assert (not b!135388))

(assert (not b!135383))

(assert (not b!135381))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

