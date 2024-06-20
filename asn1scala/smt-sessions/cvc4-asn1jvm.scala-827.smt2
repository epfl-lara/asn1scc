; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24420 () Bool)

(assert start!24420)

(declare-fun b!124283 () Bool)

(declare-fun e!81520 () Bool)

(declare-fun e!81521 () Bool)

(assert (=> b!124283 (= e!81520 (not e!81521))))

(declare-fun res!103028 () Bool)

(assert (=> b!124283 (=> res!103028 e!81521)))

(declare-fun lt!195903 () (_ BitVec 64))

(declare-fun lt!195901 () (_ BitVec 64))

(assert (=> b!124283 (= res!103028 (not (= lt!195903 (bvadd lt!195903 lt!195901))))))

(declare-datatypes ((array!5481 0))(
  ( (array!5482 (arr!3074 (Array (_ BitVec 32) (_ BitVec 8))) (size!2481 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4436 0))(
  ( (BitStream!4437 (buf!2927 array!5481) (currentByte!5633 (_ BitVec 32)) (currentBit!5628 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4436)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!124283 (= lt!195903 (bitIndex!0 (size!2481 (buf!2927 thiss!1305)) (currentByte!5633 thiss!1305) (currentBit!5628 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4436 BitStream!4436) Bool)

(assert (=> b!124283 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!7706 0))(
  ( (Unit!7707) )
))
(declare-fun lt!195902 () Unit!7706)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4436) Unit!7706)

(assert (=> b!124283 (= lt!195902 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun b!124284 () Bool)

(declare-fun res!103029 () Bool)

(assert (=> b!124284 (=> (not res!103029) (not e!81520))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!124284 (= res!103029 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!124285 () Bool)

(declare-fun res!103027 () Bool)

(assert (=> b!124285 (=> (not res!103027) (not e!81520))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!124285 (= res!103027 (bvsge i!615 nBits!396))))

(declare-fun res!103025 () Bool)

(declare-fun e!81522 () Bool)

(assert (=> start!24420 (=> (not res!103025) (not e!81522))))

(assert (=> start!24420 (= res!103025 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24420 e!81522))

(assert (=> start!24420 true))

(declare-fun e!81518 () Bool)

(declare-fun inv!12 (BitStream!4436) Bool)

(assert (=> start!24420 (and (inv!12 thiss!1305) e!81518)))

(declare-fun b!124286 () Bool)

(assert (=> b!124286 (= e!81521 true)))

(declare-datatypes ((tuple2!10448 0))(
  ( (tuple2!10449 (_1!5492 BitStream!4436) (_2!5492 BitStream!4436)) )
))
(declare-fun lt!195900 () tuple2!10448)

(declare-fun reader!0 (BitStream!4436 BitStream!4436) tuple2!10448)

(assert (=> b!124286 (= lt!195900 (reader!0 thiss!1305 thiss!1305))))

(declare-fun b!124287 () Bool)

(declare-fun array_inv!2283 (array!5481) Bool)

(assert (=> b!124287 (= e!81518 (array_inv!2283 (buf!2927 thiss!1305)))))

(declare-fun b!124288 () Bool)

(assert (=> b!124288 (= e!81522 e!81520)))

(declare-fun res!103026 () Bool)

(assert (=> b!124288 (=> (not res!103026) (not e!81520))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124288 (= res!103026 (validate_offset_bits!1 ((_ sign_extend 32) (size!2481 (buf!2927 thiss!1305))) ((_ sign_extend 32) (currentByte!5633 thiss!1305)) ((_ sign_extend 32) (currentBit!5628 thiss!1305)) lt!195901))))

(assert (=> b!124288 (= lt!195901 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (= (and start!24420 res!103025) b!124288))

(assert (= (and b!124288 res!103026) b!124284))

(assert (= (and b!124284 res!103029) b!124285))

(assert (= (and b!124285 res!103027) b!124283))

(assert (= (and b!124283 (not res!103028)) b!124286))

(assert (= start!24420 b!124287))

(declare-fun m!189483 () Bool)

(assert (=> b!124287 m!189483))

(declare-fun m!189485 () Bool)

(assert (=> b!124284 m!189485))

(declare-fun m!189487 () Bool)

(assert (=> b!124283 m!189487))

(declare-fun m!189489 () Bool)

(assert (=> b!124283 m!189489))

(declare-fun m!189491 () Bool)

(assert (=> b!124283 m!189491))

(declare-fun m!189493 () Bool)

(assert (=> b!124286 m!189493))

(declare-fun m!189495 () Bool)

(assert (=> b!124288 m!189495))

(declare-fun m!189497 () Bool)

(assert (=> start!24420 m!189497))

(push 1)

(assert (not b!124283))

(assert (not b!124286))

(assert (not b!124287))

(assert (not b!124288))

(assert (not start!24420))

(assert (not b!124284))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

