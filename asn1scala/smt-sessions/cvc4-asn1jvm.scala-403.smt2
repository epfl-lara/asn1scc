; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10408 () Bool)

(assert start!10408)

(declare-fun res!43676 () Bool)

(declare-fun e!34647 () Bool)

(assert (=> start!10408 (=> (not res!43676) (not e!34647))))

(declare-datatypes ((array!2429 0))(
  ( (array!2430 (arr!1645 (Array (_ BitVec 32) (_ BitVec 8))) (size!1109 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2429)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!10408 (= res!43676 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1109 srcBuffer!2))))))))

(assert (=> start!10408 e!34647))

(assert (=> start!10408 true))

(declare-fun array_inv!1014 (array!2429) Bool)

(assert (=> start!10408 (array_inv!1014 srcBuffer!2)))

(declare-datatypes ((BitStream!1910 0))(
  ( (BitStream!1911 (buf!1459 array!2429) (currentByte!3002 (_ BitVec 32)) (currentBit!2997 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1910)

(declare-fun e!34646 () Bool)

(declare-fun inv!12 (BitStream!1910) Bool)

(assert (=> start!10408 (and (inv!12 thiss!1379) e!34646)))

(declare-fun b!52289 () Bool)

(declare-fun res!43677 () Bool)

(assert (=> b!52289 (=> (not res!43677) (not e!34647))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52289 (= res!43677 (validate_offset_bits!1 ((_ sign_extend 32) (size!1109 (buf!1459 thiss!1379))) ((_ sign_extend 32) (currentByte!3002 thiss!1379)) ((_ sign_extend 32) (currentBit!2997 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52290 () Bool)

(assert (=> b!52290 (= e!34647 (not (or (bvsge i!635 to!314) (bvslt (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))))

(declare-fun isPrefixOf!0 (BitStream!1910 BitStream!1910) Bool)

(assert (=> b!52290 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3622 0))(
  ( (Unit!3623) )
))
(declare-fun lt!81328 () Unit!3622)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1910) Unit!3622)

(assert (=> b!52290 (= lt!81328 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81327 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52290 (= lt!81327 (bitIndex!0 (size!1109 (buf!1459 thiss!1379)) (currentByte!3002 thiss!1379) (currentBit!2997 thiss!1379)))))

(declare-fun b!52291 () Bool)

(assert (=> b!52291 (= e!34646 (array_inv!1014 (buf!1459 thiss!1379)))))

(assert (= (and start!10408 res!43676) b!52289))

(assert (= (and b!52289 res!43677) b!52290))

(assert (= start!10408 b!52291))

(declare-fun m!82553 () Bool)

(assert (=> start!10408 m!82553))

(declare-fun m!82555 () Bool)

(assert (=> start!10408 m!82555))

(declare-fun m!82557 () Bool)

(assert (=> b!52289 m!82557))

(declare-fun m!82559 () Bool)

(assert (=> b!52290 m!82559))

(declare-fun m!82561 () Bool)

(assert (=> b!52290 m!82561))

(declare-fun m!82563 () Bool)

(assert (=> b!52290 m!82563))

(declare-fun m!82565 () Bool)

(assert (=> b!52291 m!82565))

(push 1)

(assert (not b!52289))

(assert (not b!52291))

(assert (not b!52290))

(assert (not start!10408))

(check-sat)

(pop 1)

(push 1)

(check-sat)

