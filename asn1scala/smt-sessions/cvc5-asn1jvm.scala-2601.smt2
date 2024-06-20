; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64438 () Bool)

(assert start!64438)

(declare-fun b!289195 () Bool)

(declare-fun res!238952 () Bool)

(declare-fun e!205719 () Bool)

(assert (=> b!289195 (=> (not res!238952) (not e!205719))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!289195 (= res!238952 (bvslt from!505 to!474))))

(declare-fun b!289197 () Bool)

(declare-fun e!205716 () Bool)

(declare-datatypes ((array!17105 0))(
  ( (array!17106 (arr!8395 (Array (_ BitVec 32) (_ BitVec 8))) (size!7399 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12808 0))(
  ( (BitStream!12809 (buf!7465 array!17105) (currentByte!13860 (_ BitVec 32)) (currentBit!13855 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12808)

(declare-fun array_inv!7011 (array!17105) Bool)

(assert (=> b!289197 (= e!205716 (array_inv!7011 (buf!7465 thiss!1728)))))

(declare-fun b!289194 () Bool)

(declare-fun res!238950 () Bool)

(assert (=> b!289194 (=> (not res!238950) (not e!205719))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289194 (= res!238950 (validate_offset_bits!1 ((_ sign_extend 32) (size!7399 (buf!7465 thiss!1728))) ((_ sign_extend 32) (currentByte!13860 thiss!1728)) ((_ sign_extend 32) (currentBit!13855 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!289196 () Bool)

(assert (=> b!289196 (= e!205719 (not true))))

(declare-datatypes ((tuple2!22656 0))(
  ( (tuple2!22657 (_1!12522 Bool) (_2!12522 BitStream!12808)) )
))
(declare-fun lt!419034 () tuple2!22656)

(assert (=> b!289196 (validate_offset_bits!1 ((_ sign_extend 32) (size!7399 (buf!7465 (_2!12522 lt!419034)))) ((_ sign_extend 32) (currentByte!13860 (_2!12522 lt!419034))) ((_ sign_extend 32) (currentBit!13855 (_2!12522 lt!419034))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!20025 0))(
  ( (Unit!20026) )
))
(declare-fun lt!419033 () Unit!20025)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12808 BitStream!12808 (_ BitVec 64) (_ BitVec 64)) Unit!20025)

(assert (=> b!289196 (= lt!419033 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12522 lt!419034) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBit!0 (BitStream!12808) tuple2!22656)

(assert (=> b!289196 (= lt!419034 (readBit!0 thiss!1728))))

(declare-fun res!238951 () Bool)

(assert (=> start!64438 (=> (not res!238951) (not e!205719))))

(declare-fun arr!273 () array!17105)

(assert (=> start!64438 (= res!238951 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7399 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64438 e!205719))

(declare-fun inv!12 (BitStream!12808) Bool)

(assert (=> start!64438 (and (inv!12 thiss!1728) e!205716)))

(assert (=> start!64438 true))

(assert (=> start!64438 (array_inv!7011 arr!273)))

(assert (= (and start!64438 res!238951) b!289194))

(assert (= (and b!289194 res!238950) b!289195))

(assert (= (and b!289195 res!238952) b!289196))

(assert (= start!64438 b!289197))

(declare-fun m!421915 () Bool)

(assert (=> b!289197 m!421915))

(declare-fun m!421917 () Bool)

(assert (=> b!289194 m!421917))

(declare-fun m!421919 () Bool)

(assert (=> b!289196 m!421919))

(declare-fun m!421921 () Bool)

(assert (=> b!289196 m!421921))

(declare-fun m!421923 () Bool)

(assert (=> b!289196 m!421923))

(declare-fun m!421925 () Bool)

(assert (=> start!64438 m!421925))

(declare-fun m!421927 () Bool)

(assert (=> start!64438 m!421927))

(push 1)

(assert (not b!289194))

(assert (not start!64438))

(assert (not b!289196))

(assert (not b!289197))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

