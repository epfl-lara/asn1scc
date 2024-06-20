; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45364 () Bool)

(assert start!45364)

(declare-fun res!185371 () Bool)

(declare-fun e!149431 () Bool)

(assert (=> start!45364 (=> (not res!185371) (not e!149431))))

(declare-fun i!541 () (_ BitVec 32))

(declare-fun nBits!265 () (_ BitVec 32))

(assert (=> start!45364 (= res!185371 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45364 e!149431))

(assert (=> start!45364 true))

(declare-datatypes ((array!10705 0))(
  ( (array!10706 (arr!5632 (Array (_ BitVec 32) (_ BitVec 8))) (size!4702 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8512 0))(
  ( (BitStream!8513 (buf!5249 array!10705) (currentByte!9852 (_ BitVec 32)) (currentBit!9847 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8512)

(declare-fun e!149433 () Bool)

(declare-fun inv!12 (BitStream!8512) Bool)

(assert (=> start!45364 (and (inv!12 bs!62) e!149433)))

(declare-fun b!220036 () Bool)

(declare-fun res!185372 () Bool)

(assert (=> b!220036 (=> (not res!185372) (not e!149431))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220036 (= res!185372 (validate_offset_bits!1 ((_ sign_extend 32) (size!4702 (buf!5249 bs!62))) ((_ sign_extend 32) (currentByte!9852 bs!62)) ((_ sign_extend 32) (currentBit!9847 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun b!220037 () Bool)

(assert (=> b!220037 (= e!149431 (bvsgt #b00000000000000000000000000000000 (bvsub #b00000000000000000000000001000000 i!541)))))

(declare-fun b!220038 () Bool)

(declare-fun array_inv!4443 (array!10705) Bool)

(assert (=> b!220038 (= e!149433 (array_inv!4443 (buf!5249 bs!62)))))

(assert (= (and start!45364 res!185371) b!220036))

(assert (= (and b!220036 res!185372) b!220037))

(assert (= start!45364 b!220038))

(declare-fun m!338773 () Bool)

(assert (=> start!45364 m!338773))

(declare-fun m!338775 () Bool)

(assert (=> b!220036 m!338775))

(declare-fun m!338777 () Bool)

(assert (=> b!220038 m!338777))

(push 1)

(assert (not b!220038))

(assert (not start!45364))

(assert (not b!220036))

(check-sat)

(pop 1)

(push 1)

(check-sat)

