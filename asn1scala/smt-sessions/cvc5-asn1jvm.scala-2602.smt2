; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64444 () Bool)

(assert start!64444)

(declare-fun b!289230 () Bool)

(declare-fun res!238977 () Bool)

(declare-fun e!205753 () Bool)

(assert (=> b!289230 (=> (not res!238977) (not e!205753))))

(declare-datatypes ((array!17111 0))(
  ( (array!17112 (arr!8398 (Array (_ BitVec 32) (_ BitVec 8))) (size!7402 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12814 0))(
  ( (BitStream!12815 (buf!7468 array!17111) (currentByte!13863 (_ BitVec 32)) (currentBit!13858 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12814)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289230 (= res!238977 (validate_offset_bits!1 ((_ sign_extend 32) (size!7402 (buf!7468 thiss!1728))) ((_ sign_extend 32) (currentByte!13863 thiss!1728)) ((_ sign_extend 32) (currentBit!13858 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!289231 () Bool)

(declare-fun res!238978 () Bool)

(assert (=> b!289231 (=> (not res!238978) (not e!205753))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!289231 (= res!238978 (bvslt from!505 to!474))))

(declare-fun b!289232 () Bool)

(assert (=> b!289232 (= e!205753 (not (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))))

(declare-datatypes ((tuple2!22662 0))(
  ( (tuple2!22663 (_1!12525 Bool) (_2!12525 BitStream!12814)) )
))
(declare-fun lt!419052 () tuple2!22662)

(assert (=> b!289232 (validate_offset_bits!1 ((_ sign_extend 32) (size!7402 (buf!7468 (_2!12525 lt!419052)))) ((_ sign_extend 32) (currentByte!13863 (_2!12525 lt!419052))) ((_ sign_extend 32) (currentBit!13858 (_2!12525 lt!419052))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!20031 0))(
  ( (Unit!20032) )
))
(declare-fun lt!419051 () Unit!20031)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12814 BitStream!12814 (_ BitVec 64) (_ BitVec 64)) Unit!20031)

(assert (=> b!289232 (= lt!419051 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12525 lt!419052) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBit!0 (BitStream!12814) tuple2!22662)

(assert (=> b!289232 (= lt!419052 (readBit!0 thiss!1728))))

(declare-fun res!238979 () Bool)

(assert (=> start!64444 (=> (not res!238979) (not e!205753))))

(declare-fun arr!273 () array!17111)

(assert (=> start!64444 (= res!238979 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7402 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64444 e!205753))

(declare-fun e!205752 () Bool)

(declare-fun inv!12 (BitStream!12814) Bool)

(assert (=> start!64444 (and (inv!12 thiss!1728) e!205752)))

(assert (=> start!64444 true))

(declare-fun array_inv!7014 (array!17111) Bool)

(assert (=> start!64444 (array_inv!7014 arr!273)))

(declare-fun b!289233 () Bool)

(assert (=> b!289233 (= e!205752 (array_inv!7014 (buf!7468 thiss!1728)))))

(assert (= (and start!64444 res!238979) b!289230))

(assert (= (and b!289230 res!238977) b!289231))

(assert (= (and b!289231 res!238978) b!289232))

(assert (= start!64444 b!289233))

(declare-fun m!421957 () Bool)

(assert (=> b!289230 m!421957))

(declare-fun m!421959 () Bool)

(assert (=> b!289232 m!421959))

(declare-fun m!421961 () Bool)

(assert (=> b!289232 m!421961))

(declare-fun m!421963 () Bool)

(assert (=> b!289232 m!421963))

(declare-fun m!421965 () Bool)

(assert (=> start!64444 m!421965))

(declare-fun m!421967 () Bool)

(assert (=> start!64444 m!421967))

(declare-fun m!421969 () Bool)

(assert (=> b!289233 m!421969))

(push 1)

(assert (not b!289230))

(assert (not start!64444))

(assert (not b!289233))

(assert (not b!289232))

(check-sat)

(pop 1)

(push 1)

(check-sat)

