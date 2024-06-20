; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49686 () Bool)

(assert start!49686)

(declare-fun b!234388 () Bool)

(declare-fun e!162038 () Bool)

(declare-fun nBits!274 () (_ BitVec 32))

(assert (=> b!234388 (= e!162038 (bvsgt #b00000000000000000000000000000000 nBits!274))))

(declare-fun b!234389 () Bool)

(declare-fun e!162037 () Bool)

(declare-datatypes ((array!12282 0))(
  ( (array!12283 (arr!6384 (Array (_ BitVec 32) (_ BitVec 8))) (size!5397 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9758 0))(
  ( (BitStream!9759 (buf!5872 array!12282) (currentByte!10927 (_ BitVec 32)) (currentBit!10922 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9758)

(declare-fun array_inv!5138 (array!12282) Bool)

(assert (=> b!234389 (= e!162037 (array_inv!5138 (buf!5872 bs!63)))))

(declare-fun b!234387 () Bool)

(declare-fun res!196029 () Bool)

(assert (=> b!234387 (=> (not res!196029) (not e!162038))))

(declare-fun acc!118 () (_ BitVec 64))

(declare-fun i!546 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!234387 (= res!196029 (= (bvand acc!118 (onesLSBLong!0 (bvsub nBits!274 i!546))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!196027 () Bool)

(assert (=> start!49686 (=> (not res!196027) (not e!162038))))

(assert (=> start!49686 (= res!196027 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!49686 e!162038))

(assert (=> start!49686 true))

(declare-fun inv!12 (BitStream!9758) Bool)

(assert (=> start!49686 (and (inv!12 bs!63) e!162037)))

(declare-fun b!234386 () Bool)

(declare-fun res!196028 () Bool)

(assert (=> b!234386 (=> (not res!196028) (not e!162038))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!234386 (= res!196028 (validate_offset_bits!1 ((_ sign_extend 32) (size!5397 (buf!5872 bs!63))) ((_ sign_extend 32) (currentByte!10927 bs!63)) ((_ sign_extend 32) (currentBit!10922 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(assert (= (and start!49686 res!196027) b!234386))

(assert (= (and b!234386 res!196028) b!234387))

(assert (= (and b!234387 res!196029) b!234388))

(assert (= start!49686 b!234389))

(declare-fun m!357005 () Bool)

(assert (=> b!234389 m!357005))

(declare-fun m!357007 () Bool)

(assert (=> b!234387 m!357007))

(declare-fun m!357009 () Bool)

(assert (=> start!49686 m!357009))

(declare-fun m!357011 () Bool)

(assert (=> b!234386 m!357011))

(push 1)

(assert (not b!234389))

(assert (not b!234387))

(assert (not start!49686))

(assert (not b!234386))

(check-sat)

(pop 1)

(push 1)

(check-sat)

