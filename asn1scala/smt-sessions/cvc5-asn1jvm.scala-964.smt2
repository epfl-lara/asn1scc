; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27288 () Bool)

(assert start!27288)

(declare-fun res!116818 () Bool)

(declare-fun e!93356 () Bool)

(assert (=> start!27288 (=> (not res!116818) (not e!93356))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6381 0))(
  ( (array!6382 (arr!3594 (Array (_ BitVec 32) (_ BitVec 8))) (size!2887 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6381)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!27288 (= res!116818 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2887 arr!237))))))

(assert (=> start!27288 e!93356))

(assert (=> start!27288 true))

(declare-fun array_inv!2676 (array!6381) Bool)

(assert (=> start!27288 (array_inv!2676 arr!237)))

(declare-datatypes ((BitStream!5032 0))(
  ( (BitStream!5033 (buf!3308 array!6381) (currentByte!6150 (_ BitVec 32)) (currentBit!6145 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5032)

(declare-fun e!93354 () Bool)

(declare-fun inv!12 (BitStream!5032) Bool)

(assert (=> start!27288 (and (inv!12 thiss!1634) e!93354)))

(declare-fun b!140109 () Bool)

(declare-fun res!116817 () Bool)

(assert (=> b!140109 (=> (not res!116817) (not e!93356))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!140109 (= res!116817 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2887 (buf!3308 thiss!1634))) ((_ sign_extend 32) (currentByte!6150 thiss!1634)) ((_ sign_extend 32) (currentBit!6145 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!140110 () Bool)

(assert (=> b!140110 (= e!93356 (and (not (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000))) (not (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000)))))))

(declare-fun b!140111 () Bool)

(assert (=> b!140111 (= e!93354 (array_inv!2676 (buf!3308 thiss!1634)))))

(assert (= (and start!27288 res!116818) b!140109))

(assert (= (and b!140109 res!116817) b!140110))

(assert (= start!27288 b!140111))

(declare-fun m!215939 () Bool)

(assert (=> start!27288 m!215939))

(declare-fun m!215941 () Bool)

(assert (=> start!27288 m!215941))

(declare-fun m!215943 () Bool)

(assert (=> b!140109 m!215943))

(declare-fun m!215945 () Bool)

(assert (=> b!140111 m!215945))

(push 1)

(assert (not b!140111))

(assert (not start!27288))

(assert (not b!140109))

(check-sat)

(pop 1)

(push 1)

(check-sat)

