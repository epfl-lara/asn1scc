; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45368 () Bool)

(assert start!45368)

(declare-fun res!185383 () Bool)

(declare-fun e!149451 () Bool)

(assert (=> start!45368 (=> (not res!185383) (not e!149451))))

(declare-fun i!541 () (_ BitVec 32))

(declare-fun nBits!265 () (_ BitVec 32))

(assert (=> start!45368 (= res!185383 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45368 e!149451))

(assert (=> start!45368 true))

(declare-datatypes ((array!10709 0))(
  ( (array!10710 (arr!5634 (Array (_ BitVec 32) (_ BitVec 8))) (size!4704 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8516 0))(
  ( (BitStream!8517 (buf!5251 array!10709) (currentByte!9854 (_ BitVec 32)) (currentBit!9849 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8516)

(declare-fun e!149450 () Bool)

(declare-fun inv!12 (BitStream!8516) Bool)

(assert (=> start!45368 (and (inv!12 bs!62) e!149450)))

(declare-fun b!220054 () Bool)

(declare-fun res!185384 () Bool)

(assert (=> b!220054 (=> (not res!185384) (not e!149451))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220054 (= res!185384 (validate_offset_bits!1 ((_ sign_extend 32) (size!4704 (buf!5251 bs!62))) ((_ sign_extend 32) (currentByte!9854 bs!62)) ((_ sign_extend 32) (currentBit!9849 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun b!220055 () Bool)

(assert (=> b!220055 (= e!149451 (bvsgt #b00000000000000000000000000000000 (bvsub #b00000000000000000000000001000000 i!541)))))

(declare-fun b!220056 () Bool)

(declare-fun array_inv!4445 (array!10709) Bool)

(assert (=> b!220056 (= e!149450 (array_inv!4445 (buf!5251 bs!62)))))

(assert (= (and start!45368 res!185383) b!220054))

(assert (= (and b!220054 res!185384) b!220055))

(assert (= start!45368 b!220056))

(declare-fun m!338785 () Bool)

(assert (=> start!45368 m!338785))

(declare-fun m!338787 () Bool)

(assert (=> b!220054 m!338787))

(declare-fun m!338789 () Bool)

(assert (=> b!220056 m!338789))

(push 1)

(assert (not start!45368))

(assert (not b!220054))

(assert (not b!220056))

(check-sat)

(pop 1)

(push 1)

(check-sat)

