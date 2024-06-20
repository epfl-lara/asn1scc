; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45370 () Bool)

(assert start!45370)

(declare-fun res!185393 () Bool)

(declare-fun e!149459 () Bool)

(assert (=> start!45370 (=> (not res!185393) (not e!149459))))

(declare-fun i!541 () (_ BitVec 32))

(declare-fun nBits!265 () (_ BitVec 32))

(assert (=> start!45370 (= res!185393 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45370 e!149459))

(assert (=> start!45370 true))

(declare-datatypes ((array!10711 0))(
  ( (array!10712 (arr!5635 (Array (_ BitVec 32) (_ BitVec 8))) (size!4705 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8518 0))(
  ( (BitStream!8519 (buf!5252 array!10711) (currentByte!9855 (_ BitVec 32)) (currentBit!9850 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8518)

(declare-fun e!149460 () Bool)

(declare-fun inv!12 (BitStream!8518) Bool)

(assert (=> start!45370 (and (inv!12 bs!62) e!149460)))

(declare-fun b!220067 () Bool)

(declare-fun acc!113 () (_ BitVec 64))

(assert (=> b!220067 (= e!149459 (and (= (bvand acc!113 #b1111111111111111111111111111111111111111111111111111111111111111) acc!113) (bvsgt i!541 nBits!265)))))

(declare-fun b!220065 () Bool)

(declare-fun res!185391 () Bool)

(assert (=> b!220065 (=> (not res!185391) (not e!149459))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220065 (= res!185391 (validate_offset_bits!1 ((_ sign_extend 32) (size!4705 (buf!5252 bs!62))) ((_ sign_extend 32) (currentByte!9855 bs!62)) ((_ sign_extend 32) (currentBit!9850 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun b!220066 () Bool)

(declare-fun res!185392 () Bool)

(assert (=> b!220066 (=> (not res!185392) (not e!149459))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!220066 (= res!185392 (= (bvand acc!113 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!541))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!220068 () Bool)

(declare-fun array_inv!4446 (array!10711) Bool)

(assert (=> b!220068 (= e!149460 (array_inv!4446 (buf!5252 bs!62)))))

(assert (= (and start!45370 res!185393) b!220065))

(assert (= (and b!220065 res!185391) b!220066))

(assert (= (and b!220066 res!185392) b!220067))

(assert (= start!45370 b!220068))

(declare-fun m!338791 () Bool)

(assert (=> start!45370 m!338791))

(declare-fun m!338793 () Bool)

(assert (=> b!220065 m!338793))

(declare-fun m!338795 () Bool)

(assert (=> b!220066 m!338795))

(declare-fun m!338797 () Bool)

(assert (=> b!220068 m!338797))

(push 1)

(assert (not start!45370))

(assert (not b!220065))

(assert (not b!220066))

(assert (not b!220068))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

