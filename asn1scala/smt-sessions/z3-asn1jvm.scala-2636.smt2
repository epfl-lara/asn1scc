; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65052 () Bool)

(assert start!65052)

(declare-fun res!241185 () Bool)

(declare-fun e!208155 () Bool)

(assert (=> start!65052 (=> (not res!241185) (not e!208155))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17335 0))(
  ( (array!17336 (arr!8531 (Array (_ BitVec 32) (_ BitVec 8))) (size!7505 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17335)

(assert (=> start!65052 (= res!241185 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7505 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65052 e!208155))

(declare-datatypes ((BitStream!13020 0))(
  ( (BitStream!13021 (buf!7571 array!17335) (currentByte!14014 (_ BitVec 32)) (currentBit!14009 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13020)

(declare-fun e!208154 () Bool)

(declare-fun inv!12 (BitStream!13020) Bool)

(assert (=> start!65052 (and (inv!12 thiss!1728) e!208154)))

(assert (=> start!65052 true))

(declare-fun array_inv!7117 (array!17335) Bool)

(assert (=> start!65052 (array_inv!7117 arr!273)))

(declare-fun b!291964 () Bool)

(declare-fun res!241187 () Bool)

(assert (=> b!291964 (=> (not res!241187) (not e!208155))))

(assert (=> b!291964 (= res!241187 (bvsge from!505 to!474))))

(declare-fun b!291966 () Bool)

(assert (=> b!291966 (= e!208154 (array_inv!7117 (buf!7571 thiss!1728)))))

(declare-fun b!291963 () Bool)

(declare-fun res!241186 () Bool)

(assert (=> b!291963 (=> (not res!241186) (not e!208155))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291963 (= res!241186 (validate_offset_bits!1 ((_ sign_extend 32) (size!7505 (buf!7571 thiss!1728))) ((_ sign_extend 32) (currentByte!14014 thiss!1728)) ((_ sign_extend 32) (currentBit!14009 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!291965 () Bool)

(assert (=> b!291965 (= e!208155 (not true))))

(declare-fun arrayBitRangesEq!0 (array!17335 array!17335 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291965 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7505 arr!273))))))

(declare-datatypes ((Unit!20299 0))(
  ( (Unit!20300) )
))
(declare-fun lt!424443 () Unit!20299)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17335) Unit!20299)

(assert (=> b!291965 (= lt!424443 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(assert (= (and start!65052 res!241185) b!291963))

(assert (= (and b!291963 res!241186) b!291964))

(assert (= (and b!291964 res!241187) b!291965))

(assert (= start!65052 b!291966))

(declare-fun m!427393 () Bool)

(assert (=> start!65052 m!427393))

(declare-fun m!427395 () Bool)

(assert (=> start!65052 m!427395))

(declare-fun m!427397 () Bool)

(assert (=> b!291966 m!427397))

(declare-fun m!427399 () Bool)

(assert (=> b!291963 m!427399))

(declare-fun m!427401 () Bool)

(assert (=> b!291965 m!427401))

(declare-fun m!427403 () Bool)

(assert (=> b!291965 m!427403))

(check-sat (not start!65052) (not b!291963) (not b!291965) (not b!291966))
