; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71666 () Bool)

(assert start!71666)

(declare-fun b!321858 () Bool)

(declare-fun e!231954 () Bool)

(declare-fun e!231953 () Bool)

(assert (=> b!321858 (= e!231954 e!231953)))

(declare-fun res!264195 () Bool)

(assert (=> b!321858 (=> (not res!264195) (not e!231953))))

(declare-datatypes ((array!20512 0))(
  ( (array!20513 (arr!10021 (Array (_ BitVec 32) (_ BitVec 8))) (size!8929 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14020 0))(
  ( (BitStream!14021 (buf!8071 array!20512) (currentByte!14882 (_ BitVec 32)) (currentBit!14877 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14020)

(declare-fun lt!444667 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!321858 (= res!264195 (validate_offset_bits!1 ((_ sign_extend 32) (size!8929 (buf!8071 thiss!1793))) ((_ sign_extend 32) (currentByte!14882 thiss!1793)) ((_ sign_extend 32) (currentBit!14877 thiss!1793)) lt!444667))))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-fun i!743 () (_ BitVec 32))

(assert (=> b!321858 (= lt!444667 ((_ sign_extend 32) (bvsub nBits!548 i!743)))))

(declare-fun lt!444668 () (_ BitVec 64))

(declare-fun b!321859 () Bool)

(assert (=> b!321859 (= e!231953 (and (= lt!444668 (bvadd lt!444668 lt!444667)) (bvsgt i!743 #b00000000000000000000000001000000)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321859 (= lt!444668 (bitIndex!0 (size!8929 (buf!8071 thiss!1793)) (currentByte!14882 thiss!1793) (currentBit!14877 thiss!1793)))))

(declare-fun b!321860 () Bool)

(declare-fun res!264196 () Bool)

(assert (=> b!321860 (=> (not res!264196) (not e!231953))))

(declare-fun acc!161 () (_ BitVec 64))

(assert (=> b!321860 (= res!264196 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (= nBits!548 i!743)))))

(declare-fun b!321861 () Bool)

(declare-fun e!231952 () Bool)

(declare-fun array_inv!8481 (array!20512) Bool)

(assert (=> b!321861 (= e!231952 (array_inv!8481 (buf!8071 thiss!1793)))))

(declare-fun b!321862 () Bool)

(declare-fun res!264193 () Bool)

(assert (=> b!321862 (=> (not res!264193) (not e!231953))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321862 (= res!264193 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!264194 () Bool)

(assert (=> start!71666 (=> (not res!264194) (not e!231954))))

(assert (=> start!71666 (= res!264194 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71666 e!231954))

(assert (=> start!71666 true))

(declare-fun inv!12 (BitStream!14020) Bool)

(assert (=> start!71666 (and (inv!12 thiss!1793) e!231952)))

(assert (= (and start!71666 res!264194) b!321858))

(assert (= (and b!321858 res!264195) b!321862))

(assert (= (and b!321862 res!264193) b!321860))

(assert (= (and b!321860 res!264196) b!321859))

(assert (= start!71666 b!321861))

(declare-fun m!460161 () Bool)

(assert (=> b!321858 m!460161))

(declare-fun m!460163 () Bool)

(assert (=> b!321861 m!460163))

(declare-fun m!460165 () Bool)

(assert (=> b!321862 m!460165))

(declare-fun m!460167 () Bool)

(assert (=> start!71666 m!460167))

(declare-fun m!460169 () Bool)

(assert (=> b!321859 m!460169))

(push 1)

(assert (not b!321858))

(assert (not b!321861))

(assert (not b!321859))

(assert (not b!321862))

(assert (not start!71666))

(check-sat)

(pop 1)

(push 1)

(check-sat)

