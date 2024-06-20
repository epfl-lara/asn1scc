; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65196 () Bool)

(assert start!65196)

(declare-fun b!292510 () Bool)

(declare-fun res!241594 () Bool)

(declare-fun e!208675 () Bool)

(assert (=> b!292510 (=> (not res!241594) (not e!208675))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!292510 (= res!241594 (bvsge from!505 to!474))))

(declare-fun b!292512 () Bool)

(declare-fun e!208676 () Bool)

(declare-datatypes ((array!17401 0))(
  ( (array!17402 (arr!8561 (Array (_ BitVec 32) (_ BitVec 8))) (size!7535 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13080 0))(
  ( (BitStream!13081 (buf!7601 array!17401) (currentByte!14056 (_ BitVec 32)) (currentBit!14051 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13080)

(declare-fun array_inv!7147 (array!17401) Bool)

(assert (=> b!292512 (= e!208676 (array_inv!7147 (buf!7601 thiss!1728)))))

(declare-fun b!292509 () Bool)

(declare-fun res!241593 () Bool)

(assert (=> b!292509 (=> (not res!241593) (not e!208675))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292509 (= res!241593 (validate_offset_bits!1 ((_ sign_extend 32) (size!7535 (buf!7601 thiss!1728))) ((_ sign_extend 32) (currentByte!14056 thiss!1728)) ((_ sign_extend 32) (currentBit!14051 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!292511 () Bool)

(assert (=> b!292511 (= e!208675 (not true))))

(declare-fun lt!424819 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!292511 (= lt!424819 (bitIndex!0 (size!7535 (buf!7601 thiss!1728)) (currentByte!14056 thiss!1728) (currentBit!14051 thiss!1728)))))

(declare-fun arr!273 () array!17401)

(declare-fun arrayBitRangesEq!0 (array!17401 array!17401 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292511 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20359 0))(
  ( (Unit!20360) )
))
(declare-fun lt!424818 () Unit!20359)

(declare-fun lt!424821 () (_ BitVec 64))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17401 array!17401 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20359)

(assert (=> b!292511 (= lt!424818 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424821 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!292511 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424821)))

(assert (=> b!292511 (= lt!424821 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7535 arr!273))))))

(declare-fun lt!424820 () Unit!20359)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17401) Unit!20359)

(assert (=> b!292511 (= lt!424820 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun res!241595 () Bool)

(assert (=> start!65196 (=> (not res!241595) (not e!208675))))

(assert (=> start!65196 (= res!241595 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7535 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65196 e!208675))

(declare-fun inv!12 (BitStream!13080) Bool)

(assert (=> start!65196 (and (inv!12 thiss!1728) e!208676)))

(assert (=> start!65196 true))

(assert (=> start!65196 (array_inv!7147 arr!273)))

(assert (= (and start!65196 res!241595) b!292509))

(assert (= (and b!292509 res!241593) b!292510))

(assert (= (and b!292510 res!241594) b!292511))

(assert (= start!65196 b!292512))

(declare-fun m!428059 () Bool)

(assert (=> b!292512 m!428059))

(declare-fun m!428061 () Bool)

(assert (=> b!292509 m!428061))

(declare-fun m!428063 () Bool)

(assert (=> b!292511 m!428063))

(declare-fun m!428065 () Bool)

(assert (=> b!292511 m!428065))

(declare-fun m!428067 () Bool)

(assert (=> b!292511 m!428067))

(declare-fun m!428069 () Bool)

(assert (=> b!292511 m!428069))

(declare-fun m!428071 () Bool)

(assert (=> b!292511 m!428071))

(declare-fun m!428073 () Bool)

(assert (=> start!65196 m!428073))

(declare-fun m!428075 () Bool)

(assert (=> start!65196 m!428075))

(check-sat (not b!292512) (not b!292511) (not b!292509) (not start!65196))
