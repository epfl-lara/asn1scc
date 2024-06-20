; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22332 () Bool)

(assert start!22332)

(declare-fun b!112917 () Bool)

(declare-fun res!93232 () Bool)

(declare-fun e!74092 () Bool)

(assert (=> b!112917 (=> (not res!93232) (not e!74092))))

(declare-datatypes ((array!5123 0))(
  ( (array!5124 (arr!2922 (Array (_ BitVec 32) (_ BitVec 8))) (size!2329 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4132 0))(
  ( (BitStream!4133 (buf!2737 array!5123) (currentByte!5311 (_ BitVec 32)) (currentBit!5306 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4132)

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!112917 (= res!93232 (validate_offset_bits!1 ((_ sign_extend 32) (size!2329 (buf!2737 thiss!1305))) ((_ sign_extend 32) (currentByte!5311 thiss!1305)) ((_ sign_extend 32) (currentBit!5306 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!112918 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!112918 (= e!74092 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!2329 (buf!2737 thiss!1305))) ((_ sign_extend 32) (currentByte!5311 thiss!1305)) ((_ sign_extend 32) (currentBit!5306 thiss!1305)))))))

(declare-fun b!112919 () Bool)

(declare-fun e!74094 () Bool)

(declare-fun array_inv!2131 (array!5123) Bool)

(assert (=> b!112919 (= e!74094 (array_inv!2131 (buf!2737 thiss!1305)))))

(declare-fun b!112920 () Bool)

(declare-fun res!93233 () Bool)

(assert (=> b!112920 (=> (not res!93233) (not e!74092))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!112920 (= res!93233 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun res!93231 () Bool)

(assert (=> start!22332 (=> (not res!93231) (not e!74092))))

(assert (=> start!22332 (= res!93231 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22332 e!74092))

(assert (=> start!22332 true))

(declare-fun inv!12 (BitStream!4132) Bool)

(assert (=> start!22332 (and (inv!12 thiss!1305) e!74094)))

(declare-fun b!112921 () Bool)

(declare-fun res!93230 () Bool)

(assert (=> b!112921 (=> (not res!93230) (not e!74092))))

(assert (=> b!112921 (= res!93230 (bvslt i!615 nBits!396))))

(assert (= (and start!22332 res!93231) b!112917))

(assert (= (and b!112917 res!93232) b!112920))

(assert (= (and b!112920 res!93233) b!112921))

(assert (= (and b!112921 res!93230) b!112918))

(assert (= start!22332 b!112919))

(declare-fun m!168985 () Bool)

(assert (=> b!112920 m!168985))

(declare-fun m!168987 () Bool)

(assert (=> start!22332 m!168987))

(declare-fun m!168989 () Bool)

(assert (=> b!112918 m!168989))

(declare-fun m!168991 () Bool)

(assert (=> b!112917 m!168991))

(declare-fun m!168993 () Bool)

(assert (=> b!112919 m!168993))

(push 1)

(assert (not b!112918))

(assert (not b!112919))

(assert (not b!112917))

(assert (not b!112920))

(assert (not start!22332))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!36370 () Bool)

(assert (=> d!36370 (= (array_inv!2131 (buf!2737 thiss!1305)) (bvsge (size!2329 (buf!2737 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!112919 d!36370))

(declare-fun d!36374 () Bool)

(assert (=> d!36374 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!112920 d!36374))

(declare-fun d!36376 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!36376 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2329 (buf!2737 thiss!1305))) ((_ sign_extend 32) (currentByte!5311 thiss!1305)) ((_ sign_extend 32) (currentBit!5306 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2329 (buf!2737 thiss!1305))) ((_ sign_extend 32) (currentByte!5311 thiss!1305)) ((_ sign_extend 32) (currentBit!5306 thiss!1305))) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun bs!8837 () Bool)

(assert (= bs!8837 d!36376))

(declare-fun m!169019 () Bool)

(assert (=> bs!8837 m!169019))

(assert (=> b!112917 d!36376))

(declare-fun d!36380 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!36380 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5306 thiss!1305) (currentByte!5311 thiss!1305) (size!2329 (buf!2737 thiss!1305))))))

(declare-fun bs!8839 () Bool)

(assert (= bs!8839 d!36380))

(declare-fun m!169021 () Bool)

(assert (=> bs!8839 m!169021))

(assert (=> start!22332 d!36380))

(declare-fun d!36384 () Bool)

(assert (=> d!36384 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!2329 (buf!2737 thiss!1305))) ((_ sign_extend 32) (currentByte!5311 thiss!1305)) ((_ sign_extend 32) (currentBit!5306 thiss!1305))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2329 (buf!2737 thiss!1305))) ((_ sign_extend 32) (currentByte!5311 thiss!1305)) ((_ sign_extend 32) (currentBit!5306 thiss!1305))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!8840 () Bool)

(assert (= bs!8840 d!36384))

(assert (=> bs!8840 m!169019))

(assert (=> b!112918 d!36384))

(push 1)

(assert (not d!36376))

(assert (not d!36384))

(assert (not d!36380))

(check-sat)

(pop 1)

(push 1)

(check-sat)

