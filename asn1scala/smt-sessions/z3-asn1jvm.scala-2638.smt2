; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65064 () Bool)

(assert start!65064)

(declare-fun res!241240 () Bool)

(declare-fun e!208225 () Bool)

(assert (=> start!65064 (=> (not res!241240) (not e!208225))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17347 0))(
  ( (array!17348 (arr!8537 (Array (_ BitVec 32) (_ BitVec 8))) (size!7511 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17347)

(assert (=> start!65064 (= res!241240 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7511 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65064 e!208225))

(declare-datatypes ((BitStream!13032 0))(
  ( (BitStream!13033 (buf!7577 array!17347) (currentByte!14020 (_ BitVec 32)) (currentBit!14015 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13032)

(declare-fun e!208224 () Bool)

(declare-fun inv!12 (BitStream!13032) Bool)

(assert (=> start!65064 (and (inv!12 thiss!1728) e!208224)))

(assert (=> start!65064 true))

(declare-fun array_inv!7123 (array!17347) Bool)

(assert (=> start!65064 (array_inv!7123 arr!273)))

(declare-fun b!292038 () Bool)

(assert (=> b!292038 (= e!208224 (array_inv!7123 (buf!7577 thiss!1728)))))

(declare-fun b!292035 () Bool)

(declare-fun res!241241 () Bool)

(assert (=> b!292035 (=> (not res!241241) (not e!208225))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292035 (= res!241241 (validate_offset_bits!1 ((_ sign_extend 32) (size!7511 (buf!7577 thiss!1728))) ((_ sign_extend 32) (currentByte!14020 thiss!1728)) ((_ sign_extend 32) (currentBit!14015 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!292037 () Bool)

(assert (=> b!292037 (= e!208225 (not true))))

(declare-fun arrayBitRangesEq!0 (array!17347 array!17347 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292037 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7511 arr!273))))))

(declare-datatypes ((Unit!20311 0))(
  ( (Unit!20312) )
))
(declare-fun lt!424461 () Unit!20311)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17347) Unit!20311)

(assert (=> b!292037 (= lt!424461 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!292036 () Bool)

(declare-fun res!241239 () Bool)

(assert (=> b!292036 (=> (not res!241239) (not e!208225))))

(assert (=> b!292036 (= res!241239 (bvsge from!505 to!474))))

(assert (= (and start!65064 res!241240) b!292035))

(assert (= (and b!292035 res!241241) b!292036))

(assert (= (and b!292036 res!241239) b!292037))

(assert (= start!65064 b!292038))

(declare-fun m!427465 () Bool)

(assert (=> start!65064 m!427465))

(declare-fun m!427467 () Bool)

(assert (=> start!65064 m!427467))

(declare-fun m!427469 () Bool)

(assert (=> b!292038 m!427469))

(declare-fun m!427471 () Bool)

(assert (=> b!292035 m!427471))

(declare-fun m!427473 () Bool)

(assert (=> b!292037 m!427473))

(declare-fun m!427475 () Bool)

(assert (=> b!292037 m!427475))

(check-sat (not b!292035) (not b!292037) (not b!292038) (not start!65064))
