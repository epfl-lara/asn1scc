; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71676 () Bool)

(assert start!71676)

(declare-fun b!321933 () Bool)

(declare-fun e!232014 () Bool)

(declare-fun e!232011 () Bool)

(assert (=> b!321933 (= e!232014 e!232011)))

(declare-fun res!264253 () Bool)

(assert (=> b!321933 (=> (not res!264253) (not e!232011))))

(declare-datatypes ((array!20522 0))(
  ( (array!20523 (arr!10026 (Array (_ BitVec 32) (_ BitVec 8))) (size!8934 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14030 0))(
  ( (BitStream!14031 (buf!8076 array!20522) (currentByte!14887 (_ BitVec 32)) (currentBit!14882 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14030)

(declare-fun lt!444698 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!321933 (= res!264253 (validate_offset_bits!1 ((_ sign_extend 32) (size!8934 (buf!8076 thiss!1793))) ((_ sign_extend 32) (currentByte!14887 thiss!1793)) ((_ sign_extend 32) (currentBit!14882 thiss!1793)) lt!444698))))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-fun i!743 () (_ BitVec 32))

(assert (=> b!321933 (= lt!444698 ((_ sign_extend 32) (bvsub nBits!548 i!743)))))

(declare-fun res!264255 () Bool)

(assert (=> start!71676 (=> (not res!264255) (not e!232014))))

(assert (=> start!71676 (= res!264255 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71676 e!232014))

(assert (=> start!71676 true))

(declare-fun e!232012 () Bool)

(declare-fun inv!12 (BitStream!14030) Bool)

(assert (=> start!71676 (and (inv!12 thiss!1793) e!232012)))

(declare-fun b!321934 () Bool)

(declare-fun res!264254 () Bool)

(assert (=> b!321934 (=> (not res!264254) (not e!232011))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321934 (= res!264254 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!321935 () Bool)

(declare-fun res!264256 () Bool)

(assert (=> b!321935 (=> (not res!264256) (not e!232011))))

(assert (=> b!321935 (= res!264256 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (= nBits!548 i!743)))))

(declare-fun b!321936 () Bool)

(declare-fun array_inv!8486 (array!20522) Bool)

(assert (=> b!321936 (= e!232012 (array_inv!8486 (buf!8076 thiss!1793)))))

(declare-fun b!321937 () Bool)

(declare-fun lt!444697 () (_ BitVec 64))

(assert (=> b!321937 (= e!232011 (and (= lt!444697 (bvadd lt!444697 lt!444698)) (bvsgt #b00000000000000000000000000000000 nBits!548)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!321937 (= lt!444697 (bitIndex!0 (size!8934 (buf!8076 thiss!1793)) (currentByte!14887 thiss!1793) (currentBit!14882 thiss!1793)))))

(assert (= (and start!71676 res!264255) b!321933))

(assert (= (and b!321933 res!264253) b!321934))

(assert (= (and b!321934 res!264254) b!321935))

(assert (= (and b!321935 res!264256) b!321937))

(assert (= start!71676 b!321936))

(declare-fun m!460211 () Bool)

(assert (=> b!321937 m!460211))

(declare-fun m!460213 () Bool)

(assert (=> b!321934 m!460213))

(declare-fun m!460215 () Bool)

(assert (=> b!321936 m!460215))

(declare-fun m!460217 () Bool)

(assert (=> start!71676 m!460217))

(declare-fun m!460219 () Bool)

(assert (=> b!321933 m!460219))

(push 1)

(assert (not start!71676))

(assert (not b!321936))

(assert (not b!321933))

(assert (not b!321937))

(assert (not b!321934))

(check-sat)

(pop 1)

(push 1)

(check-sat)

