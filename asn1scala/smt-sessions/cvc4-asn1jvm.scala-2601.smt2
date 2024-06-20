; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64442 () Bool)

(assert start!64442)

(declare-fun b!289221 () Bool)

(declare-fun e!205743 () Bool)

(declare-datatypes ((array!17109 0))(
  ( (array!17110 (arr!8397 (Array (_ BitVec 32) (_ BitVec 8))) (size!7401 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12812 0))(
  ( (BitStream!12813 (buf!7467 array!17109) (currentByte!13862 (_ BitVec 32)) (currentBit!13857 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12812)

(declare-fun array_inv!7013 (array!17109) Bool)

(assert (=> b!289221 (= e!205743 (array_inv!7013 (buf!7467 thiss!1728)))))

(declare-fun b!289220 () Bool)

(declare-fun e!205741 () Bool)

(assert (=> b!289220 (= e!205741 (not true))))

(declare-datatypes ((tuple2!22660 0))(
  ( (tuple2!22661 (_1!12524 Bool) (_2!12524 BitStream!12812)) )
))
(declare-fun lt!419046 () tuple2!22660)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289220 (validate_offset_bits!1 ((_ sign_extend 32) (size!7401 (buf!7467 (_2!12524 lt!419046)))) ((_ sign_extend 32) (currentByte!13862 (_2!12524 lt!419046))) ((_ sign_extend 32) (currentBit!13857 (_2!12524 lt!419046))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!20029 0))(
  ( (Unit!20030) )
))
(declare-fun lt!419045 () Unit!20029)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12812 BitStream!12812 (_ BitVec 64) (_ BitVec 64)) Unit!20029)

(assert (=> b!289220 (= lt!419045 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12524 lt!419046) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBit!0 (BitStream!12812) tuple2!22660)

(assert (=> b!289220 (= lt!419046 (readBit!0 thiss!1728))))

(declare-fun b!289218 () Bool)

(declare-fun res!238970 () Bool)

(assert (=> b!289218 (=> (not res!238970) (not e!205741))))

(assert (=> b!289218 (= res!238970 (validate_offset_bits!1 ((_ sign_extend 32) (size!7401 (buf!7467 thiss!1728))) ((_ sign_extend 32) (currentByte!13862 thiss!1728)) ((_ sign_extend 32) (currentBit!13857 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!289219 () Bool)

(declare-fun res!238968 () Bool)

(assert (=> b!289219 (=> (not res!238968) (not e!205741))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!289219 (= res!238968 (bvslt from!505 to!474))))

(declare-fun res!238969 () Bool)

(assert (=> start!64442 (=> (not res!238969) (not e!205741))))

(declare-fun arr!273 () array!17109)

(assert (=> start!64442 (= res!238969 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7401 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64442 e!205741))

(declare-fun inv!12 (BitStream!12812) Bool)

(assert (=> start!64442 (and (inv!12 thiss!1728) e!205743)))

(assert (=> start!64442 true))

(assert (=> start!64442 (array_inv!7013 arr!273)))

(assert (= (and start!64442 res!238969) b!289218))

(assert (= (and b!289218 res!238970) b!289219))

(assert (= (and b!289219 res!238968) b!289220))

(assert (= start!64442 b!289221))

(declare-fun m!421943 () Bool)

(assert (=> b!289221 m!421943))

(declare-fun m!421945 () Bool)

(assert (=> b!289220 m!421945))

(declare-fun m!421947 () Bool)

(assert (=> b!289220 m!421947))

(declare-fun m!421949 () Bool)

(assert (=> b!289220 m!421949))

(declare-fun m!421951 () Bool)

(assert (=> b!289218 m!421951))

(declare-fun m!421953 () Bool)

(assert (=> start!64442 m!421953))

(declare-fun m!421955 () Bool)

(assert (=> start!64442 m!421955))

(push 1)

(assert (not b!289220))

(assert (not start!64442))

(assert (not b!289221))

(assert (not b!289218))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

