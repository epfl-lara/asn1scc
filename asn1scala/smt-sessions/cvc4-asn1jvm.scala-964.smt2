; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27292 () Bool)

(assert start!27292)

(declare-fun res!116830 () Bool)

(declare-fun e!93380 () Bool)

(assert (=> start!27292 (=> (not res!116830) (not e!93380))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6385 0))(
  ( (array!6386 (arr!3596 (Array (_ BitVec 32) (_ BitVec 8))) (size!2889 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6385)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!27292 (= res!116830 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2889 arr!237))))))

(assert (=> start!27292 e!93380))

(assert (=> start!27292 true))

(declare-fun array_inv!2678 (array!6385) Bool)

(assert (=> start!27292 (array_inv!2678 arr!237)))

(declare-datatypes ((BitStream!5036 0))(
  ( (BitStream!5037 (buf!3310 array!6385) (currentByte!6152 (_ BitVec 32)) (currentBit!6147 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5036)

(declare-fun e!93378 () Bool)

(declare-fun inv!12 (BitStream!5036) Bool)

(assert (=> start!27292 (and (inv!12 thiss!1634) e!93378)))

(declare-fun b!140127 () Bool)

(declare-fun res!116829 () Bool)

(assert (=> b!140127 (=> (not res!116829) (not e!93380))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!140127 (= res!116829 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2889 (buf!3310 thiss!1634))) ((_ sign_extend 32) (currentByte!6152 thiss!1634)) ((_ sign_extend 32) (currentBit!6147 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!140128 () Bool)

(assert (=> b!140128 (= e!93380 (and (not (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000))) (not (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000)))))))

(declare-fun b!140129 () Bool)

(assert (=> b!140129 (= e!93378 (array_inv!2678 (buf!3310 thiss!1634)))))

(assert (= (and start!27292 res!116830) b!140127))

(assert (= (and b!140127 res!116829) b!140128))

(assert (= start!27292 b!140129))

(declare-fun m!215955 () Bool)

(assert (=> start!27292 m!215955))

(declare-fun m!215957 () Bool)

(assert (=> start!27292 m!215957))

(declare-fun m!215959 () Bool)

(assert (=> b!140127 m!215959))

(declare-fun m!215961 () Bool)

(assert (=> b!140129 m!215961))

(push 1)

(assert (not b!140127))

(assert (not b!140129))

(assert (not start!27292))

(check-sat)

(pop 1)

(push 1)

(check-sat)

