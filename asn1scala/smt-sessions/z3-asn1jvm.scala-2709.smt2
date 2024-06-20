; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66372 () Bool)

(assert start!66372)

(declare-fun b!297467 () Bool)

(declare-fun e!212958 () Bool)

(assert (=> b!297467 (= e!212958 (not true))))

(declare-datatypes ((array!17809 0))(
  ( (array!17810 (arr!8798 (Array (_ BitVec 32) (_ BitVec 8))) (size!7718 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17809)

(declare-fun arrayBitRangesEq!0 (array!17809 array!17809 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297467 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7718 arr!273))))))

(declare-datatypes ((Unit!20757 0))(
  ( (Unit!20758) )
))
(declare-fun lt!433704 () Unit!20757)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17809) Unit!20757)

(assert (=> b!297467 (= lt!433704 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun res!245513 () Bool)

(assert (=> start!66372 (=> (not res!245513) (not e!212958))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(assert (=> start!66372 (= res!245513 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7718 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66372 e!212958))

(declare-datatypes ((BitStream!13440 0))(
  ( (BitStream!13441 (buf!7781 array!17809) (currentByte!14323 (_ BitVec 32)) (currentBit!14318 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13440)

(declare-fun e!212956 () Bool)

(declare-fun inv!12 (BitStream!13440) Bool)

(assert (=> start!66372 (and (inv!12 thiss!1728) e!212956)))

(assert (=> start!66372 true))

(declare-fun array_inv!7330 (array!17809) Bool)

(assert (=> start!66372 (array_inv!7330 arr!273)))

(declare-fun b!297465 () Bool)

(declare-fun res!245511 () Bool)

(assert (=> b!297465 (=> (not res!245511) (not e!212958))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297465 (= res!245511 (validate_offset_bits!1 ((_ sign_extend 32) (size!7718 (buf!7781 thiss!1728))) ((_ sign_extend 32) (currentByte!14323 thiss!1728)) ((_ sign_extend 32) (currentBit!14318 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!297466 () Bool)

(declare-fun res!245512 () Bool)

(assert (=> b!297466 (=> (not res!245512) (not e!212958))))

(assert (=> b!297466 (= res!245512 (bvsge from!505 to!474))))

(declare-fun b!297468 () Bool)

(assert (=> b!297468 (= e!212956 (array_inv!7330 (buf!7781 thiss!1728)))))

(assert (= (and start!66372 res!245513) b!297465))

(assert (= (and b!297465 res!245511) b!297466))

(assert (= (and b!297466 res!245512) b!297467))

(assert (= start!66372 b!297468))

(declare-fun m!436285 () Bool)

(assert (=> b!297467 m!436285))

(declare-fun m!436287 () Bool)

(assert (=> b!297467 m!436287))

(declare-fun m!436289 () Bool)

(assert (=> start!66372 m!436289))

(declare-fun m!436291 () Bool)

(assert (=> start!66372 m!436291))

(declare-fun m!436293 () Bool)

(assert (=> b!297465 m!436293))

(declare-fun m!436295 () Bool)

(assert (=> b!297468 m!436295))

(check-sat (not start!66372) (not b!297465) (not b!297467) (not b!297468))
