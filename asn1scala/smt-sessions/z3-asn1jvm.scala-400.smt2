; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10388 () Bool)

(assert start!10388)

(declare-fun res!43617 () Bool)

(declare-fun e!34527 () Bool)

(assert (=> start!10388 (=> (not res!43617) (not e!34527))))

(declare-datatypes ((array!2409 0))(
  ( (array!2410 (arr!1635 (Array (_ BitVec 32) (_ BitVec 8))) (size!1099 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2409)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!10388 (= res!43617 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1099 srcBuffer!2))))))))

(assert (=> start!10388 e!34527))

(assert (=> start!10388 true))

(declare-fun array_inv!1004 (array!2409) Bool)

(assert (=> start!10388 (array_inv!1004 srcBuffer!2)))

(declare-datatypes ((BitStream!1890 0))(
  ( (BitStream!1891 (buf!1449 array!2409) (currentByte!2992 (_ BitVec 32)) (currentBit!2987 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1890)

(declare-fun e!34528 () Bool)

(declare-fun inv!12 (BitStream!1890) Bool)

(assert (=> start!10388 (and (inv!12 thiss!1379) e!34528)))

(declare-fun b!52199 () Bool)

(declare-fun res!43616 () Bool)

(assert (=> b!52199 (=> (not res!43616) (not e!34527))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52199 (= res!43616 (validate_offset_bits!1 ((_ sign_extend 32) (size!1099 (buf!1449 thiss!1379))) ((_ sign_extend 32) (currentByte!2992 thiss!1379)) ((_ sign_extend 32) (currentBit!2987 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52200 () Bool)

(assert (=> b!52200 (= e!34527 (and (not (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!52201 () Bool)

(assert (=> b!52201 (= e!34528 (array_inv!1004 (buf!1449 thiss!1379)))))

(assert (= (and start!10388 res!43617) b!52199))

(assert (= (and b!52199 res!43616) b!52200))

(assert (= start!10388 b!52201))

(declare-fun m!82425 () Bool)

(assert (=> start!10388 m!82425))

(declare-fun m!82427 () Bool)

(assert (=> start!10388 m!82427))

(declare-fun m!82429 () Bool)

(assert (=> b!52199 m!82429))

(declare-fun m!82431 () Bool)

(assert (=> b!52201 m!82431))

(check-sat (not b!52199) (not b!52201) (not start!10388))
(check-sat)
