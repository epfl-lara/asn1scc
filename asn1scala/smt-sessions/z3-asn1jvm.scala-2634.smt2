; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65040 () Bool)

(assert start!65040)

(declare-fun b!291892 () Bool)

(declare-fun res!241132 () Bool)

(declare-fun e!208080 () Bool)

(assert (=> b!291892 (=> (not res!241132) (not e!208080))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!291892 (= res!241132 (bvsge from!505 to!474))))

(declare-fun b!291893 () Bool)

(assert (=> b!291893 (= e!208080 (not true))))

(declare-datatypes ((array!17323 0))(
  ( (array!17324 (arr!8525 (Array (_ BitVec 32) (_ BitVec 8))) (size!7499 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17323)

(declare-fun arrayBitRangesEq!0 (array!17323 array!17323 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291893 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7499 arr!273))))))

(declare-datatypes ((Unit!20287 0))(
  ( (Unit!20288) )
))
(declare-fun lt!424425 () Unit!20287)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17323) Unit!20287)

(assert (=> b!291893 (= lt!424425 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun res!241133 () Bool)

(assert (=> start!65040 (=> (not res!241133) (not e!208080))))

(declare-fun nBits!523 () (_ BitVec 64))

(assert (=> start!65040 (= res!241133 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7499 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65040 e!208080))

(declare-datatypes ((BitStream!13008 0))(
  ( (BitStream!13009 (buf!7565 array!17323) (currentByte!14008 (_ BitVec 32)) (currentBit!14003 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13008)

(declare-fun e!208083 () Bool)

(declare-fun inv!12 (BitStream!13008) Bool)

(assert (=> start!65040 (and (inv!12 thiss!1728) e!208083)))

(assert (=> start!65040 true))

(declare-fun array_inv!7111 (array!17323) Bool)

(assert (=> start!65040 (array_inv!7111 arr!273)))

(declare-fun b!291894 () Bool)

(assert (=> b!291894 (= e!208083 (array_inv!7111 (buf!7565 thiss!1728)))))

(declare-fun b!291891 () Bool)

(declare-fun res!241131 () Bool)

(assert (=> b!291891 (=> (not res!241131) (not e!208080))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!291891 (= res!241131 (validate_offset_bits!1 ((_ sign_extend 32) (size!7499 (buf!7565 thiss!1728))) ((_ sign_extend 32) (currentByte!14008 thiss!1728)) ((_ sign_extend 32) (currentBit!14003 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!65040 res!241133) b!291891))

(assert (= (and b!291891 res!241131) b!291892))

(assert (= (and b!291892 res!241132) b!291893))

(assert (= start!65040 b!291894))

(declare-fun m!427321 () Bool)

(assert (=> b!291893 m!427321))

(declare-fun m!427323 () Bool)

(assert (=> b!291893 m!427323))

(declare-fun m!427325 () Bool)

(assert (=> start!65040 m!427325))

(declare-fun m!427327 () Bool)

(assert (=> start!65040 m!427327))

(declare-fun m!427329 () Bool)

(assert (=> b!291894 m!427329))

(declare-fun m!427331 () Bool)

(assert (=> b!291891 m!427331))

(check-sat (not start!65040) (not b!291891) (not b!291893) (not b!291894))
