; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61754 () Bool)

(assert start!61754)

(declare-fun res!230074 () Bool)

(declare-fun e!196940 () Bool)

(assert (=> start!61754 (=> (not res!230074) (not e!196940))))

(declare-datatypes ((array!15866 0))(
  ( (array!15867 (arr!7863 (Array (_ BitVec 32) (_ BitVec 8))) (size!6867 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12548 0))(
  ( (BitStream!12549 (buf!7335 array!15866) (currentByte!13588 (_ BitVec 32)) (currentBit!13583 (_ BitVec 32))) )
))
(declare-fun thiss!872 () BitStream!12548)

(declare-fun b2!124 () BitStream!12548)

(assert (=> start!61754 (= res!230074 (= (size!6867 (buf!7335 thiss!872)) (size!6867 (buf!7335 b2!124))))))

(assert (=> start!61754 e!196940))

(declare-fun e!196943 () Bool)

(declare-fun inv!12 (BitStream!12548) Bool)

(assert (=> start!61754 (and (inv!12 thiss!872) e!196943)))

(declare-fun e!196942 () Bool)

(assert (=> start!61754 (and (inv!12 b2!124) e!196942)))

(declare-fun b!276991 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!276991 (= e!196940 (not (invariant!0 (currentBit!13583 b2!124) (currentByte!13588 b2!124) (size!6867 (buf!7335 b2!124)))))))

(declare-fun b!276992 () Bool)

(declare-fun array_inv!6591 (array!15866) Bool)

(assert (=> b!276992 (= e!196943 (array_inv!6591 (buf!7335 thiss!872)))))

(declare-fun b!276993 () Bool)

(assert (=> b!276993 (= e!196942 (array_inv!6591 (buf!7335 b2!124)))))

(assert (= (and start!61754 res!230074) b!276991))

(assert (= start!61754 b!276992))

(assert (= start!61754 b!276993))

(declare-fun m!410197 () Bool)

(assert (=> start!61754 m!410197))

(declare-fun m!410199 () Bool)

(assert (=> start!61754 m!410199))

(declare-fun m!410201 () Bool)

(assert (=> b!276991 m!410201))

(declare-fun m!410203 () Bool)

(assert (=> b!276992 m!410203))

(declare-fun m!410205 () Bool)

(assert (=> b!276993 m!410205))

(push 1)

(assert (not b!276992))

(assert (not b!276991))

(assert (not b!276993))

(assert (not start!61754))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!95548 () Bool)

(assert (=> d!95548 (= (array_inv!6591 (buf!7335 thiss!872)) (bvsge (size!6867 (buf!7335 thiss!872)) #b00000000000000000000000000000000))))

(assert (=> b!276992 d!95548))

(declare-fun d!95556 () Bool)

(assert (=> d!95556 (= (invariant!0 (currentBit!13583 b2!124) (currentByte!13588 b2!124) (size!6867 (buf!7335 b2!124))) (and (bvsge (currentBit!13583 b2!124) #b00000000000000000000000000000000) (bvslt (currentBit!13583 b2!124) #b00000000000000000000000000001000) (bvsge (currentByte!13588 b2!124) #b00000000000000000000000000000000) (or (bvslt (currentByte!13588 b2!124) (size!6867 (buf!7335 b2!124))) (and (= (currentBit!13583 b2!124) #b00000000000000000000000000000000) (= (currentByte!13588 b2!124) (size!6867 (buf!7335 b2!124)))))))))

