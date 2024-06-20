; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26732 () Bool)

(assert start!26732)

(declare-fun b!137676 () Bool)

(declare-fun e!91512 () Bool)

(declare-fun e!91514 () Bool)

(assert (=> b!137676 (= e!91512 (not e!91514))))

(declare-fun res!114681 () Bool)

(assert (=> b!137676 (=> res!114681 e!91514)))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6241 0))(
  ( (array!6242 (arr!3512 (Array (_ BitVec 32) (_ BitVec 8))) (size!2826 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4916 0))(
  ( (BitStream!4917 (buf!3233 array!6241) (currentByte!6040 (_ BitVec 32)) (currentBit!6035 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!12018 0))(
  ( (tuple2!12019 (_1!6332 BitStream!4916) (_2!6332 array!6241)) )
))
(declare-fun lt!214584 () tuple2!12018)

(declare-fun lt!214596 () tuple2!12018)

(declare-fun arrayRangesEq!229 (array!6241 array!6241 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!137676 (= res!114681 (not (arrayRangesEq!229 (_2!6332 lt!214584) (_2!6332 lt!214596) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!214592 () tuple2!12018)

(assert (=> b!137676 (arrayRangesEq!229 (_2!6332 lt!214584) (_2!6332 lt!214592) #b00000000000000000000000000000000 to!404)))

(declare-datatypes ((Unit!8599 0))(
  ( (Unit!8600) )
))
(declare-fun lt!214590 () Unit!8599)

(declare-datatypes ((tuple2!12020 0))(
  ( (tuple2!12021 (_1!6333 BitStream!4916) (_2!6333 BitStream!4916)) )
))
(declare-fun lt!214599 () tuple2!12020)

(declare-fun arr!237 () array!6241)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4916 array!6241 (_ BitVec 32) (_ BitVec 32)) Unit!8599)

(assert (=> b!137676 (= lt!214590 (readByteArrayLoopArrayPrefixLemma!0 (_1!6333 lt!214599) arr!237 from!447 to!404))))

(declare-fun lt!214604 () array!6241)

(declare-fun readByteArrayLoopPure!0 (BitStream!4916 array!6241 (_ BitVec 32) (_ BitVec 32)) tuple2!12018)

(declare-fun withMovedByteIndex!0 (BitStream!4916 (_ BitVec 32)) BitStream!4916)

(assert (=> b!137676 (= lt!214592 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6333 lt!214599) #b00000000000000000000000000000001) lt!214604 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!214593 () tuple2!12020)

(assert (=> b!137676 (= lt!214596 (readByteArrayLoopPure!0 (_1!6333 lt!214593) lt!214604 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((tuple2!12022 0))(
  ( (tuple2!12023 (_1!6334 BitStream!4916) (_2!6334 (_ BitVec 8))) )
))
(declare-fun lt!214605 () tuple2!12022)

(assert (=> b!137676 (= lt!214604 (array!6242 (store (arr!3512 arr!237) from!447 (_2!6334 lt!214605)) (size!2826 arr!237)))))

(declare-datatypes ((tuple2!12024 0))(
  ( (tuple2!12025 (_1!6335 Unit!8599) (_2!6335 BitStream!4916)) )
))
(declare-fun lt!214578 () tuple2!12024)

(declare-fun lt!214580 () tuple2!12024)

(declare-fun lt!214577 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!137676 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2826 (buf!3233 (_2!6335 lt!214578)))) ((_ sign_extend 32) (currentByte!6040 (_2!6335 lt!214580))) ((_ sign_extend 32) (currentBit!6035 (_2!6335 lt!214580))) lt!214577)))

(declare-fun lt!214595 () Unit!8599)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4916 array!6241 (_ BitVec 32)) Unit!8599)

(assert (=> b!137676 (= lt!214595 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6335 lt!214580) (buf!3233 (_2!6335 lt!214578)) lt!214577))))

(assert (=> b!137676 (= (_1!6332 lt!214584) (_2!6333 lt!214599))))

(assert (=> b!137676 (= lt!214584 (readByteArrayLoopPure!0 (_1!6333 lt!214599) arr!237 from!447 to!404))))

(declare-fun thiss!1634 () BitStream!4916)

(assert (=> b!137676 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2826 (buf!3233 (_2!6335 lt!214578)))) ((_ sign_extend 32) (currentByte!6040 thiss!1634)) ((_ sign_extend 32) (currentBit!6035 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!214600 () Unit!8599)

(assert (=> b!137676 (= lt!214600 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3233 (_2!6335 lt!214578)) (bvsub to!404 from!447)))))

(assert (=> b!137676 (= (_2!6334 lt!214605) (select (arr!3512 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!4916) tuple2!12022)

(assert (=> b!137676 (= lt!214605 (readBytePure!0 (_1!6333 lt!214599)))))

(declare-fun reader!0 (BitStream!4916 BitStream!4916) tuple2!12020)

(assert (=> b!137676 (= lt!214593 (reader!0 (_2!6335 lt!214580) (_2!6335 lt!214578)))))

(assert (=> b!137676 (= lt!214599 (reader!0 thiss!1634 (_2!6335 lt!214578)))))

(declare-fun e!91511 () Bool)

(assert (=> b!137676 e!91511))

(declare-fun res!114674 () Bool)

(assert (=> b!137676 (=> (not res!114674) (not e!91511))))

(declare-fun lt!214587 () tuple2!12022)

(declare-fun lt!214594 () tuple2!12022)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!137676 (= res!114674 (= (bitIndex!0 (size!2826 (buf!3233 (_1!6334 lt!214587))) (currentByte!6040 (_1!6334 lt!214587)) (currentBit!6035 (_1!6334 lt!214587))) (bitIndex!0 (size!2826 (buf!3233 (_1!6334 lt!214594))) (currentByte!6040 (_1!6334 lt!214594)) (currentBit!6035 (_1!6334 lt!214594)))))))

(declare-fun lt!214598 () Unit!8599)

(declare-fun lt!214585 () BitStream!4916)

(declare-fun readBytePrefixLemma!0 (BitStream!4916 BitStream!4916) Unit!8599)

(assert (=> b!137676 (= lt!214598 (readBytePrefixLemma!0 lt!214585 (_2!6335 lt!214578)))))

(assert (=> b!137676 (= lt!214594 (readBytePure!0 (BitStream!4917 (buf!3233 (_2!6335 lt!214578)) (currentByte!6040 thiss!1634) (currentBit!6035 thiss!1634))))))

(assert (=> b!137676 (= lt!214587 (readBytePure!0 lt!214585))))

(assert (=> b!137676 (= lt!214585 (BitStream!4917 (buf!3233 (_2!6335 lt!214580)) (currentByte!6040 thiss!1634) (currentBit!6035 thiss!1634)))))

(declare-fun e!91521 () Bool)

(assert (=> b!137676 e!91521))

(declare-fun res!114676 () Bool)

(assert (=> b!137676 (=> (not res!114676) (not e!91521))))

(declare-fun isPrefixOf!0 (BitStream!4916 BitStream!4916) Bool)

(assert (=> b!137676 (= res!114676 (isPrefixOf!0 thiss!1634 (_2!6335 lt!214578)))))

(declare-fun lt!214581 () Unit!8599)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4916 BitStream!4916 BitStream!4916) Unit!8599)

(assert (=> b!137676 (= lt!214581 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6335 lt!214580) (_2!6335 lt!214578)))))

(declare-fun e!91518 () Bool)

(assert (=> b!137676 e!91518))

(declare-fun res!114678 () Bool)

(assert (=> b!137676 (=> (not res!114678) (not e!91518))))

(assert (=> b!137676 (= res!114678 (= (size!2826 (buf!3233 (_2!6335 lt!214580))) (size!2826 (buf!3233 (_2!6335 lt!214578)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4916 array!6241 (_ BitVec 32) (_ BitVec 32)) tuple2!12024)

(assert (=> b!137676 (= lt!214578 (appendByteArrayLoop!0 (_2!6335 lt!214580) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!137676 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2826 (buf!3233 (_2!6335 lt!214580)))) ((_ sign_extend 32) (currentByte!6040 (_2!6335 lt!214580))) ((_ sign_extend 32) (currentBit!6035 (_2!6335 lt!214580))) lt!214577)))

(assert (=> b!137676 (= lt!214577 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!214579 () Unit!8599)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4916 BitStream!4916 (_ BitVec 64) (_ BitVec 32)) Unit!8599)

(assert (=> b!137676 (= lt!214579 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6335 lt!214580) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!91515 () Bool)

(assert (=> b!137676 e!91515))

(declare-fun res!114675 () Bool)

(assert (=> b!137676 (=> (not res!114675) (not e!91515))))

(assert (=> b!137676 (= res!114675 (= (size!2826 (buf!3233 thiss!1634)) (size!2826 (buf!3233 (_2!6335 lt!214580)))))))

(declare-fun appendByte!0 (BitStream!4916 (_ BitVec 8)) tuple2!12024)

(assert (=> b!137676 (= lt!214580 (appendByte!0 thiss!1634 (select (arr!3512 arr!237) from!447)))))

(declare-fun b!137677 () Bool)

(declare-fun res!114687 () Bool)

(assert (=> b!137677 (=> (not res!114687) (not e!91512))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!137677 (= res!114687 (invariant!0 (currentBit!6035 thiss!1634) (currentByte!6040 thiss!1634) (size!2826 (buf!3233 thiss!1634))))))

(declare-fun b!137678 () Bool)

(declare-fun res!114673 () Bool)

(assert (=> b!137678 (=> (not res!114673) (not e!91512))))

(assert (=> b!137678 (= res!114673 (bvslt from!447 to!404))))

(declare-fun b!137679 () Bool)

(declare-fun e!91513 () Bool)

(assert (=> b!137679 (= e!91513 true)))

(declare-fun lt!214597 () (_ BitVec 64))

(assert (=> b!137679 (= lt!214597 (bitIndex!0 (size!2826 (buf!3233 (_2!6335 lt!214578))) (currentByte!6040 (_2!6335 lt!214578)) (currentBit!6035 (_2!6335 lt!214578))))))

(declare-fun lt!214603 () (_ BitVec 64))

(assert (=> b!137679 (= lt!214603 (bitIndex!0 (size!2826 (buf!3233 thiss!1634)) (currentByte!6040 thiss!1634) (currentBit!6035 thiss!1634)))))

(declare-fun b!137680 () Bool)

(declare-fun e!91517 () Bool)

(assert (=> b!137680 (= e!91518 e!91517)))

(declare-fun res!114677 () Bool)

(assert (=> b!137680 (=> (not res!114677) (not e!91517))))

(declare-fun lt!214588 () (_ BitVec 64))

(assert (=> b!137680 (= res!114677 (= (bitIndex!0 (size!2826 (buf!3233 (_2!6335 lt!214578))) (currentByte!6040 (_2!6335 lt!214578)) (currentBit!6035 (_2!6335 lt!214578))) (bvadd (bitIndex!0 (size!2826 (buf!3233 (_2!6335 lt!214580))) (currentByte!6040 (_2!6335 lt!214580)) (currentBit!6035 (_2!6335 lt!214580))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!214588))))))

(assert (=> b!137680 (= lt!214588 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!137681 () Bool)

(assert (=> b!137681 (= e!91514 e!91513)))

(declare-fun res!114684 () Bool)

(assert (=> b!137681 (=> res!114684 e!91513)))

(assert (=> b!137681 (= res!114684 (not (= (size!2826 (buf!3233 thiss!1634)) (size!2826 (buf!3233 (_2!6335 lt!214578))))))))

(assert (=> b!137681 (arrayRangesEq!229 arr!237 (_2!6332 lt!214584) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!214586 () Unit!8599)

(declare-fun arrayRangesEqTransitive!31 (array!6241 array!6241 array!6241 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8599)

(assert (=> b!137681 (= lt!214586 (arrayRangesEqTransitive!31 arr!237 (_2!6332 lt!214596) (_2!6332 lt!214584) #b00000000000000000000000000000000 to!404 to!404))))

(assert (=> b!137681 (arrayRangesEq!229 (_2!6332 lt!214596) (_2!6332 lt!214584) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!214601 () Unit!8599)

(declare-fun arrayRangesEqSymmetricLemma!42 (array!6241 array!6241 (_ BitVec 32) (_ BitVec 32)) Unit!8599)

(assert (=> b!137681 (= lt!214601 (arrayRangesEqSymmetricLemma!42 (_2!6332 lt!214584) (_2!6332 lt!214596) #b00000000000000000000000000000000 to!404))))

(declare-fun b!137682 () Bool)

(declare-fun lt!214602 () tuple2!12020)

(declare-fun lt!214591 () tuple2!12022)

(assert (=> b!137682 (= e!91515 (and (= (_2!6334 lt!214591) (select (arr!3512 arr!237) from!447)) (= (_1!6334 lt!214591) (_2!6333 lt!214602))))))

(assert (=> b!137682 (= lt!214591 (readBytePure!0 (_1!6333 lt!214602)))))

(assert (=> b!137682 (= lt!214602 (reader!0 thiss!1634 (_2!6335 lt!214580)))))

(declare-fun b!137683 () Bool)

(declare-fun e!91519 () Bool)

(assert (=> b!137683 (= e!91517 (not e!91519))))

(declare-fun res!114685 () Bool)

(assert (=> b!137683 (=> res!114685 e!91519)))

(declare-fun lt!214589 () tuple2!12020)

(declare-fun lt!214582 () tuple2!12018)

(assert (=> b!137683 (= res!114685 (or (not (= (size!2826 (_2!6332 lt!214582)) (size!2826 arr!237))) (not (= (_1!6332 lt!214582) (_2!6333 lt!214589)))))))

(assert (=> b!137683 (= lt!214582 (readByteArrayLoopPure!0 (_1!6333 lt!214589) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!137683 (validate_offset_bits!1 ((_ sign_extend 32) (size!2826 (buf!3233 (_2!6335 lt!214578)))) ((_ sign_extend 32) (currentByte!6040 (_2!6335 lt!214580))) ((_ sign_extend 32) (currentBit!6035 (_2!6335 lt!214580))) lt!214588)))

(declare-fun lt!214583 () Unit!8599)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4916 array!6241 (_ BitVec 64)) Unit!8599)

(assert (=> b!137683 (= lt!214583 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6335 lt!214580) (buf!3233 (_2!6335 lt!214578)) lt!214588))))

(assert (=> b!137683 (= lt!214589 (reader!0 (_2!6335 lt!214580) (_2!6335 lt!214578)))))

(declare-fun b!137684 () Bool)

(declare-fun e!91516 () Bool)

(declare-fun array_inv!2615 (array!6241) Bool)

(assert (=> b!137684 (= e!91516 (array_inv!2615 (buf!3233 thiss!1634)))))

(declare-fun b!137686 () Bool)

(assert (=> b!137686 (= e!91519 (not (arrayRangesEq!229 arr!237 (_2!6332 lt!214582) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!137687 () Bool)

(assert (=> b!137687 (= e!91511 (= (_2!6334 lt!214587) (_2!6334 lt!214594)))))

(declare-fun b!137688 () Bool)

(declare-fun res!114682 () Bool)

(assert (=> b!137688 (=> (not res!114682) (not e!91515))))

(assert (=> b!137688 (= res!114682 (= (bitIndex!0 (size!2826 (buf!3233 (_2!6335 lt!214580))) (currentByte!6040 (_2!6335 lt!214580)) (currentBit!6035 (_2!6335 lt!214580))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2826 (buf!3233 thiss!1634)) (currentByte!6040 thiss!1634) (currentBit!6035 thiss!1634)))))))

(declare-fun b!137689 () Bool)

(declare-fun res!114679 () Bool)

(assert (=> b!137689 (=> (not res!114679) (not e!91515))))

(assert (=> b!137689 (= res!114679 (isPrefixOf!0 thiss!1634 (_2!6335 lt!214580)))))

(declare-fun b!137690 () Bool)

(assert (=> b!137690 (= e!91521 (invariant!0 (currentBit!6035 thiss!1634) (currentByte!6040 thiss!1634) (size!2826 (buf!3233 (_2!6335 lt!214580)))))))

(declare-fun b!137691 () Bool)

(declare-fun res!114683 () Bool)

(assert (=> b!137691 (=> (not res!114683) (not e!91512))))

(assert (=> b!137691 (= res!114683 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2826 (buf!3233 thiss!1634))) ((_ sign_extend 32) (currentByte!6040 thiss!1634)) ((_ sign_extend 32) (currentBit!6035 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!137685 () Bool)

(declare-fun res!114680 () Bool)

(assert (=> b!137685 (=> (not res!114680) (not e!91517))))

(assert (=> b!137685 (= res!114680 (isPrefixOf!0 (_2!6335 lt!214580) (_2!6335 lt!214578)))))

(declare-fun res!114686 () Bool)

(assert (=> start!26732 (=> (not res!114686) (not e!91512))))

(assert (=> start!26732 (= res!114686 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2826 arr!237))))))

(assert (=> start!26732 e!91512))

(assert (=> start!26732 true))

(assert (=> start!26732 (array_inv!2615 arr!237)))

(declare-fun inv!12 (BitStream!4916) Bool)

(assert (=> start!26732 (and (inv!12 thiss!1634) e!91516)))

(assert (= (and start!26732 res!114686) b!137691))

(assert (= (and b!137691 res!114683) b!137678))

(assert (= (and b!137678 res!114673) b!137677))

(assert (= (and b!137677 res!114687) b!137676))

(assert (= (and b!137676 res!114675) b!137688))

(assert (= (and b!137688 res!114682) b!137689))

(assert (= (and b!137689 res!114679) b!137682))

(assert (= (and b!137676 res!114678) b!137680))

(assert (= (and b!137680 res!114677) b!137685))

(assert (= (and b!137685 res!114680) b!137683))

(assert (= (and b!137683 (not res!114685)) b!137686))

(assert (= (and b!137676 res!114676) b!137690))

(assert (= (and b!137676 res!114674) b!137687))

(assert (= (and b!137676 (not res!114681)) b!137681))

(assert (= (and b!137681 (not res!114684)) b!137679))

(assert (= start!26732 b!137684))

(declare-fun m!211439 () Bool)

(assert (=> b!137689 m!211439))

(declare-fun m!211441 () Bool)

(assert (=> b!137681 m!211441))

(declare-fun m!211443 () Bool)

(assert (=> b!137681 m!211443))

(declare-fun m!211445 () Bool)

(assert (=> b!137681 m!211445))

(declare-fun m!211447 () Bool)

(assert (=> b!137681 m!211447))

(declare-fun m!211449 () Bool)

(assert (=> b!137683 m!211449))

(declare-fun m!211451 () Bool)

(assert (=> b!137683 m!211451))

(declare-fun m!211453 () Bool)

(assert (=> b!137683 m!211453))

(declare-fun m!211455 () Bool)

(assert (=> b!137683 m!211455))

(declare-fun m!211457 () Bool)

(assert (=> b!137686 m!211457))

(assert (=> b!137676 m!211455))

(declare-fun m!211459 () Bool)

(assert (=> b!137676 m!211459))

(declare-fun m!211461 () Bool)

(assert (=> b!137676 m!211461))

(declare-fun m!211463 () Bool)

(assert (=> b!137676 m!211463))

(declare-fun m!211465 () Bool)

(assert (=> b!137676 m!211465))

(declare-fun m!211467 () Bool)

(assert (=> b!137676 m!211467))

(declare-fun m!211469 () Bool)

(assert (=> b!137676 m!211469))

(declare-fun m!211471 () Bool)

(assert (=> b!137676 m!211471))

(declare-fun m!211473 () Bool)

(assert (=> b!137676 m!211473))

(declare-fun m!211475 () Bool)

(assert (=> b!137676 m!211475))

(declare-fun m!211477 () Bool)

(assert (=> b!137676 m!211477))

(declare-fun m!211479 () Bool)

(assert (=> b!137676 m!211479))

(declare-fun m!211481 () Bool)

(assert (=> b!137676 m!211481))

(declare-fun m!211483 () Bool)

(assert (=> b!137676 m!211483))

(declare-fun m!211485 () Bool)

(assert (=> b!137676 m!211485))

(declare-fun m!211487 () Bool)

(assert (=> b!137676 m!211487))

(assert (=> b!137676 m!211485))

(declare-fun m!211489 () Bool)

(assert (=> b!137676 m!211489))

(declare-fun m!211491 () Bool)

(assert (=> b!137676 m!211491))

(declare-fun m!211493 () Bool)

(assert (=> b!137676 m!211493))

(declare-fun m!211495 () Bool)

(assert (=> b!137676 m!211495))

(declare-fun m!211497 () Bool)

(assert (=> b!137676 m!211497))

(declare-fun m!211499 () Bool)

(assert (=> b!137676 m!211499))

(declare-fun m!211501 () Bool)

(assert (=> b!137676 m!211501))

(declare-fun m!211503 () Bool)

(assert (=> b!137676 m!211503))

(declare-fun m!211505 () Bool)

(assert (=> b!137676 m!211505))

(declare-fun m!211507 () Bool)

(assert (=> b!137676 m!211507))

(declare-fun m!211509 () Bool)

(assert (=> b!137676 m!211509))

(assert (=> b!137676 m!211477))

(declare-fun m!211511 () Bool)

(assert (=> b!137685 m!211511))

(declare-fun m!211513 () Bool)

(assert (=> b!137679 m!211513))

(declare-fun m!211515 () Bool)

(assert (=> b!137679 m!211515))

(declare-fun m!211517 () Bool)

(assert (=> start!26732 m!211517))

(declare-fun m!211519 () Bool)

(assert (=> start!26732 m!211519))

(assert (=> b!137680 m!211513))

(declare-fun m!211521 () Bool)

(assert (=> b!137680 m!211521))

(declare-fun m!211523 () Bool)

(assert (=> b!137677 m!211523))

(declare-fun m!211525 () Bool)

(assert (=> b!137691 m!211525))

(assert (=> b!137682 m!211477))

(declare-fun m!211527 () Bool)

(assert (=> b!137682 m!211527))

(declare-fun m!211529 () Bool)

(assert (=> b!137682 m!211529))

(declare-fun m!211531 () Bool)

(assert (=> b!137684 m!211531))

(declare-fun m!211533 () Bool)

(assert (=> b!137690 m!211533))

(assert (=> b!137688 m!211521))

(assert (=> b!137688 m!211515))

(push 1)

(assert (not b!137688))

(assert (not b!137685))

(assert (not b!137691))

(assert (not start!26732))

(assert (not b!137681))

(assert (not b!137684))

(assert (not b!137689))

(assert (not b!137690))

(assert (not b!137680))

(assert (not b!137683))

(assert (not b!137676))

(assert (not b!137686))

(assert (not b!137679))

(assert (not b!137677))

(assert (not b!137682))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

