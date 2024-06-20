; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45652 () Bool)

(assert start!45652)

(declare-fun res!185891 () Bool)

(declare-fun e!149854 () Bool)

(assert (=> start!45652 (=> (not res!185891) (not e!149854))))

(declare-fun i!541 () (_ BitVec 32))

(declare-fun nBits!265 () (_ BitVec 32))

(assert (=> start!45652 (= res!185891 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45652 e!149854))

(assert (=> start!45652 true))

(declare-datatypes ((array!10765 0))(
  ( (array!10766 (arr!5656 (Array (_ BitVec 32) (_ BitVec 8))) (size!4726 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8560 0))(
  ( (BitStream!8561 (buf!5273 array!10765) (currentByte!9909 (_ BitVec 32)) (currentBit!9904 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8560)

(declare-fun e!149856 () Bool)

(declare-fun inv!12 (BitStream!8560) Bool)

(assert (=> start!45652 (and (inv!12 bs!62) e!149856)))

(declare-fun b!220669 () Bool)

(declare-fun res!185890 () Bool)

(assert (=> b!220669 (=> (not res!185890) (not e!149854))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220669 (= res!185890 (validate_offset_bits!1 ((_ sign_extend 32) (size!4726 (buf!5273 bs!62))) ((_ sign_extend 32) (currentByte!9909 bs!62)) ((_ sign_extend 32) (currentBit!9904 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun b!220670 () Bool)

(assert (=> b!220670 (= e!149854 (and (not (= #b00000000000000000000000000000000 (bvand i!541 #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000001000000 i!541) #b10000000000000000000000000000000)))))))

(declare-fun b!220671 () Bool)

(declare-fun array_inv!4467 (array!10765) Bool)

(assert (=> b!220671 (= e!149856 (array_inv!4467 (buf!5273 bs!62)))))

(assert (= (and start!45652 res!185891) b!220669))

(assert (= (and b!220669 res!185890) b!220670))

(assert (= start!45652 b!220671))

(declare-fun m!339373 () Bool)

(assert (=> start!45652 m!339373))

(declare-fun m!339375 () Bool)

(assert (=> b!220669 m!339375))

(declare-fun m!339377 () Bool)

(assert (=> b!220671 m!339377))

(push 1)

(assert (not start!45652))

(assert (not b!220669))

(assert (not b!220671))

(check-sat)

(pop 1)

(push 1)

(check-sat)

