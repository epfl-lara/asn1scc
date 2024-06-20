; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61804 () Bool)

(assert start!61804)

(declare-fun res!230128 () Bool)

(declare-fun e!197014 () Bool)

(assert (=> start!61804 (=> (not res!230128) (not e!197014))))

(declare-datatypes ((array!15880 0))(
  ( (array!15881 (arr!7867 (Array (_ BitVec 32) (_ BitVec 8))) (size!6871 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12556 0))(
  ( (BitStream!12557 (buf!7339 array!15880) (currentByte!13601 (_ BitVec 32)) (currentBit!13596 (_ BitVec 32))) )
))
(declare-fun thiss!872 () BitStream!12556)

(declare-fun b2!124 () BitStream!12556)

(assert (=> start!61804 (= res!230128 (= (size!6871 (buf!7339 thiss!872)) (size!6871 (buf!7339 b2!124))))))

(assert (=> start!61804 e!197014))

(declare-fun e!197013 () Bool)

(declare-fun inv!12 (BitStream!12556) Bool)

(assert (=> start!61804 (and (inv!12 thiss!872) e!197013)))

(declare-fun e!197015 () Bool)

(assert (=> start!61804 (and (inv!12 b2!124) e!197015)))

(declare-fun b!277069 () Bool)

(assert (=> b!277069 (= e!197014 false)))

(declare-fun lt!415226 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!277069 (= lt!415226 (bitIndex!0 (size!6871 (buf!7339 b2!124)) (currentByte!13601 b2!124) (currentBit!13596 b2!124)))))

(declare-fun lt!415227 () (_ BitVec 64))

(assert (=> b!277069 (= lt!415227 (bitIndex!0 (size!6871 (buf!7339 thiss!872)) (currentByte!13601 thiss!872) (currentBit!13596 thiss!872)))))

(declare-fun b!277070 () Bool)

(declare-fun array_inv!6595 (array!15880) Bool)

(assert (=> b!277070 (= e!197013 (array_inv!6595 (buf!7339 thiss!872)))))

(declare-fun b!277071 () Bool)

(assert (=> b!277071 (= e!197015 (array_inv!6595 (buf!7339 b2!124)))))

(assert (= (and start!61804 res!230128) b!277069))

(assert (= start!61804 b!277070))

(assert (= start!61804 b!277071))

(declare-fun m!410273 () Bool)

(assert (=> start!61804 m!410273))

(declare-fun m!410275 () Bool)

(assert (=> start!61804 m!410275))

(declare-fun m!410277 () Bool)

(assert (=> b!277069 m!410277))

(declare-fun m!410279 () Bool)

(assert (=> b!277069 m!410279))

(declare-fun m!410281 () Bool)

(assert (=> b!277070 m!410281))

(declare-fun m!410283 () Bool)

(assert (=> b!277071 m!410283))

(push 1)

(assert (not b!277069))

(assert (not b!277070))

(assert (not start!61804))

(assert (not b!277071))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

