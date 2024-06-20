; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64452 () Bool)

(assert start!64452)

(declare-fun res!239018 () Bool)

(declare-fun e!205807 () Bool)

(assert (=> start!64452 (=> (not res!239018) (not e!205807))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((array!17119 0))(
  ( (array!17120 (arr!8402 (Array (_ BitVec 32) (_ BitVec 8))) (size!7406 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17119)

(assert (=> start!64452 (= res!239018 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7406 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64452 e!205807))

(declare-datatypes ((BitStream!12822 0))(
  ( (BitStream!12823 (buf!7472 array!17119) (currentByte!13867 (_ BitVec 32)) (currentBit!13862 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12822)

(declare-fun e!205805 () Bool)

(declare-fun inv!12 (BitStream!12822) Bool)

(assert (=> start!64452 (and (inv!12 thiss!1728) e!205805)))

(assert (=> start!64452 true))

(declare-fun array_inv!7018 (array!17119) Bool)

(assert (=> start!64452 (array_inv!7018 arr!273)))

(declare-fun b!289283 () Bool)

(assert (=> b!289283 (= e!205805 (array_inv!7018 (buf!7472 thiss!1728)))))

(declare-fun b!289284 () Bool)

(declare-fun e!205809 () Bool)

(assert (=> b!289284 (= e!205807 (not e!205809))))

(declare-fun res!239020 () Bool)

(assert (=> b!289284 (=> res!239020 e!205809)))

(assert (=> b!289284 (= res!239020 (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505)))))

(declare-datatypes ((tuple2!22670 0))(
  ( (tuple2!22671 (_1!12529 Bool) (_2!12529 BitStream!12822)) )
))
(declare-fun lt!419076 () tuple2!22670)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289284 (validate_offset_bits!1 ((_ sign_extend 32) (size!7406 (buf!7472 (_2!12529 lt!419076)))) ((_ sign_extend 32) (currentByte!13867 (_2!12529 lt!419076))) ((_ sign_extend 32) (currentBit!13862 (_2!12529 lt!419076))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!20039 0))(
  ( (Unit!20040) )
))
(declare-fun lt!419075 () Unit!20039)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12822 BitStream!12822 (_ BitVec 64) (_ BitVec 64)) Unit!20039)

(assert (=> b!289284 (= lt!419075 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12529 lt!419076) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBit!0 (BitStream!12822) tuple2!22670)

(assert (=> b!289284 (= lt!419076 (readBit!0 thiss!1728))))

(declare-fun b!289285 () Bool)

(declare-fun res!239019 () Bool)

(assert (=> b!289285 (=> (not res!239019) (not e!205807))))

(assert (=> b!289285 (= res!239019 (validate_offset_bits!1 ((_ sign_extend 32) (size!7406 (buf!7472 thiss!1728))) ((_ sign_extend 32) (currentByte!13867 thiss!1728)) ((_ sign_extend 32) (currentBit!13862 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!289286 () Bool)

(assert (=> b!289286 (= e!205809 (validate_offset_bits!1 ((_ sign_extend 32) (size!7406 (buf!7472 (_2!12529 lt!419076)))) ((_ sign_extend 32) (currentByte!13867 (_2!12529 lt!419076))) ((_ sign_extend 32) (currentBit!13862 (_2!12529 lt!419076))) (bvsub nBits!523 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))))

(declare-fun b!289287 () Bool)

(declare-fun res!239021 () Bool)

(assert (=> b!289287 (=> (not res!239021) (not e!205807))))

(assert (=> b!289287 (= res!239021 (bvslt from!505 to!474))))

(assert (= (and start!64452 res!239018) b!289285))

(assert (= (and b!289285 res!239019) b!289287))

(assert (= (and b!289287 res!239021) b!289284))

(assert (= (and b!289284 (not res!239020)) b!289286))

(assert (= start!64452 b!289283))

(declare-fun m!422015 () Bool)

(assert (=> b!289286 m!422015))

(declare-fun m!422017 () Bool)

(assert (=> start!64452 m!422017))

(declare-fun m!422019 () Bool)

(assert (=> start!64452 m!422019))

(declare-fun m!422021 () Bool)

(assert (=> b!289284 m!422021))

(declare-fun m!422023 () Bool)

(assert (=> b!289284 m!422023))

(declare-fun m!422025 () Bool)

(assert (=> b!289284 m!422025))

(declare-fun m!422027 () Bool)

(assert (=> b!289283 m!422027))

(declare-fun m!422029 () Bool)

(assert (=> b!289285 m!422029))

(check-sat (not b!289284) (not b!289283) (not start!64452) (not b!289285) (not b!289286))
(check-sat)
