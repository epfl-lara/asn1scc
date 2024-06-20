; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39366 () Bool)

(assert start!39366)

(declare-fun b!177030 () Bool)

(declare-fun res!146721 () Bool)

(declare-fun e!123376 () Bool)

(assert (=> b!177030 (=> (not res!146721) (not e!123376))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!177030 (= res!146721 (not (= i!590 nBits!348)))))

(declare-fun b!177031 () Bool)

(declare-fun e!123374 () Bool)

(declare-datatypes ((array!9558 0))(
  ( (array!9559 (arr!5145 (Array (_ BitVec 32) (_ BitVec 8))) (size!4215 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7538 0))(
  ( (BitStream!7539 (buf!4658 array!9558) (currentByte!8829 (_ BitVec 32)) (currentBit!8824 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!15250 0))(
  ( (tuple2!15251 (_1!8270 BitStream!7538) (_2!8270 Bool)) )
))
(declare-fun lt!272171 () tuple2!15250)

(declare-fun lt!272172 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!177031 (= e!123374 (= (bitIndex!0 (size!4215 (buf!4658 (_1!8270 lt!272171))) (currentByte!8829 (_1!8270 lt!272171)) (currentBit!8824 (_1!8270 lt!272171))) lt!272172))))

(declare-fun b!177032 () Bool)

(declare-fun e!123378 () Bool)

(assert (=> b!177032 (= e!123378 e!123374)))

(declare-fun res!146719 () Bool)

(assert (=> b!177032 (=> (not res!146719) (not e!123374))))

(declare-fun lt!272170 () Bool)

(declare-datatypes ((Unit!12744 0))(
  ( (Unit!12745) )
))
(declare-datatypes ((tuple2!15252 0))(
  ( (tuple2!15253 (_1!8271 Unit!12744) (_2!8271 BitStream!7538)) )
))
(declare-fun lt!272173 () tuple2!15252)

(assert (=> b!177032 (= res!146719 (and (= (_2!8270 lt!272171) lt!272170) (= (_1!8270 lt!272171) (_2!8271 lt!272173))))))

(declare-fun thiss!1204 () BitStream!7538)

(declare-fun readBitPure!0 (BitStream!7538) tuple2!15250)

(declare-fun readerFrom!0 (BitStream!7538 (_ BitVec 32) (_ BitVec 32)) BitStream!7538)

(assert (=> b!177032 (= lt!272171 (readBitPure!0 (readerFrom!0 (_2!8271 lt!272173) (currentBit!8824 thiss!1204) (currentByte!8829 thiss!1204))))))

(declare-fun b!177033 () Bool)

(declare-fun e!123373 () Bool)

(assert (=> b!177033 (= e!123373 e!123378)))

(declare-fun res!146715 () Bool)

(assert (=> b!177033 (=> (not res!146715) (not e!123378))))

(declare-fun lt!272174 () (_ BitVec 64))

(assert (=> b!177033 (= res!146715 (= lt!272172 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!272174)))))

(assert (=> b!177033 (= lt!272172 (bitIndex!0 (size!4215 (buf!4658 (_2!8271 lt!272173))) (currentByte!8829 (_2!8271 lt!272173)) (currentBit!8824 (_2!8271 lt!272173))))))

(assert (=> b!177033 (= lt!272174 (bitIndex!0 (size!4215 (buf!4658 thiss!1204)) (currentByte!8829 thiss!1204) (currentBit!8824 thiss!1204)))))

(declare-fun b!177034 () Bool)

(declare-fun res!146717 () Bool)

(assert (=> b!177034 (=> (not res!146717) (not e!123376))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!177034 (= res!146717 (validate_offset_bits!1 ((_ sign_extend 32) (size!4215 (buf!4658 thiss!1204))) ((_ sign_extend 32) (currentByte!8829 thiss!1204)) ((_ sign_extend 32) (currentBit!8824 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun res!146718 () Bool)

(assert (=> start!39366 (=> (not res!146718) (not e!123376))))

(assert (=> start!39366 (= res!146718 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39366 e!123376))

(assert (=> start!39366 true))

(declare-fun e!123379 () Bool)

(declare-fun inv!12 (BitStream!7538) Bool)

(assert (=> start!39366 (and (inv!12 thiss!1204) e!123379)))

(declare-fun b!177035 () Bool)

(declare-fun e!123377 () Bool)

(assert (=> b!177035 (= e!123376 (not e!123377))))

(declare-fun res!146713 () Bool)

(assert (=> b!177035 (=> res!146713 e!123377)))

(assert (=> b!177035 (= res!146713 (not (= (bitIndex!0 (size!4215 (buf!4658 (_2!8271 lt!272173))) (currentByte!8829 (_2!8271 lt!272173)) (currentBit!8824 (_2!8271 lt!272173))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4215 (buf!4658 thiss!1204)) (currentByte!8829 thiss!1204) (currentBit!8824 thiss!1204))))))))

(assert (=> b!177035 e!123373))

(declare-fun res!146714 () Bool)

(assert (=> b!177035 (=> (not res!146714) (not e!123373))))

(assert (=> b!177035 (= res!146714 (= (size!4215 (buf!4658 thiss!1204)) (size!4215 (buf!4658 (_2!8271 lt!272173)))))))

(declare-fun appendBit!0 (BitStream!7538 Bool) tuple2!15252)

(assert (=> b!177035 (= lt!272173 (appendBit!0 thiss!1204 lt!272170))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!177035 (= lt!272170 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!177036 () Bool)

(declare-fun res!146716 () Bool)

(assert (=> b!177036 (=> (not res!146716) (not e!123376))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!177036 (= res!146716 (invariant!0 (currentBit!8824 thiss!1204) (currentByte!8829 thiss!1204) (size!4215 (buf!4658 thiss!1204))))))

(declare-fun b!177037 () Bool)

(declare-fun array_inv!3956 (array!9558) Bool)

(assert (=> b!177037 (= e!123379 (array_inv!3956 (buf!4658 thiss!1204)))))

(declare-fun b!177038 () Bool)

(declare-fun res!146720 () Bool)

(assert (=> b!177038 (=> (not res!146720) (not e!123378))))

(declare-fun isPrefixOf!0 (BitStream!7538 BitStream!7538) Bool)

(assert (=> b!177038 (= res!146720 (isPrefixOf!0 thiss!1204 (_2!8271 lt!272173)))))

(declare-fun b!177039 () Bool)

(assert (=> b!177039 (= e!123377 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!590)) (bvsle (bvadd #b00000000000000000000000000000001 i!590) nBits!348)))))

(assert (= (and start!39366 res!146718) b!177034))

(assert (= (and b!177034 res!146717) b!177036))

(assert (= (and b!177036 res!146716) b!177030))

(assert (= (and b!177030 res!146721) b!177035))

(assert (= (and b!177035 res!146714) b!177033))

(assert (= (and b!177033 res!146715) b!177038))

(assert (= (and b!177038 res!146720) b!177032))

(assert (= (and b!177032 res!146719) b!177031))

(assert (= (and b!177035 (not res!146713)) b!177039))

(assert (= start!39366 b!177037))

(declare-fun m!277017 () Bool)

(assert (=> b!177038 m!277017))

(declare-fun m!277019 () Bool)

(assert (=> b!177037 m!277019))

(declare-fun m!277021 () Bool)

(assert (=> start!39366 m!277021))

(declare-fun m!277023 () Bool)

(assert (=> b!177033 m!277023))

(declare-fun m!277025 () Bool)

(assert (=> b!177033 m!277025))

(assert (=> b!177035 m!277023))

(assert (=> b!177035 m!277025))

(declare-fun m!277027 () Bool)

(assert (=> b!177035 m!277027))

(declare-fun m!277029 () Bool)

(assert (=> b!177036 m!277029))

(declare-fun m!277031 () Bool)

(assert (=> b!177032 m!277031))

(assert (=> b!177032 m!277031))

(declare-fun m!277033 () Bool)

(assert (=> b!177032 m!277033))

(declare-fun m!277035 () Bool)

(assert (=> b!177031 m!277035))

(declare-fun m!277037 () Bool)

(assert (=> b!177034 m!277037))

(push 1)

(assert (not b!177035))

(assert (not b!177034))

(assert (not b!177037))

(assert (not start!39366))

(assert (not b!177032))

(assert (not b!177036))

(assert (not b!177031))

(assert (not b!177033))

(assert (not b!177038))

(check-sat)

(pop 1)

(push 1)

(check-sat)

