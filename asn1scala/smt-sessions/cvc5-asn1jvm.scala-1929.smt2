; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50282 () Bool)

(assert start!50282)

(declare-fun b!235950 () Bool)

(declare-fun res!197202 () Bool)

(declare-fun e!163177 () Bool)

(assert (=> b!235950 (=> (not res!197202) (not e!163177))))

(declare-datatypes ((array!12478 0))(
  ( (array!12479 (arr!6469 (Array (_ BitVec 32) (_ BitVec 8))) (size!5482 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9928 0))(
  ( (BitStream!9929 (buf!5957 array!12478) (currentByte!11068 (_ BitVec 32)) (currentBit!11063 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9928)

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235950 (= res!197202 (validate_offset_bits!1 ((_ sign_extend 32) (size!5482 (buf!5957 thiss!1830))) ((_ sign_extend 32) (currentByte!11068 thiss!1830)) ((_ sign_extend 32) (currentBit!11063 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!235951 () Bool)

(declare-fun res!197204 () Bool)

(assert (=> b!235951 (=> (not res!197204) (not e!163177))))

(assert (=> b!235951 (= res!197204 (= nBits!581 i!752))))

(declare-fun b!235952 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!235952 (= e!163177 (not (invariant!0 (currentBit!11063 thiss!1830) (currentByte!11068 thiss!1830) (size!5482 (buf!5957 thiss!1830)))))))

(declare-fun b!235953 () Bool)

(declare-fun res!197201 () Bool)

(assert (=> b!235953 (=> (not res!197201) (not e!163177))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!235953 (= res!197201 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!235954 () Bool)

(declare-fun res!197205 () Bool)

(assert (=> b!235954 (=> (not res!197205) (not e!163177))))

(assert (=> b!235954 (= res!197205 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!235955 () Bool)

(declare-fun e!163176 () Bool)

(declare-fun array_inv!5223 (array!12478) Bool)

(assert (=> b!235955 (= e!163176 (array_inv!5223 (buf!5957 thiss!1830)))))

(declare-fun res!197203 () Bool)

(assert (=> start!50282 (=> (not res!197203) (not e!163177))))

(assert (=> start!50282 (= res!197203 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50282 e!163177))

(assert (=> start!50282 true))

(declare-fun inv!12 (BitStream!9928) Bool)

(assert (=> start!50282 (and (inv!12 thiss!1830) e!163176)))

(assert (= (and start!50282 res!197203) b!235950))

(assert (= (and b!235950 res!197202) b!235954))

(assert (= (and b!235954 res!197205) b!235953))

(assert (= (and b!235953 res!197201) b!235951))

(assert (= (and b!235951 res!197204) b!235952))

(assert (= start!50282 b!235955))

(declare-fun m!358581 () Bool)

(assert (=> b!235952 m!358581))

(declare-fun m!358583 () Bool)

(assert (=> b!235953 m!358583))

(declare-fun m!358585 () Bool)

(assert (=> start!50282 m!358585))

(declare-fun m!358587 () Bool)

(assert (=> b!235954 m!358587))

(declare-fun m!358589 () Bool)

(assert (=> b!235955 m!358589))

(declare-fun m!358591 () Bool)

(assert (=> b!235950 m!358591))

(push 1)

(assert (not b!235953))

(assert (not b!235950))

(assert (not b!235955))

(assert (not start!50282))

(assert (not b!235954))

(assert (not b!235952))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79612 () Bool)

(assert (=> d!79612 (= (onesLSBLong!0 nBits!581) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!581))))))

(assert (=> b!235953 d!79612))

(declare-fun d!79614 () Bool)

(assert (=> d!79614 (= (onesLSBLong!0 (bvsub nBits!581 i!752)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!581 i!752)))))))

(assert (=> b!235954 d!79614))

(declare-fun d!79616 () Bool)

(assert (=> d!79616 (= (array_inv!5223 (buf!5957 thiss!1830)) (bvsge (size!5482 (buf!5957 thiss!1830)) #b00000000000000000000000000000000))))

(assert (=> b!235955 d!79616))

(declare-fun d!79622 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!79622 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5482 (buf!5957 thiss!1830))) ((_ sign_extend 32) (currentByte!11068 thiss!1830)) ((_ sign_extend 32) (currentBit!11063 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5482 (buf!5957 thiss!1830))) ((_ sign_extend 32) (currentByte!11068 thiss!1830)) ((_ sign_extend 32) (currentBit!11063 thiss!1830))) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun bs!19875 () Bool)

(assert (= bs!19875 d!79622))

(declare-fun m!358619 () Bool)

(assert (=> bs!19875 m!358619))

(assert (=> b!235950 d!79622))

(declare-fun d!79628 () Bool)

(assert (=> d!79628 (= (inv!12 thiss!1830) (invariant!0 (currentBit!11063 thiss!1830) (currentByte!11068 thiss!1830) (size!5482 (buf!5957 thiss!1830))))))

(declare-fun bs!19877 () Bool)

(assert (= bs!19877 d!79628))

(assert (=> bs!19877 m!358581))

(assert (=> start!50282 d!79628))

(declare-fun d!79632 () Bool)

(assert (=> d!79632 (= (invariant!0 (currentBit!11063 thiss!1830) (currentByte!11068 thiss!1830) (size!5482 (buf!5957 thiss!1830))) (and (bvsge (currentBit!11063 thiss!1830) #b00000000000000000000000000000000) (bvslt (currentBit!11063 thiss!1830) #b00000000000000000000000000001000) (bvsge (currentByte!11068 thiss!1830) #b00000000000000000000000000000000) (or (bvslt (currentByte!11068 thiss!1830) (size!5482 (buf!5957 thiss!1830))) (and (= (currentBit!11063 thiss!1830) #b00000000000000000000000000000000) (= (currentByte!11068 thiss!1830) (size!5482 (buf!5957 thiss!1830)))))))))

(assert (=> b!235952 d!79632))

(push 1)

(assert (not d!79628))

(assert (not d!79622))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

