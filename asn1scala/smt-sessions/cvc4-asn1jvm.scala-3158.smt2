; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72546 () Bool)

(assert start!72546)

(declare-fun res!266098 () Bool)

(declare-fun e!233653 () Bool)

(assert (=> start!72546 (=> (not res!266098) (not e!233653))))

(declare-datatypes ((array!20789 0))(
  ( (array!20790 (arr!10134 (Array (_ BitVec 32) (_ BitVec 8))) (size!9042 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14246 0))(
  ( (BitStream!14247 (buf!8184 array!20789) (currentByte!15115 (_ BitVec 32)) (currentBit!15110 (_ BitVec 32))) )
))
(declare-fun thiss!1702 () BitStream!14246)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!72546 (= res!266098 (validate_offset_bit!0 ((_ sign_extend 32) (size!9042 (buf!8184 thiss!1702))) ((_ sign_extend 32) (currentByte!15115 thiss!1702)) ((_ sign_extend 32) (currentBit!15110 thiss!1702))))))

(assert (=> start!72546 e!233653))

(declare-fun e!233654 () Bool)

(declare-fun inv!12 (BitStream!14246) Bool)

(assert (=> start!72546 (and (inv!12 thiss!1702) e!233654)))

(declare-fun b!324204 () Bool)

(assert (=> b!324204 (= e!233653 (or (bvslt (currentBit!15110 thiss!1702) #b00000000000000000000000000000000) (bvsge (currentBit!15110 thiss!1702) #b00000000000000000000000000001000)))))

(declare-fun b!324205 () Bool)

(declare-fun array_inv!8594 (array!20789) Bool)

(assert (=> b!324205 (= e!233654 (array_inv!8594 (buf!8184 thiss!1702)))))

(assert (= (and start!72546 res!266098) b!324204))

(assert (= start!72546 b!324205))

(declare-fun m!462311 () Bool)

(assert (=> start!72546 m!462311))

(declare-fun m!462313 () Bool)

(assert (=> start!72546 m!462313))

(declare-fun m!462315 () Bool)

(assert (=> b!324205 m!462315))

(push 1)

(assert (not b!324205))

(assert (not start!72546))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106490 () Bool)

(assert (=> d!106490 (= (array_inv!8594 (buf!8184 thiss!1702)) (bvsge (size!9042 (buf!8184 thiss!1702)) #b00000000000000000000000000000000))))

(assert (=> b!324205 d!106490))

(declare-fun d!106494 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!106494 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!9042 (buf!8184 thiss!1702))) ((_ sign_extend 32) (currentByte!15115 thiss!1702)) ((_ sign_extend 32) (currentBit!15110 thiss!1702))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!9042 (buf!8184 thiss!1702))) ((_ sign_extend 32) (currentByte!15115 thiss!1702)) ((_ sign_extend 32) (currentBit!15110 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!28051 () Bool)

(assert (= bs!28051 d!106494))

(declare-fun m!462323 () Bool)

(assert (=> bs!28051 m!462323))

(assert (=> start!72546 d!106494))

(declare-fun d!106496 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106496 (= (inv!12 thiss!1702) (invariant!0 (currentBit!15110 thiss!1702) (currentByte!15115 thiss!1702) (size!9042 (buf!8184 thiss!1702))))))

(declare-fun bs!28053 () Bool)

(assert (= bs!28053 d!106496))

(declare-fun m!462327 () Bool)

(assert (=> bs!28053 m!462327))

(assert (=> start!72546 d!106496))

(push 1)

(assert (not d!106494))

(assert (not d!106496))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

