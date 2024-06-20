; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65172 () Bool)

(assert start!65172)

(declare-fun b!292365 () Bool)

(declare-fun res!241486 () Bool)

(declare-fun e!208533 () Bool)

(assert (=> b!292365 (=> (not res!241486) (not e!208533))))

(declare-datatypes ((array!17377 0))(
  ( (array!17378 (arr!8549 (Array (_ BitVec 32) (_ BitVec 8))) (size!7523 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13056 0))(
  ( (BitStream!13057 (buf!7589 array!17377) (currentByte!14044 (_ BitVec 32)) (currentBit!14039 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13056)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292365 (= res!241486 (validate_offset_bits!1 ((_ sign_extend 32) (size!7523 (buf!7589 thiss!1728))) ((_ sign_extend 32) (currentByte!14044 thiss!1728)) ((_ sign_extend 32) (currentBit!14039 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!292368 () Bool)

(declare-fun e!208530 () Bool)

(declare-fun array_inv!7135 (array!17377) Bool)

(assert (=> b!292368 (= e!208530 (array_inv!7135 (buf!7589 thiss!1728)))))

(declare-fun b!292367 () Bool)

(assert (=> b!292367 (= e!208533 (not true))))

(declare-fun lt!424675 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!292367 (= lt!424675 (bitIndex!0 (size!7523 (buf!7589 thiss!1728)) (currentByte!14044 thiss!1728) (currentBit!14039 thiss!1728)))))

(declare-fun arr!273 () array!17377)

(declare-fun arrayBitRangesEq!0 (array!17377 array!17377 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292367 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20335 0))(
  ( (Unit!20336) )
))
(declare-fun lt!424674 () Unit!20335)

(declare-fun lt!424676 () (_ BitVec 64))

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17377 array!17377 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20335)

(assert (=> b!292367 (= lt!424674 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424676 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!292367 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424676)))

(assert (=> b!292367 (= lt!424676 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7523 arr!273))))))

(declare-fun lt!424677 () Unit!20335)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17377) Unit!20335)

(assert (=> b!292367 (= lt!424677 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!292366 () Bool)

(declare-fun res!241487 () Bool)

(assert (=> b!292366 (=> (not res!241487) (not e!208533))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!292366 (= res!241487 (bvsge from!505 to!474))))

(declare-fun res!241485 () Bool)

(assert (=> start!65172 (=> (not res!241485) (not e!208533))))

(assert (=> start!65172 (= res!241485 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7523 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65172 e!208533))

(declare-fun inv!12 (BitStream!13056) Bool)

(assert (=> start!65172 (and (inv!12 thiss!1728) e!208530)))

(assert (=> start!65172 true))

(assert (=> start!65172 (array_inv!7135 arr!273)))

(assert (= (and start!65172 res!241485) b!292365))

(assert (= (and b!292365 res!241486) b!292366))

(assert (= (and b!292366 res!241487) b!292367))

(assert (= start!65172 b!292368))

(declare-fun m!427843 () Bool)

(assert (=> b!292365 m!427843))

(declare-fun m!427845 () Bool)

(assert (=> b!292368 m!427845))

(declare-fun m!427847 () Bool)

(assert (=> b!292367 m!427847))

(declare-fun m!427849 () Bool)

(assert (=> b!292367 m!427849))

(declare-fun m!427851 () Bool)

(assert (=> b!292367 m!427851))

(declare-fun m!427853 () Bool)

(assert (=> b!292367 m!427853))

(declare-fun m!427855 () Bool)

(assert (=> b!292367 m!427855))

(declare-fun m!427857 () Bool)

(assert (=> start!65172 m!427857))

(declare-fun m!427859 () Bool)

(assert (=> start!65172 m!427859))

(check-sat (not b!292368) (not b!292367) (not start!65172) (not b!292365))
