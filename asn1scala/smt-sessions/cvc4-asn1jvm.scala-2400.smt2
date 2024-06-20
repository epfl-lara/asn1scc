; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61158 () Bool)

(assert start!61158)

(declare-fun b!275366 () Bool)

(declare-fun e!195336 () Bool)

(declare-datatypes ((array!15719 0))(
  ( (array!15720 (arr!7794 (Array (_ BitVec 32) (_ BitVec 8))) (size!6807 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12428 0))(
  ( (BitStream!12429 (buf!7275 array!15719) (currentByte!13448 (_ BitVec 32)) (currentBit!13443 (_ BitVec 32))) )
))
(declare-fun bs2!19 () BitStream!12428)

(declare-fun bs1!11 () BitStream!12428)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275366 (= e!195336 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!6807 (buf!7275 bs2!19))) ((_ sign_extend 32) (currentByte!13448 bs1!11)) ((_ sign_extend 32) (currentBit!13443 bs1!11)))))))

(declare-datatypes ((tuple2!22434 0))(
  ( (tuple2!22435 (_1!12249 BitStream!12428) (_2!12249 Bool)) )
))
(declare-fun lt!413546 () tuple2!22434)

(declare-fun readBitPure!0 (BitStream!12428) tuple2!22434)

(assert (=> b!275366 (= lt!413546 (readBitPure!0 bs1!11))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275366 (invariant!0 (currentBit!13443 bs1!11) (currentByte!13448 bs1!11) (size!6807 (buf!7275 bs2!19)))))

(declare-fun b!275367 () Bool)

(declare-fun res!228935 () Bool)

(assert (=> b!275367 (=> (not res!228935) (not e!195336))))

(declare-fun arrayBitRangesEq!0 (array!15719 array!15719 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275367 (= res!228935 (arrayBitRangesEq!0 (buf!7275 bs1!11) (buf!7275 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!6807 (buf!7275 bs1!11)) (currentByte!13448 bs1!11) (currentBit!13443 bs1!11)))))))

(declare-fun b!275368 () Bool)

(declare-fun e!195339 () Bool)

(declare-fun array_inv!6531 (array!15719) Bool)

(assert (=> b!275368 (= e!195339 (array_inv!6531 (buf!7275 bs2!19)))))

(declare-fun res!228936 () Bool)

(assert (=> start!61158 (=> (not res!228936) (not e!195336))))

(assert (=> start!61158 (= res!228936 (= (size!6807 (buf!7275 bs1!11)) (size!6807 (buf!7275 bs2!19))))))

(assert (=> start!61158 e!195336))

(declare-fun e!195340 () Bool)

(declare-fun inv!12 (BitStream!12428) Bool)

(assert (=> start!61158 (and (inv!12 bs1!11) e!195340)))

(assert (=> start!61158 (and (inv!12 bs2!19) e!195339)))

(declare-fun b!275369 () Bool)

(assert (=> b!275369 (= e!195340 (array_inv!6531 (buf!7275 bs1!11)))))

(declare-fun b!275370 () Bool)

(declare-fun res!228937 () Bool)

(assert (=> b!275370 (=> (not res!228937) (not e!195336))))

(assert (=> b!275370 (= res!228937 (validate_offset_bit!0 ((_ sign_extend 32) (size!6807 (buf!7275 bs1!11))) ((_ sign_extend 32) (currentByte!13448 bs1!11)) ((_ sign_extend 32) (currentBit!13443 bs1!11))))))

(assert (= (and start!61158 res!228936) b!275370))

(assert (= (and b!275370 res!228937) b!275367))

(assert (= (and b!275367 res!228935) b!275366))

(assert (= start!61158 b!275369))

(assert (= start!61158 b!275368))

(declare-fun m!407963 () Bool)

(assert (=> b!275366 m!407963))

(declare-fun m!407965 () Bool)

(assert (=> b!275366 m!407965))

(declare-fun m!407967 () Bool)

(assert (=> b!275366 m!407967))

(declare-fun m!407969 () Bool)

(assert (=> b!275369 m!407969))

(declare-fun m!407971 () Bool)

(assert (=> b!275370 m!407971))

(declare-fun m!407973 () Bool)

(assert (=> b!275368 m!407973))

(declare-fun m!407975 () Bool)

(assert (=> b!275367 m!407975))

(declare-fun m!407977 () Bool)

(assert (=> b!275367 m!407977))

(declare-fun m!407979 () Bool)

(assert (=> start!61158 m!407979))

(declare-fun m!407981 () Bool)

(assert (=> start!61158 m!407981))

(push 1)

(assert (not b!275369))

(assert (not b!275370))

(assert (not b!275367))

(assert (not start!61158))

(assert (not b!275368))

(assert (not b!275366))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

