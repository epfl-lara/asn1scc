; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72128 () Bool)

(assert start!72128)

(declare-fun b!323361 () Bool)

(declare-fun e!232965 () Bool)

(declare-datatypes ((array!20659 0))(
  ( (array!20660 (arr!10084 (Array (_ BitVec 32) (_ BitVec 8))) (size!8992 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14146 0))(
  ( (BitStream!14147 (buf!8134 array!20659) (currentByte!15005 (_ BitVec 32)) (currentBit!15000 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14146)

(declare-fun array_inv!8544 (array!20659) Bool)

(assert (=> b!323361 (= e!232965 (array_inv!8544 (buf!8134 thiss!1793)))))

(declare-fun b!323363 () Bool)

(declare-fun res!265448 () Bool)

(declare-fun e!232964 () Bool)

(assert (=> b!323363 (=> (not res!265448) (not e!232964))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323363 (= res!265448 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!323364 () Bool)

(assert (=> b!323364 (= e!232964 (and (= (bvand i!743 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand i!743 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!743) #b10000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!23660 0))(
  ( (tuple2!23661 (_1!13459 Bool) (_2!13459 BitStream!14146)) )
))
(declare-fun lt!445901 () tuple2!23660)

(declare-fun readBit!0 (BitStream!14146) tuple2!23660)

(assert (=> b!323364 (= lt!445901 (readBit!0 thiss!1793))))

(declare-fun b!323365 () Bool)

(declare-fun res!265447 () Bool)

(assert (=> b!323365 (=> (not res!265447) (not e!232964))))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!323365 (= res!265447 (validate_offset_bits!1 ((_ sign_extend 32) (size!8992 (buf!8134 thiss!1793))) ((_ sign_extend 32) (currentByte!15005 thiss!1793)) ((_ sign_extend 32) (currentBit!15000 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun res!265450 () Bool)

(assert (=> start!72128 (=> (not res!265450) (not e!232964))))

(assert (=> start!72128 (= res!265450 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!72128 e!232964))

(assert (=> start!72128 true))

(declare-fun inv!12 (BitStream!14146) Bool)

(assert (=> start!72128 (and (inv!12 thiss!1793) e!232965)))

(declare-fun b!323362 () Bool)

(declare-fun res!265449 () Bool)

(assert (=> b!323362 (=> (not res!265449) (not e!232964))))

(assert (=> b!323362 (= res!265449 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(assert (= (and start!72128 res!265450) b!323365))

(assert (= (and b!323365 res!265447) b!323363))

(assert (= (and b!323363 res!265448) b!323362))

(assert (= (and b!323362 res!265449) b!323364))

(assert (= start!72128 b!323361))

(declare-fun m!461457 () Bool)

(assert (=> b!323363 m!461457))

(declare-fun m!461459 () Bool)

(assert (=> start!72128 m!461459))

(declare-fun m!461461 () Bool)

(assert (=> b!323365 m!461461))

(declare-fun m!461463 () Bool)

(assert (=> b!323364 m!461463))

(declare-fun m!461465 () Bool)

(assert (=> b!323361 m!461465))

(push 1)

(assert (not b!323365))

(assert (not b!323363))

(assert (not b!323361))

(assert (not start!72128))

(assert (not b!323364))

(check-sat)

(pop 1)

(push 1)

(check-sat)

