; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39618 () Bool)

(assert start!39618)

(declare-fun b!178940 () Bool)

(declare-fun e!124517 () Bool)

(assert (=> b!178940 (= e!124517 true)))

(declare-fun e!124525 () Bool)

(assert (=> b!178940 e!124525))

(declare-fun res!148460 () Bool)

(assert (=> b!178940 (=> (not res!148460) (not e!124525))))

(declare-datatypes ((array!9633 0))(
  ( (array!9634 (arr!5178 (Array (_ BitVec 32) (_ BitVec 8))) (size!4248 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7604 0))(
  ( (BitStream!7605 (buf!4691 array!9633) (currentByte!8889 (_ BitVec 32)) (currentBit!8884 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15424 0))(
  ( (tuple2!15425 (_1!8357 BitStream!7604) (_2!8357 Bool)) )
))
(declare-fun lt!274494 () tuple2!15424)

(declare-fun lt!274493 () tuple2!15424)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!178940 (= res!148460 (= (bitIndex!0 (size!4248 (buf!4691 (_1!8357 lt!274494))) (currentByte!8889 (_1!8357 lt!274494)) (currentBit!8884 (_1!8357 lt!274494))) (bitIndex!0 (size!4248 (buf!4691 (_1!8357 lt!274493))) (currentByte!8889 (_1!8357 lt!274493)) (currentBit!8884 (_1!8357 lt!274493)))))))

(declare-datatypes ((Unit!12876 0))(
  ( (Unit!12877) )
))
(declare-fun lt!274486 () Unit!12876)

(declare-fun lt!274490 () BitStream!7604)

(declare-datatypes ((tuple2!15426 0))(
  ( (tuple2!15427 (_1!8358 Unit!12876) (_2!8358 BitStream!7604)) )
))
(declare-fun lt!274496 () tuple2!15426)

(declare-fun readBitPrefixLemma!0 (BitStream!7604 BitStream!7604) Unit!12876)

(assert (=> b!178940 (= lt!274486 (readBitPrefixLemma!0 lt!274490 (_2!8358 lt!274496)))))

(declare-fun thiss!1204 () BitStream!7604)

(declare-fun readBitPure!0 (BitStream!7604) tuple2!15424)

(assert (=> b!178940 (= lt!274493 (readBitPure!0 (BitStream!7605 (buf!4691 (_2!8358 lt!274496)) (currentByte!8889 thiss!1204) (currentBit!8884 thiss!1204))))))

(assert (=> b!178940 (= lt!274494 (readBitPure!0 lt!274490))))

(declare-fun e!124524 () Bool)

(assert (=> b!178940 e!124524))

(declare-fun res!148457 () Bool)

(assert (=> b!178940 (=> (not res!148457) (not e!124524))))

(declare-fun lt!274485 () tuple2!15426)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!178940 (= res!148457 (invariant!0 (currentBit!8884 thiss!1204) (currentByte!8889 thiss!1204) (size!4248 (buf!4691 (_2!8358 lt!274485)))))))

(assert (=> b!178940 (= lt!274490 (BitStream!7605 (buf!4691 (_2!8358 lt!274485)) (currentByte!8889 thiss!1204) (currentBit!8884 thiss!1204)))))

(declare-fun b!178941 () Bool)

(declare-fun e!124523 () Bool)

(declare-fun array_inv!3989 (array!9633) Bool)

(assert (=> b!178941 (= e!124523 (array_inv!3989 (buf!4691 thiss!1204)))))

(declare-fun b!178942 () Bool)

(declare-fun res!148454 () Bool)

(declare-fun e!124518 () Bool)

(assert (=> b!178942 (=> (not res!148454) (not e!124518))))

(assert (=> b!178942 (= res!148454 (invariant!0 (currentBit!8884 thiss!1204) (currentByte!8889 thiss!1204) (size!4248 (buf!4691 thiss!1204))))))

