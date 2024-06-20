; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61166 () Bool)

(assert start!61166)

(declare-fun b!275426 () Bool)

(declare-fun res!228972 () Bool)

(declare-fun e!195399 () Bool)

(assert (=> b!275426 (=> (not res!228972) (not e!195399))))

(declare-datatypes ((array!15727 0))(
  ( (array!15728 (arr!7798 (Array (_ BitVec 32) (_ BitVec 8))) (size!6811 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12436 0))(
  ( (BitStream!12437 (buf!7279 array!15727) (currentByte!13452 (_ BitVec 32)) (currentBit!13447 (_ BitVec 32))) )
))
(declare-fun bs1!11 () BitStream!12436)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275426 (= res!228972 (validate_offset_bit!0 ((_ sign_extend 32) (size!6811 (buf!7279 bs1!11))) ((_ sign_extend 32) (currentByte!13452 bs1!11)) ((_ sign_extend 32) (currentBit!13447 bs1!11))))))

(declare-fun b!275427 () Bool)

(declare-fun e!195400 () Bool)

(declare-fun bs2!19 () BitStream!12436)

(declare-fun array_inv!6535 (array!15727) Bool)

(assert (=> b!275427 (= e!195400 (array_inv!6535 (buf!7279 bs2!19)))))

(declare-fun b!275428 () Bool)

(declare-fun e!195397 () Bool)

(assert (=> b!275428 (= e!195397 (array_inv!6535 (buf!7279 bs1!11)))))

(declare-fun b!275429 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275429 (= e!195399 (not (invariant!0 (currentBit!13447 bs1!11) (currentByte!13452 bs1!11) (size!6811 (buf!7279 bs1!11)))))))

(declare-datatypes ((tuple2!22442 0))(
  ( (tuple2!22443 (_1!12253 BitStream!12436) (_2!12253 Bool)) )
))
(declare-fun lt!413570 () tuple2!22442)

(declare-fun readBitPure!0 (BitStream!12436) tuple2!22442)

(assert (=> b!275429 (= lt!413570 (readBitPure!0 (BitStream!12437 (buf!7279 bs2!19) (currentByte!13452 bs1!11) (currentBit!13447 bs1!11))))))

(declare-fun lt!413569 () tuple2!22442)

(assert (=> b!275429 (= lt!413569 (readBitPure!0 bs1!11))))

(assert (=> b!275429 (invariant!0 (currentBit!13447 bs1!11) (currentByte!13452 bs1!11) (size!6811 (buf!7279 bs2!19)))))

(declare-fun res!228973 () Bool)

(assert (=> start!61166 (=> (not res!228973) (not e!195399))))

(assert (=> start!61166 (= res!228973 (= (size!6811 (buf!7279 bs1!11)) (size!6811 (buf!7279 bs2!19))))))

(assert (=> start!61166 e!195399))

(declare-fun inv!12 (BitStream!12436) Bool)

(assert (=> start!61166 (and (inv!12 bs1!11) e!195397)))

(assert (=> start!61166 (and (inv!12 bs2!19) e!195400)))

(declare-fun b!275430 () Bool)

(declare-fun res!228971 () Bool)

(assert (=> b!275430 (=> (not res!228971) (not e!195399))))

(declare-fun arrayBitRangesEq!0 (array!15727 array!15727 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275430 (= res!228971 (arrayBitRangesEq!0 (buf!7279 bs1!11) (buf!7279 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6811 (buf!7279 bs1!11)) (currentByte!13452 bs1!11) (currentBit!13447 bs1!11)))))))

(assert (= (and start!61166 res!228973) b!275426))

(assert (= (and b!275426 res!228972) b!275430))

(assert (= (and b!275430 res!228971) b!275429))

(assert (= start!61166 b!275428))

(assert (= start!61166 b!275427))

(declare-fun m!408049 () Bool)

(assert (=> b!275426 m!408049))

(declare-fun m!408051 () Bool)

(assert (=> b!275429 m!408051))

(declare-fun m!408053 () Bool)

(assert (=> b!275429 m!408053))

(declare-fun m!408055 () Bool)

(assert (=> b!275429 m!408055))

(declare-fun m!408057 () Bool)

(assert (=> b!275429 m!408057))

(declare-fun m!408059 () Bool)

(assert (=> b!275428 m!408059))

(declare-fun m!408061 () Bool)

(assert (=> b!275430 m!408061))

(declare-fun m!408063 () Bool)

(assert (=> b!275430 m!408063))

(declare-fun m!408065 () Bool)

(assert (=> start!61166 m!408065))

(declare-fun m!408067 () Bool)

(assert (=> start!61166 m!408067))

(declare-fun m!408069 () Bool)

(assert (=> b!275427 m!408069))

(push 1)

(assert (not b!275429))

(assert (not b!275426))

(assert (not start!61166))

(assert (not b!275430))

(assert (not b!275428))

(assert (not b!275427))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

