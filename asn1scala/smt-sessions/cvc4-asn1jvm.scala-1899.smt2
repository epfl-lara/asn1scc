; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49692 () Bool)

(assert start!49692)

(declare-fun b!234430 () Bool)

(declare-fun res!196064 () Bool)

(declare-fun e!162063 () Bool)

(assert (=> b!234430 (=> (not res!196064) (not e!162063))))

(declare-fun acc!118 () (_ BitVec 64))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!234430 (= res!196064 (= (bvand acc!118 (onesLSBLong!0 nBits!274)) acc!118))))

(declare-fun b!234431 () Bool)

(declare-fun e!162065 () Bool)

(declare-datatypes ((array!12288 0))(
  ( (array!12289 (arr!6387 (Array (_ BitVec 32) (_ BitVec 8))) (size!5400 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9764 0))(
  ( (BitStream!9765 (buf!5875 array!12288) (currentByte!10930 (_ BitVec 32)) (currentBit!10925 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9764)

(declare-fun array_inv!5141 (array!12288) Bool)

(assert (=> b!234431 (= e!162065 (array_inv!5141 (buf!5875 bs!63)))))

(declare-fun res!196065 () Bool)

(assert (=> start!49692 (=> (not res!196065) (not e!162063))))

(declare-fun i!546 () (_ BitVec 32))

(assert (=> start!49692 (= res!196065 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!49692 e!162063))

(assert (=> start!49692 true))

(declare-fun inv!12 (BitStream!9764) Bool)

(assert (=> start!49692 (and (inv!12 bs!63) e!162065)))

(declare-fun b!234432 () Bool)

(declare-fun res!196062 () Bool)

(assert (=> b!234432 (=> (not res!196062) (not e!162063))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!234432 (= res!196062 (validate_offset_bits!1 ((_ sign_extend 32) (size!5400 (buf!5875 bs!63))) ((_ sign_extend 32) (currentByte!10930 bs!63)) ((_ sign_extend 32) (currentBit!10925 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun b!234433 () Bool)

(declare-fun res!196063 () Bool)

(assert (=> b!234433 (=> (not res!196063) (not e!162063))))

(assert (=> b!234433 (= res!196063 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234434 () Bool)

(assert (=> b!234434 (= e!162063 (bvsgt i!546 nBits!274))))

(assert (= (and start!49692 res!196065) b!234432))

(assert (= (and b!234432 res!196062) b!234433))

(assert (= (and b!234433 res!196063) b!234430))

(assert (= (and b!234430 res!196064) b!234434))

(assert (= start!49692 b!234431))

(declare-fun m!357033 () Bool)

(assert (=> b!234430 m!357033))

(declare-fun m!357035 () Bool)

(assert (=> start!49692 m!357035))

(declare-fun m!357037 () Bool)

(assert (=> b!234431 m!357037))

(declare-fun m!357039 () Bool)

(assert (=> b!234433 m!357039))

(declare-fun m!357041 () Bool)

(assert (=> b!234432 m!357041))

(push 1)

(assert (not b!234430))

(assert (not start!49692))

(assert (not b!234432))

(assert (not b!234433))

(assert (not b!234431))

(check-sat)

(pop 1)

(push 1)

(check-sat)

