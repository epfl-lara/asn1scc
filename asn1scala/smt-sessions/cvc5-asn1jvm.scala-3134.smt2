; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72056 () Bool)

(assert start!72056)

(declare-fun b!323065 () Bool)

(declare-fun e!232767 () Bool)

(declare-datatypes ((array!20620 0))(
  ( (array!20621 (arr!10066 (Array (_ BitVec 32) (_ BitVec 8))) (size!8974 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14110 0))(
  ( (BitStream!14111 (buf!8116 array!20620) (currentByte!14981 (_ BitVec 32)) (currentBit!14976 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14110)

(declare-fun array_inv!8526 (array!20620) Bool)

(assert (=> b!323065 (= e!232767 (array_inv!8526 (buf!8116 thiss!1793)))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-fun acc!161 () (_ BitVec 64))

(declare-fun e!232765 () Bool)

(declare-fun b!323064 () Bool)

(assert (=> b!323064 (= e!232765 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand i!743 #b10000000000000000000000000000000))) (not (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvsub nBits!548 i!743) #b10000000000000000000000000000000)))))))

(declare-fun b!323063 () Bool)

(declare-fun res!265204 () Bool)

(assert (=> b!323063 (=> (not res!265204) (not e!232765))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323063 (= res!265204 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!265202 () Bool)

(assert (=> start!72056 (=> (not res!265202) (not e!232765))))

(assert (=> start!72056 (= res!265202 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!72056 e!232765))

(assert (=> start!72056 true))

(declare-fun inv!12 (BitStream!14110) Bool)

(assert (=> start!72056 (and (inv!12 thiss!1793) e!232767)))

(declare-fun b!323062 () Bool)

(declare-fun res!265203 () Bool)

(assert (=> b!323062 (=> (not res!265203) (not e!232765))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!323062 (= res!265203 (validate_offset_bits!1 ((_ sign_extend 32) (size!8974 (buf!8116 thiss!1793))) ((_ sign_extend 32) (currentByte!14981 thiss!1793)) ((_ sign_extend 32) (currentBit!14976 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(assert (= (and start!72056 res!265202) b!323062))

(assert (= (and b!323062 res!265203) b!323063))

(assert (= (and b!323063 res!265204) b!323064))

(assert (= start!72056 b!323065))

(declare-fun m!461265 () Bool)

(assert (=> b!323065 m!461265))

(declare-fun m!461267 () Bool)

(assert (=> b!323063 m!461267))

(declare-fun m!461269 () Bool)

(assert (=> start!72056 m!461269))

(declare-fun m!461271 () Bool)

(assert (=> b!323062 m!461271))

(push 1)

(assert (not start!72056))

(assert (not b!323063))

(assert (not b!323062))

(assert (not b!323065))

(check-sat)

(pop 1)

(push 1)

(check-sat)

