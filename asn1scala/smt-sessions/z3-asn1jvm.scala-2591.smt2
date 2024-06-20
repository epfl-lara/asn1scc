; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64344 () Bool)

(assert start!64344)

(declare-datatypes ((array!17042 0))(
  ( (array!17043 (arr!8366 (Array (_ BitVec 32) (_ BitVec 8))) (size!7370 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12750 0))(
  ( (BitStream!12751 (buf!7436 array!17042) (currentByte!13823 (_ BitVec 32)) (currentBit!13818 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12750)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arr!273 () array!17042)

(assert (=> start!64344 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7370 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523) (or (bvsgt ((_ sign_extend 32) (size!7370 (buf!7436 thiss!1728))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!13823 thiss!1728)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!13818 thiss!1728)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun e!205345 () Bool)

(declare-fun inv!12 (BitStream!12750) Bool)

(assert (=> start!64344 (and (inv!12 thiss!1728) e!205345)))

(assert (=> start!64344 true))

(declare-fun array_inv!6982 (array!17042) Bool)

(assert (=> start!64344 (array_inv!6982 arr!273)))

(declare-fun b!288876 () Bool)

(assert (=> b!288876 (= e!205345 (array_inv!6982 (buf!7436 thiss!1728)))))

(assert (= start!64344 b!288876))

(declare-fun m!421581 () Bool)

(assert (=> start!64344 m!421581))

(declare-fun m!421583 () Bool)

(assert (=> start!64344 m!421583))

(declare-fun m!421585 () Bool)

(assert (=> b!288876 m!421585))

(check-sat (not b!288876) (not start!64344))
(check-sat)
