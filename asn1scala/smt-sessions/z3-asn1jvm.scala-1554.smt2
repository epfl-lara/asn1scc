; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43622 () Bool)

(assert start!43622)

(declare-fun b!206849 () Bool)

(declare-fun res!173495 () Bool)

(declare-fun e!141412 () Bool)

(assert (=> b!206849 (=> (not res!173495) (not e!141412))))

(declare-datatypes ((array!10405 0))(
  ( (array!10406 (arr!5504 (Array (_ BitVec 32) (_ BitVec 8))) (size!4574 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8256 0))(
  ( (BitStream!8257 (buf!5079 array!10405) (currentByte!9597 (_ BitVec 32)) (currentBit!9592 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8256)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!206849 (= res!173495 (invariant!0 (currentBit!9592 thiss!1204) (currentByte!9597 thiss!1204) (size!4574 (buf!5079 thiss!1204))))))

(declare-fun b!206850 () Bool)

(declare-fun res!173486 () Bool)

(declare-fun e!141415 () Bool)

(assert (=> b!206850 (=> res!173486 e!141415)))

(declare-datatypes ((Unit!14742 0))(
  ( (Unit!14743) )
))
(declare-datatypes ((tuple2!17698 0))(
  ( (tuple2!17699 (_1!9504 Unit!14742) (_2!9504 BitStream!8256)) )
))
(declare-fun lt!323072 () tuple2!17698)

(declare-fun isPrefixOf!0 (BitStream!8256 BitStream!8256) Bool)

(assert (=> b!206850 (= res!173486 (not (isPrefixOf!0 thiss!1204 (_2!9504 lt!323072))))))

(declare-fun b!206851 () Bool)

(declare-fun res!173488 () Bool)

(assert (=> b!206851 (=> res!173488 e!141415)))

(declare-fun lt!323069 () tuple2!17698)

(assert (=> b!206851 (= res!173488 (not (isPrefixOf!0 (_2!9504 lt!323072) (_2!9504 lt!323069))))))

(declare-fun b!206852 () Bool)

(declare-fun res!173496 () Bool)

(assert (=> b!206852 (=> res!173496 e!141415)))

(assert (=> b!206852 (= res!173496 (not (invariant!0 (currentBit!9592 (_2!9504 lt!323069)) (currentByte!9597 (_2!9504 lt!323069)) (size!4574 (buf!5079 (_2!9504 lt!323069))))))))

(declare-fun b!206853 () Bool)

(declare-fun e!141418 () Bool)

(declare-datatypes ((tuple2!17700 0))(
  ( (tuple2!17701 (_1!9505 BitStream!8256) (_2!9505 Bool)) )
))
(declare-fun lt!323064 () tuple2!17700)

(declare-fun lt!323061 () tuple2!17700)

(assert (=> b!206853 (= e!141418 (= (_2!9505 lt!323064) (_2!9505 lt!323061)))))

(declare-fun b!206854 () Bool)

(declare-fun res!173483 () Bool)

(assert (=> b!206854 (=> (not res!173483) (not e!141412))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!206854 (= res!173483 (not (= i!590 nBits!348)))))

(declare-fun b!206856 () Bool)

(declare-fun e!141414 () Bool)

(declare-fun e!141416 () Bool)

(assert (=> b!206856 (= e!141414 e!141416)))

(declare-fun res!173492 () Bool)

(assert (=> b!206856 (=> (not res!173492) (not e!141416))))

(declare-fun lt!323073 () (_ BitVec 64))

(declare-fun lt!323059 () (_ BitVec 64))

(assert (=> b!206856 (= res!173492 (= lt!323073 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!323059)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!206856 (= lt!323073 (bitIndex!0 (size!4574 (buf!5079 (_2!9504 lt!323072))) (currentByte!9597 (_2!9504 lt!323072)) (currentBit!9592 (_2!9504 lt!323072))))))

(assert (=> b!206856 (= lt!323059 (bitIndex!0 (size!4574 (buf!5079 thiss!1204)) (currentByte!9597 thiss!1204) (currentBit!9592 thiss!1204)))))

(declare-fun b!206857 () Bool)

(declare-fun e!141420 () Bool)

(assert (=> b!206857 (= e!141412 (not e!141420))))

(declare-fun res!173487 () Bool)

(assert (=> b!206857 (=> res!173487 e!141420)))

(declare-fun lt!323067 () (_ BitVec 64))

(declare-fun lt!323070 () (_ BitVec 64))

(assert (=> b!206857 (= res!173487 (not (= lt!323067 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!323070))))))

(assert (=> b!206857 (= lt!323067 (bitIndex!0 (size!4574 (buf!5079 (_2!9504 lt!323072))) (currentByte!9597 (_2!9504 lt!323072)) (currentBit!9592 (_2!9504 lt!323072))))))

(assert (=> b!206857 (= lt!323070 (bitIndex!0 (size!4574 (buf!5079 thiss!1204)) (currentByte!9597 thiss!1204) (currentBit!9592 thiss!1204)))))

(assert (=> b!206857 e!141414))

(declare-fun res!173484 () Bool)

(assert (=> b!206857 (=> (not res!173484) (not e!141414))))

(assert (=> b!206857 (= res!173484 (= (size!4574 (buf!5079 thiss!1204)) (size!4574 (buf!5079 (_2!9504 lt!323072)))))))

(declare-fun lt!323071 () Bool)

(declare-fun appendBit!0 (BitStream!8256 Bool) tuple2!17698)

(assert (=> b!206857 (= lt!323072 (appendBit!0 thiss!1204 lt!323071))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!206857 (= lt!323071 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!206858 () Bool)

(declare-fun e!141417 () Bool)

(assert (=> b!206858 (= e!141417 (invariant!0 (currentBit!9592 thiss!1204) (currentByte!9597 thiss!1204) (size!4574 (buf!5079 (_2!9504 lt!323069)))))))

(declare-fun b!206859 () Bool)

(declare-fun e!141410 () Bool)

(assert (=> b!206859 (= e!141416 e!141410)))

(declare-fun res!173490 () Bool)

(assert (=> b!206859 (=> (not res!173490) (not e!141410))))

(declare-fun lt!323066 () tuple2!17700)

(assert (=> b!206859 (= res!173490 (and (= (_2!9505 lt!323066) lt!323071) (= (_1!9505 lt!323066) (_2!9504 lt!323072))))))

(declare-fun readBitPure!0 (BitStream!8256) tuple2!17700)

(declare-fun readerFrom!0 (BitStream!8256 (_ BitVec 32) (_ BitVec 32)) BitStream!8256)

(assert (=> b!206859 (= lt!323066 (readBitPure!0 (readerFrom!0 (_2!9504 lt!323072) (currentBit!9592 thiss!1204) (currentByte!9597 thiss!1204))))))

(declare-fun b!206860 () Bool)

(assert (=> b!206860 (= e!141410 (= (bitIndex!0 (size!4574 (buf!5079 (_1!9505 lt!323066))) (currentByte!9597 (_1!9505 lt!323066)) (currentBit!9592 (_1!9505 lt!323066))) lt!323073))))

(declare-fun b!206861 () Bool)

(declare-fun res!173498 () Bool)

(assert (=> b!206861 (=> res!173498 e!141415)))

(declare-fun lt!323060 () (_ BitVec 64))

(assert (=> b!206861 (= res!173498 (or (not (= (size!4574 (buf!5079 (_2!9504 lt!323069))) (size!4574 (buf!5079 thiss!1204)))) (not (= lt!323060 (bvsub (bvadd lt!323070 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!206862 () Bool)

(assert (=> b!206862 (= e!141415 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand i!590 #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 i!590) #b10000000000000000000000000000000))))))

(declare-datatypes ((tuple2!17702 0))(
  ( (tuple2!17703 (_1!9506 BitStream!8256) (_2!9506 (_ BitVec 64))) )
))
(declare-fun lt!323074 () tuple2!17702)

(declare-datatypes ((tuple2!17704 0))(
  ( (tuple2!17705 (_1!9507 BitStream!8256) (_2!9507 BitStream!8256)) )
))
(declare-fun lt!323075 () tuple2!17704)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8256 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17702)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!206862 (= lt!323074 (readNBitsLSBFirstsLoopPure!0 (_1!9507 lt!323075) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(declare-fun lt!323063 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!206862 (validate_offset_bits!1 ((_ sign_extend 32) (size!4574 (buf!5079 (_2!9504 lt!323069)))) ((_ sign_extend 32) (currentByte!9597 thiss!1204)) ((_ sign_extend 32) (currentBit!9592 thiss!1204)) lt!323063)))

(declare-fun lt!323058 () Unit!14742)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8256 array!10405 (_ BitVec 64)) Unit!14742)

(assert (=> b!206862 (= lt!323058 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5079 (_2!9504 lt!323069)) lt!323063))))

(assert (=> b!206862 (= (_2!9505 (readBitPure!0 (_1!9507 lt!323075))) lt!323071)))

(declare-fun lt!323068 () tuple2!17704)

(declare-fun reader!0 (BitStream!8256 BitStream!8256) tuple2!17704)

(assert (=> b!206862 (= lt!323068 (reader!0 (_2!9504 lt!323072) (_2!9504 lt!323069)))))

(assert (=> b!206862 (= lt!323075 (reader!0 thiss!1204 (_2!9504 lt!323069)))))

(assert (=> b!206862 e!141418))

(declare-fun res!173497 () Bool)

(assert (=> b!206862 (=> (not res!173497) (not e!141418))))

(assert (=> b!206862 (= res!173497 (= (bitIndex!0 (size!4574 (buf!5079 (_1!9505 lt!323064))) (currentByte!9597 (_1!9505 lt!323064)) (currentBit!9592 (_1!9505 lt!323064))) (bitIndex!0 (size!4574 (buf!5079 (_1!9505 lt!323061))) (currentByte!9597 (_1!9505 lt!323061)) (currentBit!9592 (_1!9505 lt!323061)))))))

(declare-fun lt!323062 () Unit!14742)

(declare-fun lt!323065 () BitStream!8256)

(declare-fun readBitPrefixLemma!0 (BitStream!8256 BitStream!8256) Unit!14742)

(assert (=> b!206862 (= lt!323062 (readBitPrefixLemma!0 lt!323065 (_2!9504 lt!323069)))))

(assert (=> b!206862 (= lt!323061 (readBitPure!0 (BitStream!8257 (buf!5079 (_2!9504 lt!323069)) (currentByte!9597 thiss!1204) (currentBit!9592 thiss!1204))))))

(assert (=> b!206862 (= lt!323064 (readBitPure!0 lt!323065))))

(assert (=> b!206862 e!141417))

(declare-fun res!173494 () Bool)

(assert (=> b!206862 (=> (not res!173494) (not e!141417))))

(assert (=> b!206862 (= res!173494 (invariant!0 (currentBit!9592 thiss!1204) (currentByte!9597 thiss!1204) (size!4574 (buf!5079 (_2!9504 lt!323072)))))))

(assert (=> b!206862 (= lt!323065 (BitStream!8257 (buf!5079 (_2!9504 lt!323072)) (currentByte!9597 thiss!1204) (currentBit!9592 thiss!1204)))))

(declare-fun b!206863 () Bool)

(declare-fun res!173493 () Bool)

(assert (=> b!206863 (=> (not res!173493) (not e!141416))))

(assert (=> b!206863 (= res!173493 (isPrefixOf!0 thiss!1204 (_2!9504 lt!323072)))))

(declare-fun b!206864 () Bool)

(assert (=> b!206864 (= e!141420 e!141415)))

(declare-fun res!173489 () Bool)

(assert (=> b!206864 (=> res!173489 e!141415)))

(assert (=> b!206864 (= res!173489 (not (= lt!323060 (bvsub (bvsub (bvadd lt!323067 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!206864 (= lt!323060 (bitIndex!0 (size!4574 (buf!5079 (_2!9504 lt!323069))) (currentByte!9597 (_2!9504 lt!323069)) (currentBit!9592 (_2!9504 lt!323069))))))

(assert (=> b!206864 (isPrefixOf!0 thiss!1204 (_2!9504 lt!323069))))

(declare-fun lt!323057 () Unit!14742)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8256 BitStream!8256 BitStream!8256) Unit!14742)

(assert (=> b!206864 (= lt!323057 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9504 lt!323072) (_2!9504 lt!323069)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8256 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17698)

(assert (=> b!206864 (= lt!323069 (appendBitsLSBFirstLoopTR!0 (_2!9504 lt!323072) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!206865 () Bool)

(declare-fun e!141413 () Bool)

(declare-fun array_inv!4315 (array!10405) Bool)

(assert (=> b!206865 (= e!141413 (array_inv!4315 (buf!5079 thiss!1204)))))

(declare-fun res!173491 () Bool)

(declare-fun e!141419 () Bool)

(assert (=> start!43622 (=> (not res!173491) (not e!141419))))

(assert (=> start!43622 (= res!173491 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43622 e!141419))

(assert (=> start!43622 true))

(declare-fun inv!12 (BitStream!8256) Bool)

(assert (=> start!43622 (and (inv!12 thiss!1204) e!141413)))

(declare-fun b!206855 () Bool)

(assert (=> b!206855 (= e!141419 e!141412)))

(declare-fun res!173485 () Bool)

(assert (=> b!206855 (=> (not res!173485) (not e!141412))))

(assert (=> b!206855 (= res!173485 (validate_offset_bits!1 ((_ sign_extend 32) (size!4574 (buf!5079 thiss!1204))) ((_ sign_extend 32) (currentByte!9597 thiss!1204)) ((_ sign_extend 32) (currentBit!9592 thiss!1204)) lt!323063))))

(assert (=> b!206855 (= lt!323063 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(assert (= (and start!43622 res!173491) b!206855))

(assert (= (and b!206855 res!173485) b!206849))

(assert (= (and b!206849 res!173495) b!206854))

(assert (= (and b!206854 res!173483) b!206857))

(assert (= (and b!206857 res!173484) b!206856))

(assert (= (and b!206856 res!173492) b!206863))

(assert (= (and b!206863 res!173493) b!206859))

(assert (= (and b!206859 res!173490) b!206860))

(assert (= (and b!206857 (not res!173487)) b!206864))

(assert (= (and b!206864 (not res!173489)) b!206852))

(assert (= (and b!206852 (not res!173496)) b!206861))

(assert (= (and b!206861 (not res!173498)) b!206851))

(assert (= (and b!206851 (not res!173488)) b!206850))

(assert (= (and b!206850 (not res!173486)) b!206862))

(assert (= (and b!206862 res!173494) b!206858))

(assert (= (and b!206862 res!173497) b!206853))

(assert (= start!43622 b!206865))

(declare-fun m!318467 () Bool)

(assert (=> b!206864 m!318467))

(declare-fun m!318469 () Bool)

(assert (=> b!206864 m!318469))

(declare-fun m!318471 () Bool)

(assert (=> b!206864 m!318471))

(declare-fun m!318473 () Bool)

(assert (=> b!206864 m!318473))

(declare-fun m!318475 () Bool)

(assert (=> b!206856 m!318475))

(declare-fun m!318477 () Bool)

(assert (=> b!206856 m!318477))

(declare-fun m!318479 () Bool)

(assert (=> start!43622 m!318479))

(declare-fun m!318481 () Bool)

(assert (=> b!206855 m!318481))

(declare-fun m!318483 () Bool)

(assert (=> b!206865 m!318483))

(declare-fun m!318485 () Bool)

(assert (=> b!206862 m!318485))

(declare-fun m!318487 () Bool)

(assert (=> b!206862 m!318487))

(declare-fun m!318489 () Bool)

(assert (=> b!206862 m!318489))

(declare-fun m!318491 () Bool)

(assert (=> b!206862 m!318491))

(declare-fun m!318493 () Bool)

(assert (=> b!206862 m!318493))

(declare-fun m!318495 () Bool)

(assert (=> b!206862 m!318495))

(declare-fun m!318497 () Bool)

(assert (=> b!206862 m!318497))

(declare-fun m!318499 () Bool)

(assert (=> b!206862 m!318499))

(declare-fun m!318501 () Bool)

(assert (=> b!206862 m!318501))

(declare-fun m!318503 () Bool)

(assert (=> b!206862 m!318503))

(declare-fun m!318505 () Bool)

(assert (=> b!206862 m!318505))

(declare-fun m!318507 () Bool)

(assert (=> b!206862 m!318507))

(declare-fun m!318509 () Bool)

(assert (=> b!206862 m!318509))

(declare-fun m!318511 () Bool)

(assert (=> b!206860 m!318511))

(declare-fun m!318513 () Bool)

(assert (=> b!206863 m!318513))

(declare-fun m!318515 () Bool)

(assert (=> b!206852 m!318515))

(assert (=> b!206857 m!318475))

(assert (=> b!206857 m!318477))

(declare-fun m!318517 () Bool)

(assert (=> b!206857 m!318517))

(declare-fun m!318519 () Bool)

(assert (=> b!206859 m!318519))

(assert (=> b!206859 m!318519))

(declare-fun m!318521 () Bool)

(assert (=> b!206859 m!318521))

(declare-fun m!318523 () Bool)

(assert (=> b!206849 m!318523))

(declare-fun m!318525 () Bool)

(assert (=> b!206858 m!318525))

(declare-fun m!318527 () Bool)

(assert (=> b!206851 m!318527))

(assert (=> b!206850 m!318513))

(check-sat (not b!206864) (not b!206858) (not b!206863) (not b!206850) (not b!206862) (not b!206865) (not b!206851) (not b!206852) (not b!206856) (not b!206859) (not b!206849) (not start!43622) (not b!206855) (not b!206857) (not b!206860))
(check-sat)
