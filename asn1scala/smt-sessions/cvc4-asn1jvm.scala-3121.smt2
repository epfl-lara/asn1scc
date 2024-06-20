; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71688 () Bool)

(assert start!71688)

(declare-fun b!322023 () Bool)

(declare-fun res!264326 () Bool)

(declare-fun e!232067 () Bool)

(assert (=> b!322023 (=> (not res!264326) (not e!232067))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-fun acc!161 () (_ BitVec 64))

(assert (=> b!322023 (= res!264326 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(declare-fun res!264325 () Bool)

(assert (=> start!71688 (=> (not res!264325) (not e!232067))))

(assert (=> start!71688 (= res!264325 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71688 e!232067))

(assert (=> start!71688 true))

(declare-datatypes ((array!20534 0))(
  ( (array!20535 (arr!10032 (Array (_ BitVec 32) (_ BitVec 8))) (size!8940 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14042 0))(
  ( (BitStream!14043 (buf!8082 array!20534) (currentByte!14893 (_ BitVec 32)) (currentBit!14888 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14042)

(declare-fun e!232066 () Bool)

(declare-fun inv!12 (BitStream!14042) Bool)

(assert (=> start!71688 (and (inv!12 thiss!1793) e!232066)))

(declare-fun b!322024 () Bool)

(declare-fun array_inv!8492 (array!20534) Bool)

(assert (=> b!322024 (= e!232066 (array_inv!8492 (buf!8082 thiss!1793)))))

(declare-fun b!322025 () Bool)

(declare-fun res!264328 () Bool)

(assert (=> b!322025 (=> (not res!264328) (not e!232067))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!322025 (= res!264328 (validate_offset_bits!1 ((_ sign_extend 32) (size!8940 (buf!8082 thiss!1793))) ((_ sign_extend 32) (currentByte!14893 thiss!1793)) ((_ sign_extend 32) (currentBit!14888 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!322026 () Bool)

(declare-fun res!264327 () Bool)

(assert (=> b!322026 (=> (not res!264327) (not e!232067))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!322026 (= res!264327 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!322027 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!322027 (= e!232067 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!8940 (buf!8082 thiss!1793))) ((_ sign_extend 32) (currentByte!14893 thiss!1793)) ((_ sign_extend 32) (currentBit!14888 thiss!1793)))))))

(assert (= (and start!71688 res!264325) b!322025))

(assert (= (and b!322025 res!264328) b!322026))

(assert (= (and b!322026 res!264327) b!322023))

(assert (= (and b!322023 res!264326) b!322027))

(assert (= start!71688 b!322024))

(declare-fun m!460271 () Bool)

(assert (=> b!322025 m!460271))

(declare-fun m!460273 () Bool)

(assert (=> b!322027 m!460273))

(declare-fun m!460275 () Bool)

(assert (=> start!71688 m!460275))

(declare-fun m!460277 () Bool)

(assert (=> b!322024 m!460277))

(declare-fun m!460279 () Bool)

(assert (=> b!322026 m!460279))

(push 1)

(assert (not b!322024))

(assert (not start!71688))

(assert (not b!322027))

(assert (not b!322026))

(assert (not b!322025))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!105612 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!105612 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8940 (buf!8082 thiss!1793))) ((_ sign_extend 32) (currentByte!14893 thiss!1793)) ((_ sign_extend 32) (currentBit!14888 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8940 (buf!8082 thiss!1793))) ((_ sign_extend 32) (currentByte!14893 thiss!1793)) ((_ sign_extend 32) (currentBit!14888 thiss!1793))) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun bs!27821 () Bool)

(assert (= bs!27821 d!105612))

(declare-fun m!460283 () Bool)

(assert (=> bs!27821 m!460283))

(assert (=> b!322025 d!105612))

(declare-fun d!105618 () Bool)

(assert (=> d!105618 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743)) (ite (= (bvsub #b00000000000000000000000001000000 i!743) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!743))))))))

(assert (=> b!322026 d!105618))

(declare-fun d!105624 () Bool)

(assert (=> d!105624 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!8940 (buf!8082 thiss!1793))) ((_ sign_extend 32) (currentByte!14893 thiss!1793)) ((_ sign_extend 32) (currentBit!14888 thiss!1793))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8940 (buf!8082 thiss!1793))) ((_ sign_extend 32) (currentByte!14893 thiss!1793)) ((_ sign_extend 32) (currentBit!14888 thiss!1793))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!27825 () Bool)

(assert (= bs!27825 d!105624))

(assert (=> bs!27825 m!460283))

(assert (=> b!322027 d!105624))

(declare-fun d!105628 () Bool)

(assert (=> d!105628 (= (array_inv!8492 (buf!8082 thiss!1793)) (bvsge (size!8940 (buf!8082 thiss!1793)) #b00000000000000000000000000000000))))

(assert (=> b!322024 d!105628))

(declare-fun d!105630 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!105630 (= (inv!12 thiss!1793) (invariant!0 (currentBit!14888 thiss!1793) (currentByte!14893 thiss!1793) (size!8940 (buf!8082 thiss!1793))))))

(declare-fun bs!27827 () Bool)

(assert (= bs!27827 d!105630))

(declare-fun m!460291 () Bool)

(assert (=> bs!27827 m!460291))

(assert (=> start!71688 d!105630))

(push 1)

(assert (not d!105624))

(assert (not d!105630))

(assert (not d!105612))

(check-sat)

(pop 1)

(push 1)

(check-sat)

