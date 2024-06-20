; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71440 () Bool)

(assert start!71440)

(declare-fun res!263962 () Bool)

(declare-fun e!231571 () Bool)

(assert (=> start!71440 (=> (not res!263962) (not e!231571))))

(declare-datatypes ((array!20405 0))(
  ( (array!20406 (arr!9976 (Array (_ BitVec 32) (_ BitVec 8))) (size!8884 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13930 0))(
  ( (BitStream!13931 (buf!8026 array!20405) (currentByte!14811 (_ BitVec 32)) (currentBit!14806 (_ BitVec 32))) )
))
(declare-fun thiss!1701 () BitStream!13930)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!71440 (= res!263962 (validate_offset_bit!0 ((_ sign_extend 32) (size!8884 (buf!8026 thiss!1701))) ((_ sign_extend 32) (currentByte!14811 thiss!1701)) ((_ sign_extend 32) (currentBit!14806 thiss!1701))))))

(assert (=> start!71440 e!231571))

(declare-fun e!231572 () Bool)

(declare-fun inv!12 (BitStream!13930) Bool)

(assert (=> start!71440 (and (inv!12 thiss!1701) e!231572)))

(declare-fun b!321492 () Bool)

(assert (=> b!321492 (= e!231571 (or (bvslt (currentBit!14806 thiss!1701) #b00000000000000000000000000000000) (bvsge (currentBit!14806 thiss!1701) #b00000000000000000000000000001000)))))

(declare-fun b!321493 () Bool)

(declare-fun array_inv!8436 (array!20405) Bool)

(assert (=> b!321493 (= e!231572 (array_inv!8436 (buf!8026 thiss!1701)))))

(assert (= (and start!71440 res!263962) b!321492))

(assert (= start!71440 b!321493))

(declare-fun m!459841 () Bool)

(assert (=> start!71440 m!459841))

(declare-fun m!459843 () Bool)

(assert (=> start!71440 m!459843))

(declare-fun m!459845 () Bool)

(assert (=> b!321493 m!459845))

(push 1)

(assert (not start!71440))

(assert (not b!321493))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105442 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!105442 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!8884 (buf!8026 thiss!1701))) ((_ sign_extend 32) (currentByte!14811 thiss!1701)) ((_ sign_extend 32) (currentBit!14806 thiss!1701))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8884 (buf!8026 thiss!1701))) ((_ sign_extend 32) (currentByte!14811 thiss!1701)) ((_ sign_extend 32) (currentBit!14806 thiss!1701))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!27739 () Bool)

(assert (= bs!27739 d!105442))

(declare-fun m!459863 () Bool)

(assert (=> bs!27739 m!459863))

(assert (=> start!71440 d!105442))

(declare-fun d!105444 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105444 (= (inv!12 thiss!1701) (invariant!0 (currentBit!14806 thiss!1701) (currentByte!14811 thiss!1701) (size!8884 (buf!8026 thiss!1701))))))

(declare-fun bs!27741 () Bool)

(assert (= bs!27741 d!105444))

(declare-fun m!459867 () Bool)

(assert (=> bs!27741 m!459867))

(assert (=> start!71440 d!105444))

(declare-fun d!105450 () Bool)

(assert (=> d!105450 (= (array_inv!8436 (buf!8026 thiss!1701)) (bvsge (size!8884 (buf!8026 thiss!1701)) #b00000000000000000000000000000000))))

(assert (=> b!321493 d!105450))

(push 1)

(assert (not d!105442))

(assert (not d!105444))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105458 () Bool)

(assert (=> d!105458 (= (remainingBits!0 ((_ sign_extend 32) (size!8884 (buf!8026 thiss!1701))) ((_ sign_extend 32) (currentByte!14811 thiss!1701)) ((_ sign_extend 32) (currentBit!14806 thiss!1701))) (bvsub (bvmul ((_ sign_extend 32) (size!8884 (buf!8026 thiss!1701))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14811 thiss!1701)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14806 thiss!1701)))))))

(assert (=> d!105442 d!105458))

(declare-fun d!105460 () Bool)

(assert (=> d!105460 (= (invariant!0 (currentBit!14806 thiss!1701) (currentByte!14811 thiss!1701) (size!8884 (buf!8026 thiss!1701))) (and (bvsge (currentBit!14806 thiss!1701) #b00000000000000000000000000000000) (bvslt (currentBit!14806 thiss!1701) #b00000000000000000000000000001000) (bvsge (currentByte!14811 thiss!1701) #b00000000000000000000000000000000) (or (bvslt (currentByte!14811 thiss!1701) (size!8884 (buf!8026 thiss!1701))) (and (= (currentBit!14806 thiss!1701) #b00000000000000000000000000000000) (= (currentByte!14811 thiss!1701) (size!8884 (buf!8026 thiss!1701)))))))))

(assert (=> d!105444 d!105460))

(push 1)

(check-sat)

(pop 1)

