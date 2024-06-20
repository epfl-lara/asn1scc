; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65414 () Bool)

(assert start!65414)

(declare-fun b!293454 () Bool)

(declare-fun e!209600 () Bool)

(declare-datatypes ((array!17541 0))(
  ( (array!17542 (arr!8628 (Array (_ BitVec 32) (_ BitVec 8))) (size!7602 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13208 0))(
  ( (BitStream!13209 (buf!7665 array!17541) (currentByte!14132 (_ BitVec 32)) (currentBit!14127 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13208)

(declare-fun array_inv!7214 (array!17541) Bool)

(assert (=> b!293454 (= e!209600 (array_inv!7214 (buf!7665 thiss!1728)))))

(declare-fun res!242320 () Bool)

(declare-fun e!209601 () Bool)

(assert (=> start!65414 (=> (not res!242320) (not e!209601))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arr!273 () array!17541)

(assert (=> start!65414 (= res!242320 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7602 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65414 e!209601))

(declare-fun inv!12 (BitStream!13208) Bool)

(assert (=> start!65414 (and (inv!12 thiss!1728) e!209600)))

(assert (=> start!65414 true))

(assert (=> start!65414 (array_inv!7214 arr!273)))

(declare-fun b!293451 () Bool)

(declare-fun res!242319 () Bool)

(assert (=> b!293451 (=> (not res!242319) (not e!209601))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293451 (= res!242319 (validate_offset_bits!1 ((_ sign_extend 32) (size!7602 (buf!7665 thiss!1728))) ((_ sign_extend 32) (currentByte!14132 thiss!1728)) ((_ sign_extend 32) (currentBit!14127 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!293452 () Bool)

(declare-fun res!242321 () Bool)

(assert (=> b!293452 (=> (not res!242321) (not e!209601))))

(assert (=> b!293452 (= res!242321 (bvslt from!505 to!474))))

(declare-fun b!293453 () Bool)

(assert (=> b!293453 (= e!209601 false)))

(declare-datatypes ((tuple2!23036 0))(
  ( (tuple2!23037 (_1!12823 Bool) (_2!12823 BitStream!13208)) )
))
(declare-fun lt!425355 () tuple2!23036)

(declare-fun readBit!0 (BitStream!13208) tuple2!23036)

(assert (=> b!293453 (= lt!425355 (readBit!0 thiss!1728))))

(assert (= (and start!65414 res!242320) b!293451))

(assert (= (and b!293451 res!242319) b!293452))

(assert (= (and b!293452 res!242321) b!293453))

(assert (= start!65414 b!293454))

(declare-fun m!428979 () Bool)

(assert (=> b!293454 m!428979))

(declare-fun m!428981 () Bool)

(assert (=> start!65414 m!428981))

(declare-fun m!428983 () Bool)

(assert (=> start!65414 m!428983))

(declare-fun m!428985 () Bool)

(assert (=> b!293451 m!428985))

(declare-fun m!428987 () Bool)

(assert (=> b!293453 m!428987))

(push 1)

(assert (not b!293451))

(assert (not start!65414))

(assert (not b!293454))

(assert (not b!293453))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

