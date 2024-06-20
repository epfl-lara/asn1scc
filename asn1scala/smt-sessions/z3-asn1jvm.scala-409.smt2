; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10442 () Bool)

(assert start!10442)

(declare-fun res!43785 () Bool)

(declare-fun e!34858 () Bool)

(assert (=> start!10442 (=> (not res!43785) (not e!34858))))

(declare-datatypes ((array!2463 0))(
  ( (array!2464 (arr!1662 (Array (_ BitVec 32) (_ BitVec 8))) (size!1126 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2463)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!10442 (= res!43785 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1126 srcBuffer!2))))))))

(assert (=> start!10442 e!34858))

(assert (=> start!10442 true))

(declare-fun array_inv!1031 (array!2463) Bool)

(assert (=> start!10442 (array_inv!1031 srcBuffer!2)))

(declare-datatypes ((BitStream!1944 0))(
  ( (BitStream!1945 (buf!1476 array!2463) (currentByte!3019 (_ BitVec 32)) (currentBit!3014 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1944)

(declare-fun e!34857 () Bool)

(declare-fun inv!12 (BitStream!1944) Bool)

(assert (=> start!10442 (and (inv!12 thiss!1379) e!34857)))

(declare-fun b!52447 () Bool)

(declare-fun res!43783 () Bool)

(assert (=> b!52447 (=> (not res!43783) (not e!34858))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52447 (= res!43783 (validate_offset_bits!1 ((_ sign_extend 32) (size!1126 (buf!1476 thiss!1379))) ((_ sign_extend 32) (currentByte!3019 thiss!1379)) ((_ sign_extend 32) (currentBit!3014 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52449 () Bool)

(declare-fun e!34859 () Bool)

(assert (=> b!52449 (= e!34859 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!3656 0))(
  ( (Unit!3657) )
))
(declare-datatypes ((tuple2!4762 0))(
  ( (tuple2!4763 (_1!2486 Unit!3656) (_2!2486 BitStream!1944)) )
))
(declare-fun lt!81435 () tuple2!4762)

(declare-fun appendBitFromByte!0 (BitStream!1944 (_ BitVec 8) (_ BitVec 32)) tuple2!4762)

(assert (=> b!52449 (= lt!81435 (appendBitFromByte!0 thiss!1379 (select (arr!1662 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!52450 () Bool)

(assert (=> b!52450 (= e!34857 (array_inv!1031 (buf!1476 thiss!1379)))))

(declare-fun b!52448 () Bool)

(assert (=> b!52448 (= e!34858 (not e!34859))))

(declare-fun res!43784 () Bool)

(assert (=> b!52448 (=> res!43784 e!34859)))

(assert (=> b!52448 (= res!43784 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1944 BitStream!1944) Bool)

(assert (=> b!52448 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!81434 () Unit!3656)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1944) Unit!3656)

(assert (=> b!52448 (= lt!81434 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81436 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52448 (= lt!81436 (bitIndex!0 (size!1126 (buf!1476 thiss!1379)) (currentByte!3019 thiss!1379) (currentBit!3014 thiss!1379)))))

(assert (= (and start!10442 res!43785) b!52447))

(assert (= (and b!52447 res!43783) b!52448))

(assert (= (and b!52448 (not res!43784)) b!52449))

(assert (= start!10442 b!52450))

(declare-fun m!82795 () Bool)

(assert (=> b!52450 m!82795))

(declare-fun m!82797 () Bool)

(assert (=> b!52448 m!82797))

(declare-fun m!82799 () Bool)

(assert (=> b!52448 m!82799))

(declare-fun m!82801 () Bool)

(assert (=> b!52448 m!82801))

(declare-fun m!82803 () Bool)

(assert (=> b!52449 m!82803))

(assert (=> b!52449 m!82803))

(declare-fun m!82805 () Bool)

(assert (=> b!52449 m!82805))

(declare-fun m!82807 () Bool)

(assert (=> start!10442 m!82807))

(declare-fun m!82809 () Bool)

(assert (=> start!10442 m!82809))

(declare-fun m!82811 () Bool)

(assert (=> b!52447 m!82811))

(check-sat (not start!10442) (not b!52450) (not b!52449) (not b!52448) (not b!52447))
(check-sat)
