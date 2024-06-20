; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10390 () Bool)

(assert start!10390)

(declare-fun res!43623 () Bool)

(declare-fun e!34541 () Bool)

(assert (=> start!10390 (=> (not res!43623) (not e!34541))))

(declare-datatypes ((array!2411 0))(
  ( (array!2412 (arr!1636 (Array (_ BitVec 32) (_ BitVec 8))) (size!1100 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2411)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!10390 (= res!43623 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1100 srcBuffer!2))))))))

(assert (=> start!10390 e!34541))

(assert (=> start!10390 true))

(declare-fun array_inv!1005 (array!2411) Bool)

(assert (=> start!10390 (array_inv!1005 srcBuffer!2)))

(declare-datatypes ((BitStream!1892 0))(
  ( (BitStream!1893 (buf!1450 array!2411) (currentByte!2993 (_ BitVec 32)) (currentBit!2988 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1892)

(declare-fun e!34540 () Bool)

(declare-fun inv!12 (BitStream!1892) Bool)

(assert (=> start!10390 (and (inv!12 thiss!1379) e!34540)))

(declare-fun b!52208 () Bool)

(declare-fun res!43622 () Bool)

(assert (=> b!52208 (=> (not res!43622) (not e!34541))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52208 (= res!43622 (validate_offset_bits!1 ((_ sign_extend 32) (size!1100 (buf!1450 thiss!1379))) ((_ sign_extend 32) (currentByte!2993 thiss!1379)) ((_ sign_extend 32) (currentBit!2988 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52209 () Bool)

(assert (=> b!52209 (= e!34541 (and (not (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!52210 () Bool)

(assert (=> b!52210 (= e!34540 (array_inv!1005 (buf!1450 thiss!1379)))))

(assert (= (and start!10390 res!43623) b!52208))

(assert (= (and b!52208 res!43622) b!52209))

(assert (= start!10390 b!52210))

(declare-fun m!82433 () Bool)

(assert (=> start!10390 m!82433))

(declare-fun m!82435 () Bool)

(assert (=> start!10390 m!82435))

(declare-fun m!82437 () Bool)

(assert (=> b!52208 m!82437))

(declare-fun m!82439 () Bool)

(assert (=> b!52210 m!82439))

(push 1)

(assert (not b!52208))

(assert (not start!10390))

(assert (not b!52210))

(check-sat)

(pop 1)

(push 1)

(check-sat)

