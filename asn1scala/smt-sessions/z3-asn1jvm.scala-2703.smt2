; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66336 () Bool)

(assert start!66336)

(declare-fun b!297251 () Bool)

(declare-fun e!212742 () Bool)

(declare-datatypes ((array!17773 0))(
  ( (array!17774 (arr!8780 (Array (_ BitVec 32) (_ BitVec 8))) (size!7700 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17773)

(declare-fun lt!433628 () (_ BitVec 64))

(assert (=> b!297251 (= e!212742 (not (or (= ((_ sign_extend 32) (size!7700 arr!273)) #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv lt!433628 ((_ sign_extend 32) (size!7700 arr!273)))))))))

(declare-fun arrayBitRangesEq!0 (array!17773 array!17773 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297251 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433628)))

(assert (=> b!297251 (= lt!433628 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7700 arr!273))))))

(declare-datatypes ((Unit!20721 0))(
  ( (Unit!20722) )
))
(declare-fun lt!433629 () Unit!20721)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17773) Unit!20721)

(assert (=> b!297251 (= lt!433629 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun res!245350 () Bool)

(assert (=> start!66336 (=> (not res!245350) (not e!212742))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(assert (=> start!66336 (= res!245350 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7700 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66336 e!212742))

(declare-datatypes ((BitStream!13404 0))(
  ( (BitStream!13405 (buf!7763 array!17773) (currentByte!14305 (_ BitVec 32)) (currentBit!14300 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13404)

(declare-fun e!212741 () Bool)

(declare-fun inv!12 (BitStream!13404) Bool)

(assert (=> start!66336 (and (inv!12 thiss!1728) e!212741)))

(assert (=> start!66336 true))

(declare-fun array_inv!7312 (array!17773) Bool)

(assert (=> start!66336 (array_inv!7312 arr!273)))

(declare-fun b!297249 () Bool)

(declare-fun res!245349 () Bool)

(assert (=> b!297249 (=> (not res!245349) (not e!212742))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297249 (= res!245349 (validate_offset_bits!1 ((_ sign_extend 32) (size!7700 (buf!7763 thiss!1728))) ((_ sign_extend 32) (currentByte!14305 thiss!1728)) ((_ sign_extend 32) (currentBit!14300 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!297250 () Bool)

(declare-fun res!245351 () Bool)

(assert (=> b!297250 (=> (not res!245351) (not e!212742))))

(assert (=> b!297250 (= res!245351 (bvsge from!505 to!474))))

(declare-fun b!297252 () Bool)

(assert (=> b!297252 (= e!212741 (array_inv!7312 (buf!7763 thiss!1728)))))

(assert (= (and start!66336 res!245350) b!297249))

(assert (= (and b!297249 res!245349) b!297250))

(assert (= (and b!297250 res!245351) b!297251))

(assert (= start!66336 b!297252))

(declare-fun m!436069 () Bool)

(assert (=> b!297251 m!436069))

(declare-fun m!436071 () Bool)

(assert (=> b!297251 m!436071))

(declare-fun m!436073 () Bool)

(assert (=> start!66336 m!436073))

(declare-fun m!436075 () Bool)

(assert (=> start!66336 m!436075))

(declare-fun m!436077 () Bool)

(assert (=> b!297249 m!436077))

(declare-fun m!436079 () Bool)

(assert (=> b!297252 m!436079))

(check-sat (not b!297249) (not start!66336) (not b!297251) (not b!297252))
(check-sat)
