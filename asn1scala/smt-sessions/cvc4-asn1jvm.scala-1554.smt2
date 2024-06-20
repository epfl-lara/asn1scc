; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43624 () Bool)

(assert start!43624)

(declare-fun b!206900 () Bool)

(declare-fun e!141449 () Bool)

(declare-datatypes ((array!10407 0))(
  ( (array!10408 (arr!5505 (Array (_ BitVec 32) (_ BitVec 8))) (size!4575 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8258 0))(
  ( (BitStream!8259 (buf!5080 array!10407) (currentByte!9598 (_ BitVec 32)) (currentBit!9593 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8258)

(declare-datatypes ((Unit!14744 0))(
  ( (Unit!14745) )
))
(declare-datatypes ((tuple2!17706 0))(
  ( (tuple2!17707 (_1!9508 Unit!14744) (_2!9508 BitStream!8258)) )
))
(declare-fun lt!323127 () tuple2!17706)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!206900 (= e!141449 (invariant!0 (currentBit!9593 thiss!1204) (currentByte!9598 thiss!1204) (size!4575 (buf!5080 (_2!9508 lt!323127)))))))

(declare-fun b!206901 () Bool)

(declare-fun res!173542 () Bool)

(declare-fun e!141448 () Bool)

(assert (=> b!206901 (=> (not res!173542) (not e!141448))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!206901 (= res!173542 (not (= i!590 nBits!348)))))

(declare-fun res!173531 () Bool)

(declare-fun e!141451 () Bool)

(assert (=> start!43624 (=> (not res!173531) (not e!141451))))

(assert (=> start!43624 (= res!173531 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43624 e!141451))

(assert (=> start!43624 true))

(declare-fun e!141447 () Bool)

(declare-fun inv!12 (BitStream!8258) Bool)

(assert (=> start!43624 (and (inv!12 thiss!1204) e!141447)))

(declare-fun b!206902 () Bool)

(declare-fun e!141452 () Bool)

(assert (=> b!206902 (= e!141448 (not e!141452))))

(declare-fun res!173537 () Bool)

(assert (=> b!206902 (=> res!173537 e!141452)))

(declare-fun lt!323120 () (_ BitVec 64))

(declare-fun lt!323118 () (_ BitVec 64))

(assert (=> b!206902 (= res!173537 (not (= lt!323120 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!323118))))))

(declare-fun lt!323115 () tuple2!17706)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!206902 (= lt!323120 (bitIndex!0 (size!4575 (buf!5080 (_2!9508 lt!323115))) (currentByte!9598 (_2!9508 lt!323115)) (currentBit!9593 (_2!9508 lt!323115))))))

(assert (=> b!206902 (= lt!323118 (bitIndex!0 (size!4575 (buf!5080 thiss!1204)) (currentByte!9598 thiss!1204) (currentBit!9593 thiss!1204)))))

(declare-fun e!141446 () Bool)

(assert (=> b!206902 e!141446))

(declare-fun res!173534 () Bool)

(assert (=> b!206902 (=> (not res!173534) (not e!141446))))

(assert (=> b!206902 (= res!173534 (= (size!4575 (buf!5080 thiss!1204)) (size!4575 (buf!5080 (_2!9508 lt!323115)))))))

(declare-fun lt!323125 () Bool)

(declare-fun appendBit!0 (BitStream!8258 Bool) tuple2!17706)

(assert (=> b!206902 (= lt!323115 (appendBit!0 thiss!1204 lt!323125))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!206902 (= lt!323125 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!206903 () Bool)

(declare-fun res!173546 () Bool)

(declare-fun e!141453 () Bool)

(assert (=> b!206903 (=> res!173546 e!141453)))

(declare-fun isPrefixOf!0 (BitStream!8258 BitStream!8258) Bool)

(assert (=> b!206903 (= res!173546 (not (isPrefixOf!0 (_2!9508 lt!323115) (_2!9508 lt!323127))))))

(declare-fun b!206904 () Bool)

(declare-fun res!173543 () Bool)

(declare-fun e!141445 () Bool)

(assert (=> b!206904 (=> (not res!173543) (not e!141445))))

(assert (=> b!206904 (= res!173543 (isPrefixOf!0 thiss!1204 (_2!9508 lt!323115)))))

(declare-fun b!206905 () Bool)

(declare-fun res!173536 () Bool)

(assert (=> b!206905 (=> res!173536 e!141453)))

(assert (=> b!206905 (= res!173536 (not (invariant!0 (currentBit!9593 (_2!9508 lt!323127)) (currentByte!9598 (_2!9508 lt!323127)) (size!4575 (buf!5080 (_2!9508 lt!323127))))))))

(declare-fun b!206906 () Bool)

(assert (=> b!206906 (= e!141446 e!141445)))

(declare-fun res!173535 () Bool)

(assert (=> b!206906 (=> (not res!173535) (not e!141445))))

(declare-fun lt!323123 () (_ BitVec 64))

(declare-fun lt!323128 () (_ BitVec 64))

(assert (=> b!206906 (= res!173535 (= lt!323123 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!323128)))))

(assert (=> b!206906 (= lt!323123 (bitIndex!0 (size!4575 (buf!5080 (_2!9508 lt!323115))) (currentByte!9598 (_2!9508 lt!323115)) (currentBit!9593 (_2!9508 lt!323115))))))

(assert (=> b!206906 (= lt!323128 (bitIndex!0 (size!4575 (buf!5080 thiss!1204)) (currentByte!9598 thiss!1204) (currentBit!9593 thiss!1204)))))

(declare-fun b!206907 () Bool)

(declare-fun e!141450 () Bool)

(declare-datatypes ((tuple2!17708 0))(
  ( (tuple2!17709 (_1!9509 BitStream!8258) (_2!9509 Bool)) )
))
(declare-fun lt!323119 () tuple2!17708)

(assert (=> b!206907 (= e!141450 (= (bitIndex!0 (size!4575 (buf!5080 (_1!9509 lt!323119))) (currentByte!9598 (_1!9509 lt!323119)) (currentBit!9593 (_1!9509 lt!323119))) lt!323123))))

(declare-fun b!206908 () Bool)

(assert (=> b!206908 (= e!141453 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand i!590 #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 i!590) #b10000000000000000000000000000000))))))

(declare-datatypes ((tuple2!17710 0))(
  ( (tuple2!17711 (_1!9510 BitStream!8258) (_2!9510 BitStream!8258)) )
))
(declare-fun lt!323124 () tuple2!17710)

(declare-datatypes ((tuple2!17712 0))(
  ( (tuple2!17713 (_1!9511 BitStream!8258) (_2!9511 (_ BitVec 64))) )
))
(declare-fun lt!323130 () tuple2!17712)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8258 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17712)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!206908 (= lt!323130 (readNBitsLSBFirstsLoopPure!0 (_1!9510 lt!323124) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(declare-fun lt!323121 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!206908 (validate_offset_bits!1 ((_ sign_extend 32) (size!4575 (buf!5080 (_2!9508 lt!323127)))) ((_ sign_extend 32) (currentByte!9598 thiss!1204)) ((_ sign_extend 32) (currentBit!9593 thiss!1204)) lt!323121)))

(declare-fun lt!323117 () Unit!14744)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8258 array!10407 (_ BitVec 64)) Unit!14744)

(assert (=> b!206908 (= lt!323117 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5080 (_2!9508 lt!323127)) lt!323121))))

(declare-fun readBitPure!0 (BitStream!8258) tuple2!17708)

(assert (=> b!206908 (= (_2!9509 (readBitPure!0 (_1!9510 lt!323124))) lt!323125)))

(declare-fun lt!323131 () tuple2!17710)

(declare-fun reader!0 (BitStream!8258 BitStream!8258) tuple2!17710)

(assert (=> b!206908 (= lt!323131 (reader!0 (_2!9508 lt!323115) (_2!9508 lt!323127)))))

(assert (=> b!206908 (= lt!323124 (reader!0 thiss!1204 (_2!9508 lt!323127)))))

(declare-fun e!141444 () Bool)

(assert (=> b!206908 e!141444))

(declare-fun res!173545 () Bool)

(assert (=> b!206908 (=> (not res!173545) (not e!141444))))

(declare-fun lt!323129 () tuple2!17708)

(declare-fun lt!323122 () tuple2!17708)

(assert (=> b!206908 (= res!173545 (= (bitIndex!0 (size!4575 (buf!5080 (_1!9509 lt!323129))) (currentByte!9598 (_1!9509 lt!323129)) (currentBit!9593 (_1!9509 lt!323129))) (bitIndex!0 (size!4575 (buf!5080 (_1!9509 lt!323122))) (currentByte!9598 (_1!9509 lt!323122)) (currentBit!9593 (_1!9509 lt!323122)))))))

(declare-fun lt!323114 () Unit!14744)

(declare-fun lt!323116 () BitStream!8258)

(declare-fun readBitPrefixLemma!0 (BitStream!8258 BitStream!8258) Unit!14744)

(assert (=> b!206908 (= lt!323114 (readBitPrefixLemma!0 lt!323116 (_2!9508 lt!323127)))))

(assert (=> b!206908 (= lt!323122 (readBitPure!0 (BitStream!8259 (buf!5080 (_2!9508 lt!323127)) (currentByte!9598 thiss!1204) (currentBit!9593 thiss!1204))))))

(assert (=> b!206908 (= lt!323129 (readBitPure!0 lt!323116))))

(assert (=> b!206908 e!141449))

(declare-fun res!173544 () Bool)

(assert (=> b!206908 (=> (not res!173544) (not e!141449))))

(assert (=> b!206908 (= res!173544 (invariant!0 (currentBit!9593 thiss!1204) (currentByte!9598 thiss!1204) (size!4575 (buf!5080 (_2!9508 lt!323115)))))))

(assert (=> b!206908 (= lt!323116 (BitStream!8259 (buf!5080 (_2!9508 lt!323115)) (currentByte!9598 thiss!1204) (currentBit!9593 thiss!1204)))))

(declare-fun b!206909 () Bool)

(declare-fun res!173540 () Bool)

(assert (=> b!206909 (=> res!173540 e!141453)))

(declare-fun lt!323126 () (_ BitVec 64))

(assert (=> b!206909 (= res!173540 (or (not (= (size!4575 (buf!5080 (_2!9508 lt!323127))) (size!4575 (buf!5080 thiss!1204)))) (not (= lt!323126 (bvsub (bvadd lt!323118 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!206910 () Bool)

(assert (=> b!206910 (= e!141451 e!141448)))

(declare-fun res!173532 () Bool)

(assert (=> b!206910 (=> (not res!173532) (not e!141448))))

(assert (=> b!206910 (= res!173532 (validate_offset_bits!1 ((_ sign_extend 32) (size!4575 (buf!5080 thiss!1204))) ((_ sign_extend 32) (currentByte!9598 thiss!1204)) ((_ sign_extend 32) (currentBit!9593 thiss!1204)) lt!323121))))

(assert (=> b!206910 (= lt!323121 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!206911 () Bool)

(assert (=> b!206911 (= e!141445 e!141450)))

(declare-fun res!173541 () Bool)

(assert (=> b!206911 (=> (not res!173541) (not e!141450))))

(assert (=> b!206911 (= res!173541 (and (= (_2!9509 lt!323119) lt!323125) (= (_1!9509 lt!323119) (_2!9508 lt!323115))))))

(declare-fun readerFrom!0 (BitStream!8258 (_ BitVec 32) (_ BitVec 32)) BitStream!8258)

(assert (=> b!206911 (= lt!323119 (readBitPure!0 (readerFrom!0 (_2!9508 lt!323115) (currentBit!9593 thiss!1204) (currentByte!9598 thiss!1204))))))

(declare-fun b!206912 () Bool)

(declare-fun res!173539 () Bool)

(assert (=> b!206912 (=> (not res!173539) (not e!141448))))

(assert (=> b!206912 (= res!173539 (invariant!0 (currentBit!9593 thiss!1204) (currentByte!9598 thiss!1204) (size!4575 (buf!5080 thiss!1204))))))

(declare-fun b!206913 () Bool)

(assert (=> b!206913 (= e!141444 (= (_2!9509 lt!323129) (_2!9509 lt!323122)))))

(declare-fun b!206914 () Bool)

(declare-fun array_inv!4316 (array!10407) Bool)

(assert (=> b!206914 (= e!141447 (array_inv!4316 (buf!5080 thiss!1204)))))

(declare-fun b!206915 () Bool)

(assert (=> b!206915 (= e!141452 e!141453)))

(declare-fun res!173538 () Bool)

(assert (=> b!206915 (=> res!173538 e!141453)))

(assert (=> b!206915 (= res!173538 (not (= lt!323126 (bvsub (bvsub (bvadd lt!323120 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!206915 (= lt!323126 (bitIndex!0 (size!4575 (buf!5080 (_2!9508 lt!323127))) (currentByte!9598 (_2!9508 lt!323127)) (currentBit!9593 (_2!9508 lt!323127))))))

(assert (=> b!206915 (isPrefixOf!0 thiss!1204 (_2!9508 lt!323127))))

(declare-fun lt!323132 () Unit!14744)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8258 BitStream!8258 BitStream!8258) Unit!14744)

(assert (=> b!206915 (= lt!323132 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9508 lt!323115) (_2!9508 lt!323127)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8258 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17706)

(assert (=> b!206915 (= lt!323127 (appendBitsLSBFirstLoopTR!0 (_2!9508 lt!323115) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!206916 () Bool)

(declare-fun res!173533 () Bool)

(assert (=> b!206916 (=> res!173533 e!141453)))

(assert (=> b!206916 (= res!173533 (not (isPrefixOf!0 thiss!1204 (_2!9508 lt!323115))))))

(assert (= (and start!43624 res!173531) b!206910))

(assert (= (and b!206910 res!173532) b!206912))

(assert (= (and b!206912 res!173539) b!206901))

(assert (= (and b!206901 res!173542) b!206902))

(assert (= (and b!206902 res!173534) b!206906))

(assert (= (and b!206906 res!173535) b!206904))

(assert (= (and b!206904 res!173543) b!206911))

(assert (= (and b!206911 res!173541) b!206907))

(assert (= (and b!206902 (not res!173537)) b!206915))

(assert (= (and b!206915 (not res!173538)) b!206905))

(assert (= (and b!206905 (not res!173536)) b!206909))

(assert (= (and b!206909 (not res!173540)) b!206903))

(assert (= (and b!206903 (not res!173546)) b!206916))

(assert (= (and b!206916 (not res!173533)) b!206908))

(assert (= (and b!206908 res!173544) b!206900))

(assert (= (and b!206908 res!173545) b!206913))

(assert (= start!43624 b!206914))

(declare-fun m!318529 () Bool)

(assert (=> b!206916 m!318529))

(declare-fun m!318531 () Bool)

(assert (=> b!206911 m!318531))

(assert (=> b!206911 m!318531))

(declare-fun m!318533 () Bool)

(assert (=> b!206911 m!318533))

(assert (=> b!206904 m!318529))

(declare-fun m!318535 () Bool)

(assert (=> b!206907 m!318535))

(declare-fun m!318537 () Bool)

(assert (=> b!206908 m!318537))

(declare-fun m!318539 () Bool)

(assert (=> b!206908 m!318539))

(declare-fun m!318541 () Bool)

(assert (=> b!206908 m!318541))

(declare-fun m!318543 () Bool)

(assert (=> b!206908 m!318543))

(declare-fun m!318545 () Bool)

(assert (=> b!206908 m!318545))

(declare-fun m!318547 () Bool)

(assert (=> b!206908 m!318547))

(declare-fun m!318549 () Bool)

(assert (=> b!206908 m!318549))

(declare-fun m!318551 () Bool)

(assert (=> b!206908 m!318551))

(declare-fun m!318553 () Bool)

(assert (=> b!206908 m!318553))

(declare-fun m!318555 () Bool)

(assert (=> b!206908 m!318555))

(declare-fun m!318557 () Bool)

(assert (=> b!206908 m!318557))

(declare-fun m!318559 () Bool)

(assert (=> b!206908 m!318559))

(declare-fun m!318561 () Bool)

(assert (=> b!206908 m!318561))

(declare-fun m!318563 () Bool)

(assert (=> b!206902 m!318563))

(declare-fun m!318565 () Bool)

(assert (=> b!206902 m!318565))

(declare-fun m!318567 () Bool)

(assert (=> b!206902 m!318567))

(declare-fun m!318569 () Bool)

(assert (=> b!206903 m!318569))

(declare-fun m!318571 () Bool)

(assert (=> start!43624 m!318571))

(declare-fun m!318573 () Bool)

(assert (=> b!206910 m!318573))

(declare-fun m!318575 () Bool)

(assert (=> b!206900 m!318575))

(declare-fun m!318577 () Bool)

(assert (=> b!206914 m!318577))

(declare-fun m!318579 () Bool)

(assert (=> b!206915 m!318579))

(declare-fun m!318581 () Bool)

(assert (=> b!206915 m!318581))

(declare-fun m!318583 () Bool)

(assert (=> b!206915 m!318583))

(declare-fun m!318585 () Bool)

(assert (=> b!206915 m!318585))

(declare-fun m!318587 () Bool)

(assert (=> b!206905 m!318587))

(declare-fun m!318589 () Bool)

(assert (=> b!206912 m!318589))

(assert (=> b!206906 m!318563))

(assert (=> b!206906 m!318565))

(push 1)

(assert (not b!206904))

(assert (not start!43624))

(assert (not b!206902))

(assert (not b!206905))

(assert (not b!206907))

(assert (not b!206910))

(assert (not b!206912))

(assert (not b!206915))

(assert (not b!206900))

(assert (not b!206903))

(assert (not b!206908))

(assert (not b!206916))

(assert (not b!206911))

(assert (not b!206914))

(assert (not b!206906))

(check-sat)

(pop 1)

(push 1)

(check-sat)

