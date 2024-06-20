; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22312 () Bool)

(assert start!22312)

(declare-fun res!93139 () Bool)

(declare-fun e!74004 () Bool)

(assert (=> start!22312 (=> (not res!93139) (not e!74004))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!22312 (= res!93139 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22312 e!74004))

(assert (=> start!22312 true))

(declare-datatypes ((array!5103 0))(
  ( (array!5104 (arr!2912 (Array (_ BitVec 32) (_ BitVec 8))) (size!2319 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4112 0))(
  ( (BitStream!4113 (buf!2727 array!5103) (currentByte!5301 (_ BitVec 32)) (currentBit!5296 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4112)

(declare-fun e!74002 () Bool)

(declare-fun inv!12 (BitStream!4112) Bool)

(assert (=> start!22312 (and (inv!12 thiss!1305) e!74002)))

(declare-fun b!112798 () Bool)

(declare-fun array_inv!2121 (array!5103) Bool)

(assert (=> b!112798 (= e!74002 (array_inv!2121 (buf!2727 thiss!1305)))))

(declare-fun b!112796 () Bool)

(declare-fun res!93140 () Bool)

(assert (=> b!112796 (=> (not res!93140) (not e!74004))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!112796 (= res!93140 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!112795 () Bool)

(declare-fun res!93138 () Bool)

(assert (=> b!112795 (=> (not res!93138) (not e!74004))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!112795 (= res!93138 (validate_offset_bits!1 ((_ sign_extend 32) (size!2319 (buf!2727 thiss!1305))) ((_ sign_extend 32) (currentByte!5301 thiss!1305)) ((_ sign_extend 32) (currentBit!5296 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!112797 () Bool)

(assert (=> b!112797 (= e!74004 (and (not (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000))) (not (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))))

(assert (= (and start!22312 res!93139) b!112795))

(assert (= (and b!112795 res!93138) b!112796))

(assert (= (and b!112796 res!93140) b!112797))

(assert (= start!22312 b!112798))

(declare-fun m!168905 () Bool)

(assert (=> start!22312 m!168905))

(declare-fun m!168907 () Bool)

(assert (=> b!112798 m!168907))

(declare-fun m!168909 () Bool)

(assert (=> b!112796 m!168909))

(declare-fun m!168911 () Bool)

(assert (=> b!112795 m!168911))

(push 1)

(assert (not start!22312))

(assert (not b!112795))

(assert (not b!112796))

(assert (not b!112798))

(check-sat)

(pop 1)

(push 1)

(check-sat)

