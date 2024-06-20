; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10386 () Bool)

(assert start!10386)

(declare-fun res!43610 () Bool)

(declare-fun e!34516 () Bool)

(assert (=> start!10386 (=> (not res!43610) (not e!34516))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((array!2407 0))(
  ( (array!2408 (arr!1634 (Array (_ BitVec 32) (_ BitVec 8))) (size!1098 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2407)

(assert (=> start!10386 (= res!43610 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1098 srcBuffer!2))))))))

(assert (=> start!10386 e!34516))

(assert (=> start!10386 true))

(declare-fun array_inv!1003 (array!2407) Bool)

(assert (=> start!10386 (array_inv!1003 srcBuffer!2)))

(declare-datatypes ((BitStream!1888 0))(
  ( (BitStream!1889 (buf!1448 array!2407) (currentByte!2991 (_ BitVec 32)) (currentBit!2986 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1888)

(declare-fun e!34517 () Bool)

(declare-fun inv!12 (BitStream!1888) Bool)

(assert (=> start!10386 (and (inv!12 thiss!1379) e!34517)))

(declare-fun b!52190 () Bool)

(declare-fun res!43611 () Bool)

(assert (=> b!52190 (=> (not res!43611) (not e!34516))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52190 (= res!43611 (validate_offset_bits!1 ((_ sign_extend 32) (size!1098 (buf!1448 thiss!1379))) ((_ sign_extend 32) (currentByte!2991 thiss!1379)) ((_ sign_extend 32) (currentBit!2986 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52191 () Bool)

(assert (=> b!52191 (= e!34516 (and (not (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!52192 () Bool)

(assert (=> b!52192 (= e!34517 (array_inv!1003 (buf!1448 thiss!1379)))))

(assert (= (and start!10386 res!43610) b!52190))

(assert (= (and b!52190 res!43611) b!52191))

(assert (= start!10386 b!52192))

(declare-fun m!82417 () Bool)

(assert (=> start!10386 m!82417))

(declare-fun m!82419 () Bool)

(assert (=> start!10386 m!82419))

(declare-fun m!82421 () Bool)

(assert (=> b!52190 m!82421))

(declare-fun m!82423 () Bool)

(assert (=> b!52192 m!82423))

(push 1)

(assert (not b!52192))

(assert (not start!10386))

(assert (not b!52190))

(check-sat)

(pop 1)

(push 1)

(check-sat)

