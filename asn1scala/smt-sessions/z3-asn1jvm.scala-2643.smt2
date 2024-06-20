; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65178 () Bool)

(assert start!65178)

(declare-fun res!241512 () Bool)

(declare-fun e!208566 () Bool)

(assert (=> start!65178 (=> (not res!241512) (not e!208566))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-datatypes ((array!17383 0))(
  ( (array!17384 (arr!8552 (Array (_ BitVec 32) (_ BitVec 8))) (size!7526 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17383)

(assert (=> start!65178 (= res!241512 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7526 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65178 e!208566))

(declare-datatypes ((BitStream!13062 0))(
  ( (BitStream!13063 (buf!7592 array!17383) (currentByte!14047 (_ BitVec 32)) (currentBit!14042 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13062)

(declare-fun e!208567 () Bool)

(declare-fun inv!12 (BitStream!13062) Bool)

(assert (=> start!65178 (and (inv!12 thiss!1728) e!208567)))

(assert (=> start!65178 true))

(declare-fun array_inv!7138 (array!17383) Bool)

(assert (=> start!65178 (array_inv!7138 arr!273)))

(declare-fun b!292401 () Bool)

(declare-fun res!241514 () Bool)

(assert (=> b!292401 (=> (not res!241514) (not e!208566))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292401 (= res!241514 (validate_offset_bits!1 ((_ sign_extend 32) (size!7526 (buf!7592 thiss!1728))) ((_ sign_extend 32) (currentByte!14047 thiss!1728)) ((_ sign_extend 32) (currentBit!14042 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun lt!424711 () (_ BitVec 64))

(declare-fun lt!424713 () (_ BitVec 64))

(declare-fun b!292403 () Bool)

(assert (=> b!292403 (= e!208566 (not (or (not (= (bvsub (bvadd lt!424713 to!474) from!505) lt!424713)) (bvsle from!505 lt!424711))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!292403 (= lt!424713 (bitIndex!0 (size!7526 (buf!7592 thiss!1728)) (currentByte!14047 thiss!1728) (currentBit!14042 thiss!1728)))))

(declare-fun arrayBitRangesEq!0 (array!17383 array!17383 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!292403 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 from!505)))

(declare-datatypes ((Unit!20341 0))(
  ( (Unit!20342) )
))
(declare-fun lt!424712 () Unit!20341)

(declare-fun arrayBitRangesEqSlicedLemma!0 (array!17383 array!17383 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!20341)

(assert (=> b!292403 (= lt!424712 (arrayBitRangesEqSlicedLemma!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424711 #b0000000000000000000000000000000000000000000000000000000000000000 from!505))))

(assert (=> b!292403 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!424711)))

(assert (=> b!292403 (= lt!424711 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7526 arr!273))))))

(declare-fun lt!424710 () Unit!20341)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17383) Unit!20341)

(assert (=> b!292403 (= lt!424710 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!292404 () Bool)

(assert (=> b!292404 (= e!208567 (array_inv!7138 (buf!7592 thiss!1728)))))

(declare-fun b!292402 () Bool)

(declare-fun res!241513 () Bool)

(assert (=> b!292402 (=> (not res!241513) (not e!208566))))

(assert (=> b!292402 (= res!241513 (bvsge from!505 to!474))))

(assert (= (and start!65178 res!241512) b!292401))

(assert (= (and b!292401 res!241514) b!292402))

(assert (= (and b!292402 res!241513) b!292403))

(assert (= start!65178 b!292404))

(declare-fun m!427897 () Bool)

(assert (=> start!65178 m!427897))

(declare-fun m!427899 () Bool)

(assert (=> start!65178 m!427899))

(declare-fun m!427901 () Bool)

(assert (=> b!292401 m!427901))

(declare-fun m!427903 () Bool)

(assert (=> b!292403 m!427903))

(declare-fun m!427905 () Bool)

(assert (=> b!292403 m!427905))

(declare-fun m!427907 () Bool)

(assert (=> b!292403 m!427907))

(declare-fun m!427909 () Bool)

(assert (=> b!292403 m!427909))

(declare-fun m!427911 () Bool)

(assert (=> b!292403 m!427911))

(declare-fun m!427913 () Bool)

(assert (=> b!292404 m!427913))

(check-sat (not b!292404) (not b!292403) (not b!292401) (not start!65178))
(check-sat)
