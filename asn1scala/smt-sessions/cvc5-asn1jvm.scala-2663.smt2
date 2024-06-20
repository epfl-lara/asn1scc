; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65344 () Bool)

(assert start!65344)

(declare-fun b!293159 () Bool)

(declare-fun e!209298 () Bool)

(declare-fun lt!425196 () (_ BitVec 32))

(assert (=> b!293159 (= e!209298 (or (bvslt lt!425196 #b00000000000000000000000000000000) (bvsge lt!425196 #b00000000000000000000000000001000)))))

(declare-fun b!293160 () Bool)

(declare-fun res!242099 () Bool)

(declare-fun e!209294 () Bool)

(assert (=> b!293160 (=> (not res!242099) (not e!209294))))

(declare-datatypes ((array!17492 0))(
  ( (array!17493 (arr!8605 (Array (_ BitVec 32) (_ BitVec 8))) (size!7579 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13162 0))(
  ( (BitStream!13163 (buf!7642 array!17492) (currentByte!14106 (_ BitVec 32)) (currentBit!14101 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13162)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293160 (= res!242099 (validate_offset_bits!1 ((_ sign_extend 32) (size!7579 (buf!7642 thiss!1728))) ((_ sign_extend 32) (currentByte!14106 thiss!1728)) ((_ sign_extend 32) (currentBit!14101 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun res!242096 () Bool)

(assert (=> start!65344 (=> (not res!242096) (not e!209294))))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun arr!273 () array!17492)

(assert (=> start!65344 (= res!242096 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7579 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65344 e!209294))

(declare-fun e!209295 () Bool)

(declare-fun inv!12 (BitStream!13162) Bool)

(assert (=> start!65344 (and (inv!12 thiss!1728) e!209295)))

(assert (=> start!65344 true))

(declare-fun array_inv!7191 (array!17492) Bool)

(assert (=> start!65344 (array_inv!7191 arr!273)))

(declare-fun b!293161 () Bool)

(declare-fun res!242098 () Bool)

(assert (=> b!293161 (=> (not res!242098) (not e!209294))))

(assert (=> b!293161 (= res!242098 (bvslt from!505 to!474))))

(declare-fun b!293162 () Bool)

(assert (=> b!293162 (= e!209294 e!209298)))

(declare-fun res!242097 () Bool)

(assert (=> b!293162 (=> (not res!242097) (not e!209298))))

(declare-datatypes ((tuple2!22988 0))(
  ( (tuple2!22989 (_1!12799 Bool) (_2!12799 BitStream!13162)) )
))
(declare-fun readBit!0 (BitStream!13162) tuple2!22988)

(assert (=> b!293162 (= res!242097 (_1!12799 (readBit!0 thiss!1728)))))

(assert (=> b!293162 (= lt!425196 ((_ extract 31 0) (bvsrem from!505 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!293163 () Bool)

(assert (=> b!293163 (= e!209295 (array_inv!7191 (buf!7642 thiss!1728)))))

(assert (= (and start!65344 res!242096) b!293160))

(assert (= (and b!293160 res!242099) b!293161))

(assert (= (and b!293161 res!242098) b!293162))

(assert (= (and b!293162 res!242097) b!293159))

(assert (= start!65344 b!293163))

(declare-fun m!428725 () Bool)

(assert (=> b!293160 m!428725))

(declare-fun m!428727 () Bool)

(assert (=> start!65344 m!428727))

(declare-fun m!428729 () Bool)

(assert (=> start!65344 m!428729))

(declare-fun m!428731 () Bool)

(assert (=> b!293162 m!428731))

(declare-fun m!428733 () Bool)

(assert (=> b!293163 m!428733))

(push 1)

(assert (not b!293163))

(assert (not b!293162))

(assert (not start!65344))

(assert (not b!293160))

(check-sat)

(pop 1)

(push 1)

(check-sat)

