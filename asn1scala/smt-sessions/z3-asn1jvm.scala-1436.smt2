; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39436 () Bool)

(assert start!39436)

(declare-fun b!177398 () Bool)

(declare-fun e!123620 () Bool)

(declare-fun e!123621 () Bool)

(assert (=> b!177398 (= e!123620 e!123621)))

(declare-fun res!147057 () Bool)

(assert (=> b!177398 (=> (not res!147057) (not e!123621))))

(declare-fun lt!272453 () (_ BitVec 64))

(declare-fun lt!272456 () (_ BitVec 64))

(assert (=> b!177398 (= res!147057 (= lt!272453 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!272456)))))

(declare-datatypes ((array!9577 0))(
  ( (array!9578 (arr!5153 (Array (_ BitVec 32) (_ BitVec 8))) (size!4223 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7554 0))(
  ( (BitStream!7555 (buf!4666 array!9577) (currentByte!8846 (_ BitVec 32)) (currentBit!8841 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!12760 0))(
  ( (Unit!12761) )
))
(declare-datatypes ((tuple2!15288 0))(
  ( (tuple2!15289 (_1!8289 Unit!12760) (_2!8289 BitStream!7554)) )
))
(declare-fun lt!272459 () tuple2!15288)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!177398 (= lt!272453 (bitIndex!0 (size!4223 (buf!4666 (_2!8289 lt!272459))) (currentByte!8846 (_2!8289 lt!272459)) (currentBit!8841 (_2!8289 lt!272459))))))

(declare-fun thiss!1204 () BitStream!7554)

(assert (=> b!177398 (= lt!272456 (bitIndex!0 (size!4223 (buf!4666 thiss!1204)) (currentByte!8846 thiss!1204) (currentBit!8841 thiss!1204)))))

(declare-fun b!177399 () Bool)

(declare-fun res!147066 () Bool)

(declare-fun e!123618 () Bool)

(assert (=> b!177399 (=> (not res!147066) (not e!123618))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!177399 (= res!147066 (validate_offset_bits!1 ((_ sign_extend 32) (size!4223 (buf!4666 thiss!1204))) ((_ sign_extend 32) (currentByte!8846 thiss!1204)) ((_ sign_extend 32) (currentBit!8841 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!177400 () Bool)

(declare-fun res!147064 () Bool)

(assert (=> b!177400 (=> (not res!147064) (not e!123618))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!177400 (= res!147064 (invariant!0 (currentBit!8841 thiss!1204) (currentByte!8846 thiss!1204) (size!4223 (buf!4666 thiss!1204))))))

(declare-fun b!177401 () Bool)

(declare-fun e!123619 () Bool)

(declare-fun e!123616 () Bool)

(assert (=> b!177401 (= e!123619 e!123616)))

(declare-fun res!147059 () Bool)

(assert (=> b!177401 (=> res!147059 e!123616)))

(declare-fun isPrefixOf!0 (BitStream!7554 BitStream!7554) Bool)

(assert (=> b!177401 (= res!147059 (not (isPrefixOf!0 thiss!1204 (_2!8289 lt!272459))))))

(declare-fun lt!272455 () tuple2!15288)

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7554 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15288)

(assert (=> b!177401 (= lt!272455 (appendBitsLSBFirstLoopTR!0 (_2!8289 lt!272459) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!177402 () Bool)

(declare-fun res!147065 () Bool)

(assert (=> b!177402 (=> (not res!147065) (not e!123618))))

(assert (=> b!177402 (= res!147065 (not (= i!590 nBits!348)))))

(declare-fun res!147060 () Bool)

(assert (=> start!39436 (=> (not res!147060) (not e!123618))))

(assert (=> start!39436 (= res!147060 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39436 e!123618))

(assert (=> start!39436 true))

(declare-fun e!123622 () Bool)

(declare-fun inv!12 (BitStream!7554) Bool)

(assert (=> start!39436 (and (inv!12 thiss!1204) e!123622)))

(declare-fun b!177403 () Bool)

(declare-fun array_inv!3964 (array!9577) Bool)

(assert (=> b!177403 (= e!123622 (array_inv!3964 (buf!4666 thiss!1204)))))

(declare-fun b!177404 () Bool)

(declare-fun e!123615 () Bool)

(declare-datatypes ((tuple2!15290 0))(
  ( (tuple2!15291 (_1!8290 BitStream!7554) (_2!8290 Bool)) )
))
(declare-fun lt!272458 () tuple2!15290)

(assert (=> b!177404 (= e!123615 (= (bitIndex!0 (size!4223 (buf!4666 (_1!8290 lt!272458))) (currentByte!8846 (_1!8290 lt!272458)) (currentBit!8841 (_1!8290 lt!272458))) lt!272453))))

(declare-fun b!177405 () Bool)

(declare-fun res!147063 () Bool)

(assert (=> b!177405 (=> (not res!147063) (not e!123621))))

(assert (=> b!177405 (= res!147063 (isPrefixOf!0 thiss!1204 (_2!8289 lt!272459)))))

(declare-fun b!177406 () Bool)

(assert (=> b!177406 (= e!123616 true)))

(declare-fun lt!272457 () Bool)

(assert (=> b!177406 (= lt!272457 (isPrefixOf!0 (_2!8289 lt!272459) (_2!8289 lt!272455)))))

(declare-fun b!177407 () Bool)

(assert (=> b!177407 (= e!123621 e!123615)))

(declare-fun res!147061 () Bool)

(assert (=> b!177407 (=> (not res!147061) (not e!123615))))

(declare-fun lt!272454 () Bool)

(assert (=> b!177407 (= res!147061 (and (= (_2!8290 lt!272458) lt!272454) (= (_1!8290 lt!272458) (_2!8289 lt!272459))))))

(declare-fun readBitPure!0 (BitStream!7554) tuple2!15290)

(declare-fun readerFrom!0 (BitStream!7554 (_ BitVec 32) (_ BitVec 32)) BitStream!7554)

(assert (=> b!177407 (= lt!272458 (readBitPure!0 (readerFrom!0 (_2!8289 lt!272459) (currentBit!8841 thiss!1204) (currentByte!8846 thiss!1204))))))

(declare-fun b!177408 () Bool)

(assert (=> b!177408 (= e!123618 (not e!123619))))

(declare-fun res!147058 () Bool)

(assert (=> b!177408 (=> res!147058 e!123619)))

(assert (=> b!177408 (= res!147058 (not (= (bitIndex!0 (size!4223 (buf!4666 (_2!8289 lt!272459))) (currentByte!8846 (_2!8289 lt!272459)) (currentBit!8841 (_2!8289 lt!272459))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4223 (buf!4666 thiss!1204)) (currentByte!8846 thiss!1204) (currentBit!8841 thiss!1204))))))))

(assert (=> b!177408 e!123620))

(declare-fun res!147062 () Bool)

(assert (=> b!177408 (=> (not res!147062) (not e!123620))))

(assert (=> b!177408 (= res!147062 (= (size!4223 (buf!4666 thiss!1204)) (size!4223 (buf!4666 (_2!8289 lt!272459)))))))

(declare-fun appendBit!0 (BitStream!7554 Bool) tuple2!15288)

(assert (=> b!177408 (= lt!272459 (appendBit!0 thiss!1204 lt!272454))))

(assert (=> b!177408 (= lt!272454 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!39436 res!147060) b!177399))

(assert (= (and b!177399 res!147066) b!177400))

(assert (= (and b!177400 res!147064) b!177402))

(assert (= (and b!177402 res!147065) b!177408))

(assert (= (and b!177408 res!147062) b!177398))

(assert (= (and b!177398 res!147057) b!177405))

(assert (= (and b!177405 res!147063) b!177407))

(assert (= (and b!177407 res!147061) b!177404))

(assert (= (and b!177408 (not res!147058)) b!177401))

(assert (= (and b!177401 (not res!147059)) b!177406))

(assert (= start!39436 b!177403))

(declare-fun m!277305 () Bool)

(assert (=> b!177400 m!277305))

(declare-fun m!277307 () Bool)

(assert (=> b!177405 m!277307))

(declare-fun m!277309 () Bool)

(assert (=> b!177407 m!277309))

(assert (=> b!177407 m!277309))

(declare-fun m!277311 () Bool)

(assert (=> b!177407 m!277311))

(declare-fun m!277313 () Bool)

(assert (=> b!177399 m!277313))

(assert (=> b!177401 m!277307))

(declare-fun m!277315 () Bool)

(assert (=> b!177401 m!277315))

(declare-fun m!277317 () Bool)

(assert (=> b!177403 m!277317))

(declare-fun m!277319 () Bool)

(assert (=> b!177404 m!277319))

(declare-fun m!277321 () Bool)

(assert (=> b!177408 m!277321))

(declare-fun m!277323 () Bool)

(assert (=> b!177408 m!277323))

(declare-fun m!277325 () Bool)

(assert (=> b!177408 m!277325))

(declare-fun m!277327 () Bool)

(assert (=> b!177406 m!277327))

(declare-fun m!277329 () Bool)

(assert (=> start!39436 m!277329))

(assert (=> b!177398 m!277321))

(assert (=> b!177398 m!277323))

(check-sat (not b!177400) (not b!177403) (not b!177404) (not b!177406) (not b!177399) (not b!177398) (not b!177407) (not b!177401) (not b!177405) (not start!39436) (not b!177408))
