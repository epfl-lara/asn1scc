; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39732 () Bool)

(assert start!39732)

(declare-fun res!149467 () Bool)

(declare-fun e!125162 () Bool)

(assert (=> start!39732 (=> (not res!149467) (not e!125162))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!39732 (= res!149467 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39732 e!125162))

(assert (=> start!39732 true))

(declare-datatypes ((array!9666 0))(
  ( (array!9667 (arr!5193 (Array (_ BitVec 32) (_ BitVec 8))) (size!4263 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7634 0))(
  ( (BitStream!7635 (buf!4706 array!9666) (currentByte!8916 (_ BitVec 32)) (currentBit!8911 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7634)

(declare-fun e!125163 () Bool)

(declare-fun inv!12 (BitStream!7634) Bool)

(assert (=> start!39732 (and (inv!12 thiss!1204) e!125163)))

(declare-fun b!180059 () Bool)

(declare-fun e!125167 () Bool)

(declare-datatypes ((Unit!12945 0))(
  ( (Unit!12946) )
))
(declare-datatypes ((tuple2!15524 0))(
  ( (tuple2!15525 (_1!8407 Unit!12945) (_2!8407 BitStream!7634)) )
))
(declare-fun lt!276181 () tuple2!15524)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!180059 (= e!125167 (invariant!0 (currentBit!8911 thiss!1204) (currentByte!8916 thiss!1204) (size!4263 (buf!4706 (_2!8407 lt!276181)))))))

(declare-fun b!180060 () Bool)

(declare-fun e!125165 () Bool)

(declare-fun e!125169 () Bool)

(assert (=> b!180060 (= e!125165 e!125169)))

(declare-fun res!149469 () Bool)

(assert (=> b!180060 (=> res!149469 e!125169)))

(declare-fun lt!276185 () (_ BitVec 64))

(declare-fun lt!276178 () (_ BitVec 64))

(assert (=> b!180060 (= res!149469 (not (= lt!276185 (bvsub (bvsub (bvadd lt!276178 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!180060 (= lt!276185 (bitIndex!0 (size!4263 (buf!4706 (_2!8407 lt!276181))) (currentByte!8916 (_2!8407 lt!276181)) (currentBit!8911 (_2!8407 lt!276181))))))

(declare-fun isPrefixOf!0 (BitStream!7634 BitStream!7634) Bool)

(assert (=> b!180060 (isPrefixOf!0 thiss!1204 (_2!8407 lt!276181))))

(declare-fun lt!276191 () Unit!12945)

(declare-fun lt!276189 () tuple2!15524)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7634 BitStream!7634 BitStream!7634) Unit!12945)

(assert (=> b!180060 (= lt!276191 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8407 lt!276189) (_2!8407 lt!276181)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7634 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15524)

(assert (=> b!180060 (= lt!276181 (appendBitsLSBFirstLoopTR!0 (_2!8407 lt!276189) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!180061 () Bool)

(declare-fun res!149472 () Bool)

(assert (=> b!180061 (=> (not res!149472) (not e!125162))))

(assert (=> b!180061 (= res!149472 (not (= i!590 nBits!348)))))

(declare-fun b!180062 () Bool)

(declare-fun res!149470 () Bool)

(assert (=> b!180062 (=> (not res!149470) (not e!125162))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!180062 (= res!149470 (validate_offset_bits!1 ((_ sign_extend 32) (size!4263 (buf!4706 thiss!1204))) ((_ sign_extend 32) (currentByte!8916 thiss!1204)) ((_ sign_extend 32) (currentBit!8911 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!180063 () Bool)

(declare-fun res!149480 () Bool)

(assert (=> b!180063 (=> res!149480 e!125169)))

(assert (=> b!180063 (= res!149480 (not (isPrefixOf!0 thiss!1204 (_2!8407 lt!276189))))))

(declare-fun b!180064 () Bool)

(declare-fun res!149471 () Bool)

(declare-fun e!125161 () Bool)

(assert (=> b!180064 (=> (not res!149471) (not e!125161))))

(assert (=> b!180064 (= res!149471 (isPrefixOf!0 thiss!1204 (_2!8407 lt!276189)))))

(declare-fun b!180065 () Bool)

(declare-fun res!149473 () Bool)

(assert (=> b!180065 (=> res!149473 e!125169)))

(assert (=> b!180065 (= res!149473 (not (isPrefixOf!0 (_2!8407 lt!276189) (_2!8407 lt!276181))))))

(declare-fun b!180066 () Bool)

(declare-fun res!149474 () Bool)

(assert (=> b!180066 (=> (not res!149474) (not e!125162))))

(assert (=> b!180066 (= res!149474 (invariant!0 (currentBit!8911 thiss!1204) (currentByte!8916 thiss!1204) (size!4263 (buf!4706 thiss!1204))))))

(declare-fun b!180067 () Bool)

(declare-fun e!125168 () Bool)

(declare-datatypes ((tuple2!15526 0))(
  ( (tuple2!15527 (_1!8408 BitStream!7634) (_2!8408 Bool)) )
))
(declare-fun lt!276186 () tuple2!15526)

(declare-fun lt!276187 () (_ BitVec 64))

(assert (=> b!180067 (= e!125168 (= (bitIndex!0 (size!4263 (buf!4706 (_1!8408 lt!276186))) (currentByte!8916 (_1!8408 lt!276186)) (currentBit!8911 (_1!8408 lt!276186))) lt!276187))))

(declare-fun b!180068 () Bool)

(assert (=> b!180068 (= e!125162 (not e!125165))))

(declare-fun res!149477 () Bool)

(assert (=> b!180068 (=> res!149477 e!125165)))

(declare-fun lt!276182 () (_ BitVec 64))

(assert (=> b!180068 (= res!149477 (not (= lt!276178 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!276182))))))

(assert (=> b!180068 (= lt!276178 (bitIndex!0 (size!4263 (buf!4706 (_2!8407 lt!276189))) (currentByte!8916 (_2!8407 lt!276189)) (currentBit!8911 (_2!8407 lt!276189))))))

(assert (=> b!180068 (= lt!276182 (bitIndex!0 (size!4263 (buf!4706 thiss!1204)) (currentByte!8916 thiss!1204) (currentBit!8911 thiss!1204)))))

(declare-fun e!125164 () Bool)

(assert (=> b!180068 e!125164))

(declare-fun res!149479 () Bool)

(assert (=> b!180068 (=> (not res!149479) (not e!125164))))

(assert (=> b!180068 (= res!149479 (= (size!4263 (buf!4706 thiss!1204)) (size!4263 (buf!4706 (_2!8407 lt!276189)))))))

(declare-fun lt!276177 () Bool)

(declare-fun appendBit!0 (BitStream!7634 Bool) tuple2!15524)

(assert (=> b!180068 (= lt!276189 (appendBit!0 thiss!1204 lt!276177))))

(assert (=> b!180068 (= lt!276177 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!180069 () Bool)

(assert (=> b!180069 (= e!125169 true)))

(declare-datatypes ((tuple2!15528 0))(
  ( (tuple2!15529 (_1!8409 BitStream!7634) (_2!8409 BitStream!7634)) )
))
(declare-fun lt!276183 () tuple2!15528)

(declare-fun readBitPure!0 (BitStream!7634) tuple2!15526)

(assert (=> b!180069 (= (_2!8408 (readBitPure!0 (_1!8409 lt!276183))) lt!276177)))

(declare-fun lt!276190 () tuple2!15528)

(declare-fun reader!0 (BitStream!7634 BitStream!7634) tuple2!15528)

(assert (=> b!180069 (= lt!276190 (reader!0 (_2!8407 lt!276189) (_2!8407 lt!276181)))))

(assert (=> b!180069 (= lt!276183 (reader!0 thiss!1204 (_2!8407 lt!276181)))))

(declare-fun e!125166 () Bool)

(assert (=> b!180069 e!125166))

(declare-fun res!149476 () Bool)

(assert (=> b!180069 (=> (not res!149476) (not e!125166))))

(declare-fun lt!276188 () tuple2!15526)

(declare-fun lt!276180 () tuple2!15526)

(assert (=> b!180069 (= res!149476 (= (bitIndex!0 (size!4263 (buf!4706 (_1!8408 lt!276188))) (currentByte!8916 (_1!8408 lt!276188)) (currentBit!8911 (_1!8408 lt!276188))) (bitIndex!0 (size!4263 (buf!4706 (_1!8408 lt!276180))) (currentByte!8916 (_1!8408 lt!276180)) (currentBit!8911 (_1!8408 lt!276180)))))))

(declare-fun lt!276184 () Unit!12945)

(declare-fun lt!276176 () BitStream!7634)

(declare-fun readBitPrefixLemma!0 (BitStream!7634 BitStream!7634) Unit!12945)

(assert (=> b!180069 (= lt!276184 (readBitPrefixLemma!0 lt!276176 (_2!8407 lt!276181)))))

(assert (=> b!180069 (= lt!276180 (readBitPure!0 (BitStream!7635 (buf!4706 (_2!8407 lt!276181)) (currentByte!8916 thiss!1204) (currentBit!8911 thiss!1204))))))

(assert (=> b!180069 (= lt!276188 (readBitPure!0 lt!276176))))

(assert (=> b!180069 e!125167))

(declare-fun res!149478 () Bool)

(assert (=> b!180069 (=> (not res!149478) (not e!125167))))

(assert (=> b!180069 (= res!149478 (invariant!0 (currentBit!8911 thiss!1204) (currentByte!8916 thiss!1204) (size!4263 (buf!4706 (_2!8407 lt!276189)))))))

(assert (=> b!180069 (= lt!276176 (BitStream!7635 (buf!4706 (_2!8407 lt!276189)) (currentByte!8916 thiss!1204) (currentBit!8911 thiss!1204)))))

(declare-fun b!180070 () Bool)

(assert (=> b!180070 (= e!125164 e!125161)))

(declare-fun res!149468 () Bool)

(assert (=> b!180070 (=> (not res!149468) (not e!125161))))

(declare-fun lt!276179 () (_ BitVec 64))

(assert (=> b!180070 (= res!149468 (= lt!276187 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!276179)))))

(assert (=> b!180070 (= lt!276187 (bitIndex!0 (size!4263 (buf!4706 (_2!8407 lt!276189))) (currentByte!8916 (_2!8407 lt!276189)) (currentBit!8911 (_2!8407 lt!276189))))))

(assert (=> b!180070 (= lt!276179 (bitIndex!0 (size!4263 (buf!4706 thiss!1204)) (currentByte!8916 thiss!1204) (currentBit!8911 thiss!1204)))))

(declare-fun b!180071 () Bool)

(declare-fun res!149481 () Bool)

(assert (=> b!180071 (=> res!149481 e!125169)))

(assert (=> b!180071 (= res!149481 (or (not (= (size!4263 (buf!4706 (_2!8407 lt!276181))) (size!4263 (buf!4706 thiss!1204)))) (not (= lt!276185 (bvsub (bvadd lt!276182 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!180072 () Bool)

(assert (=> b!180072 (= e!125166 (= (_2!8408 lt!276188) (_2!8408 lt!276180)))))

(declare-fun b!180073 () Bool)

(declare-fun res!149475 () Bool)

(assert (=> b!180073 (=> res!149475 e!125169)))

(assert (=> b!180073 (= res!149475 (not (invariant!0 (currentBit!8911 (_2!8407 lt!276181)) (currentByte!8916 (_2!8407 lt!276181)) (size!4263 (buf!4706 (_2!8407 lt!276181))))))))

(declare-fun b!180074 () Bool)

(declare-fun array_inv!4004 (array!9666) Bool)

(assert (=> b!180074 (= e!125163 (array_inv!4004 (buf!4706 thiss!1204)))))

(declare-fun b!180075 () Bool)

(assert (=> b!180075 (= e!125161 e!125168)))

(declare-fun res!149466 () Bool)

(assert (=> b!180075 (=> (not res!149466) (not e!125168))))

(assert (=> b!180075 (= res!149466 (and (= (_2!8408 lt!276186) lt!276177) (= (_1!8408 lt!276186) (_2!8407 lt!276189))))))

(declare-fun readerFrom!0 (BitStream!7634 (_ BitVec 32) (_ BitVec 32)) BitStream!7634)

(assert (=> b!180075 (= lt!276186 (readBitPure!0 (readerFrom!0 (_2!8407 lt!276189) (currentBit!8911 thiss!1204) (currentByte!8916 thiss!1204))))))

(assert (= (and start!39732 res!149467) b!180062))

(assert (= (and b!180062 res!149470) b!180066))

(assert (= (and b!180066 res!149474) b!180061))

(assert (= (and b!180061 res!149472) b!180068))

(assert (= (and b!180068 res!149479) b!180070))

(assert (= (and b!180070 res!149468) b!180064))

(assert (= (and b!180064 res!149471) b!180075))

(assert (= (and b!180075 res!149466) b!180067))

(assert (= (and b!180068 (not res!149477)) b!180060))

(assert (= (and b!180060 (not res!149469)) b!180073))

(assert (= (and b!180073 (not res!149475)) b!180071))

(assert (= (and b!180071 (not res!149481)) b!180065))

(assert (= (and b!180065 (not res!149473)) b!180063))

(assert (= (and b!180063 (not res!149480)) b!180069))

(assert (= (and b!180069 res!149478) b!180059))

(assert (= (and b!180069 res!149476) b!180072))

(assert (= start!39732 b!180074))

(declare-fun m!280435 () Bool)

(assert (=> b!180060 m!280435))

(declare-fun m!280437 () Bool)

(assert (=> b!180060 m!280437))

(declare-fun m!280439 () Bool)

(assert (=> b!180060 m!280439))

(declare-fun m!280441 () Bool)

(assert (=> b!180060 m!280441))

(declare-fun m!280443 () Bool)

(assert (=> b!180069 m!280443))

(declare-fun m!280445 () Bool)

(assert (=> b!180069 m!280445))

(declare-fun m!280447 () Bool)

(assert (=> b!180069 m!280447))

(declare-fun m!280449 () Bool)

(assert (=> b!180069 m!280449))

(declare-fun m!280451 () Bool)

(assert (=> b!180069 m!280451))

(declare-fun m!280453 () Bool)

(assert (=> b!180069 m!280453))

(declare-fun m!280455 () Bool)

(assert (=> b!180069 m!280455))

(declare-fun m!280457 () Bool)

(assert (=> b!180069 m!280457))

(declare-fun m!280459 () Bool)

(assert (=> b!180069 m!280459))

(declare-fun m!280461 () Bool)

(assert (=> b!180066 m!280461))

(declare-fun m!280463 () Bool)

(assert (=> b!180067 m!280463))

(declare-fun m!280465 () Bool)

(assert (=> b!180074 m!280465))

(declare-fun m!280467 () Bool)

(assert (=> b!180073 m!280467))

(declare-fun m!280469 () Bool)

(assert (=> b!180062 m!280469))

(declare-fun m!280471 () Bool)

(assert (=> b!180068 m!280471))

(declare-fun m!280473 () Bool)

(assert (=> b!180068 m!280473))

(declare-fun m!280475 () Bool)

(assert (=> b!180068 m!280475))

(declare-fun m!280477 () Bool)

(assert (=> start!39732 m!280477))

(declare-fun m!280479 () Bool)

(assert (=> b!180059 m!280479))

(declare-fun m!280481 () Bool)

(assert (=> b!180065 m!280481))

(declare-fun m!280483 () Bool)

(assert (=> b!180075 m!280483))

(assert (=> b!180075 m!280483))

(declare-fun m!280485 () Bool)

(assert (=> b!180075 m!280485))

(assert (=> b!180070 m!280471))

(assert (=> b!180070 m!280473))

(declare-fun m!280487 () Bool)

(assert (=> b!180064 m!280487))

(assert (=> b!180063 m!280487))

(push 1)

(assert (not b!180066))

(assert (not b!180065))

(assert (not b!180060))

(assert (not start!39732))

(assert (not b!180075))

(assert (not b!180059))

(assert (not b!180064))

(assert (not b!180070))

(assert (not b!180067))

(assert (not b!180063))

(assert (not b!180062))

(assert (not b!180074))

(assert (not b!180069))

(assert (not b!180068))

(assert (not b!180073))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

