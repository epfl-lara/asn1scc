; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64448 () Bool)

(assert start!64448)

(declare-fun b!289255 () Bool)

(declare-fun res!238995 () Bool)

(declare-fun e!205779 () Bool)

(assert (=> b!289255 (=> (not res!238995) (not e!205779))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!289255 (= res!238995 (bvslt from!505 to!474))))

(declare-fun b!289254 () Bool)

(declare-fun res!238996 () Bool)

(assert (=> b!289254 (=> (not res!238996) (not e!205779))))

(declare-datatypes ((array!17115 0))(
  ( (array!17116 (arr!8400 (Array (_ BitVec 32) (_ BitVec 8))) (size!7404 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12818 0))(
  ( (BitStream!12819 (buf!7470 array!17115) (currentByte!13865 (_ BitVec 32)) (currentBit!13860 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12818)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289254 (= res!238996 (validate_offset_bits!1 ((_ sign_extend 32) (size!7404 (buf!7470 thiss!1728))) ((_ sign_extend 32) (currentByte!13865 thiss!1728)) ((_ sign_extend 32) (currentBit!13860 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!289257 () Bool)

(declare-fun e!205778 () Bool)

(declare-fun array_inv!7016 (array!17115) Bool)

(assert (=> b!289257 (= e!205778 (array_inv!7016 (buf!7470 thiss!1728)))))

(declare-fun b!289256 () Bool)

(assert (=> b!289256 (= e!205779 (not (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505))))))

(declare-datatypes ((tuple2!22666 0))(
  ( (tuple2!22667 (_1!12527 Bool) (_2!12527 BitStream!12818)) )
))
(declare-fun lt!419063 () tuple2!22666)

(assert (=> b!289256 (validate_offset_bits!1 ((_ sign_extend 32) (size!7404 (buf!7470 (_2!12527 lt!419063)))) ((_ sign_extend 32) (currentByte!13865 (_2!12527 lt!419063))) ((_ sign_extend 32) (currentBit!13860 (_2!12527 lt!419063))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!20035 0))(
  ( (Unit!20036) )
))
(declare-fun lt!419064 () Unit!20035)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12818 BitStream!12818 (_ BitVec 64) (_ BitVec 64)) Unit!20035)

(assert (=> b!289256 (= lt!419064 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12527 lt!419063) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBit!0 (BitStream!12818) tuple2!22666)

(assert (=> b!289256 (= lt!419063 (readBit!0 thiss!1728))))

(declare-fun res!238997 () Bool)

(assert (=> start!64448 (=> (not res!238997) (not e!205779))))

(declare-fun arr!273 () array!17115)

(assert (=> start!64448 (= res!238997 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7404 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64448 e!205779))

(declare-fun inv!12 (BitStream!12818) Bool)

(assert (=> start!64448 (and (inv!12 thiss!1728) e!205778)))

(assert (=> start!64448 true))

(assert (=> start!64448 (array_inv!7016 arr!273)))

(assert (= (and start!64448 res!238997) b!289254))

(assert (= (and b!289254 res!238996) b!289255))

(assert (= (and b!289255 res!238995) b!289256))

(assert (= start!64448 b!289257))

(declare-fun m!421985 () Bool)

(assert (=> b!289254 m!421985))

(declare-fun m!421987 () Bool)

(assert (=> b!289257 m!421987))

(declare-fun m!421989 () Bool)

(assert (=> b!289256 m!421989))

(declare-fun m!421991 () Bool)

(assert (=> b!289256 m!421991))

(declare-fun m!421993 () Bool)

(assert (=> b!289256 m!421993))

(declare-fun m!421995 () Bool)

(assert (=> start!64448 m!421995))

(declare-fun m!421997 () Bool)

(assert (=> start!64448 m!421997))

(push 1)

(assert (not b!289254))

(assert (not b!289256))

(assert (not start!64448))

(assert (not b!289257))

(check-sat)

(pop 1)

(push 1)

(check-sat)

