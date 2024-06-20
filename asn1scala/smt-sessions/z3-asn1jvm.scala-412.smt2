; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10502 () Bool)

(assert start!10502)

(declare-fun b!52677 () Bool)

(declare-fun e!35056 () Bool)

(assert (=> b!52677 (= e!35056 true)))

(declare-datatypes ((array!2484 0))(
  ( (array!2485 (arr!1671 (Array (_ BitVec 32) (_ BitVec 8))) (size!1135 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2484)

(declare-datatypes ((BitStream!1962 0))(
  ( (BitStream!1963 (buf!1485 array!2484) (currentByte!3034 (_ BitVec 32)) (currentBit!3029 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1962)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((Unit!3674 0))(
  ( (Unit!3675) )
))
(declare-datatypes ((tuple2!4788 0))(
  ( (tuple2!4789 (_1!2499 Unit!3674) (_2!2499 BitStream!1962)) )
))
(declare-fun lt!81679 () tuple2!4788)

(declare-fun appendBitFromByte!0 (BitStream!1962 (_ BitVec 8) (_ BitVec 32)) tuple2!4788)

(assert (=> b!52677 (= lt!81679 (appendBitFromByte!0 thiss!1379 (select (arr!1671 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!52678 () Bool)

(declare-fun e!35053 () Bool)

(declare-fun array_inv!1040 (array!2484) Bool)

(assert (=> b!52678 (= e!35053 (array_inv!1040 (buf!1485 thiss!1379)))))

(declare-fun b!52675 () Bool)

(declare-fun res!43983 () Bool)

(declare-fun e!35054 () Bool)

(assert (=> b!52675 (=> (not res!43983) (not e!35054))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52675 (= res!43983 (validate_offset_bits!1 ((_ sign_extend 32) (size!1135 (buf!1485 thiss!1379))) ((_ sign_extend 32) (currentByte!3034 thiss!1379)) ((_ sign_extend 32) (currentBit!3029 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52676 () Bool)

(assert (=> b!52676 (= e!35054 (not e!35056))))

(declare-fun res!43982 () Bool)

(assert (=> b!52676 (=> res!43982 e!35056)))

(assert (=> b!52676 (= res!43982 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1962 BitStream!1962) Bool)

(assert (=> b!52676 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!81678 () Unit!3674)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1962) Unit!3674)

(assert (=> b!52676 (= lt!81678 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81677 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52676 (= lt!81677 (bitIndex!0 (size!1135 (buf!1485 thiss!1379)) (currentByte!3034 thiss!1379) (currentBit!3029 thiss!1379)))))

(declare-fun res!43981 () Bool)

(assert (=> start!10502 (=> (not res!43981) (not e!35054))))

(assert (=> start!10502 (= res!43981 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1135 srcBuffer!2))))))))

(assert (=> start!10502 e!35054))

(assert (=> start!10502 true))

(assert (=> start!10502 (array_inv!1040 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1962) Bool)

(assert (=> start!10502 (and (inv!12 thiss!1379) e!35053)))

(assert (= (and start!10502 res!43981) b!52675))

(assert (= (and b!52675 res!43983) b!52676))

(assert (= (and b!52676 (not res!43982)) b!52677))

(assert (= start!10502 b!52678))

(declare-fun m!83065 () Bool)

(assert (=> b!52678 m!83065))

(declare-fun m!83067 () Bool)

(assert (=> start!10502 m!83067))

(declare-fun m!83069 () Bool)

(assert (=> start!10502 m!83069))

(declare-fun m!83071 () Bool)

(assert (=> b!52677 m!83071))

(assert (=> b!52677 m!83071))

(declare-fun m!83073 () Bool)

(assert (=> b!52677 m!83073))

(declare-fun m!83075 () Bool)

(assert (=> b!52676 m!83075))

(declare-fun m!83077 () Bool)

(assert (=> b!52676 m!83077))

(declare-fun m!83079 () Bool)

(assert (=> b!52676 m!83079))

(declare-fun m!83081 () Bool)

(assert (=> b!52675 m!83081))

(check-sat (not b!52677) (not b!52678) (not b!52676) (not b!52675) (not start!10502))
