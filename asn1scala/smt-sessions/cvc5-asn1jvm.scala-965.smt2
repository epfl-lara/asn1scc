; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27294 () Bool)

(assert start!27294)

(declare-fun b!140140 () Bool)

(declare-fun e!93391 () Bool)

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!140140 (= e!93391 (and (not (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000))) (not (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000)))))))

(declare-fun b!140141 () Bool)

(declare-fun res!116840 () Bool)

(assert (=> b!140141 (=> (not res!116840) (not e!93391))))

(declare-datatypes ((array!6387 0))(
  ( (array!6388 (arr!3597 (Array (_ BitVec 32) (_ BitVec 8))) (size!2890 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5038 0))(
  ( (BitStream!5039 (buf!3311 array!6387) (currentByte!6153 (_ BitVec 32)) (currentBit!6148 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5038)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!140141 (= res!116840 (invariant!0 (currentBit!6148 thiss!1634) (currentByte!6153 thiss!1634) (size!2890 (buf!3311 thiss!1634))))))

(declare-fun b!140142 () Bool)

(declare-fun e!93392 () Bool)

(declare-fun array_inv!2679 (array!6387) Bool)

(assert (=> b!140142 (= e!93392 (array_inv!2679 (buf!3311 thiss!1634)))))

(declare-fun b!140143 () Bool)

(declare-fun res!116841 () Bool)

(assert (=> b!140143 (=> (not res!116841) (not e!93391))))

(assert (=> b!140143 (= res!116841 (bvslt from!447 to!404))))

(declare-fun b!140144 () Bool)

(declare-fun res!116842 () Bool)

(assert (=> b!140144 (=> (not res!116842) (not e!93391))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!140144 (= res!116842 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2890 (buf!3311 thiss!1634))) ((_ sign_extend 32) (currentByte!6153 thiss!1634)) ((_ sign_extend 32) (currentBit!6148 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun res!116839 () Bool)

(assert (=> start!27294 (=> (not res!116839) (not e!93391))))

(declare-fun arr!237 () array!6387)

(assert (=> start!27294 (= res!116839 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2890 arr!237))))))

(assert (=> start!27294 e!93391))

(assert (=> start!27294 true))

(assert (=> start!27294 (array_inv!2679 arr!237)))

(declare-fun inv!12 (BitStream!5038) Bool)

(assert (=> start!27294 (and (inv!12 thiss!1634) e!93392)))

(assert (= (and start!27294 res!116839) b!140144))

(assert (= (and b!140144 res!116842) b!140143))

(assert (= (and b!140143 res!116841) b!140141))

(assert (= (and b!140141 res!116840) b!140140))

(assert (= start!27294 b!140142))

(declare-fun m!215963 () Bool)

(assert (=> b!140141 m!215963))

(declare-fun m!215965 () Bool)

(assert (=> b!140142 m!215965))

(declare-fun m!215967 () Bool)

(assert (=> b!140144 m!215967))

(declare-fun m!215969 () Bool)

(assert (=> start!27294 m!215969))

(declare-fun m!215971 () Bool)

(assert (=> start!27294 m!215971))

(push 1)

(assert (not b!140141))

(assert (not start!27294))

(assert (not b!140142))

(assert (not b!140144))

(check-sat)

(pop 1)

(push 1)

(check-sat)

