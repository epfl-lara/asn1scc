; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37638 () Bool)

(assert start!37638)

(declare-fun res!141707 () Bool)

(declare-fun e!119160 () Bool)

(assert (=> start!37638 (=> (not res!141707) (not e!119160))))

(declare-fun nBits!283 () (_ BitVec 64))

(declare-fun from!235 () (_ BitVec 64))

(assert (=> start!37638 (= res!141707 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!235) (bvslt from!235 nBits!283)))))

(assert (=> start!37638 e!119160))

(assert (=> start!37638 true))

(declare-datatypes ((array!9049 0))(
  ( (array!9050 (arr!4936 (Array (_ BitVec 32) (_ BitVec 8))) (size!4006 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7150 0))(
  ( (BitStream!7151 (buf!4449 array!9049) (currentByte!8436 (_ BitVec 32)) (currentBit!8431 (_ BitVec 32))) )
))
(declare-fun bs!64 () BitStream!7150)

(declare-fun e!119159 () Bool)

(declare-fun inv!12 (BitStream!7150) Bool)

(assert (=> start!37638 (and (inv!12 bs!64) e!119159)))

(declare-fun b!170770 () Bool)

(declare-fun res!141708 () Bool)

(assert (=> b!170770 (=> (not res!141708) (not e!119160))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!170770 (= res!141708 (validate_offset_bits!1 ((_ sign_extend 32) (size!4006 (buf!4449 bs!64))) ((_ sign_extend 32) (currentByte!8436 bs!64)) ((_ sign_extend 32) (currentBit!8431 bs!64)) (bvsub nBits!283 from!235)))))

(declare-fun b!170771 () Bool)

(assert (=> b!170771 (= e!119160 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283))))

(declare-fun b!170772 () Bool)

(declare-fun array_inv!3747 (array!9049) Bool)

(assert (=> b!170772 (= e!119159 (array_inv!3747 (buf!4449 bs!64)))))

(assert (= (and start!37638 res!141707) b!170770))

(assert (= (and b!170770 res!141708) b!170771))

(assert (= start!37638 b!170772))

(declare-fun m!269923 () Bool)

(assert (=> start!37638 m!269923))

(declare-fun m!269925 () Bool)

(assert (=> b!170770 m!269925))

(declare-fun m!269927 () Bool)

(assert (=> b!170772 m!269927))

(push 1)

(assert (not b!170770))

(assert (not start!37638))

(assert (not b!170772))

(check-sat)

(pop 1)

(push 1)

(check-sat)

