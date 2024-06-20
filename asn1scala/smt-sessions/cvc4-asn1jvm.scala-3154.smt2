; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72396 () Bool)

(assert start!72396)

(declare-fun res!265984 () Bool)

(declare-fun e!233506 () Bool)

(assert (=> start!72396 (=> (not res!265984) (not e!233506))))

(declare-datatypes ((array!20753 0))(
  ( (array!20754 (arr!10122 (Array (_ BitVec 32) (_ BitVec 8))) (size!9030 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14222 0))(
  ( (BitStream!14223 (buf!8172 array!20753) (currentByte!15070 (_ BitVec 32)) (currentBit!15065 (_ BitVec 32))) )
))
(declare-fun thiss!1702 () BitStream!14222)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!72396 (= res!265984 (validate_offset_bit!0 ((_ sign_extend 32) (size!9030 (buf!8172 thiss!1702))) ((_ sign_extend 32) (currentByte!15070 thiss!1702)) ((_ sign_extend 32) (currentBit!15065 thiss!1702))))))

(assert (=> start!72396 e!233506))

(declare-fun e!233507 () Bool)

(declare-fun inv!12 (BitStream!14222) Bool)

(assert (=> start!72396 (and (inv!12 thiss!1702) e!233507)))

(declare-fun b!324054 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!324054 (= e!233506 (bvsle (remainingBits!0 ((_ sign_extend 32) (size!9030 (buf!8172 thiss!1702))) ((_ sign_extend 32) (currentByte!15070 thiss!1702)) ((_ sign_extend 32) (currentBit!15065 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!324055 () Bool)

(declare-fun array_inv!8582 (array!20753) Bool)

(assert (=> b!324055 (= e!233507 (array_inv!8582 (buf!8172 thiss!1702)))))

(assert (= (and start!72396 res!265984) b!324054))

(assert (= start!72396 b!324055))

(declare-fun m!462135 () Bool)

(assert (=> start!72396 m!462135))

(declare-fun m!462137 () Bool)

(assert (=> start!72396 m!462137))

(declare-fun m!462139 () Bool)

(assert (=> b!324054 m!462139))

(declare-fun m!462141 () Bool)

(assert (=> b!324055 m!462141))

(push 1)

(assert (not b!324055))

(assert (not b!324054))

(assert (not start!72396))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106336 () Bool)

(assert (=> d!106336 (= (array_inv!8582 (buf!8172 thiss!1702)) (bvsge (size!9030 (buf!8172 thiss!1702)) #b00000000000000000000000000000000))))

(assert (=> b!324055 d!106336))

(declare-fun d!106338 () Bool)

(assert (=> d!106338 (= (remainingBits!0 ((_ sign_extend 32) (size!9030 (buf!8172 thiss!1702))) ((_ sign_extend 32) (currentByte!15070 thiss!1702)) ((_ sign_extend 32) (currentBit!15065 thiss!1702))) (bvsub (bvmul ((_ sign_extend 32) (size!9030 (buf!8172 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15070 thiss!1702)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15065 thiss!1702)))))))

(assert (=> b!324054 d!106338))

(declare-fun d!106344 () Bool)

(assert (=> d!106344 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!9030 (buf!8172 thiss!1702))) ((_ sign_extend 32) (currentByte!15070 thiss!1702)) ((_ sign_extend 32) (currentBit!15065 thiss!1702))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!9030 (buf!8172 thiss!1702))) ((_ sign_extend 32) (currentByte!15070 thiss!1702)) ((_ sign_extend 32) (currentBit!15065 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!28013 () Bool)

(assert (= bs!28013 d!106344))

(assert (=> bs!28013 m!462139))

(assert (=> start!72396 d!106344))

(declare-fun d!106346 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106346 (= (inv!12 thiss!1702) (invariant!0 (currentBit!15065 thiss!1702) (currentByte!15070 thiss!1702) (size!9030 (buf!8172 thiss!1702))))))

(declare-fun bs!28016 () Bool)

(assert (= bs!28016 d!106346))

(declare-fun m!462145 () Bool)

(assert (=> bs!28016 m!462145))

(assert (=> start!72396 d!106346))

(push 1)

(assert (not d!106346))

(assert (not d!106344))

(check-sat)

(pop 1)

(push 1)

(check-sat)

