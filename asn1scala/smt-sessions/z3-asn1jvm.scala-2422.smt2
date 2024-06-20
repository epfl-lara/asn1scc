; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!61806 () Bool)

(assert start!61806)

(declare-fun res!230131 () Bool)

(declare-fun e!197028 () Bool)

(assert (=> start!61806 (=> (not res!230131) (not e!197028))))

(declare-datatypes ((array!15882 0))(
  ( (array!15883 (arr!7868 (Array (_ BitVec 32) (_ BitVec 8))) (size!6872 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12558 0))(
  ( (BitStream!12559 (buf!7340 array!15882) (currentByte!13602 (_ BitVec 32)) (currentBit!13597 (_ BitVec 32))) )
))
(declare-fun thiss!872 () BitStream!12558)

(declare-fun b2!124 () BitStream!12558)

(assert (=> start!61806 (= res!230131 (= (size!6872 (buf!7340 thiss!872)) (size!6872 (buf!7340 b2!124))))))

(assert (=> start!61806 e!197028))

(declare-fun e!197029 () Bool)

(declare-fun inv!12 (BitStream!12558) Bool)

(assert (=> start!61806 (and (inv!12 thiss!872) e!197029)))

(declare-fun e!197030 () Bool)

(assert (=> start!61806 (and (inv!12 b2!124) e!197030)))

(declare-fun b!277078 () Bool)

(assert (=> b!277078 (= e!197028 false)))

(declare-fun lt!415233 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!277078 (= lt!415233 (bitIndex!0 (size!6872 (buf!7340 b2!124)) (currentByte!13602 b2!124) (currentBit!13597 b2!124)))))

(declare-fun lt!415232 () (_ BitVec 64))

(assert (=> b!277078 (= lt!415232 (bitIndex!0 (size!6872 (buf!7340 thiss!872)) (currentByte!13602 thiss!872) (currentBit!13597 thiss!872)))))

(declare-fun b!277079 () Bool)

(declare-fun array_inv!6596 (array!15882) Bool)

(assert (=> b!277079 (= e!197029 (array_inv!6596 (buf!7340 thiss!872)))))

(declare-fun b!277080 () Bool)

(assert (=> b!277080 (= e!197030 (array_inv!6596 (buf!7340 b2!124)))))

(assert (= (and start!61806 res!230131) b!277078))

(assert (= start!61806 b!277079))

(assert (= start!61806 b!277080))

(declare-fun m!410285 () Bool)

(assert (=> start!61806 m!410285))

(declare-fun m!410287 () Bool)

(assert (=> start!61806 m!410287))

(declare-fun m!410289 () Bool)

(assert (=> b!277078 m!410289))

(declare-fun m!410291 () Bool)

(assert (=> b!277078 m!410291))

(declare-fun m!410293 () Bool)

(assert (=> b!277079 m!410293))

(declare-fun m!410295 () Bool)

(assert (=> b!277080 m!410295))

(check-sat (not b!277079) (not start!61806) (not b!277080) (not b!277078))
