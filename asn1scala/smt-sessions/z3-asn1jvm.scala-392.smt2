; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10300 () Bool)

(assert start!10300)

(declare-fun res!43455 () Bool)

(declare-fun e!34284 () Bool)

(assert (=> start!10300 (=> (not res!43455) (not e!34284))))

(declare-datatypes ((array!2364 0))(
  ( (array!2365 (arr!1614 (Array (_ BitVec 32) (_ BitVec 8))) (size!1078 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2364)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!10300 (= res!43455 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1078 srcBuffer!2))))))))

(assert (=> start!10300 e!34284))

(assert (=> start!10300 true))

(declare-fun array_inv!983 (array!2364) Bool)

(assert (=> start!10300 (array_inv!983 srcBuffer!2)))

(declare-datatypes ((BitStream!1860 0))(
  ( (BitStream!1861 (buf!1434 array!2364) (currentByte!2969 (_ BitVec 32)) (currentBit!2964 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1860)

(declare-fun e!34285 () Bool)

(declare-fun inv!12 (BitStream!1860) Bool)

(assert (=> start!10300 (and (inv!12 thiss!1379) e!34285)))

(declare-fun b!51992 () Bool)

(declare-fun res!43454 () Bool)

(assert (=> b!51992 (=> (not res!43454) (not e!34284))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!51992 (= res!43454 (validate_offset_bits!1 ((_ sign_extend 32) (size!1078 (buf!1434 thiss!1379))) ((_ sign_extend 32) (currentByte!2969 thiss!1379)) ((_ sign_extend 32) (currentBit!2964 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!51993 () Bool)

(declare-fun lt!81123 () (_ BitVec 64))

(assert (=> b!51993 (= e!34284 (not (or (bvslt i!635 to!314) (= lt!81123 (bvsub (bvadd lt!81123 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1860 BitStream!1860) Bool)

(assert (=> b!51993 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3578 0))(
  ( (Unit!3579) )
))
(declare-fun lt!81124 () Unit!3578)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1860) Unit!3578)

(assert (=> b!51993 (= lt!81124 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!51993 (= lt!81123 (bitIndex!0 (size!1078 (buf!1434 thiss!1379)) (currentByte!2969 thiss!1379) (currentBit!2964 thiss!1379)))))

(declare-fun b!51994 () Bool)

(assert (=> b!51994 (= e!34285 (array_inv!983 (buf!1434 thiss!1379)))))

(assert (= (and start!10300 res!43455) b!51992))

(assert (= (and b!51992 res!43454) b!51993))

(assert (= start!10300 b!51994))

(declare-fun m!82169 () Bool)

(assert (=> start!10300 m!82169))

(declare-fun m!82171 () Bool)

(assert (=> start!10300 m!82171))

(declare-fun m!82173 () Bool)

(assert (=> b!51992 m!82173))

(declare-fun m!82175 () Bool)

(assert (=> b!51993 m!82175))

(declare-fun m!82177 () Bool)

(assert (=> b!51993 m!82177))

(declare-fun m!82179 () Bool)

(assert (=> b!51993 m!82179))

(declare-fun m!82181 () Bool)

(assert (=> b!51994 m!82181))

(check-sat (not b!51994) (not start!10300) (not b!51993) (not b!51992))
(check-sat)