(declare-fun res!148461 () Bool)

(assert (=> start!39618 (=> (not res!148461) (not e!124518))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!39618 (= res!148461 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39618 e!124518))

(assert (=> start!39618 true))

(declare-fun inv!12 (BitStream!7604) Bool)

(assert (=> start!39618 (and (inv!12 thiss!1204) e!124523)))

(declare-fun b!178943 () Bool)

(declare-fun e!124520 () Bool)

(assert (=> b!178943 (= e!124520 e!124517)))

(declare-fun res!148462 () Bool)

(assert (=> b!178943 (=> res!148462 e!124517)))

(declare-fun lt!274488 () (_ BitVec 64))

(declare-fun lt!274489 () (_ BitVec 64))

(assert (=> b!178943 (= res!148462 (not (= lt!274489 (bvsub (bvsub (bvadd lt!274488 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!178943 (= lt!274489 (bitIndex!0 (size!4248 (buf!4691 (_2!8358 lt!274496))) (currentByte!8889 (_2!8358 lt!274496)) (currentBit!8884 (_2!8358 lt!274496))))))

(declare-fun isPrefixOf!0 (BitStream!7604 BitStream!7604) Bool)

(assert (=> b!178943 (isPrefixOf!0 thiss!1204 (_2!8358 lt!274496))))

(declare-fun lt!274484 () Unit!12876)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7604 BitStream!7604 BitStream!7604) Unit!12876)

(assert (=> b!178943 (= lt!274484 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8358 lt!274485) (_2!8358 lt!274496)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7604 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15426)

(assert (=> b!178943 (= lt!274496 (appendBitsLSBFirstLoopTR!0 (_2!8358 lt!274485) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!178944 () Bool)

(declare-fun e!124516 () Bool)

(declare-fun e!124519 () Bool)

(assert (=> b!178944 (= e!124516 e!124519)))

(declare-fun res!148452 () Bool)

(assert (=> b!178944 (=> (not res!148452) (not e!124519))))

(declare-fun lt!274492 () (_ BitVec 64))

(declare-fun lt!274491 () (_ BitVec 64))

(assert (=> b!178944 (= res!148452 (= lt!274492 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!274491)))))

(assert (=> b!178944 (= lt!274492 (bitIndex!0 (size!4248 (buf!4691 (_2!8358 lt!274485))) (currentByte!8889 (_2!8358 lt!274485)) (currentBit!8884 (_2!8358 lt!274485))))))

(assert (=> b!178944 (= lt!274491 (bitIndex!0 (size!4248 (buf!4691 thiss!1204)) (currentByte!8889 thiss!1204) (currentBit!8884 thiss!1204)))))

(declare-fun b!178945 () Bool)

(declare-fun res!148465 () Bool)

(assert (=> b!178945 (=> (not res!148465) (not e!124518))))

(assert (=> b!178945 (= res!148465 (not (= i!590 nBits!348)))))

(declare-fun b!178946 () Bool)

(declare-fun res!148463 () Bool)

(assert (=> b!178946 (=> res!148463 e!124517)))

(declare-fun lt!274487 () (_ BitVec 64))

(assert (=> b!178946 (= res!148463 (or (not (= (size!4248 (buf!4691 (_2!8358 lt!274496))) (size!4248 (buf!4691 thiss!1204)))) (not (= lt!274489 (bvsub (bvadd lt!274487 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!178947 () Bool)

(declare-fun res!148455 () Bool)

(assert (=> b!178947 (=> res!148455 e!124517)))

(assert (=> b!178947 (= res!148455 (not (invariant!0 (currentBit!8884 (_2!8358 lt!274496)) (currentByte!8889 (_2!8358 lt!274496)) (size!4248 (buf!4691 (_2!8358 lt!274496))))))))

(declare-fun b!178948 () Bool)

(assert (=> b!178948 (= e!124524 (invariant!0 (currentBit!8884 thiss!1204) (currentByte!8889 thiss!1204) (size!4248 (buf!4691 (_2!8358 lt!274496)))))))

(declare-fun b!178949 () Bool)

(declare-fun e!124521 () Bool)

(assert (=> b!178949 (= e!124519 e!124521)))

(declare-fun res!148453 () Bool)

(assert (=> b!178949 (=> (not res!148453) (not e!124521))))

(declare-fun lt!274483 () tuple2!15424)

(declare-fun lt!274495 () Bool)

(assert (=> b!178949 (= res!148453 (and (= (_2!8357 lt!274483) lt!274495) (= (_1!8357 lt!274483) (_2!8358 lt!274485))))))

(declare-fun readerFrom!0 (BitStream!7604 (_ BitVec 32) (_ BitVec 32)) BitStream!7604)

(assert (=> b!178949 (= lt!274483 (readBitPure!0 (readerFrom!0 (_2!8358 lt!274485) (currentBit!8884 thiss!1204) (currentByte!8889 thiss!1204))))))

(declare-fun b!178950 () Bool)

(declare-fun res!148467 () Bool)

(assert (=> b!178950 (=> res!148467 e!124517)))

(assert (=> b!178950 (= res!148467 (not (isPrefixOf!0 thiss!1204 (_2!8358 lt!274485))))))

(declare-fun b!178951 () Bool)

(declare-fun res!148459 () Bool)

(assert (=> b!178951 (=> (not res!148459) (not e!124519))))

(assert (=> b!178951 (= res!148459 (isPrefixOf!0 thiss!1204 (_2!8358 lt!274485)))))

(declare-fun b!178952 () Bool)

(declare-fun res!148458 () Bool)

(assert (=> b!178952 (=> (not res!148458) (not e!124518))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!178952 (= res!148458 (validate_offset_bits!1 ((_ sign_extend 32) (size!4248 (buf!4691 thiss!1204))) ((_ sign_extend 32) (currentByte!8889 thiss!1204)) ((_ sign_extend 32) (currentBit!8884 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!178953 () Bool)

(assert (=> b!178953 (= e!124521 (= (bitIndex!0 (size!4248 (buf!4691 (_1!8357 lt!274483))) (currentByte!8889 (_1!8357 lt!274483)) (currentBit!8884 (_1!8357 lt!274483))) lt!274492))))

(declare-fun b!178954 () Bool)

(assert (=> b!178954 (= e!124525 (= (_2!8357 lt!274494) (_2!8357 lt!274493)))))

(declare-fun b!178955 () Bool)

(assert (=> b!178955 (= e!124518 (not e!124520))))

(declare-fun res!148464 () Bool)

(assert (=> b!178955 (=> res!148464 e!124520)))

(assert (=> b!178955 (= res!148464 (not (= lt!274488 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!274487))))))

(assert (=> b!178955 (= lt!274488 (bitIndex!0 (size!4248 (buf!4691 (_2!8358 lt!274485))) (currentByte!8889 (_2!8358 lt!274485)) (currentBit!8884 (_2!8358 lt!274485))))))

(assert (=> b!178955 (= lt!274487 (bitIndex!0 (size!4248 (buf!4691 thiss!1204)) (currentByte!8889 thiss!1204) (currentBit!8884 thiss!1204)))))

(assert (=> b!178955 e!124516))

(declare-fun res!148456 () Bool)

(assert (=> b!178955 (=> (not res!148456) (not e!124516))))

(assert (=> b!178955 (= res!148456 (= (size!4248 (buf!4691 thiss!1204)) (size!4248 (buf!4691 (_2!8358 lt!274485)))))))

(declare-fun appendBit!0 (BitStream!7604 Bool) tuple2!15426)

(assert (=> b!178955 (= lt!274485 (appendBit!0 thiss!1204 lt!274495))))

(assert (=> b!178955 (= lt!274495 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!178956 () Bool)

(declare-fun res!148466 () Bool)

(assert (=> b!178956 (=> res!148466 e!124517)))

(assert (=> b!178956 (= res!148466 (not (isPrefixOf!0 (_2!8358 lt!274485) (_2!8358 lt!274496))))))

(assert (= (and start!39618 res!148461) b!178952))

(assert (= (and b!178952 res!148458) b!178942))

(assert (= (and b!178942 res!148454) b!178945))

(assert (= (and b!178945 res!148465) b!178955))

(assert (= (and b!178955 res!148456) b!178944))

(assert (= (and b!178944 res!148452) b!178951))

(assert (= (and b!178951 res!148459) b!178949))

(assert (= (and b!178949 res!148453) b!178953))

(assert (= (and b!178955 (not res!148464)) b!178943))

(assert (= (and b!178943 (not res!148462)) b!178947))

(assert (= (and b!178947 (not res!148455)) b!178946))

(assert (= (and b!178946 (not res!148463)) b!178956))

(assert (= (and b!178956 (not res!148466)) b!178950))

(assert (= (and b!178950 (not res!148467)) b!178940))

(assert (= (and b!178940 res!148457) b!178948))

(assert (= (and b!178940 res!148460) b!178954))

(assert (= start!39618 b!178941))

(declare-fun m!279019 () Bool)

(assert (=> b!178955 m!279019))

(declare-fun m!279021 () Bool)

(assert (=> b!178955 m!279021))

(declare-fun m!279023 () Bool)

(assert (=> b!178955 m!279023))

(declare-fun m!279025 () Bool)

(assert (=> b!178953 m!279025))

(declare-fun m!279027 () Bool)

(assert (=> b!178941 m!279027))

(declare-fun m!279029 () Bool)

(assert (=> b!178943 m!279029))

(declare-fun m!279031 () Bool)

(assert (=> b!178943 m!279031))

(declare-fun m!279033 () Bool)

(assert (=> b!178943 m!279033))

(declare-fun m!279035 () Bool)

(assert (=> b!178943 m!279035))

(declare-fun m!279037 () Bool)

(assert (=> start!39618 m!279037))

(declare-fun m!279039 () Bool)

(assert (=> b!178949 m!279039))

(assert (=> b!178949 m!279039))

(declare-fun m!279041 () Bool)

(assert (=> b!178949 m!279041))

(declare-fun m!279043 () Bool)

(assert (=> b!178947 m!279043))

(declare-fun m!279045 () Bool)

(assert (=> b!178940 m!279045))

(declare-fun m!279047 () Bool)

(assert (=> b!178940 m!279047))

(declare-fun m!279049 () Bool)

(assert (=> b!178940 m!279049))

(declare-fun m!279051 () Bool)

(assert (=> b!178940 m!279051))

(declare-fun m!279053 () Bool)

(assert (=> b!178940 m!279053))

(declare-fun m!279055 () Bool)

(assert (=> b!178940 m!279055))

(declare-fun m!279057 () Bool)

(assert (=> b!178948 m!279057))

(declare-fun m!279059 () Bool)

(assert (=> b!178950 m!279059))

(assert (=> b!178944 m!279019))

(assert (=> b!178944 m!279021))

(assert (=> b!178951 m!279059))

(declare-fun m!279061 () Bool)

(assert (=> b!178952 m!279061))

(declare-fun m!279063 () Bool)

(assert (=> b!178956 m!279063))

(declare-fun m!279065 () Bool)

(assert (=> b!178942 m!279065))

(push 1)

(assert (not b!178948))

(assert (not b!178940))

(assert (not b!178943))

(assert (not b!178953))

(assert (not b!178944))

(assert (not b!178956))

(assert (not b!178947))

(assert (not b!178949))

(assert (not b!178941))

(assert (not b!178952))

(assert (not b!178955))

(assert (not b!178950))

(assert (not start!39618))

(assert (not b!178942))

(assert (not b!178951))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

