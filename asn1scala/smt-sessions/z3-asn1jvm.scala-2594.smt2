; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64374 () Bool)

(assert start!64374)

(declare-fun res!238739 () Bool)

(declare-fun e!205441 () Bool)

(assert (=> start!64374 (=> (not res!238739) (not e!205441))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17062 0))(
  ( (array!17063 (arr!8375 (Array (_ BitVec 32) (_ BitVec 8))) (size!7379 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17062)

(declare-datatypes ((BitStream!12768 0))(
  ( (BitStream!12769 (buf!7445 array!17062) (currentByte!13834 (_ BitVec 32)) (currentBit!13829 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12768)

(assert (=> start!64374 (= res!238739 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7379 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523) (bvsle ((_ sign_extend 32) (size!7379 (buf!7445 thiss!1728))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!13834 thiss!1728)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!13829 thiss!1728)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!7379 (buf!7445 thiss!1728))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!13834 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!13829 thiss!1728)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!64374 e!205441))

(declare-fun e!205443 () Bool)

(declare-fun inv!12 (BitStream!12768) Bool)

(assert (=> start!64374 (and (inv!12 thiss!1728) e!205443)))

(assert (=> start!64374 true))

(declare-fun array_inv!6991 (array!17062) Bool)

(assert (=> start!64374 (array_inv!6991 arr!273)))

(declare-fun b!288922 () Bool)

(declare-fun res!238738 () Bool)

(assert (=> b!288922 (=> (not res!238738) (not e!205441))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!288922 (= res!238738 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!13829 thiss!1728))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!13834 thiss!1728))) ((_ extract 31 0) ((_ sign_extend 32) (size!7379 (buf!7445 thiss!1728))))))))

(declare-fun b!288923 () Bool)

(assert (=> b!288923 (= e!205441 (bvslt (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!288924 () Bool)

(assert (=> b!288924 (= e!205443 (array_inv!6991 (buf!7445 thiss!1728)))))

(assert (= (and start!64374 res!238739) b!288922))

(assert (= (and b!288922 res!238738) b!288923))

(assert (= start!64374 b!288924))

(declare-fun m!421647 () Bool)

(assert (=> start!64374 m!421647))

(declare-fun m!421649 () Bool)

(assert (=> start!64374 m!421649))

(declare-fun m!421651 () Bool)

(assert (=> b!288922 m!421651))

(declare-fun m!421653 () Bool)

(assert (=> b!288924 m!421653))

(check-sat (not start!64374) (not b!288922) (not b!288924))
(check-sat)
