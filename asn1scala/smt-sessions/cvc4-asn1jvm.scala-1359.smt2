; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37648 () Bool)

(assert start!37648)

(declare-fun res!141737 () Bool)

(declare-fun e!119206 () Bool)

(assert (=> start!37648 (=> (not res!141737) (not e!119206))))

(declare-fun nBits!283 () (_ BitVec 64))

(declare-fun from!235 () (_ BitVec 64))

(assert (=> start!37648 (= res!141737 (and (bvslt #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsle nBits!283 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!235) (bvslt from!235 nBits!283)))))

(assert (=> start!37648 e!119206))

(assert (=> start!37648 true))

(declare-datatypes ((array!9059 0))(
  ( (array!9060 (arr!4941 (Array (_ BitVec 32) (_ BitVec 8))) (size!4011 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7160 0))(
  ( (BitStream!7161 (buf!4454 array!9059) (currentByte!8441 (_ BitVec 32)) (currentBit!8436 (_ BitVec 32))) )
))
(declare-fun bs!64 () BitStream!7160)

(declare-fun e!119204 () Bool)

(declare-fun inv!12 (BitStream!7160) Bool)

(assert (=> start!37648 (and (inv!12 bs!64) e!119204)))

(declare-fun b!170815 () Bool)

(declare-fun res!141738 () Bool)

(assert (=> b!170815 (=> (not res!141738) (not e!119206))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!170815 (= res!141738 (validate_offset_bits!1 ((_ sign_extend 32) (size!4011 (buf!4454 bs!64))) ((_ sign_extend 32) (currentByte!8441 bs!64)) ((_ sign_extend 32) (currentBit!8436 bs!64)) (bvsub nBits!283 from!235)))))

(declare-fun b!170816 () Bool)

(assert (=> b!170816 (= e!119206 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!283) (bvsgt from!235 nBits!283)))))

(declare-fun b!170817 () Bool)

(declare-fun array_inv!3752 (array!9059) Bool)

(assert (=> b!170817 (= e!119204 (array_inv!3752 (buf!4454 bs!64)))))

(assert (= (and start!37648 res!141737) b!170815))

(assert (= (and b!170815 res!141738) b!170816))

(assert (= start!37648 b!170817))

(declare-fun m!269953 () Bool)

(assert (=> start!37648 m!269953))

(declare-fun m!269955 () Bool)

(assert (=> b!170815 m!269955))

(declare-fun m!269957 () Bool)

(assert (=> b!170817 m!269957))

(push 1)

(assert (not b!170817))

(assert (not start!37648))

(assert (not b!170815))

(check-sat)

(pop 1)

(push 1)

(check-sat)

