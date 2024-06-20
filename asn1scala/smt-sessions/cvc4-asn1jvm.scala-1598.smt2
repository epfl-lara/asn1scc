; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45374 () Bool)

(assert start!45374)

(declare-fun nBits!265 () (_ BitVec 32))

(declare-fun b!220091 () Bool)

(declare-fun e!149477 () Bool)

(declare-fun acc!113 () (_ BitVec 64))

(declare-fun i!541 () (_ BitVec 32))

(assert (=> b!220091 (= e!149477 (and (= (bvand acc!113 #b1111111111111111111111111111111111111111111111111111111111111111) acc!113) (bvsgt i!541 nBits!265)))))

(declare-fun b!220092 () Bool)

(declare-fun e!149478 () Bool)

(declare-datatypes ((array!10715 0))(
  ( (array!10716 (arr!5637 (Array (_ BitVec 32) (_ BitVec 8))) (size!4707 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8522 0))(
  ( (BitStream!8523 (buf!5254 array!10715) (currentByte!9857 (_ BitVec 32)) (currentBit!9852 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8522)

(declare-fun array_inv!4448 (array!10715) Bool)

(assert (=> b!220092 (= e!149478 (array_inv!4448 (buf!5254 bs!62)))))

(declare-fun b!220089 () Bool)

(declare-fun res!185411 () Bool)

(assert (=> b!220089 (=> (not res!185411) (not e!149477))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220089 (= res!185411 (validate_offset_bits!1 ((_ sign_extend 32) (size!4707 (buf!5254 bs!62))) ((_ sign_extend 32) (currentByte!9857 bs!62)) ((_ sign_extend 32) (currentBit!9852 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun res!185410 () Bool)

(assert (=> start!45374 (=> (not res!185410) (not e!149477))))

(assert (=> start!45374 (= res!185410 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45374 e!149477))

(assert (=> start!45374 true))

(declare-fun inv!12 (BitStream!8522) Bool)

(assert (=> start!45374 (and (inv!12 bs!62) e!149478)))

(declare-fun b!220090 () Bool)

(declare-fun res!185409 () Bool)

(assert (=> b!220090 (=> (not res!185409) (not e!149477))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220090 (= res!185409 (= (bvand acc!113 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!45374 res!185410) b!220089))

(assert (= (and b!220089 res!185411) b!220090))

(assert (= (and b!220090 res!185409) b!220091))

(assert (= start!45374 b!220092))

(declare-fun m!338807 () Bool)

(assert (=> b!220092 m!338807))

(declare-fun m!338809 () Bool)

(assert (=> b!220089 m!338809))

(declare-fun m!338811 () Bool)

(assert (=> start!45374 m!338811))

(declare-fun m!338813 () Bool)

(assert (=> b!220090 m!338813))

(push 1)

(assert (not b!220089))

(assert (not b!220090))

(assert (not b!220092))

(assert (not start!45374))

(check-sat)

(pop 1)

(push 1)

(check-sat)

