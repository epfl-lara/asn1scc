; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65608 () Bool)

(assert start!65608)

(declare-fun res!242849 () Bool)

(declare-fun e!210109 () Bool)

(assert (=> start!65608 (=> (not res!242849) (not e!210109))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-datatypes ((array!17591 0))(
  ( (array!17592 (arr!8656 (Array (_ BitVec 32) (_ BitVec 8))) (size!7621 (_ BitVec 32))) )
))
(declare-fun arr!273 () array!17591)

(assert (=> start!65608 (= res!242849 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7621 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65608 e!210109))

(declare-datatypes ((BitStream!13246 0))(
  ( (BitStream!13247 (buf!7684 array!17591) (currentByte!14175 (_ BitVec 32)) (currentBit!14170 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13246)

(declare-fun e!210111 () Bool)

(declare-fun inv!12 (BitStream!13246) Bool)

(assert (=> start!65608 (and (inv!12 thiss!1728) e!210111)))

(assert (=> start!65608 true))

(declare-fun array_inv!7233 (array!17591) Bool)

(assert (=> start!65608 (array_inv!7233 arr!273)))

(declare-fun b!294089 () Bool)

(assert (=> b!294089 (= e!210109 (not (bvslt from!505 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7621 arr!273))))))))

(declare-fun e!210108 () Bool)

(assert (=> b!294089 e!210108))

(declare-fun res!242847 () Bool)

(assert (=> b!294089 (=> (not res!242847) (not e!210108))))

(declare-datatypes ((Unit!20467 0))(
  ( (Unit!20468) )
))
(declare-datatypes ((tuple3!1758 0))(
  ( (tuple3!1759 (_1!12872 Unit!20467) (_2!12872 BitStream!13246) (_3!1314 array!17591)) )
))
(declare-fun lt!427087 () tuple3!1758)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!294089 (= res!242847 (= (bvsub (bvadd (bitIndex!0 (size!7621 (buf!7684 thiss!1728)) (currentByte!14175 thiss!1728) (currentBit!14170 thiss!1728)) to!474) from!505) (bitIndex!0 (size!7621 (buf!7684 (_2!12872 lt!427087))) (currentByte!14175 (_2!12872 lt!427087)) (currentBit!14170 (_2!12872 lt!427087)))))))

(declare-fun lt!427089 () (_ BitVec 32))

(declare-fun lt!427088 () (_ BitVec 32))

(declare-datatypes ((tuple2!23116 0))(
  ( (tuple2!23117 (_1!12873 Bool) (_2!12873 BitStream!13246)) )
))
(declare-fun lt!427085 () tuple2!23116)

(declare-fun readBitsLoop!0 (BitStream!13246 (_ BitVec 64) array!17591 (_ BitVec 64) (_ BitVec 64)) tuple3!1758)

(assert (=> b!294089 (= lt!427087 (readBitsLoop!0 (_2!12873 lt!427085) nBits!523 (array!17592 (store (arr!8656 arr!273) lt!427089 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8656 arr!273) lt!427089)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427088)))) ((_ sign_extend 24) (ite (_1!12873 lt!427085) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!427088) #b00000000))))) (size!7621 arr!273)) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!505) to!474))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!294089 (validate_offset_bits!1 ((_ sign_extend 32) (size!7621 (buf!7684 (_2!12873 lt!427085)))) ((_ sign_extend 32) (currentByte!14175 (_2!12873 lt!427085))) ((_ sign_extend 32) (currentBit!14170 (_2!12873 lt!427085))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!427086 () Unit!20467)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!13246 BitStream!13246 (_ BitVec 64) (_ BitVec 64)) Unit!20467)

(assert (=> b!294089 (= lt!427086 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12873 lt!427085) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!294089 (= lt!427088 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!294089 (= lt!427089 ((_ extract 31 0) (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun readBit!0 (BitStream!13246) tuple2!23116)

(assert (=> b!294089 (= lt!427085 (readBit!0 thiss!1728))))

(declare-fun b!294090 () Bool)

(assert (=> b!294090 (= e!210108 (and (= (buf!7684 thiss!1728) (buf!7684 (_2!12872 lt!427087))) (= (size!7621 arr!273) (size!7621 (_3!1314 lt!427087)))))))

(declare-fun b!294091 () Bool)

(declare-fun res!242846 () Bool)

(assert (=> b!294091 (=> (not res!242846) (not e!210109))))

(assert (=> b!294091 (= res!242846 (validate_offset_bits!1 ((_ sign_extend 32) (size!7621 (buf!7684 thiss!1728))) ((_ sign_extend 32) (currentByte!14175 thiss!1728)) ((_ sign_extend 32) (currentBit!14170 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!294092 () Bool)

(declare-fun res!242848 () Bool)

(assert (=> b!294092 (=> (not res!242848) (not e!210109))))

(assert (=> b!294092 (= res!242848 (bvslt from!505 to!474))))

(declare-fun b!294093 () Bool)

(assert (=> b!294093 (= e!210111 (array_inv!7233 (buf!7684 thiss!1728)))))

(assert (= (and start!65608 res!242849) b!294091))

(assert (= (and b!294091 res!242846) b!294092))

(assert (= (and b!294092 res!242848) b!294089))

(assert (= (and b!294089 res!242847) b!294090))

(assert (= start!65608 b!294093))

(declare-fun m!430087 () Bool)

(assert (=> start!65608 m!430087))

(declare-fun m!430089 () Bool)

(assert (=> start!65608 m!430089))

(declare-fun m!430091 () Bool)

(assert (=> b!294089 m!430091))

(declare-fun m!430093 () Bool)

(assert (=> b!294089 m!430093))

(declare-fun m!430095 () Bool)

(assert (=> b!294089 m!430095))

(declare-fun m!430097 () Bool)

(assert (=> b!294089 m!430097))

(declare-fun m!430099 () Bool)

(assert (=> b!294089 m!430099))

(declare-fun m!430101 () Bool)

(assert (=> b!294089 m!430101))

(declare-fun m!430103 () Bool)

(assert (=> b!294089 m!430103))

(declare-fun m!430105 () Bool)

(assert (=> b!294089 m!430105))

(declare-fun m!430107 () Bool)

(assert (=> b!294089 m!430107))

(declare-fun m!430109 () Bool)

(assert (=> b!294091 m!430109))

(declare-fun m!430111 () Bool)

(assert (=> b!294093 m!430111))

(push 1)

(assert (not start!65608))

(assert (not b!294089))

(assert (not b!294093))

(assert (not b!294091))

(check-sat)

(pop 1)

(push 1)

(check-sat)

