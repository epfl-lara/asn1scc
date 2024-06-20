; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!14336 () Bool)

(assert start!14336)

(declare-fun res!61446 () Bool)

(declare-fun e!48580 () Bool)

(assert (=> start!14336 (=> (not res!61446) (not e!48580))))

(declare-datatypes ((array!3024 0))(
  ( (array!3025 (arr!2007 (Array (_ BitVec 32) (_ BitVec 8))) (size!1413 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!3024)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!14336 (= res!61446 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1413 srcBuffer!2))))))))

(assert (=> start!14336 e!48580))

(assert (=> start!14336 true))

(declare-fun array_inv!1259 (array!3024) Bool)

(assert (=> start!14336 (array_inv!1259 srcBuffer!2)))

(declare-datatypes ((BitStream!2400 0))(
  ( (BitStream!2401 (buf!1794 array!3024) (currentByte!3538 (_ BitVec 32)) (currentBit!3533 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2400)

(declare-fun e!48581 () Bool)

(declare-fun inv!12 (BitStream!2400) Bool)

(assert (=> start!14336 (and (inv!12 thiss!1379) e!48581)))

(declare-fun b!74330 () Bool)

(declare-fun res!61445 () Bool)

(assert (=> b!74330 (=> (not res!61445) (not e!48580))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74330 (= res!61445 (validate_offset_bits!1 ((_ sign_extend 32) (size!1413 (buf!1794 thiss!1379))) ((_ sign_extend 32) (currentByte!3538 thiss!1379)) ((_ sign_extend 32) (currentBit!3533 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!74331 () Bool)

(assert (=> b!74331 (= e!48580 (not true))))

(declare-fun isPrefixOf!0 (BitStream!2400 BitStream!2400) Bool)

(assert (=> b!74331 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4903 0))(
  ( (Unit!4904) )
))
(declare-fun lt!119665 () Unit!4903)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2400) Unit!4903)

(assert (=> b!74331 (= lt!119665 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!119664 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!74331 (= lt!119664 (bitIndex!0 (size!1413 (buf!1794 thiss!1379)) (currentByte!3538 thiss!1379) (currentBit!3533 thiss!1379)))))

(declare-fun b!74332 () Bool)

(assert (=> b!74332 (= e!48581 (array_inv!1259 (buf!1794 thiss!1379)))))

(assert (= (and start!14336 res!61446) b!74330))

(assert (= (and b!74330 res!61445) b!74331))

(assert (= start!14336 b!74332))

(declare-fun m!119277 () Bool)

(assert (=> start!14336 m!119277))

(declare-fun m!119279 () Bool)

(assert (=> start!14336 m!119279))

(declare-fun m!119281 () Bool)

(assert (=> b!74330 m!119281))

(declare-fun m!119283 () Bool)

(assert (=> b!74331 m!119283))

(declare-fun m!119285 () Bool)

(assert (=> b!74331 m!119285))

(declare-fun m!119287 () Bool)

(assert (=> b!74331 m!119287))

(declare-fun m!119289 () Bool)

(assert (=> b!74332 m!119289))

(check-sat (not start!14336) (not b!74331) (not b!74330) (not b!74332))
