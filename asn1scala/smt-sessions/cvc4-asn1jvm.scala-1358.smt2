; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37642 () Bool)

(assert start!37642)

(declare-fun res!141720 () Bool)

(declare-fun e!119177 () Bool)

(assert (=> start!37642 (=> (not res!141720) (not e!119177))))

(declare-fun nBits!283 () (_ BitVec 64))

(declare-fun from!235 () (_ BitVec 64))

(assert (=> start!37642 (= res!141720 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!235) (bvslt from!235 nBits!283)))))

(assert (=> start!37642 e!119177))

(assert (=> start!37642 true))

(declare-datatypes ((array!9053 0))(
  ( (array!9054 (arr!4938 (Array (_ BitVec 32) (_ BitVec 8))) (size!4008 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7154 0))(
  ( (BitStream!7155 (buf!4451 array!9053) (currentByte!8438 (_ BitVec 32)) (currentBit!8433 (_ BitVec 32))) )
))
(declare-fun bs!64 () BitStream!7154)

(declare-fun e!119178 () Bool)

(declare-fun inv!12 (BitStream!7154) Bool)

(assert (=> start!37642 (and (inv!12 bs!64) e!119178)))

(declare-fun b!170788 () Bool)

(declare-fun res!141719 () Bool)

(assert (=> b!170788 (=> (not res!141719) (not e!119177))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!170788 (= res!141719 (validate_offset_bits!1 ((_ sign_extend 32) (size!4008 (buf!4451 bs!64))) ((_ sign_extend 32) (currentByte!8438 bs!64)) ((_ sign_extend 32) (currentBit!8433 bs!64)) (bvsub nBits!283 from!235)))))

(declare-fun b!170789 () Bool)

(assert (=> b!170789 (= e!119177 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283))))

(declare-fun b!170790 () Bool)

(declare-fun array_inv!3749 (array!9053) Bool)

(assert (=> b!170790 (= e!119178 (array_inv!3749 (buf!4451 bs!64)))))

(assert (= (and start!37642 res!141720) b!170788))

(assert (= (and b!170788 res!141719) b!170789))

(assert (= start!37642 b!170790))

(declare-fun m!269935 () Bool)

(assert (=> start!37642 m!269935))

(declare-fun m!269937 () Bool)

(assert (=> b!170788 m!269937))

(declare-fun m!269939 () Bool)

(assert (=> b!170790 m!269939))

(push 1)

(assert (not start!37642))

(assert (not b!170788))

(assert (not b!170790))

(check-sat)

(pop 1)

(push 1)

(check-sat)

