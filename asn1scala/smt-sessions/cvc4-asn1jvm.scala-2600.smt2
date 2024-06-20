; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64436 () Bool)

(assert start!64436)

(declare-fun b!289183 () Bool)

(declare-fun res!238941 () Bool)

(declare-fun e!205704 () Bool)

(assert (=> b!289183 (=> (not res!238941) (not e!205704))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!289183 (= res!238941 (bvslt from!505 to!474))))

(declare-fun b!289182 () Bool)

(declare-fun res!238942 () Bool)

(assert (=> b!289182 (=> (not res!238942) (not e!205704))))

(declare-datatypes ((array!17103 0))(
  ( (array!17104 (arr!8394 (Array (_ BitVec 32) (_ BitVec 8))) (size!7398 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12806 0))(
  ( (BitStream!12807 (buf!7464 array!17103) (currentByte!13859 (_ BitVec 32)) (currentBit!13854 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12806)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289182 (= res!238942 (validate_offset_bits!1 ((_ sign_extend 32) (size!7398 (buf!7464 thiss!1728))) ((_ sign_extend 32) (currentByte!13859 thiss!1728)) ((_ sign_extend 32) (currentBit!13854 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!238943 () Bool)

(assert (=> start!64436 (=> (not res!238943) (not e!205704))))

(declare-fun arr!273 () array!17103)

(assert (=> start!64436 (= res!238943 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7398 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64436 e!205704))

(declare-fun e!205706 () Bool)

(declare-fun inv!12 (BitStream!12806) Bool)

(assert (=> start!64436 (and (inv!12 thiss!1728) e!205706)))

(assert (=> start!64436 true))

(declare-fun array_inv!7010 (array!17103) Bool)

(assert (=> start!64436 (array_inv!7010 arr!273)))

(declare-fun b!289185 () Bool)

(assert (=> b!289185 (= e!205706 (array_inv!7010 (buf!7464 thiss!1728)))))

(declare-fun b!289184 () Bool)

(assert (=> b!289184 (= e!205704 (not true))))

(declare-datatypes ((tuple2!22654 0))(
  ( (tuple2!22655 (_1!12521 Bool) (_2!12521 BitStream!12806)) )
))
(declare-fun lt!419027 () tuple2!22654)

(assert (=> b!289184 (validate_offset_bits!1 ((_ sign_extend 32) (size!7398 (buf!7464 (_2!12521 lt!419027)))) ((_ sign_extend 32) (currentByte!13859 (_2!12521 lt!419027))) ((_ sign_extend 32) (currentBit!13854 (_2!12521 lt!419027))) (bvsub (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((Unit!20023 0))(
  ( (Unit!20024) )
))
(declare-fun lt!419028 () Unit!20023)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!12806 BitStream!12806 (_ BitVec 64) (_ BitVec 64)) Unit!20023)

(assert (=> b!289184 (= lt!419028 (validateOffsetBitsIneqLemma!0 thiss!1728 (_2!12521 lt!419027) (bvsub nBits!523 from!505) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBit!0 (BitStream!12806) tuple2!22654)

(assert (=> b!289184 (= lt!419027 (readBit!0 thiss!1728))))

(assert (= (and start!64436 res!238943) b!289182))

(assert (= (and b!289182 res!238942) b!289183))

(assert (= (and b!289183 res!238941) b!289184))

(assert (= start!64436 b!289185))

(declare-fun m!421901 () Bool)

(assert (=> b!289182 m!421901))

(declare-fun m!421903 () Bool)

(assert (=> start!64436 m!421903))

(declare-fun m!421905 () Bool)

(assert (=> start!64436 m!421905))

(declare-fun m!421907 () Bool)

(assert (=> b!289185 m!421907))

(declare-fun m!421909 () Bool)

(assert (=> b!289184 m!421909))

(declare-fun m!421911 () Bool)

(assert (=> b!289184 m!421911))

(declare-fun m!421913 () Bool)

(assert (=> b!289184 m!421913))

(push 1)

(assert (not b!289184))

