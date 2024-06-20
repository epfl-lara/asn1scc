; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72506 () Bool)

(assert start!72506)

(declare-fun res!266083 () Bool)

(declare-fun e!233608 () Bool)

(assert (=> start!72506 (=> (not res!266083) (not e!233608))))

(declare-datatypes ((array!20776 0))(
  ( (array!20777 (arr!10129 (Array (_ BitVec 32) (_ BitVec 8))) (size!9037 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14236 0))(
  ( (BitStream!14237 (buf!8179 array!20776) (currentByte!15101 (_ BitVec 32)) (currentBit!15096 (_ BitVec 32))) )
))
(declare-fun thiss!1702 () BitStream!14236)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!72506 (= res!266083 (validate_offset_bit!0 ((_ sign_extend 32) (size!9037 (buf!8179 thiss!1702))) ((_ sign_extend 32) (currentByte!15101 thiss!1702)) ((_ sign_extend 32) (currentBit!15096 thiss!1702))))))

(assert (=> start!72506 e!233608))

(declare-fun e!233609 () Bool)

(declare-fun inv!12 (BitStream!14236) Bool)

(assert (=> start!72506 (and (inv!12 thiss!1702) e!233609)))

(declare-fun b!324174 () Bool)

(assert (=> b!324174 (= e!233608 (or (bvslt (currentByte!15101 thiss!1702) #b00000000000000000000000000000000) (bvsge (currentByte!15101 thiss!1702) (size!9037 (buf!8179 thiss!1702)))))))

(declare-fun b!324175 () Bool)

(declare-fun array_inv!8589 (array!20776) Bool)

(assert (=> b!324175 (= e!233609 (array_inv!8589 (buf!8179 thiss!1702)))))

(assert (= (and start!72506 res!266083) b!324174))

(assert (= start!72506 b!324175))

(declare-fun m!462269 () Bool)

(assert (=> start!72506 m!462269))

(declare-fun m!462271 () Bool)

(assert (=> start!72506 m!462271))

(declare-fun m!462273 () Bool)

(assert (=> b!324175 m!462273))

(push 1)

(assert (not start!72506))

(assert (not b!324175))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106454 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!106454 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!9037 (buf!8179 thiss!1702))) ((_ sign_extend 32) (currentByte!15101 thiss!1702)) ((_ sign_extend 32) (currentBit!15096 thiss!1702))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!9037 (buf!8179 thiss!1702))) ((_ sign_extend 32) (currentByte!15101 thiss!1702)) ((_ sign_extend 32) (currentBit!15096 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!28041 () Bool)

(assert (= bs!28041 d!106454))

(declare-fun m!462291 () Bool)

(assert (=> bs!28041 m!462291))

(assert (=> start!72506 d!106454))

(declare-fun d!106458 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106458 (= (inv!12 thiss!1702) (invariant!0 (currentBit!15096 thiss!1702) (currentByte!15101 thiss!1702) (size!9037 (buf!8179 thiss!1702))))))

(declare-fun bs!28042 () Bool)

(assert (= bs!28042 d!106458))

(declare-fun m!462293 () Bool)

(assert (=> bs!28042 m!462293))

(assert (=> start!72506 d!106458))

(declare-fun d!106462 () Bool)

(assert (=> d!106462 (= (array_inv!8589 (buf!8179 thiss!1702)) (bvsge (size!9037 (buf!8179 thiss!1702)) #b00000000000000000000000000000000))))

(assert (=> b!324175 d!106462))

(push 1)

(assert (not d!106454))

(assert (not d!106458))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106472 () Bool)

(assert (=> d!106472 (= (remainingBits!0 ((_ sign_extend 32) (size!9037 (buf!8179 thiss!1702))) ((_ sign_extend 32) (currentByte!15101 thiss!1702)) ((_ sign_extend 32) (currentBit!15096 thiss!1702))) (bvsub (bvmul ((_ sign_extend 32) (size!9037 (buf!8179 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15101 thiss!1702)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15096 thiss!1702)))))))

(assert (=> d!106454 d!106472))

(declare-fun d!106474 () Bool)

(assert (=> d!106474 (= (invariant!0 (currentBit!15096 thiss!1702) (currentByte!15101 thiss!1702) (size!9037 (buf!8179 thiss!1702))) (and (bvsge (currentBit!15096 thiss!1702) #b00000000000000000000000000000000) (bvslt (currentBit!15096 thiss!1702) #b00000000000000000000000000001000) (bvsge (currentByte!15101 thiss!1702) #b00000000000000000000000000000000) (or (bvslt (currentByte!15101 thiss!1702) (size!9037 (buf!8179 thiss!1702))) (and (= (currentBit!15096 thiss!1702) #b00000000000000000000000000000000) (= (currentByte!15101 thiss!1702) (size!9037 (buf!8179 thiss!1702)))))))))

(assert (=> d!106458 d!106474))

(push 1)

(check-sat)

(pop 1)

