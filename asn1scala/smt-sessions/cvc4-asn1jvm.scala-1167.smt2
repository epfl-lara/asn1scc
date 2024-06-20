; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33024 () Bool)

(assert start!33024)

(declare-fun res!133907 () Bool)

(declare-fun e!110152 () Bool)

(assert (=> start!33024 (=> (not res!133907) (not e!110152))))

(declare-datatypes ((array!7800 0))(
  ( (array!7801 (arr!4437 (Array (_ BitVec 32) (_ BitVec 8))) (size!3516 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6200 0))(
  ( (BitStream!6201 (buf!3974 array!7800) (currentByte!7340 (_ BitVec 32)) (currentBit!7335 (_ BitVec 32))) )
))
(declare-fun thiss!1602 () BitStream!6200)

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!33024 (= res!133907 (validate_offset_byte!0 ((_ sign_extend 32) (size!3516 (buf!3974 thiss!1602))) ((_ sign_extend 32) (currentByte!7340 thiss!1602)) ((_ sign_extend 32) (currentBit!7335 thiss!1602))))))

(assert (=> start!33024 e!110152))

(declare-fun e!110153 () Bool)

(declare-fun inv!12 (BitStream!6200) Bool)

(assert (=> start!33024 (and (inv!12 thiss!1602) e!110153)))

(declare-fun b!160589 () Bool)

(assert (=> b!160589 (= e!110152 (and (bvslt (currentByte!7340 thiss!1602) (size!3516 (buf!3974 thiss!1602))) (bvslt (currentByte!7340 thiss!1602) #b00000000000000000000000000000000)))))

(declare-fun b!160590 () Bool)

(declare-fun array_inv!3263 (array!7800) Bool)

(assert (=> b!160590 (= e!110153 (array_inv!3263 (buf!3974 thiss!1602)))))

(assert (= (and start!33024 res!133907) b!160589))

(assert (= start!33024 b!160590))

(declare-fun m!253609 () Bool)

(assert (=> start!33024 m!253609))

(declare-fun m!253611 () Bool)

(assert (=> start!33024 m!253611))

(declare-fun m!253613 () Bool)

(assert (=> b!160590 m!253613))

(push 1)

(assert (not start!33024))

(assert (not b!160590))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!54477 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!54477 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!3516 (buf!3974 thiss!1602))) ((_ sign_extend 32) (currentByte!7340 thiss!1602)) ((_ sign_extend 32) (currentBit!7335 thiss!1602))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3516 (buf!3974 thiss!1602))) ((_ sign_extend 32) (currentByte!7340 thiss!1602)) ((_ sign_extend 32) (currentBit!7335 thiss!1602))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!13519 () Bool)

(assert (= bs!13519 d!54477))

(declare-fun m!253621 () Bool)

(assert (=> bs!13519 m!253621))

(assert (=> start!33024 d!54477))

(declare-fun d!54481 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!54481 (= (inv!12 thiss!1602) (invariant!0 (currentBit!7335 thiss!1602) (currentByte!7340 thiss!1602) (size!3516 (buf!3974 thiss!1602))))))

(declare-fun bs!13521 () Bool)

(assert (= bs!13521 d!54481))

(declare-fun m!253625 () Bool)

(assert (=> bs!13521 m!253625))

(assert (=> start!33024 d!54481))

(declare-fun d!54483 () Bool)

(assert (=> d!54483 (= (array_inv!3263 (buf!3974 thiss!1602)) (bvsge (size!3516 (buf!3974 thiss!1602)) #b00000000000000000000000000000000))))

(assert (=> b!160590 d!54483))

(push 1)

(assert (not d!54481))

(assert (not d!54477))

(check-sat)

(pop 1)

(push 1)

(check-sat)

