; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53722 () Bool)

(assert start!53722)

(declare-fun b!249943 () Bool)

(declare-fun e!173231 () Bool)

(declare-fun e!173234 () Bool)

(assert (=> b!249943 (= e!173231 e!173234)))

(declare-fun res!209208 () Bool)

(assert (=> b!249943 (=> (not res!209208) (not e!173234))))

(declare-fun lt!388539 () (_ BitVec 64))

(declare-fun lt!388547 () (_ BitVec 64))

(assert (=> b!249943 (= res!209208 (= lt!388539 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388547)))))

(declare-datatypes ((array!13631 0))(
  ( (array!13632 (arr!6966 (Array (_ BitVec 32) (_ BitVec 8))) (size!5979 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10880 0))(
  ( (BitStream!10881 (buf!6472 array!13631) (currentByte!11903 (_ BitVec 32)) (currentBit!11898 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!18094 0))(
  ( (Unit!18095) )
))
(declare-datatypes ((tuple2!21426 0))(
  ( (tuple2!21427 (_1!11638 Unit!18094) (_2!11638 BitStream!10880)) )
))
(declare-fun lt!388544 () tuple2!21426)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!249943 (= lt!388539 (bitIndex!0 (size!5979 (buf!6472 (_2!11638 lt!388544))) (currentByte!11903 (_2!11638 lt!388544)) (currentBit!11898 (_2!11638 lt!388544))))))

(declare-fun thiss!1005 () BitStream!10880)

(assert (=> b!249943 (= lt!388547 (bitIndex!0 (size!5979 (buf!6472 thiss!1005)) (currentByte!11903 thiss!1005) (currentBit!11898 thiss!1005)))))

(declare-fun res!209214 () Bool)

(declare-fun e!173233 () Bool)

(assert (=> start!53722 (=> (not res!209214) (not e!173233))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!53722 (= res!209214 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53722 e!173233))

(assert (=> start!53722 true))

(declare-fun e!173230 () Bool)

(declare-fun inv!12 (BitStream!10880) Bool)

(assert (=> start!53722 (and (inv!12 thiss!1005) e!173230)))

(declare-fun b!249944 () Bool)

(declare-fun res!209210 () Bool)

(assert (=> b!249944 (=> (not res!209210) (not e!173233))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249944 (= res!209210 (validate_offset_bits!1 ((_ sign_extend 32) (size!5979 (buf!6472 thiss!1005))) ((_ sign_extend 32) (currentByte!11903 thiss!1005)) ((_ sign_extend 32) (currentBit!11898 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!249945 () Bool)

(declare-fun e!173232 () Bool)

(declare-datatypes ((tuple2!21428 0))(
  ( (tuple2!21429 (_1!11639 BitStream!10880) (_2!11639 Bool)) )
))
(declare-fun lt!388542 () tuple2!21428)

(declare-datatypes ((tuple2!21430 0))(
  ( (tuple2!21431 (_1!11640 BitStream!10880) (_2!11640 BitStream!10880)) )
))
(declare-fun lt!388546 () tuple2!21430)

(assert (=> b!249945 (= e!173232 (not (or (not (_2!11639 lt!388542)) (not (= (_1!11639 lt!388542) (_2!11640 lt!388546))))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10880 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21428)

(assert (=> b!249945 (= lt!388542 (checkBitsLoopPure!0 (_1!11640 lt!388546) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!388540 () tuple2!21426)

(declare-fun lt!388543 () (_ BitVec 64))

(assert (=> b!249945 (validate_offset_bits!1 ((_ sign_extend 32) (size!5979 (buf!6472 (_2!11638 lt!388540)))) ((_ sign_extend 32) (currentByte!11903 (_2!11638 lt!388544))) ((_ sign_extend 32) (currentBit!11898 (_2!11638 lt!388544))) lt!388543)))

(declare-fun lt!388541 () Unit!18094)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10880 array!13631 (_ BitVec 64)) Unit!18094)

(assert (=> b!249945 (= lt!388541 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11638 lt!388544) (buf!6472 (_2!11638 lt!388540)) lt!388543))))

(declare-fun reader!0 (BitStream!10880 BitStream!10880) tuple2!21430)

(assert (=> b!249945 (= lt!388546 (reader!0 (_2!11638 lt!388544) (_2!11638 lt!388540)))))

(declare-fun b!249946 () Bool)

(declare-fun res!209205 () Bool)

(assert (=> b!249946 (=> (not res!209205) (not e!173232))))

(declare-fun isPrefixOf!0 (BitStream!10880 BitStream!10880) Bool)

(assert (=> b!249946 (= res!209205 (isPrefixOf!0 (_2!11638 lt!388544) (_2!11638 lt!388540)))))

(declare-fun b!249947 () Bool)

(declare-fun e!173235 () Bool)

(assert (=> b!249947 (= e!173234 e!173235)))

(declare-fun res!209206 () Bool)

(assert (=> b!249947 (=> (not res!209206) (not e!173235))))

(declare-fun lt!388548 () tuple2!21428)

(assert (=> b!249947 (= res!209206 (and (= (_2!11639 lt!388548) bit!26) (= (_1!11639 lt!388548) (_2!11638 lt!388544))))))

(declare-fun readBitPure!0 (BitStream!10880) tuple2!21428)

(declare-fun readerFrom!0 (BitStream!10880 (_ BitVec 32) (_ BitVec 32)) BitStream!10880)

(assert (=> b!249947 (= lt!388548 (readBitPure!0 (readerFrom!0 (_2!11638 lt!388544) (currentBit!11898 thiss!1005) (currentByte!11903 thiss!1005))))))

(declare-fun b!249948 () Bool)

(declare-fun e!173237 () Bool)

(assert (=> b!249948 (= e!173237 e!173232)))

(declare-fun res!209213 () Bool)

(assert (=> b!249948 (=> (not res!209213) (not e!173232))))

(assert (=> b!249948 (= res!209213 (= (bitIndex!0 (size!5979 (buf!6472 (_2!11638 lt!388540))) (currentByte!11903 (_2!11638 lt!388540)) (currentBit!11898 (_2!11638 lt!388540))) (bvadd (bitIndex!0 (size!5979 (buf!6472 (_2!11638 lt!388544))) (currentByte!11903 (_2!11638 lt!388544)) (currentBit!11898 (_2!11638 lt!388544))) lt!388543)))))

(assert (=> b!249948 (= lt!388543 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!249949 () Bool)

(declare-fun res!209212 () Bool)

(assert (=> b!249949 (=> (not res!209212) (not e!173233))))

(assert (=> b!249949 (= res!209212 (bvslt from!289 nBits!297))))

(declare-fun b!249950 () Bool)

(declare-fun res!209207 () Bool)

(assert (=> b!249950 (=> (not res!209207) (not e!173234))))

(assert (=> b!249950 (= res!209207 (isPrefixOf!0 thiss!1005 (_2!11638 lt!388544)))))

(declare-fun b!249951 () Bool)

(declare-fun array_inv!5720 (array!13631) Bool)

(assert (=> b!249951 (= e!173230 (array_inv!5720 (buf!6472 thiss!1005)))))

(declare-fun b!249952 () Bool)

(assert (=> b!249952 (= e!173233 (not (isPrefixOf!0 thiss!1005 (_2!11638 lt!388544))))))

(assert (=> b!249952 e!173237))

(declare-fun res!209211 () Bool)

(assert (=> b!249952 (=> (not res!209211) (not e!173237))))

(assert (=> b!249952 (= res!209211 (= (size!5979 (buf!6472 (_2!11638 lt!388544))) (size!5979 (buf!6472 (_2!11638 lt!388540)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10880 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21426)

(assert (=> b!249952 (= lt!388540 (appendNBitsLoop!0 (_2!11638 lt!388544) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!249952 (validate_offset_bits!1 ((_ sign_extend 32) (size!5979 (buf!6472 (_2!11638 lt!388544)))) ((_ sign_extend 32) (currentByte!11903 (_2!11638 lt!388544))) ((_ sign_extend 32) (currentBit!11898 (_2!11638 lt!388544))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!388545 () Unit!18094)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10880 BitStream!10880 (_ BitVec 64) (_ BitVec 64)) Unit!18094)

(assert (=> b!249952 (= lt!388545 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11638 lt!388544) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!249952 e!173231))

(declare-fun res!209209 () Bool)

(assert (=> b!249952 (=> (not res!209209) (not e!173231))))

(assert (=> b!249952 (= res!209209 (= (size!5979 (buf!6472 thiss!1005)) (size!5979 (buf!6472 (_2!11638 lt!388544)))))))

(declare-fun appendBit!0 (BitStream!10880 Bool) tuple2!21426)

(assert (=> b!249952 (= lt!388544 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!249953 () Bool)

(assert (=> b!249953 (= e!173235 (= (bitIndex!0 (size!5979 (buf!6472 (_1!11639 lt!388548))) (currentByte!11903 (_1!11639 lt!388548)) (currentBit!11898 (_1!11639 lt!388548))) lt!388539))))

(assert (= (and start!53722 res!209214) b!249944))

(assert (= (and b!249944 res!209210) b!249949))

(assert (= (and b!249949 res!209212) b!249952))

(assert (= (and b!249952 res!209209) b!249943))

(assert (= (and b!249943 res!209208) b!249950))

(assert (= (and b!249950 res!209207) b!249947))

(assert (= (and b!249947 res!209206) b!249953))

(assert (= (and b!249952 res!209211) b!249948))

(assert (= (and b!249948 res!209213) b!249946))

(assert (= (and b!249946 res!209205) b!249945))

(assert (= start!53722 b!249951))

(declare-fun m!376333 () Bool)

(assert (=> b!249951 m!376333))

(declare-fun m!376335 () Bool)

(assert (=> b!249952 m!376335))

(declare-fun m!376337 () Bool)

(assert (=> b!249952 m!376337))

(declare-fun m!376339 () Bool)

(assert (=> b!249952 m!376339))

(declare-fun m!376341 () Bool)

(assert (=> b!249952 m!376341))

(declare-fun m!376343 () Bool)

(assert (=> b!249952 m!376343))

(declare-fun m!376345 () Bool)

(assert (=> b!249944 m!376345))

(declare-fun m!376347 () Bool)

(assert (=> b!249945 m!376347))

(declare-fun m!376349 () Bool)

(assert (=> b!249945 m!376349))

(declare-fun m!376351 () Bool)

(assert (=> b!249945 m!376351))

(declare-fun m!376353 () Bool)

(assert (=> b!249945 m!376353))

(declare-fun m!376355 () Bool)

(assert (=> start!53722 m!376355))

(declare-fun m!376357 () Bool)

(assert (=> b!249947 m!376357))

(assert (=> b!249947 m!376357))

(declare-fun m!376359 () Bool)

(assert (=> b!249947 m!376359))

(declare-fun m!376361 () Bool)

(assert (=> b!249946 m!376361))

(declare-fun m!376363 () Bool)

(assert (=> b!249953 m!376363))

(assert (=> b!249950 m!376335))

(declare-fun m!376365 () Bool)

(assert (=> b!249948 m!376365))

(declare-fun m!376367 () Bool)

(assert (=> b!249948 m!376367))

(assert (=> b!249943 m!376367))

(declare-fun m!376369 () Bool)

(assert (=> b!249943 m!376369))

(push 1)

(assert (not b!249953))

(assert (not b!249950))

(assert (not start!53722))

(assert (not b!249951))

(assert (not b!249943))

(assert (not b!249948))

(assert (not b!249946))

(assert (not b!249944))

(assert (not b!249947))

(assert (not b!249945))

(assert (not b!249952))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

