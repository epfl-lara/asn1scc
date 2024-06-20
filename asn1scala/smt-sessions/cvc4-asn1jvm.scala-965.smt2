; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27298 () Bool)

(assert start!27298)

(declare-fun b!140170 () Bool)

(declare-fun res!116864 () Bool)

(declare-fun e!93414 () Bool)

(assert (=> b!140170 (=> (not res!116864) (not e!93414))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6391 0))(
  ( (array!6392 (arr!3599 (Array (_ BitVec 32) (_ BitVec 8))) (size!2892 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5042 0))(
  ( (BitStream!5043 (buf!3313 array!6391) (currentByte!6155 (_ BitVec 32)) (currentBit!6150 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5042)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!140170 (= res!116864 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2892 (buf!3313 thiss!1634))) ((_ sign_extend 32) (currentByte!6155 thiss!1634)) ((_ sign_extend 32) (currentBit!6150 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!140171 () Bool)

(assert (=> b!140171 (= e!93414 (and (not (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000))) (not (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000)))))))

(declare-fun res!116863 () Bool)

(assert (=> start!27298 (=> (not res!116863) (not e!93414))))

(declare-fun arr!237 () array!6391)

(assert (=> start!27298 (= res!116863 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2892 arr!237))))))

(assert (=> start!27298 e!93414))

(assert (=> start!27298 true))

(declare-fun array_inv!2681 (array!6391) Bool)

(assert (=> start!27298 (array_inv!2681 arr!237)))

(declare-fun e!93417 () Bool)

(declare-fun inv!12 (BitStream!5042) Bool)

(assert (=> start!27298 (and (inv!12 thiss!1634) e!93417)))

(declare-fun b!140172 () Bool)

(declare-fun res!116865 () Bool)

(assert (=> b!140172 (=> (not res!116865) (not e!93414))))

(assert (=> b!140172 (= res!116865 (bvslt from!447 to!404))))

(declare-fun b!140173 () Bool)

(declare-fun res!116866 () Bool)

(assert (=> b!140173 (=> (not res!116866) (not e!93414))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!140173 (= res!116866 (invariant!0 (currentBit!6150 thiss!1634) (currentByte!6155 thiss!1634) (size!2892 (buf!3313 thiss!1634))))))

(declare-fun b!140174 () Bool)

(assert (=> b!140174 (= e!93417 (array_inv!2681 (buf!3313 thiss!1634)))))

(assert (= (and start!27298 res!116863) b!140170))

(assert (= (and b!140170 res!116864) b!140172))

(assert (= (and b!140172 res!116865) b!140173))

(assert (= (and b!140173 res!116866) b!140171))

(assert (= start!27298 b!140174))

(declare-fun m!215983 () Bool)

(assert (=> b!140170 m!215983))

(declare-fun m!215985 () Bool)

(assert (=> start!27298 m!215985))

(declare-fun m!215987 () Bool)

(assert (=> start!27298 m!215987))

(declare-fun m!215989 () Bool)

(assert (=> b!140173 m!215989))

(declare-fun m!215991 () Bool)

(assert (=> b!140174 m!215991))

(push 1)

(assert (not start!27298))

(assert (not b!140173))

(assert (not b!140174))

(assert (not b!140170))

(check-sat)

(pop 1)

(push 1)

(check-sat)

