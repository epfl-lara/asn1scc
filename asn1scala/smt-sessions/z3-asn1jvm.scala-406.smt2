; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10424 () Bool)

(assert start!10424)

(declare-fun res!43724 () Bool)

(declare-fun e!34744 () Bool)

(assert (=> start!10424 (=> (not res!43724) (not e!34744))))

(declare-datatypes ((array!2445 0))(
  ( (array!2446 (arr!1653 (Array (_ BitVec 32) (_ BitVec 8))) (size!1117 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2445)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!10424 (= res!43724 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1117 srcBuffer!2))))))))

(assert (=> start!10424 e!34744))

(assert (=> start!10424 true))

(declare-fun array_inv!1022 (array!2445) Bool)

(assert (=> start!10424 (array_inv!1022 srcBuffer!2)))

(declare-datatypes ((BitStream!1926 0))(
  ( (BitStream!1927 (buf!1467 array!2445) (currentByte!3010 (_ BitVec 32)) (currentBit!3005 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1926)

(declare-fun e!34743 () Bool)

(declare-fun inv!12 (BitStream!1926) Bool)

(assert (=> start!10424 (and (inv!12 thiss!1379) e!34743)))

(declare-fun b!52361 () Bool)

(declare-fun res!43725 () Bool)

(assert (=> b!52361 (=> (not res!43725) (not e!34744))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52361 (= res!43725 (validate_offset_bits!1 ((_ sign_extend 32) (size!1117 (buf!1467 thiss!1379))) ((_ sign_extend 32) (currentByte!3010 thiss!1379)) ((_ sign_extend 32) (currentBit!3005 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52362 () Bool)

(assert (=> b!52362 (= e!34744 (not true))))

(declare-fun isPrefixOf!0 (BitStream!1926 BitStream!1926) Bool)

(assert (=> b!52362 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3638 0))(
  ( (Unit!3639) )
))
(declare-fun lt!81376 () Unit!3638)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1926) Unit!3638)

(assert (=> b!52362 (= lt!81376 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81375 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52362 (= lt!81375 (bitIndex!0 (size!1117 (buf!1467 thiss!1379)) (currentByte!3010 thiss!1379) (currentBit!3005 thiss!1379)))))

(declare-fun b!52363 () Bool)

(assert (=> b!52363 (= e!34743 (array_inv!1022 (buf!1467 thiss!1379)))))

(assert (= (and start!10424 res!43724) b!52361))

(assert (= (and b!52361 res!43725) b!52362))

(assert (= start!10424 b!52363))

(declare-fun m!82665 () Bool)

(assert (=> start!10424 m!82665))

(declare-fun m!82667 () Bool)

(assert (=> start!10424 m!82667))

(declare-fun m!82669 () Bool)

(assert (=> b!52361 m!82669))

(declare-fun m!82671 () Bool)

(assert (=> b!52362 m!82671))

(declare-fun m!82673 () Bool)

(assert (=> b!52362 m!82673))

(declare-fun m!82675 () Bool)

(assert (=> b!52362 m!82675))

(declare-fun m!82677 () Bool)

(assert (=> b!52363 m!82677))

(check-sat (not b!52362) (not start!10424) (not b!52363) (not b!52361))
