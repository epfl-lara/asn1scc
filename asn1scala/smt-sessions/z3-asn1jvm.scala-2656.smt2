; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65304 () Bool)

(assert start!65304)

(declare-fun res!241915 () Bool)

(declare-fun e!209054 () Bool)

(assert (=> start!65304 (=> (not res!241915) (not e!209054))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17452 0))(
  ( (array!17453 (arr!8585 (Array (_ BitVec 32) (_ BitVec 8))) (size!7559 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17452)

(assert (=> start!65304 (= res!241915 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7559 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65304 e!209054))

(declare-datatypes ((BitStream!13122 0))(
  ( (BitStream!13123 (buf!7622 array!17452) (currentByte!14086 (_ BitVec 32)) (currentBit!14081 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13122)

(declare-fun e!209053 () Bool)

(declare-fun inv!12 (BitStream!13122) Bool)

(assert (=> start!65304 (and (inv!12 thiss!1728) e!209053)))

(assert (=> start!65304 true))

(declare-fun array_inv!7171 (array!17452) Bool)

(assert (=> start!65304 (array_inv!7171 arr!273)))

(declare-fun b!292918 () Bool)

(declare-fun res!241914 () Bool)

(assert (=> b!292918 (=> (not res!241914) (not e!209054))))

(assert (=> b!292918 (= res!241914 (bvslt from!505 to!474))))

(declare-fun b!292917 () Bool)

(declare-fun res!241916 () Bool)

(assert (=> b!292917 (=> (not res!241916) (not e!209054))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292917 (= res!241916 (validate_offset_bits!1 ((_ sign_extend 32) (size!7559 (buf!7622 thiss!1728))) ((_ sign_extend 32) (currentByte!14086 thiss!1728)) ((_ sign_extend 32) (currentBit!14081 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!292919 () Bool)

(assert (=> b!292919 (= e!209054 false)))

(declare-datatypes ((tuple2!22948 0))(
  ( (tuple2!22949 (_1!12779 Bool) (_2!12779 BitStream!13122)) )
))
(declare-fun lt!425136 () tuple2!22948)

(declare-fun readBit!0 (BitStream!13122) tuple2!22948)

(assert (=> b!292919 (= lt!425136 (readBit!0 thiss!1728))))

(declare-fun b!292920 () Bool)

(assert (=> b!292920 (= e!209053 (array_inv!7171 (buf!7622 thiss!1728)))))

(assert (= (and start!65304 res!241915) b!292917))

(assert (= (and b!292917 res!241916) b!292918))

(assert (= (and b!292918 res!241914) b!292919))

(assert (= start!65304 b!292920))

(declare-fun m!428525 () Bool)

(assert (=> start!65304 m!428525))

(declare-fun m!428527 () Bool)

(assert (=> start!65304 m!428527))

(declare-fun m!428529 () Bool)

(assert (=> b!292917 m!428529))

(declare-fun m!428531 () Bool)

(assert (=> b!292919 m!428531))

(declare-fun m!428533 () Bool)

(assert (=> b!292920 m!428533))

(check-sat (not start!65304) (not b!292917) (not b!292919) (not b!292920))
