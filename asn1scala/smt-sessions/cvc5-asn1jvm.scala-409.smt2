; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10440 () Bool)

(assert start!10440)

(declare-fun b!52437 () Bool)

(declare-fun e!34844 () Bool)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!52437 (= e!34844 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((array!2461 0))(
  ( (array!2462 (arr!1661 (Array (_ BitVec 32) (_ BitVec 8))) (size!1125 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2461)

(declare-datatypes ((BitStream!1942 0))(
  ( (BitStream!1943 (buf!1475 array!2461) (currentByte!3018 (_ BitVec 32)) (currentBit!3013 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1942)

(declare-datatypes ((Unit!3654 0))(
  ( (Unit!3655) )
))
(declare-datatypes ((tuple2!4760 0))(
  ( (tuple2!4761 (_1!2485 Unit!3654) (_2!2485 BitStream!1942)) )
))
(declare-fun lt!81425 () tuple2!4760)

(declare-fun appendBitFromByte!0 (BitStream!1942 (_ BitVec 8) (_ BitVec 32)) tuple2!4760)

(assert (=> b!52437 (= lt!81425 (appendBitFromByte!0 thiss!1379 (select (arr!1661 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!43776 () Bool)

(declare-fun e!34840 () Bool)

(assert (=> start!10440 (=> (not res!43776) (not e!34840))))

(assert (=> start!10440 (= res!43776 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1125 srcBuffer!2))))))))

(assert (=> start!10440 e!34840))

(assert (=> start!10440 true))

(declare-fun array_inv!1030 (array!2461) Bool)

(assert (=> start!10440 (array_inv!1030 srcBuffer!2)))

(declare-fun e!34842 () Bool)

(declare-fun inv!12 (BitStream!1942) Bool)

(assert (=> start!10440 (and (inv!12 thiss!1379) e!34842)))

(declare-fun b!52435 () Bool)

(declare-fun res!43775 () Bool)

(assert (=> b!52435 (=> (not res!43775) (not e!34840))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52435 (= res!43775 (validate_offset_bits!1 ((_ sign_extend 32) (size!1125 (buf!1475 thiss!1379))) ((_ sign_extend 32) (currentByte!3018 thiss!1379)) ((_ sign_extend 32) (currentBit!3013 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52436 () Bool)

(assert (=> b!52436 (= e!34840 (not e!34844))))

(declare-fun res!43774 () Bool)

(assert (=> b!52436 (=> res!43774 e!34844)))

(assert (=> b!52436 (= res!43774 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1942 BitStream!1942) Bool)

(assert (=> b!52436 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!81427 () Unit!3654)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1942) Unit!3654)

(assert (=> b!52436 (= lt!81427 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81426 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52436 (= lt!81426 (bitIndex!0 (size!1125 (buf!1475 thiss!1379)) (currentByte!3018 thiss!1379) (currentBit!3013 thiss!1379)))))

(declare-fun b!52438 () Bool)

(assert (=> b!52438 (= e!34842 (array_inv!1030 (buf!1475 thiss!1379)))))

(assert (= (and start!10440 res!43776) b!52435))

(assert (= (and b!52435 res!43775) b!52436))

(assert (= (and b!52436 (not res!43774)) b!52437))

(assert (= start!10440 b!52438))

(declare-fun m!82777 () Bool)

(assert (=> start!10440 m!82777))

(declare-fun m!82779 () Bool)

(assert (=> start!10440 m!82779))

(declare-fun m!82781 () Bool)

(assert (=> b!52435 m!82781))

(declare-fun m!82783 () Bool)

(assert (=> b!52436 m!82783))

(declare-fun m!82785 () Bool)

(assert (=> b!52436 m!82785))

(declare-fun m!82787 () Bool)

(assert (=> b!52436 m!82787))

(declare-fun m!82789 () Bool)

(assert (=> b!52437 m!82789))

(assert (=> b!52437 m!82789))

(declare-fun m!82791 () Bool)

(assert (=> b!52437 m!82791))

(declare-fun m!82793 () Bool)

(assert (=> b!52438 m!82793))

(push 1)

(assert (not start!10440))

(assert (not b!52437))

(assert (not b!52438))

(assert (not b!52436))

(assert (not b!52435))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

