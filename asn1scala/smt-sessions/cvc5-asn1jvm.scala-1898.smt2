; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49682 () Bool)

(assert start!49682)

(declare-fun b!234364 () Bool)

(declare-fun e!162020 () Bool)

(declare-fun nBits!274 () (_ BitVec 32))

(assert (=> b!234364 (= e!162020 (bvsgt #b00000000000000000000000000000000 nBits!274))))

(declare-fun b!234362 () Bool)

(declare-fun res!196009 () Bool)

(assert (=> b!234362 (=> (not res!196009) (not e!162020))))

(declare-datatypes ((array!12278 0))(
  ( (array!12279 (arr!6382 (Array (_ BitVec 32) (_ BitVec 8))) (size!5395 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9754 0))(
  ( (BitStream!9755 (buf!5870 array!12278) (currentByte!10925 (_ BitVec 32)) (currentBit!10920 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9754)

(declare-fun i!546 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!234362 (= res!196009 (validate_offset_bits!1 ((_ sign_extend 32) (size!5395 (buf!5870 bs!63))) ((_ sign_extend 32) (currentByte!10925 bs!63)) ((_ sign_extend 32) (currentBit!10920 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun b!234365 () Bool)

(declare-fun e!162019 () Bool)

(declare-fun array_inv!5136 (array!12278) Bool)

(assert (=> b!234365 (= e!162019 (array_inv!5136 (buf!5870 bs!63)))))

(declare-fun b!234363 () Bool)

(declare-fun res!196010 () Bool)

(assert (=> b!234363 (=> (not res!196010) (not e!162020))))

(declare-fun acc!118 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!234363 (= res!196010 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!196011 () Bool)

(assert (=> start!49682 (=> (not res!196011) (not e!162020))))

(assert (=> start!49682 (= res!196011 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!49682 e!162020))

(assert (=> start!49682 true))

(declare-fun inv!12 (BitStream!9754) Bool)

(assert (=> start!49682 (and (inv!12 bs!63) e!162019)))

(assert (= (and start!49682 res!196011) b!234362))

(assert (= (and b!234362 res!196009) b!234363))

(assert (= (and b!234363 res!196010) b!234364))

(assert (= start!49682 b!234365))

(declare-fun m!356989 () Bool)

(assert (=> b!234362 m!356989))

(declare-fun m!356991 () Bool)

(assert (=> b!234365 m!356991))

(declare-fun m!356993 () Bool)

(assert (=> b!234363 m!356993))

(declare-fun m!356995 () Bool)

(assert (=> start!49682 m!356995))

(push 1)

(assert (not b!234363))

(assert (not start!49682))

(assert (not b!234362))

(assert (not b!234365))

(check-sat)

(pop 1)

(push 1)

(check-sat)

