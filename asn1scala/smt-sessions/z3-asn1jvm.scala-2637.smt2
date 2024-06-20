; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65058 () Bool)

(assert start!65058)

(declare-fun res!241214 () Bool)

(declare-fun e!208188 () Bool)

(assert (=> start!65058 (=> (not res!241214) (not e!208188))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17341 0))(
  ( (array!17342 (arr!8534 (Array (_ BitVec 32) (_ BitVec 8))) (size!7508 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17341)

(assert (=> start!65058 (= res!241214 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7508 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65058 e!208188))

(declare-datatypes ((BitStream!13026 0))(
  ( (BitStream!13027 (buf!7574 array!17341) (currentByte!14017 (_ BitVec 32)) (currentBit!14012 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13026)

(declare-fun e!208191 () Bool)

(declare-fun inv!12 (BitStream!13026) Bool)

(assert (=> start!65058 (and (inv!12 thiss!1728) e!208191)))

(assert (=> start!65058 true))

(declare-fun array_inv!7120 (array!17341) Bool)

(assert (=> start!65058 (array_inv!7120 arr!273)))

(declare-fun b!291999 () Bool)

(declare-fun res!241212 () Bool)

(assert (=> b!291999 (=> (not res!241212) (not e!208188))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291999 (= res!241212 (validate_offset_bits!1 ((_ sign_extend 32) (size!7508 (buf!7574 thiss!1728))) ((_ sign_extend 32) (currentByte!14017 thiss!1728)) ((_ sign_extend 32) (currentBit!14012 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!292001 () Bool)

(assert (=> b!292001 (= e!208188 (not true))))

(declare-fun arrayBitRangesEq!0 (array!17341 array!17341 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292001 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7508 arr!273))))))

(declare-datatypes ((Unit!20305 0))(
  ( (Unit!20306) )
))
(declare-fun lt!424452 () Unit!20305)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17341) Unit!20305)

(assert (=> b!292001 (= lt!424452 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!292000 () Bool)

(declare-fun res!241213 () Bool)

(assert (=> b!292000 (=> (not res!241213) (not e!208188))))

(assert (=> b!292000 (= res!241213 (bvsge from!505 to!474))))

(declare-fun b!292002 () Bool)

(assert (=> b!292002 (= e!208191 (array_inv!7120 (buf!7574 thiss!1728)))))

(assert (= (and start!65058 res!241214) b!291999))

(assert (= (and b!291999 res!241212) b!292000))

(assert (= (and b!292000 res!241213) b!292001))

(assert (= start!65058 b!292002))

(declare-fun m!427429 () Bool)

(assert (=> start!65058 m!427429))

(declare-fun m!427431 () Bool)

(assert (=> start!65058 m!427431))

(declare-fun m!427433 () Bool)

(assert (=> b!291999 m!427433))

(declare-fun m!427435 () Bool)

(assert (=> b!292001 m!427435))

(declare-fun m!427437 () Bool)

(assert (=> b!292001 m!427437))

(declare-fun m!427439 () Bool)

(assert (=> b!292002 m!427439))

(check-sat (not start!65058) (not b!291999) (not b!292001) (not b!292002))
