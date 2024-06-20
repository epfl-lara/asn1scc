; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64450 () Bool)

(assert start!64450)

(declare-fun b!289268 () Bool)

(declare-fun res!239008 () Bool)

(declare-fun e!205794 () Bool)

(assert (=> b!289268 (=> (not res!239008) (not e!205794))))

(declare-datatypes ((array!17117 0))(
  ( (array!17118 (arr!8401 (Array (_ BitVec 32) (_ BitVec 8))) (size!7405 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12820 0))(
  ( (BitStream!12821 (buf!7471 array!17117) (currentByte!13866 (_ BitVec 32)) (currentBit!13861 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12820)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289268 (= res!239008 (validate_offset_bits!1 ((_ sign_extend 32) (size!7405 (buf!7471 thiss!1728))) ((_ sign_extend 32) (currentByte!13866 thiss!1728)) ((_ sign_extend 32) (currentBit!13861 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!289269 () Bool)

(declare-fun e!205793 () Bool)

(declare-fun array_inv!7017 (array!17117) Bool)

(assert (=> b!289269 (= e!205793 (array_inv!7017 (buf!7471 thiss!1728)))))

(declare-fun b!289270 () Bool)

(declare-fun e!205790 () Bool)

(assert (=> b!289270 (= e!205794 (not e!205790))))

(declare-fun res!239009 () Bool)

(assert (=> b!289270 (=> res!239009 e!205790)))

(assert (=> b!289270 (= res!239009 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-datatypes ((tuple2!22668 0))(
  ( (tuple2!22669 (_1!12528 Bool) (_2!12528 BitStream!12820)) )
))
(declare-fun lt!419070 () tuple2!22668)

(assert (=> b!289270 (validate_offset_bits!1 ((_ sign_extend 32) (size!7405 (buf!7471 (_2!12528 lt!419070)))) ((_ sign_extend 32) (currentByte!13866 (_2!12528 lt!419070))) ((_ sign_extend 32) (currentBit!13861 (_2!12528 lt!419070))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!20037 0))(
  ( (Unit!20038) )
))
(declare-fun lt!419069 () Unit!20037)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12820 BitStream!12820 (_ BitVec 64) (_ BitVec 64)) Unit!20037)

(assert (=> b!289270 (= lt!419069 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12528 lt!419070) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBit!0 (BitStream!12820) tuple2!22668)

(assert (=> b!289270 (= lt!419070 (readBit!0 thiss!1728))))

(declare-fun res!239006 () Bool)

(assert (=> start!64450 (=> (not res!239006) (not e!205794))))

(declare-fun arr!273 () array!17117)

(declare-fun to!474 () (_ BitVec 64))

(assert (=> start!64450 (= res!239006 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7405 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64450 e!205794))

(declare-fun inv!12 (BitStream!12820) Bool)

(assert (=> start!64450 (and (inv!12 thiss!1728) e!205793)))

(assert (=> start!64450 true))

(assert (=> start!64450 (array_inv!7017 arr!273)))

(declare-fun b!289271 () Bool)

(declare-fun res!239007 () Bool)

(assert (=> b!289271 (=> (not res!239007) (not e!205794))))

(assert (=> b!289271 (= res!239007 (bvslt from!505 to!474))))

(declare-fun b!289272 () Bool)

(assert (=> b!289272 (= e!205790 (validate_offset_bits!1 ((_ sign_extend 32) (size!7405 (buf!7471 (_2!12528 lt!419070)))) ((_ sign_extend 32) (currentByte!13866 (_2!12528 lt!419070))) ((_ sign_extend 32) (currentBit!13861 (_2!12528 lt!419070))) (bvsub nBits!523 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))))

(assert (= (and start!64450 res!239006) b!289268))

(assert (= (and b!289268 res!239008) b!289271))

(assert (= (and b!289271 res!239007) b!289270))

(assert (= (and b!289270 (not res!239009)) b!289272))

(assert (= start!64450 b!289269))

(declare-fun m!421999 () Bool)

(assert (=> b!289268 m!421999))

(declare-fun m!422001 () Bool)

(assert (=> b!289269 m!422001))

(declare-fun m!422003 () Bool)

(assert (=> start!64450 m!422003))

(declare-fun m!422005 () Bool)

(assert (=> start!64450 m!422005))

(declare-fun m!422007 () Bool)

(assert (=> b!289272 m!422007))

(declare-fun m!422009 () Bool)

(assert (=> b!289270 m!422009))

(declare-fun m!422011 () Bool)

(assert (=> b!289270 m!422011))

(declare-fun m!422013 () Bool)

(assert (=> b!289270 m!422013))

(push 1)

(assert (not b!289272))

(assert (not start!64450))

(assert (not b!289269))

(assert (not b!289268))

(assert (not b!289270))

(check-sat)

(pop 1)

(push 1)

(check-sat)

