; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64440 () Bool)

(assert start!64440)

(declare-fun b!289206 () Bool)

(declare-fun res!238961 () Bool)

(declare-fun e!205729 () Bool)

(assert (=> b!289206 (=> (not res!238961) (not e!205729))))

(declare-datatypes ((array!17107 0))(
  ( (array!17108 (arr!8396 (Array (_ BitVec 32) (_ BitVec 8))) (size!7400 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12810 0))(
  ( (BitStream!12811 (buf!7466 array!17107) (currentByte!13861 (_ BitVec 32)) (currentBit!13856 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12810)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289206 (= res!238961 (validate_offset_bits!1 ((_ sign_extend 32) (size!7400 (buf!7466 thiss!1728))) ((_ sign_extend 32) (currentByte!13861 thiss!1728)) ((_ sign_extend 32) (currentBit!13856 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!238960 () Bool)

(assert (=> start!64440 (=> (not res!238960) (not e!205729))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17107)

(assert (=> start!64440 (= res!238960 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7400 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64440 e!205729))

(declare-fun e!205731 () Bool)

(declare-fun inv!12 (BitStream!12810) Bool)

(assert (=> start!64440 (and (inv!12 thiss!1728) e!205731)))

(assert (=> start!64440 true))

(declare-fun array_inv!7012 (array!17107) Bool)

(assert (=> start!64440 (array_inv!7012 arr!273)))

(declare-fun b!289207 () Bool)

(declare-fun res!238959 () Bool)

(assert (=> b!289207 (=> (not res!238959) (not e!205729))))

(assert (=> b!289207 (= res!238959 (bvslt from!505 to!474))))

(declare-fun b!289209 () Bool)

(assert (=> b!289209 (= e!205731 (array_inv!7012 (buf!7466 thiss!1728)))))

(declare-fun b!289208 () Bool)

(assert (=> b!289208 (= e!205729 (not true))))

(declare-datatypes ((tuple2!22658 0))(
  ( (tuple2!22659 (_1!12523 Bool) (_2!12523 BitStream!12810)) )
))
(declare-fun lt!419039 () tuple2!22658)

(assert (=> b!289208 (validate_offset_bits!1 ((_ sign_extend 32) (size!7400 (buf!7466 (_2!12523 lt!419039)))) ((_ sign_extend 32) (currentByte!13861 (_2!12523 lt!419039))) ((_ sign_extend 32) (currentBit!13856 (_2!12523 lt!419039))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!20027 0))(
  ( (Unit!20028) )
))
(declare-fun lt!419040 () Unit!20027)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12810 BitStream!12810 (_ BitVec 64) (_ BitVec 64)) Unit!20027)

(assert (=> b!289208 (= lt!419040 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12523 lt!419039) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBit!0 (BitStream!12810) tuple2!22658)

(assert (=> b!289208 (= lt!419039 (readBit!0 thiss!1728))))

(assert (= (and start!64440 res!238960) b!289206))

(assert (= (and b!289206 res!238961) b!289207))

(assert (= (and b!289207 res!238959) b!289208))

(assert (= start!64440 b!289209))

(declare-fun m!421929 () Bool)

(assert (=> b!289206 m!421929))

(declare-fun m!421931 () Bool)

(assert (=> start!64440 m!421931))

(declare-fun m!421933 () Bool)

(assert (=> start!64440 m!421933))

(declare-fun m!421935 () Bool)

(assert (=> b!289209 m!421935))

(declare-fun m!421937 () Bool)

(assert (=> b!289208 m!421937))

(declare-fun m!421939 () Bool)

(assert (=> b!289208 m!421939))

(declare-fun m!421941 () Bool)

(assert (=> b!289208 m!421941))

(check-sat (not b!289209) (not b!289206) (not b!289208) (not start!64440))
