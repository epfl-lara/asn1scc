; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65220 () Bool)

(assert start!65220)

(declare-fun b!292689 () Bool)

(declare-fun res!241739 () Bool)

(declare-fun e!208837 () Bool)

(assert (=> b!292689 (=> (not res!241739) (not e!208837))))

(declare-datatypes ((array!17425 0))(
  ( (array!17426 (arr!8573 (Array (_ BitVec 32) (_ BitVec 8))) (size!7547 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13104 0))(
  ( (BitStream!13105 (buf!7613 array!17425) (currentByte!14068 (_ BitVec 32)) (currentBit!14063 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13104)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292689 (= res!241739 (validate_offset_bits!1 ((_ sign_extend 32) (size!7547 (buf!7613 thiss!1728))) ((_ sign_extend 32) (currentByte!14068 thiss!1728)) ((_ sign_extend 32) (currentBit!14063 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!292691 () Bool)

(assert (=> b!292691 (= e!208837 (not true))))

(declare-fun lt!424964 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!292691 (= lt!424964 (bitIndex!0 (size!7547 (buf!7613 thiss!1728)) (currentByte!14068 thiss!1728) (currentBit!14063 thiss!1728)))))

(declare-fun arr!273 () array!17425)

(declare-fun arrayBitRangesEq!0 (array!17425 array!17425 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292691 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-fun lt!424965 () (_ BitVec 64))

(declare-datatypes ((Unit!20383 0))(
  ( (Unit!20384) )
))
(declare-fun lt!424962 () Unit!20383)

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17425 array!17425 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20383)

(assert (=> b!292691 (= lt!424962 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424965 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!292691 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424965)))

(assert (=> b!292691 (= lt!424965 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7547 arr!273))))))

(declare-fun lt!424963 () Unit!20383)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17425) Unit!20383)

(assert (=> b!292691 (= lt!424963 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!292692 () Bool)

(declare-fun e!208838 () Bool)

(declare-fun array_inv!7159 (array!17425) Bool)

(assert (=> b!292692 (= e!208838 (array_inv!7159 (buf!7613 thiss!1728)))))

(declare-fun res!241737 () Bool)

(assert (=> start!65220 (=> (not res!241737) (not e!208837))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> start!65220 (= res!241737 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7547 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65220 e!208837))

(declare-fun inv!12 (BitStream!13104) Bool)

(assert (=> start!65220 (and (inv!12 thiss!1728) e!208838)))

(assert (=> start!65220 true))

(assert (=> start!65220 (array_inv!7159 arr!273)))

(declare-fun b!292690 () Bool)

(declare-fun res!241738 () Bool)

(assert (=> b!292690 (=> (not res!241738) (not e!208837))))

(assert (=> b!292690 (= res!241738 (bvsge from!505 to!474))))

(assert (= (and start!65220 res!241737) b!292689))

(assert (= (and b!292689 res!241739) b!292690))

(assert (= (and b!292690 res!241738) b!292691))

(assert (= start!65220 b!292692))

(declare-fun m!428287 () Bool)

(assert (=> b!292689 m!428287))

(declare-fun m!428289 () Bool)

(assert (=> b!292691 m!428289))

(declare-fun m!428291 () Bool)

(assert (=> b!292691 m!428291))

(declare-fun m!428293 () Bool)

(assert (=> b!292691 m!428293))

(declare-fun m!428295 () Bool)

(assert (=> b!292691 m!428295))

(declare-fun m!428297 () Bool)

(assert (=> b!292691 m!428297))

(declare-fun m!428299 () Bool)

(assert (=> b!292692 m!428299))

(declare-fun m!428301 () Bool)

(assert (=> start!65220 m!428301))

(declare-fun m!428303 () Bool)

(assert (=> start!65220 m!428303))

(check-sat (not b!292692) (not b!292689) (not start!65220) (not b!292691))
