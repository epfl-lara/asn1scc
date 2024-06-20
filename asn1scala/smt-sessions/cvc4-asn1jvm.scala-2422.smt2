; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61808 () Bool)

(assert start!61808)

(declare-fun res!230134 () Bool)

(declare-fun e!197043 () Bool)

(assert (=> start!61808 (=> (not res!230134) (not e!197043))))

(declare-datatypes ((array!15884 0))(
  ( (array!15885 (arr!7869 (Array (_ BitVec 32) (_ BitVec 8))) (size!6873 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12560 0))(
  ( (BitStream!12561 (buf!7341 array!15884) (currentByte!13603 (_ BitVec 32)) (currentBit!13598 (_ BitVec 32))) )
))
(declare-fun thiss!872 () BitStream!12560)

(declare-fun b2!124 () BitStream!12560)

(assert (=> start!61808 (= res!230134 (= (size!6873 (buf!7341 thiss!872)) (size!6873 (buf!7341 b2!124))))))

(assert (=> start!61808 e!197043))

(declare-fun e!197041 () Bool)

(declare-fun inv!12 (BitStream!12560) Bool)

(assert (=> start!61808 (and (inv!12 thiss!872) e!197041)))

(declare-fun e!197045 () Bool)

(assert (=> start!61808 (and (inv!12 b2!124) e!197045)))

(declare-fun b!277087 () Bool)

(assert (=> b!277087 (= e!197043 false)))

(declare-fun lt!415239 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!277087 (= lt!415239 (bitIndex!0 (size!6873 (buf!7341 b2!124)) (currentByte!13603 b2!124) (currentBit!13598 b2!124)))))

(declare-fun lt!415238 () (_ BitVec 64))

(assert (=> b!277087 (= lt!415238 (bitIndex!0 (size!6873 (buf!7341 thiss!872)) (currentByte!13603 thiss!872) (currentBit!13598 thiss!872)))))

(declare-fun b!277088 () Bool)

(declare-fun array_inv!6597 (array!15884) Bool)

(assert (=> b!277088 (= e!197041 (array_inv!6597 (buf!7341 thiss!872)))))

(declare-fun b!277089 () Bool)

(assert (=> b!277089 (= e!197045 (array_inv!6597 (buf!7341 b2!124)))))

(assert (= (and start!61808 res!230134) b!277087))

(assert (= start!61808 b!277088))

(assert (= start!61808 b!277089))

(declare-fun m!410297 () Bool)

(assert (=> start!61808 m!410297))

(declare-fun m!410299 () Bool)

(assert (=> start!61808 m!410299))

(declare-fun m!410301 () Bool)

(assert (=> b!277087 m!410301))

(declare-fun m!410303 () Bool)

(assert (=> b!277087 m!410303))

(declare-fun m!410305 () Bool)

(assert (=> b!277088 m!410305))

(declare-fun m!410307 () Bool)

(assert (=> b!277089 m!410307))

(push 1)

(assert (not b!277087))

(assert (not b!277089))

(assert (not start!61808))

(assert (not b!277088))

