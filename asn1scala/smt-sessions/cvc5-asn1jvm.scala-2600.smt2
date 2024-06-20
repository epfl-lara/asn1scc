; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64432 () Bool)

(assert start!64432)

(declare-fun b!289160 () Bool)

(declare-fun e!205680 () Bool)

(assert (=> b!289160 (= e!205680 (not true))))

(declare-datatypes ((array!17099 0))(
  ( (array!17100 (arr!8392 (Array (_ BitVec 32) (_ BitVec 8))) (size!7396 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12802 0))(
  ( (BitStream!12803 (buf!7462 array!17099) (currentByte!13857 (_ BitVec 32)) (currentBit!13852 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22650 0))(
  ( (tuple2!22651 (_1!12519 Bool) (_2!12519 BitStream!12802)) )
))
(declare-fun lt!419016 () tuple2!22650)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289160 (validate_offset_bits!1 ((_ sign_extend 32) (size!7396 (buf!7462 (_2!12519 lt!419016)))) ((_ sign_extend 32) (currentByte!13857 (_2!12519 lt!419016))) ((_ sign_extend 32) (currentBit!13852 (_2!12519 lt!419016))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!20019 0))(
  ( (Unit!20020) )
))
(declare-fun lt!419015 () Unit!20019)

(declare-fun thiss!1728 () BitStream!12802)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12802 BitStream!12802 (_ BitVec 64) (_ BitVec 64)) Unit!20019)

(assert (=> b!289160 (= lt!419015 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12519 lt!419016) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBit!0 (BitStream!12802) tuple2!22650)

(assert (=> b!289160 (= lt!419016 (readBit!0 thiss!1728))))

(declare-fun res!238924 () Bool)

(assert (=> start!64432 (=> (not res!238924) (not e!205680))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17099)

(assert (=> start!64432 (= res!238924 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7396 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64432 e!205680))

(declare-fun e!205682 () Bool)

(declare-fun inv!12 (BitStream!12802) Bool)

(assert (=> start!64432 (and (inv!12 thiss!1728) e!205682)))

(assert (=> start!64432 true))

(declare-fun array_inv!7008 (array!17099) Bool)

(assert (=> start!64432 (array_inv!7008 arr!273)))

(declare-fun b!289161 () Bool)

(assert (=> b!289161 (= e!205682 (array_inv!7008 (buf!7462 thiss!1728)))))

(declare-fun b!289159 () Bool)

(declare-fun res!238923 () Bool)

(assert (=> b!289159 (=> (not res!238923) (not e!205680))))

(assert (=> b!289159 (= res!238923 (bvslt from!505 to!474))))

(declare-fun b!289158 () Bool)

(declare-fun res!238925 () Bool)

(assert (=> b!289158 (=> (not res!238925) (not e!205680))))

(assert (=> b!289158 (= res!238925 (validate_offset_bits!1 ((_ sign_extend 32) (size!7396 (buf!7462 thiss!1728))) ((_ sign_extend 32) (currentByte!13857 thiss!1728)) ((_ sign_extend 32) (currentBit!13852 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!64432 res!238924) b!289158))

(assert (= (and b!289158 res!238925) b!289159))

(assert (= (and b!289159 res!238923) b!289160))

(assert (= start!64432 b!289161))

(declare-fun m!421873 () Bool)

(assert (=> b!289160 m!421873))

(declare-fun m!421875 () Bool)

(assert (=> b!289160 m!421875))

(declare-fun m!421877 () Bool)

(assert (=> b!289160 m!421877))

(declare-fun m!421879 () Bool)

(assert (=> start!64432 m!421879))

(declare-fun m!421881 () Bool)

(assert (=> start!64432 m!421881))

(declare-fun m!421883 () Bool)

(assert (=> b!289161 m!421883))

(declare-fun m!421885 () Bool)

(assert (=> b!289158 m!421885))

(push 1)

(assert (not start!64432))

(assert (not b!289160))

(assert (not b!289158))

(assert (not b!289161))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

