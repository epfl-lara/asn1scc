; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27086 () Bool)

(assert start!27086)

(declare-fun b!139372 () Bool)

(declare-fun res!116173 () Bool)

(declare-fun e!92841 () Bool)

(assert (=> b!139372 (=> (not res!116173) (not e!92841))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!139372 (= res!116173 (bvslt from!447 to!404))))

(declare-fun b!139374 () Bool)

(declare-fun e!92842 () Bool)

(declare-datatypes ((array!6351 0))(
  ( (array!6352 (arr!3570 (Array (_ BitVec 32) (_ BitVec 8))) (size!2875 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5014 0))(
  ( (BitStream!5015 (buf!3291 array!6351) (currentByte!6121 (_ BitVec 32)) (currentBit!6116 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5014)

(declare-fun array_inv!2664 (array!6351) Bool)

(assert (=> b!139374 (= e!92842 (array_inv!2664 (buf!3291 thiss!1634)))))

(declare-fun b!139371 () Bool)

(declare-fun res!116174 () Bool)

(assert (=> b!139371 (=> (not res!116174) (not e!92841))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!139371 (= res!116174 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2875 (buf!3291 thiss!1634))) ((_ sign_extend 32) (currentByte!6121 thiss!1634)) ((_ sign_extend 32) (currentBit!6116 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!139373 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!139373 (= e!92841 (not (invariant!0 (currentBit!6116 thiss!1634) (currentByte!6121 thiss!1634) (size!2875 (buf!3291 thiss!1634)))))))

(declare-fun res!116175 () Bool)

(assert (=> start!27086 (=> (not res!116175) (not e!92841))))

(declare-fun arr!237 () array!6351)

(assert (=> start!27086 (= res!116175 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2875 arr!237))))))

(assert (=> start!27086 e!92841))

(assert (=> start!27086 true))

(assert (=> start!27086 (array_inv!2664 arr!237)))

(declare-fun inv!12 (BitStream!5014) Bool)

(assert (=> start!27086 (and (inv!12 thiss!1634) e!92842)))

(assert (= (and start!27086 res!116175) b!139371))

(assert (= (and b!139371 res!116174) b!139372))

(assert (= (and b!139372 res!116173) b!139373))

(assert (= start!27086 b!139374))

(declare-fun m!214405 () Bool)

(assert (=> b!139374 m!214405))

(declare-fun m!214407 () Bool)

(assert (=> b!139371 m!214407))

(declare-fun m!214409 () Bool)

(assert (=> b!139373 m!214409))

(declare-fun m!214411 () Bool)

(assert (=> start!27086 m!214411))

(declare-fun m!214413 () Bool)

(assert (=> start!27086 m!214413))

(push 1)

(assert (not b!139373))

(assert (not start!27086))

(assert (not b!139374))

(assert (not b!139371))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!44777 () Bool)

(assert (=> d!44777 (= (invariant!0 (currentBit!6116 thiss!1634) (currentByte!6121 thiss!1634) (size!2875 (buf!3291 thiss!1634))) (and (bvsge (currentBit!6116 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6116 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6121 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6121 thiss!1634) (size!2875 (buf!3291 thiss!1634))) (and (= (currentBit!6116 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6121 thiss!1634) (size!2875 (buf!3291 thiss!1634)))))))))

(assert (=> b!139373 d!44777))

(declare-fun d!44785 () Bool)

(assert (=> d!44785 (= (array_inv!2664 arr!237) (bvsge (size!2875 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!27086 d!44785))

(declare-fun d!44787 () Bool)

(assert (=> d!44787 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6116 thiss!1634) (currentByte!6121 thiss!1634) (size!2875 (buf!3291 thiss!1634))))))

(declare-fun bs!10974 () Bool)

(assert (= bs!10974 d!44787))

(assert (=> bs!10974 m!214409))

(assert (=> start!27086 d!44787))

(declare-fun d!44793 () Bool)

(assert (=> d!44793 (= (array_inv!2664 (buf!3291 thiss!1634)) (bvsge (size!2875 (buf!3291 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!139374 d!44793))

(declare-fun d!44795 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!44795 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2875 (buf!3291 thiss!1634))) ((_ sign_extend 32) (currentByte!6121 thiss!1634)) ((_ sign_extend 32) (currentBit!6116 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2875 (buf!3291 thiss!1634))) ((_ sign_extend 32) (currentByte!6121 thiss!1634)) ((_ sign_extend 32) (currentBit!6116 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10975 () Bool)

(assert (= bs!10975 d!44795))

(declare-fun m!214439 () Bool)

(assert (=> bs!10975 m!214439))

(assert (=> b!139371 d!44795))

(push 1)

(assert (not d!44795))

(assert (not d!44787))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

