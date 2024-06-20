; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64446 () Bool)

(assert start!64446)

(declare-fun b!289244 () Bool)

(declare-fun e!205767 () Bool)

(declare-fun from!505 () (_ BitVec 64))

(assert (=> b!289244 (= e!205767 (not (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))))

(declare-datatypes ((array!17113 0))(
  ( (array!17114 (arr!8399 (Array (_ BitVec 32) (_ BitVec 8))) (size!7403 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12816 0))(
  ( (BitStream!12817 (buf!7469 array!17113) (currentByte!13864 (_ BitVec 32)) (currentBit!13859 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22664 0))(
  ( (tuple2!22665 (_1!12526 Bool) (_2!12526 BitStream!12816)) )
))
(declare-fun lt!419058 () tuple2!22664)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289244 (validate_offset_bits!1 ((_ sign_extend 32) (size!7403 (buf!7469 (_2!12526 lt!419058)))) ((_ sign_extend 32) (currentByte!13864 (_2!12526 lt!419058))) ((_ sign_extend 32) (currentBit!13859 (_2!12526 lt!419058))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun thiss!1728 () BitStream!12816)

(declare-datatypes ((Unit!20033 0))(
  ( (Unit!20034) )
))
(declare-fun lt!419057 () Unit!20033)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12816 BitStream!12816 (_ BitVec 64) (_ BitVec 64)) Unit!20033)

(assert (=> b!289244 (= lt!419057 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12526 lt!419058) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBit!0 (BitStream!12816) tuple2!22664)

(assert (=> b!289244 (= lt!419058 (readBit!0 thiss!1728))))

(declare-fun b!289242 () Bool)

(declare-fun res!238988 () Bool)

(assert (=> b!289242 (=> (not res!238988) (not e!205767))))

(assert (=> b!289242 (= res!238988 (validate_offset_bits!1 ((_ sign_extend 32) (size!7403 (buf!7469 thiss!1728))) ((_ sign_extend 32) (currentByte!13864 thiss!1728)) ((_ sign_extend 32) (currentBit!13859 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!289243 () Bool)

(declare-fun res!238986 () Bool)

(assert (=> b!289243 (=> (not res!238986) (not e!205767))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!289243 (= res!238986 (bvslt from!505 to!474))))

(declare-fun res!238987 () Bool)

(assert (=> start!64446 (=> (not res!238987) (not e!205767))))

(declare-fun arr!273 () array!17113)

(assert (=> start!64446 (= res!238987 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7403 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64446 e!205767))

(declare-fun e!205766 () Bool)

(declare-fun inv!12 (BitStream!12816) Bool)

(assert (=> start!64446 (and (inv!12 thiss!1728) e!205766)))

(assert (=> start!64446 true))

(declare-fun array_inv!7015 (array!17113) Bool)

(assert (=> start!64446 (array_inv!7015 arr!273)))

(declare-fun b!289245 () Bool)

(assert (=> b!289245 (= e!205766 (array_inv!7015 (buf!7469 thiss!1728)))))

(assert (= (and start!64446 res!238987) b!289242))

(assert (= (and b!289242 res!238988) b!289243))

(assert (= (and b!289243 res!238986) b!289244))

(assert (= start!64446 b!289245))

(declare-fun m!421971 () Bool)

(assert (=> b!289244 m!421971))

(declare-fun m!421973 () Bool)

(assert (=> b!289244 m!421973))

(declare-fun m!421975 () Bool)

(assert (=> b!289244 m!421975))

(declare-fun m!421977 () Bool)

(assert (=> b!289242 m!421977))

(declare-fun m!421979 () Bool)

(assert (=> start!64446 m!421979))

(declare-fun m!421981 () Bool)

(assert (=> start!64446 m!421981))

(declare-fun m!421983 () Bool)

(assert (=> b!289245 m!421983))

(check-sat (not b!289244) (not b!289245) (not b!289242) (not start!64446))
(check-sat)
