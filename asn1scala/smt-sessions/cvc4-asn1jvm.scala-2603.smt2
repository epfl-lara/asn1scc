; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64454 () Bool)

(assert start!64454)

(declare-fun b!289298 () Bool)

(declare-fun e!205823 () Bool)

(declare-fun e!205821 () Bool)

(assert (=> b!289298 (= e!205823 (not e!205821))))

(declare-fun res!239032 () Bool)

(assert (=> b!289298 (=> res!239032 e!205821)))

(declare-fun from!505 () (_ BitVec 64))

(assert (=> b!289298 (= res!239032 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-datatypes ((array!17121 0))(
  ( (array!17122 (arr!8403 (Array (_ BitVec 32) (_ BitVec 8))) (size!7407 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12824 0))(
  ( (BitStream!12825 (buf!7473 array!17121) (currentByte!13868 (_ BitVec 32)) (currentBit!13863 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22672 0))(
  ( (tuple2!22673 (_1!12530 Bool) (_2!12530 BitStream!12824)) )
))
(declare-fun lt!419082 () tuple2!22672)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289298 (validate_offset_bits!1 ((_ sign_extend 32) (size!7407 (buf!7473 (_2!12530 lt!419082)))) ((_ sign_extend 32) (currentByte!13868 (_2!12530 lt!419082))) ((_ sign_extend 32) (currentBit!13863 (_2!12530 lt!419082))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun thiss!1728 () BitStream!12824)

(declare-datatypes ((Unit!20041 0))(
  ( (Unit!20042) )
))
(declare-fun lt!419081 () Unit!20041)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12824 BitStream!12824 (_ BitVec 64) (_ BitVec 64)) Unit!20041)

(assert (=> b!289298 (= lt!419081 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12530 lt!419082) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBit!0 (BitStream!12824) tuple2!22672)

(assert (=> b!289298 (= lt!419082 (readBit!0 thiss!1728))))

(declare-fun b!289299 () Bool)

(assert (=> b!289299 (= e!205821 (validate_offset_bits!1 ((_ sign_extend 32) (size!7407 (buf!7473 (_2!12530 lt!419082)))) ((_ sign_extend 32) (currentByte!13868 (_2!12530 lt!419082))) ((_ sign_extend 32) (currentBit!13863 (_2!12530 lt!419082))) (bvsub nBits!523 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))))

(declare-fun b!289300 () Bool)

(declare-fun res!239031 () Bool)

(assert (=> b!289300 (=> (not res!239031) (not e!205823))))

(assert (=> b!289300 (= res!239031 (validate_offset_bits!1 ((_ sign_extend 32) (size!7407 (buf!7473 thiss!1728))) ((_ sign_extend 32) (currentByte!13868 thiss!1728)) ((_ sign_extend 32) (currentBit!13863 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!289301 () Bool)

(declare-fun e!205824 () Bool)

(declare-fun array_inv!7019 (array!17121) Bool)

(assert (=> b!289301 (= e!205824 (array_inv!7019 (buf!7473 thiss!1728)))))

(declare-fun res!239030 () Bool)

(assert (=> start!64454 (=> (not res!239030) (not e!205823))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17121)

(assert (=> start!64454 (= res!239030 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7407 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64454 e!205823))

(declare-fun inv!12 (BitStream!12824) Bool)

(assert (=> start!64454 (and (inv!12 thiss!1728) e!205824)))

(assert (=> start!64454 true))

(assert (=> start!64454 (array_inv!7019 arr!273)))

(declare-fun b!289302 () Bool)

(declare-fun res!239033 () Bool)

(assert (=> b!289302 (=> (not res!239033) (not e!205823))))

(assert (=> b!289302 (= res!239033 (bvslt from!505 to!474))))

(assert (= (and start!64454 res!239030) b!289300))

(assert (= (and b!289300 res!239031) b!289302))

(assert (= (and b!289302 res!239033) b!289298))

(assert (= (and b!289298 (not res!239032)) b!289299))

(assert (= start!64454 b!289301))

(declare-fun m!422031 () Bool)

(assert (=> b!289301 m!422031))

(declare-fun m!422033 () Bool)

(assert (=> b!289299 m!422033))

(declare-fun m!422035 () Bool)

(assert (=> b!289300 m!422035))

(declare-fun m!422037 () Bool)

(assert (=> start!64454 m!422037))

(declare-fun m!422039 () Bool)

(assert (=> start!64454 m!422039))

(declare-fun m!422041 () Bool)

(assert (=> b!289298 m!422041))

(declare-fun m!422043 () Bool)

(assert (=> b!289298 m!422043))

(declare-fun m!422045 () Bool)

(assert (=> b!289298 m!422045))

(push 1)

(assert (not b!289300))

(assert (not b!289298))

(assert (not start!64454))

(assert (not b!289301))

(assert (not b!289299))

(check-sat)

(pop 1)

(push 1)

(check-sat)

