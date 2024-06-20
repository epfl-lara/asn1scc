; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66366 () Bool)

(assert start!66366)

(declare-fun b!297430 () Bool)

(declare-fun res!245484 () Bool)

(declare-fun e!212920 () Bool)

(assert (=> b!297430 (=> (not res!245484) (not e!212920))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!297430 (= res!245484 (bvsge from!505 to!474))))

(declare-fun b!297431 () Bool)

(declare-fun lt!433692 () (_ BitVec 64))

(assert (=> b!297431 (= e!212920 (not (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!433692) (bvsle from!505 lt!433692))))))

(declare-datatypes ((array!17803 0))(
  ( (array!17804 (arr!8795 (Array (_ BitVec 32) (_ BitVec 8))) (size!7715 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17803)

(declare-fun arrayBitRangesEq!0 (array!17803 array!17803 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297431 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433692)))

(assert (=> b!297431 (= lt!433692 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7715 arr!273))))))

(declare-datatypes ((Unit!20751 0))(
  ( (Unit!20752) )
))
(declare-fun lt!433691 () Unit!20751)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17803) Unit!20751)

(assert (=> b!297431 (= lt!433691 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!297432 () Bool)

(declare-fun e!212921 () Bool)

(declare-datatypes ((BitStream!13434 0))(
  ( (BitStream!13435 (buf!7778 array!17803) (currentByte!14320 (_ BitVec 32)) (currentBit!14315 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13434)

(declare-fun array_inv!7327 (array!17803) Bool)

(assert (=> b!297432 (= e!212921 (array_inv!7327 (buf!7778 thiss!1728)))))

(declare-fun b!297429 () Bool)

(declare-fun res!245486 () Bool)

(assert (=> b!297429 (=> (not res!245486) (not e!212920))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297429 (= res!245486 (validate_offset_bits!1 ((_ sign_extend 32) (size!7715 (buf!7778 thiss!1728))) ((_ sign_extend 32) (currentByte!14320 thiss!1728)) ((_ sign_extend 32) (currentBit!14315 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!245485 () Bool)

(assert (=> start!66366 (=> (not res!245485) (not e!212920))))

(assert (=> start!66366 (= res!245485 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7715 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66366 e!212920))

(declare-fun inv!12 (BitStream!13434) Bool)

(assert (=> start!66366 (and (inv!12 thiss!1728) e!212921)))

(assert (=> start!66366 true))

(assert (=> start!66366 (array_inv!7327 arr!273)))

(assert (= (and start!66366 res!245485) b!297429))

(assert (= (and b!297429 res!245486) b!297430))

(assert (= (and b!297430 res!245484) b!297431))

(assert (= start!66366 b!297432))

(declare-fun m!436249 () Bool)

(assert (=> b!297431 m!436249))

(declare-fun m!436251 () Bool)

(assert (=> b!297431 m!436251))

(declare-fun m!436253 () Bool)

(assert (=> b!297432 m!436253))

(declare-fun m!436255 () Bool)

(assert (=> b!297429 m!436255))

(declare-fun m!436257 () Bool)

(assert (=> start!66366 m!436257))

(declare-fun m!436259 () Bool)

(assert (=> start!66366 m!436259))

(check-sat (not b!297431) (not b!297432) (not b!297429) (not start!66366))
(check-sat)
